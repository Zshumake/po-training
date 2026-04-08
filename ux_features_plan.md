# P&O Training App — UX/Engagement Features Implementation Plan

**Date:** 2026-03-21
**Constraint:** Offline-first, no backend. All persistence via local storage.
**Architecture:** StatefulWidget-based (no Riverpod/Provider/Bloc), Material 3, sealed ContentBlock classes.

---

## Priority Ranking (Build Order)

| Priority | Feature | Effort | Impact | Rationale |
|----------|---------|--------|--------|-----------|
| **P0** | Dark Mode | 3-4 hrs | High | Foundational — affects every screen, easier to build before other features exist |
| **P0** | Font Size Control | 1-2 hrs | High | Accessibility requirement, also foundational |
| **P1** | Progress Tracking | 6-8 hrs | Critical | Core engagement loop, required by Daily Review and Streaks |
| **P1** | Bookmarks | 4-5 hrs | High | Enables Daily Review, high user value |
| **P2** | Spaced Repetition | 4-6 hrs | High | Depends on Progress Tracking storage layer |
| **P2** | Study Streaks | 2-3 hrs | Medium | Depends on Progress Tracking |
| **P3** | Daily Review Mode | 4-5 hrs | High | Depends on all P1/P2 features |
| **P3** | Daily Notification | 2-3 hrs | Medium | Depends on Daily Review |

**Total estimated effort: 26-36 hours**

---

## Shared Foundation: Storage Layer

### Recommended Storage: Hive + shared_preferences

**Why not Drift/sqflite?** The app has no relational queries, no joins, no migrations. The data is simple key-value and small object collections.

**Why not Isar?** The original author abandoned the project. The core is Rust — difficult to fork/maintain.

**Decision:**
- `shared_preferences: ^2.3.0` — theme mode, font scale, streak date, notification time (simple primitives)
- `hive_flutter: ^1.1.0` — progress records, bookmarks, spaced repetition card states (structured objects)

Hive is a pure-Dart NoSQL store with zero native dependencies, binary serialization, lazy loading, and works on all platforms including web. The community edition is actively maintained.

```yaml
# pubspec.yaml additions
dependencies:
  hive_flutter: ^1.1.0
  shared_preferences: ^2.3.0
  fsrs: ^2.0.0                          # spaced repetition
  flutter_local_notifications: ^17.1.2   # daily reminder
  timezone: ^0.9.3                       # notification scheduling

dev_dependencies:
  hive_generator: ^2.0.1
  build_runner: ^2.4.8
```

### Initialization (main.dart)

```dart
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  // Register adapters before opening boxes
  Hive.registerAdapter(ProgressRecordAdapter());
  Hive.registerAdapter(BookmarkAdapter());
  Hive.registerAdapter(CardStateAdapter());

  // Open boxes (one-time, kept open for app lifetime)
  await Hive.openBox<ProgressRecord>('progress');
  await Hive.openBox<Bookmark>('bookmarks');
  await Hive.openBox<CardState>('spaced_repetition');
  await Hive.openBox('settings'); // dynamic types for simple values

  runApp(const POTrainingApp());
}
```

---

## Feature 1: Progress Tracking (Local Persistence)

### What to Persist

| Event | Data Stored | When Written |
|-------|-------------|--------------|
| Module tab viewed | moduleId, tabIndex, timestamp | On tab switch |
| Quiz completed | moduleId (nullable for mixed), score, total, questionIds, timestamp | On results screen |
| Flashcard session | deckId, knewIt, needsWork, timestamp | On summary screen |
| Time studied | moduleId, durationSeconds, timestamp | On screen dispose |

### Data Schema (Hive TypeAdapters)

```dart
import 'package:hive/hive.dart';

part 'progress_record.g.dart';

@HiveType(typeId: 0)
class ProgressRecord extends HiveObject {
  @HiveField(0)
  final String type; // 'quiz' | 'flashcard' | 'module_view'

  @HiveField(1)
  final String? moduleId; // null for mixed quiz

  @HiveField(2)
  final int score; // correct count (quiz) or "knew it" count (flashcard)

  @HiveField(3)
  final int total; // total questions or cards

  @HiveField(4)
  final DateTime timestamp;

  @HiveField(5)
  final int durationSeconds; // time spent

  @HiveField(6)
  final List<String> questionIds; // for "review missed" tracking

  ProgressRecord({
    required this.type,
    this.moduleId,
    this.score = 0,
    this.total = 0,
    required this.timestamp,
    this.durationSeconds = 0,
    this.questionIds = const [],
  });
}
```

Generate the adapter:
```bash
dart run build_runner build --delete-conflicting-outputs
```

### Storage Service

```dart
class ProgressService {
  static final _box = Hive.box<ProgressRecord>('progress');

  /// Record a completed quiz
  static void recordQuiz({
    String? moduleId,
    required int score,
    required int total,
    required int durationSeconds,
    required List<String> questionIds,
  }) {
    _box.add(ProgressRecord(
      type: 'quiz',
      moduleId: moduleId,
      score: score,
      total: total,
      timestamp: DateTime.now(),
      durationSeconds: durationSeconds,
      questionIds: questionIds,
    ));
  }

  /// Record a completed flashcard session
  static void recordFlashcard({
    required String deckId,
    required int knewIt,
    required int total,
    required int durationSeconds,
  }) {
    _box.add(ProgressRecord(
      type: 'flashcard',
      moduleId: deckId,
      score: knewIt,
      total: total,
      timestamp: DateTime.now(),
      durationSeconds: durationSeconds,
    ));
  }

  /// Record a module view (for tab completion tracking)
  static void recordModuleView(String moduleId, int tabIndex) {
    _box.add(ProgressRecord(
      type: 'module_view',
      moduleId: moduleId,
      score: tabIndex, // overload: stores which tab was viewed
      total: 0,
      timestamp: DateTime.now(),
    ));
  }

  /// Get all quiz records for a specific module
  static List<ProgressRecord> quizRecordsForModule(String moduleId) {
    return _box.values
        .where((r) => r.type == 'quiz' && r.moduleId == moduleId)
        .toList();
  }

  /// Overall quiz accuracy (0.0 - 1.0)
  static double overallQuizAccuracy() {
    final quizzes = _box.values.where((r) => r.type == 'quiz').toList();
    if (quizzes.isEmpty) return 0.0;
    final totalCorrect = quizzes.fold<int>(0, (sum, r) => sum + r.score);
    final totalQuestions = quizzes.fold<int>(0, (sum, r) => sum + r.total);
    if (totalQuestions == 0) return 0.0;
    return totalCorrect / totalQuestions;
  }

  /// Quiz accuracy for a specific module
  static double moduleQuizAccuracy(String moduleId) {
    final records = quizRecordsForModule(moduleId);
    if (records.isEmpty) return 0.0;
    final correct = records.fold<int>(0, (sum, r) => sum + r.score);
    final total = records.fold<int>(0, (sum, r) => sum + r.total);
    if (total == 0) return 0.0;
    return correct / total;
  }

  /// Weakest module by quiz accuracy (returns moduleId)
  static String? weakestModule(List<String> allModuleIds) {
    String? weakest;
    double lowestAccuracy = double.infinity;
    for (final id in allModuleIds) {
      final records = quizRecordsForModule(id);
      if (records.isEmpty) continue; // skip modules never attempted
      final accuracy = moduleQuizAccuracy(id);
      if (accuracy < lowestAccuracy) {
        lowestAccuracy = accuracy;
        weakest = id;
      }
    }
    return weakest;
  }

  /// Total study time in seconds
  static int totalStudyTimeSeconds() {
    return _box.values.fold<int>(0, (sum, r) => sum + r.durationSeconds);
  }

  /// Total questions attempted
  static int totalQuestionsAttempted() {
    return _box.values
        .where((r) => r.type == 'quiz')
        .fold<int>(0, (sum, r) => sum + r.total);
  }

  /// Unique tabs viewed for a module (for progress ring)
  static Set<int> viewedTabsForModule(String moduleId) {
    return _box.values
        .where((r) => r.type == 'module_view' && r.moduleId == moduleId)
        .map((r) => r.score) // score field stores tabIndex
        .toSet();
  }

  /// Check if any activity happened today
  static bool hasActivityToday() {
    final now = DateTime.now();
    final todayStart = DateTime(now.year, now.month, now.day);
    return _box.values.any((r) =>
        r.timestamp.isAfter(todayStart) &&
        (r.type == 'quiz' || r.type == 'flashcard'));
  }
}
```

### Home Screen Progress Display

Show a circular progress indicator on each module card:

```dart
class ModuleProgressRing extends StatelessWidget {
  final String moduleId;
  final int totalTabs;
  final Color color;

  const ModuleProgressRing({
    super.key,
    required this.moduleId,
    required this.totalTabs,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final viewedTabs = ProgressService.viewedTabsForModule(moduleId);
    final progress = totalTabs > 0 ? viewedTabs.length / totalTabs : 0.0;

    return SizedBox(
      width: 40,
      height: 40,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircularProgressIndicator(
            value: progress,
            strokeWidth: 3,
            backgroundColor: color.withOpacity(0.2),
            valueColor: AlwaysStoppedAnimation<Color>(color),
          ),
          Text(
            '${(progress * 100).round()}%',
            style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
```

### Study Stats Screen

```dart
class StudyStatsScreen extends StatelessWidget {
  const StudyStatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Study Stats')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _StatCard(
            label: 'Total Questions',
            value: '${ProgressService.totalQuestionsAttempted()}',
            icon: Icons.quiz,
          ),
          _StatCard(
            label: 'Overall Accuracy',
            value: '${(ProgressService.overallQuizAccuracy() * 100).round()}%',
            icon: Icons.check_circle,
          ),
          _StatCard(
            label: 'Time Studied',
            value: _formatDuration(ProgressService.totalStudyTimeSeconds()),
            icon: Icons.timer,
          ),
          const SizedBox(height: 24),
          const Text('Accuracy by Module',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
          const SizedBox(height: 12),
          // Build a bar for each module
          ...ModuleData.allModules.map((module) => _ModuleAccuracyBar(
                label: module.title,
                accuracy: ProgressService.moduleQuizAccuracy(module.id),
                color: AppTheme.moduleColors[module.colorIndex],
              )),
        ],
      ),
    );
  }

  String _formatDuration(int seconds) {
    final hours = seconds ~/ 3600;
    final minutes = (seconds % 3600) ~/ 60;
    if (hours > 0) return '${hours}h ${minutes}m';
    return '${minutes}m';
  }
}
```

### Integration Points

- **QuizSessionView**: Call `ProgressService.recordQuiz(...)` when results screen is shown. Pass a `Stopwatch` started at quiz begin for `durationSeconds`.
- **FlashcardView**: Call `ProgressService.recordFlashcard(...)` on summary screen.
- **ModuleContentScreen**: Call `ProgressService.recordModuleView(...)` in the `TabController` listener.
- **HomeScreen**: Add a stats icon in the AppBar leading to `StudyStatsScreen`. Add `ModuleProgressRing` to each module card.

---

## Feature 2: Bookmarks

### Data Schema

```dart
@HiveType(typeId: 1)
class Bookmark extends HiveObject {
  @HiveField(0)
  final String id; // unique: "${moduleId}_${blockType}_${blockIndex}"

  @HiveField(1)
  final String moduleId;

  @HiveField(2)
  final String blockType; // 'pearl', 'table', 'mnemonic', 'quiz', 'bullet'

  @HiveField(3)
  final String title; // display text for bookmark list

  @HiveField(4)
  final String? subtitle; // optional preview text

  @HiveField(5)
  final DateTime createdAt;

  @HiveField(6)
  final int topicIndex; // which topic tab

  @HiveField(7)
  final int blockIndex; // position within topic content

  Bookmark({
    required this.id,
    required this.moduleId,
    required this.blockType,
    required this.title,
    this.subtitle,
    required this.createdAt,
    required this.topicIndex,
    required this.blockIndex,
  });
}
```

### Bookmark Service

```dart
class BookmarkService {
  static final _box = Hive.box<Bookmark>('bookmarks');

  static bool isBookmarked(String id) => _box.containsKey(id);

  static void toggle({
    required String id,
    required String moduleId,
    required String blockType,
    required String title,
    String? subtitle,
    required int topicIndex,
    required int blockIndex,
  }) {
    if (_box.containsKey(id)) {
      _box.delete(id);
    } else {
      _box.put(
        id,
        Bookmark(
          id: id,
          moduleId: moduleId,
          blockType: blockType,
          title: title,
          subtitle: subtitle,
          createdAt: DateTime.now(),
          topicIndex: topicIndex,
          blockIndex: blockIndex,
        ),
      );
    }
  }

  static List<Bookmark> allBookmarks() =>
      _box.values.toList()..sort((a, b) => b.createdAt.compareTo(a.createdAt));

  static Map<String, List<Bookmark>> bookmarksByModule() {
    final map = <String, List<Bookmark>>{};
    for (final b in _box.values) {
      map.putIfAbsent(b.moduleId, () => []).add(b);
    }
    return map;
  }

  /// Get 3 random bookmarked items for Daily Review
  static List<Bookmark> randomBookmarks(int count) {
    final all = _box.values.toList()..shuffle();
    return all.take(count).toList();
  }
}
```

### Bookmark Icon Widget (for every content block)

```dart
class BookmarkButton extends StatefulWidget {
  final String bookmarkId;
  final String moduleId;
  final String blockType;
  final String title;
  final String? subtitle;
  final int topicIndex;
  final int blockIndex;

  const BookmarkButton({
    super.key,
    required this.bookmarkId,
    required this.moduleId,
    required this.blockType,
    required this.title,
    this.subtitle,
    required this.topicIndex,
    required this.blockIndex,
  });

  @override
  State<BookmarkButton> createState() => _BookmarkButtonState();
}

class _BookmarkButtonState extends State<BookmarkButton> {
  @override
  Widget build(BuildContext context) {
    final isBookmarked = BookmarkService.isBookmarked(widget.bookmarkId);
    return IconButton(
      icon: Icon(
        isBookmarked ? Icons.bookmark : Icons.bookmark_border,
        color: isBookmarked
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.onSurfaceVariant,
        size: 20,
      ),
      onPressed: () {
        BookmarkService.toggle(
          id: widget.bookmarkId,
          moduleId: widget.moduleId,
          blockType: widget.blockType,
          title: widget.title,
          subtitle: widget.subtitle,
          topicIndex: widget.topicIndex,
          blockIndex: widget.blockIndex,
        );
        setState(() {});
      },
      tooltip: isBookmarked ? 'Remove bookmark' : 'Bookmark',
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
    );
  }
}
```

### Bookmarks Screen

```dart
class BookmarksScreen extends StatelessWidget {
  const BookmarksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final grouped = BookmarkService.bookmarksByModule();

    return Scaffold(
      appBar: AppBar(title: const Text('Bookmarks')),
      body: grouped.isEmpty
          ? const Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.bookmark_border, size: 64, color: Colors.grey),
                  SizedBox(height: 16),
                  Text('No bookmarks yet',
                      style: TextStyle(fontSize: 16, color: Colors.grey)),
                  SizedBox(height: 8),
                  Text('Tap the bookmark icon on any content block',
                      style: TextStyle(fontSize: 14, color: Colors.grey)),
                ],
              ),
            )
          : ListView(
              children: grouped.entries.map((entry) {
                final moduleTitle = _moduleTitle(entry.key);
                return ExpansionTile(
                  title: Text(moduleTitle),
                  initiallyExpanded: true,
                  children: entry.value.map((bookmark) {
                    return ListTile(
                      leading: _blockTypeIcon(bookmark.blockType),
                      title: Text(bookmark.title, maxLines: 2,
                          overflow: TextOverflow.ellipsis),
                      subtitle: bookmark.subtitle != null
                          ? Text(bookmark.subtitle!, maxLines: 1,
                              overflow: TextOverflow.ellipsis)
                          : null,
                      onTap: () {
                        // Navigate to module, topic tab, scroll to block
                        Navigator.push(context, MaterialPageRoute(
                          builder: (_) => ModuleContentScreen(
                            moduleId: bookmark.moduleId,
                            initialTab: bookmark.topicIndex,
                            scrollToBlock: bookmark.blockIndex,
                          ),
                        ));
                      },
                      trailing: IconButton(
                        icon: const Icon(Icons.close, size: 18),
                        onPressed: () {
                          BookmarkService.toggle(
                            id: bookmark.id,
                            moduleId: bookmark.moduleId,
                            blockType: bookmark.blockType,
                            title: bookmark.title,
                            topicIndex: bookmark.topicIndex,
                            blockIndex: bookmark.blockIndex,
                          );
                        },
                      ),
                    );
                  }).toList(),
                );
              }).toList(),
            ),
    );
  }

  Widget _blockTypeIcon(String type) {
    return switch (type) {
      'pearl' => const Icon(Icons.lightbulb, color: Color(0xFFF59E0B)),
      'table' => const Icon(Icons.grid_on, color: Color(0xFF1E3A5F)),
      'mnemonic' => const Icon(Icons.psychology, color: Color(0xFF8B5CF6)),
      'quiz' => const Icon(Icons.quiz, color: Color(0xFF0D9488)),
      _ => const Icon(Icons.bookmark, color: Colors.grey),
    };
  }

  String _moduleTitle(String moduleId) {
    // Look up from ModuleData
    return ModuleData.allModules
        .firstWhere((m) => m.id == moduleId,
            orElse: () => ModuleModel(id: moduleId, title: moduleId))
        .title;
  }
}
```

### Integration Points

- **Every content block widget** (PearlBlockWidget, TableBlockWidget, MnemonicBlockWidget, etc.): Add `BookmarkButton` in the top-right corner of the block's header row.
- **HomeScreen**: Add a bookmark icon in the AppBar or as a bottom section.
- **ContentBlockRegistry**: Pass moduleId, topicIndex, blockIndex down to each block builder so it can construct the bookmark ID.

---

## Feature 3: Dark Mode

### Three-Way Toggle: Light / Dark / System

Store in shared_preferences:

```dart
// In settings service or directly:
class ThemeService {
  static const _key = 'theme_mode';

  static Future<ThemeMode> getThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getString(_key) ?? 'system';
    return switch (value) {
      'light' => ThemeMode.light,
      'dark' => ThemeMode.dark,
      _ => ThemeMode.system,
    };
  }

  static Future<void> setThemeMode(ThemeMode mode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, switch (mode) {
      ThemeMode.light => 'light',
      ThemeMode.dark => 'dark',
      ThemeMode.system => 'system',
    });
  }
}
```

### App Root with Theme Switching

```dart
class POTrainingApp extends StatefulWidget {
  const POTrainingApp({super.key});

  // Global key for theme switching from anywhere
  static final GlobalKey<_POTrainingAppState> appKey =
      GlobalKey<_POTrainingAppState>();

  static void setThemeMode(ThemeMode mode) {
    appKey.currentState?.setThemeMode(mode);
  }

  @override
  State<POTrainingApp> createState() => _POTrainingAppState();
}

class _POTrainingAppState extends State<POTrainingApp> {
  ThemeMode _themeMode = ThemeMode.system;

  @override
  void initState() {
    super.initState();
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    final mode = await ThemeService.getThemeMode();
    setState(() => _themeMode = mode);
  }

  void setThemeMode(ThemeMode mode) {
    setState(() => _themeMode = mode);
    ThemeService.setThemeMode(mode);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      key: POTrainingApp.appKey,
      title: 'P&O Training',
      theme: AppTheme.lightTheme(),
      darkTheme: AppTheme.darkTheme(),
      themeMode: _themeMode,
      home: const HomeScreen(),
    );
  }
}
```

### Dark Mode Color Mapping

**Clinical palette dark adjustments:**

| Light Mode | Dark Mode | Rationale |
|------------|-----------|-----------|
| Navy primary #1B2A4A | Desaturated blue #8BB3E0 | Primary must be light-on-dark; use tonal lift |
| Accent Teal #0D9488 | Brighter teal #2DD4BF | Increase luminance for dark backgrounds |
| Pearl amber bg #FEF3C7 | Dark amber #3D2E0A | Low-luminance warm tone, keeps amber identity |
| Pearl amber border #F59E0B | Slightly muted #D97706 | Reduce glare on dark bg |
| Mnemonic purple bg #EDE9FE | Dark purple #2D1F54 | Same hue, deep value |
| Mnemonic border #7C3AED | Brighter #A78BFA | Lift for contrast |
| Danger red bg #FEE2E2 | Dark red #3B1111 | Deep, non-distracting |
| Surface white | #121212 | Material dark standard |
| Card white | #1E1E1E | Elevation-based surfacing |

**Module colors (dark variants):** Increase lightness by ~20% from their light-mode values to maintain contrast on dark surfaces.

```dart
class AppTheme {
  // Light mode module colors (original)
  static const List<Color> moduleColors = [
    Color(0xFF3B82F6), Color(0xFF8B5CF6), Color(0xFF0EA5E9),
    Color(0xFF6366F1), Color(0xFFDC2626), Color(0xFF7C3AED),
    Color(0xFFEA580C), Color(0xFF0D9488), Color(0xFFE11D48),
    Color(0xFF2563EB), Color(0xFF9333EA), Color(0xFF059669),
    Color(0xFFF97316), Color(0xFF0891B2),
  ];

  // Dark mode module colors (lightness boosted ~20%)
  static const List<Color> moduleColorsDark = [
    Color(0xFF60A5FA), Color(0xFFA78BFA), Color(0xFF38BDF8),
    Color(0xFF818CF8), Color(0xFFF87171), Color(0xFFA78BFA),
    Color(0xFFFB923C), Color(0xFF2DD4BF), Color(0xFFFB7185),
    Color(0xFF60A5FA), Color(0xFFC084FC), Color(0xFF34D399),
    Color(0xFFFBAF24), Color(0xFF22D3EE),
  ];

  static ThemeData lightTheme() {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: const Color(0xFF1B2A4A),
      brightness: Brightness.light,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme.copyWith(
        primary: const Color(0xFF1B2A4A),
        secondary: const Color(0xFF0D9488),
      ),
      // ... rest of light theme
    );
  }

  static ThemeData darkTheme() {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: const Color(0xFF1B2A4A),
      brightness: Brightness.dark,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme.copyWith(
        primary: const Color(0xFF8BB3E0),
        secondary: const Color(0xFF2DD4BF),
        surface: const Color(0xFF121212),
      ),
      // ... rest of dark theme
    );
  }
}
```

### ThemeExtension for Clinical Colors

The plan already identifies `ThemeExtension` as the Material 3 approach for custom colors. Use it for block-specific colors that need dark variants:

```dart
class ClinicalColors extends ThemeExtension<ClinicalColors> {
  final Color pearlBackground;
  final Color pearlBorder;
  final Color mnemonicBackground;
  final Color mnemonicBorder;
  final Color dangerBackground;
  final Color dangerBorder;
  final Color tableHeaderBackground;

  const ClinicalColors({
    required this.pearlBackground,
    required this.pearlBorder,
    required this.mnemonicBackground,
    required this.mnemonicBorder,
    required this.dangerBackground,
    required this.dangerBorder,
    required this.tableHeaderBackground,
  });

  static const light = ClinicalColors(
    pearlBackground: Color(0xFFFEF3C7),
    pearlBorder: Color(0xFFF59E0B),
    mnemonicBackground: Color(0xFFEDE9FE),
    mnemonicBorder: Color(0xFF7C3AED),
    dangerBackground: Color(0xFFFEE2E2),
    dangerBorder: Color(0xFFDC2626),
    tableHeaderBackground: Color(0xFFF1F5F9),
  );

  static const dark = ClinicalColors(
    pearlBackground: Color(0xFF3D2E0A),
    pearlBorder: Color(0xFFD97706),
    mnemonicBackground: Color(0xFF2D1F54),
    mnemonicBorder: Color(0xFFA78BFA),
    dangerBackground: Color(0xFF3B1111),
    dangerBorder: Color(0xFFF87171),
    tableHeaderBackground: Color(0xFF1E2A3A),
  );

  @override
  ClinicalColors copyWith({/* all fields */}) {
    return ClinicalColors(
      pearlBackground: pearlBackground,
      pearlBorder: pearlBorder,
      mnemonicBackground: mnemonicBackground,
      mnemonicBorder: mnemonicBorder,
      dangerBackground: dangerBackground,
      dangerBorder: dangerBorder,
      tableHeaderBackground: tableHeaderBackground,
    );
  }

  @override
  ClinicalColors lerp(ClinicalColors? other, double t) {
    if (other == null) return this;
    return ClinicalColors(
      pearlBackground: Color.lerp(pearlBackground, other.pearlBackground, t)!,
      pearlBorder: Color.lerp(pearlBorder, other.pearlBorder, t)!,
      mnemonicBackground:
          Color.lerp(mnemonicBackground, other.mnemonicBackground, t)!,
      mnemonicBorder: Color.lerp(mnemonicBorder, other.mnemonicBorder, t)!,
      dangerBackground:
          Color.lerp(dangerBackground, other.dangerBackground, t)!,
      dangerBorder: Color.lerp(dangerBorder, other.dangerBorder, t)!,
      tableHeaderBackground:
          Color.lerp(tableHeaderBackground, other.tableHeaderBackground, t)!,
    );
  }
}

// Usage in ThemeData:
ThemeData lightTheme() {
  return ThemeData(
    // ...
    extensions: const [ClinicalColors.light],
  );
}

ThemeData darkTheme() {
  return ThemeData(
    // ...
    extensions: const [ClinicalColors.dark],
  );
}

// Access in widgets:
final clinical = Theme.of(context).extension<ClinicalColors>()!;
Container(
  color: clinical.pearlBackground,
  // ...
);
```

### Settings Screen Toggle

```dart
class ThemeModeSelector extends StatelessWidget {
  final ThemeMode currentMode;
  final ValueChanged<ThemeMode> onChanged;

  const ThemeModeSelector({
    super.key,
    required this.currentMode,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<ThemeMode>(
      segments: const [
        ButtonSegment(
          value: ThemeMode.light,
          icon: Icon(Icons.light_mode),
          label: Text('Light'),
        ),
        ButtonSegment(
          value: ThemeMode.dark,
          icon: Icon(Icons.dark_mode),
          label: Text('Dark'),
        ),
        ButtonSegment(
          value: ThemeMode.system,
          icon: Icon(Icons.settings_brightness),
          label: Text('System'),
        ),
      ],
      selected: {currentMode},
      onSelectionChanged: (selection) => onChanged(selection.first),
    );
  }
}
```

---

## Feature 4: Spaced Repetition for Flashcards

### Algorithm Choice: FSRS via `fsrs: ^2.0.0`

FSRS (Free Spaced Repetition Scheduler) is superior to Leitner boxes. It uses a DSR (Difficulty, Stability, Retrievability) model that adapts to individual learning patterns. The `fsrs` Dart package is actively maintained with a 2.0 release.

**Why FSRS over Leitner:**
- Leitner uses fixed intervals (1d, 3d, 7d) — not adaptive
- FSRS calculates optimal review time based on desired retention rate (default 90%)
- FSRS tracks retrievability (probability of correct recall) per card
- The `fsrs` package handles all the math

### Data Schema

```dart
@HiveType(typeId: 2)
class CardState extends HiveObject {
  @HiveField(0)
  final String cardId; // matches Flashcard.id from existing model

  @HiveField(1)
  final String deckId;

  @HiveField(2)
  double difficulty; // FSRS difficulty parameter

  @HiveField(3)
  double stability; // FSRS stability parameter

  @HiveField(4)
  DateTime due; // next review date

  @HiveField(5)
  DateTime lastReview;

  @HiveField(6)
  int reps; // total review count

  @HiveField(7)
  int lapses; // times forgotten (rated "Again")

  @HiveField(8)
  int state; // 0=New, 1=Learning, 2=Review, 3=Relearning

  @HiveField(9)
  double? lastElapsedDays;

  @HiveField(10)
  double? scheduledDays;

  CardState({
    required this.cardId,
    required this.deckId,
    this.difficulty = 0,
    this.stability = 0,
    DateTime? due,
    DateTime? lastReview,
    this.reps = 0,
    this.lapses = 0,
    this.state = 0,
    this.lastElapsedDays,
    this.scheduledDays,
  })  : due = due ?? DateTime.now(),
        lastReview = lastReview ?? DateTime.now();
}
```

### Spaced Repetition Service

```dart
import 'package:fsrs/fsrs.dart';

class SpacedRepetitionService {
  static final _box = Hive.box<CardState>('spaced_repetition');
  static final _fsrs = FSRS(); // default params: retention = 0.9

  /// Get or create FSRS Card from stored state
  static Card _toFsrsCard(CardState state) {
    return Card()
      ..due = state.due
      ..stability = state.stability
      ..difficulty = state.difficulty
      ..reps = state.reps
      ..lapses = state.lapses
      ..state = State.values[state.state]
      ..lastReview = state.lastReview
      ..elapsedDays = state.lastElapsedDays ?? 0
      ..scheduledDays = state.scheduledDays ?? 0;
  }

  /// Save FSRS Card back to Hive
  static void _saveCard(String cardId, String deckId, Card card) {
    _box.put(cardId, CardState(
      cardId: cardId,
      deckId: deckId,
      difficulty: card.difficulty,
      stability: card.stability,
      due: card.due,
      lastReview: card.lastReview,
      reps: card.reps,
      lapses: card.lapses,
      state: card.state.index,
      lastElapsedDays: card.elapsedDays,
      scheduledDays: card.scheduledDays,
    ));
  }

  /// Review a card with a rating
  /// Rating.again = forgot, Rating.hard, Rating.good, Rating.easy
  static void reviewCard(String cardId, String deckId, Rating rating) {
    final existing = _box.get(cardId);
    final fsrsCard = existing != null ? _toFsrsCard(existing) : Card();

    final schedulingCards = _fsrs.repeat(fsrsCard, DateTime.now());
    final result = schedulingCards[rating]!;

    _saveCard(cardId, deckId, result.card);
  }

  /// Get all cards due for review (due date <= now)
  static List<String> cardsDueForReview({String? deckId}) {
    final now = DateTime.now();
    return _box.values
        .where((s) =>
            s.due.isBefore(now) &&
            (deckId == null || s.deckId == deckId))
        .map((s) => s.cardId)
        .toList();
  }

  /// Get N cards due for review (for daily session)
  static List<String> dailyDueCards(int count) {
    final now = DateTime.now();
    final due = _box.values
        .where((s) => s.due.isBefore(now))
        .toList()
      ..sort((a, b) => a.due.compareTo(b.due)); // most overdue first
    return due.take(count).map((s) => s.cardId).toList();
  }

  /// Count of cards due now
  static int dueCount() {
    final now = DateTime.now();
    return _box.values.where((s) => s.due.isBefore(now)).length;
  }

  /// Get retrievability (probability of recall) for a card
  static double? getRetrievability(String cardId) {
    final state = _box.get(cardId);
    if (state == null || state.state == 0) return null; // new card
    final card = _toFsrsCard(state);
    return _fsrs.getRetrievability(card, DateTime.now());
  }

  /// Initialize all flashcards into the system (call once when flashcard
  /// data is loaded, only adds cards not already tracked)
  static void ensureCardsExist(List<String> cardIds, String deckId) {
    for (final id in cardIds) {
      if (!_box.containsKey(id)) {
        _box.put(id, CardState(cardId: id, deckId: deckId));
      }
    }
  }
}
```

### Integration with Existing FlashcardView

The existing FlashcardView uses "Know It" / "Needs Work" binary rating. Map to FSRS:

```dart
// In FlashcardView, when user taps "Know It":
SpacedRepetitionService.reviewCard(card.id, deckId, Rating.good);

// When user taps "Needs Work":
SpacedRepetitionService.reviewCard(card.id, deckId, Rating.again);
```

For a richer experience, you could add a 4-button rating after card reveal:
- Again (forgot completely)
- Hard (struggled but recalled)
- Good (recalled with effort)
- Easy (instant recall)

But the existing binary UX is fine — just map to `Rating.again` and `Rating.good`.

### Daily Session Size

Default: **5 cards per daily session.** This is based on:
- A medical student reviewing 5 cards takes ~3-4 minutes
- Low enough to not feel burdensome
- High enough to make meaningful progress
- The FSRS algorithm handles scheduling, so even with only 5/day, long-term retention is maintained

---

## Feature 5: Daily Review Mode

### Content Mix

| Component | Count | Source | Est. Time |
|-----------|-------|--------|-----------|
| Spaced repetition flashcards | 5 | Cards where `due <= now`, most overdue first | ~3 min |
| Quiz questions (weakest module) | 5 | Random from module with lowest accuracy | ~4 min |
| Bookmarked items | 3 | Random from bookmarks | ~1 min |
| **Total** | **13 items** | | **~8 min** |

### Weakest Module Algorithm

```dart
class DailyReviewService {
  /// Select the weakest module (lowest quiz accuracy among attempted modules).
  /// If no modules attempted, return the first module.
  /// If tied, prefer the module with fewer total attempts.
  static String selectWeakestModule(List<String> allModuleIds) {
    String? weakest;
    double lowestAccuracy = double.infinity;
    int fewestAttempts = 999999;

    for (final id in allModuleIds) {
      final records = ProgressService.quizRecordsForModule(id);
      if (records.isEmpty) continue;

      final accuracy = ProgressService.moduleQuizAccuracy(id);
      final attempts = records.fold<int>(0, (sum, r) => sum + r.total);

      if (accuracy < lowestAccuracy ||
          (accuracy == lowestAccuracy && attempts < fewestAttempts)) {
        lowestAccuracy = accuracy;
        fewestAttempts = attempts;
        weakest = id;
      }
    }

    return weakest ?? allModuleIds.first;
  }

  /// Build the daily review session
  static DailyReviewSession buildSession(List<String> allModuleIds) {
    final dueCards = SpacedRepetitionService.dailyDueCards(5);
    final weakModule = selectWeakestModule(allModuleIds);
    final quizQuestions = _selectQuizQuestions(weakModule, 5);
    final bookmarks = BookmarkService.randomBookmarks(3);

    return DailyReviewSession(
      flashcardIds: dueCards,
      quizQuestionIds: quizQuestions,
      bookmarks: bookmarks,
      weakModuleId: weakModule,
    );
  }

  static List<String> _selectQuizQuestions(String moduleId, int count) {
    final allQuestions = QuizBank.questionsForModule(moduleId);
    allQuestions.shuffle();
    return allQuestions.take(count).map((q) => q.id).toList();
  }

  /// Estimate session duration in minutes
  static int estimatedMinutes(DailyReviewSession session) {
    // ~40s per flashcard, ~50s per quiz question, ~20s per bookmark
    final seconds = session.flashcardIds.length * 40 +
        session.quizQuestionIds.length * 50 +
        session.bookmarks.length * 20;
    return (seconds / 60).ceil();
  }
}

class DailyReviewSession {
  final List<String> flashcardIds;
  final List<String> quizQuestionIds;
  final List<Bookmark> bookmarks;
  final String weakModuleId;

  const DailyReviewSession({
    required this.flashcardIds,
    required this.quizQuestionIds,
    required this.bookmarks,
    required this.weakModuleId,
  });

  bool get isEmpty =>
      flashcardIds.isEmpty &&
      quizQuestionIds.isEmpty &&
      bookmarks.isEmpty;
}
```

### Daily Review Screen

```dart
class DailyReviewScreen extends StatefulWidget {
  final DailyReviewSession session;
  const DailyReviewScreen({super.key, required this.session});

  @override
  State<DailyReviewScreen> createState() => _DailyReviewScreenState();
}

class _DailyReviewScreenState extends State<DailyReviewScreen> {
  int _currentPhase = 0; // 0=flashcards, 1=quiz, 2=bookmarks, 3=complete
  int _flashcardIndex = 0;
  int _quizIndex = 0;
  int _bookmarkIndex = 0;

  int get _totalItems =>
      widget.session.flashcardIds.length +
      widget.session.quizQuestionIds.length +
      widget.session.bookmarks.length;

  int get _completedItems =>
      _flashcardIndex + _quizIndex + _bookmarkIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily Review'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4),
          child: LinearProgressIndicator(
            value: _totalItems > 0 ? _completedItems / _totalItems : 0,
          ),
        ),
      ),
      body: switch (_currentPhase) {
        0 => _buildFlashcardPhase(),
        1 => _buildQuizPhase(),
        2 => _buildBookmarkPhase(),
        _ => _buildCompletionScreen(),
      },
    );
  }

  Widget _buildFlashcardPhase() {
    if (_flashcardIndex >= widget.session.flashcardIds.length) {
      // Auto-advance to quiz phase
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() => _currentPhase = 1);
      });
      return const SizedBox.shrink();
    }

    return Column(
      children: [
        _PhaseHeader(
          icon: Icons.style,
          label: 'Flashcards',
          progress: '${_flashcardIndex + 1} of ${widget.session.flashcardIds.length}',
        ),
        Expanded(
          // Render the flashcard for widget.session.flashcardIds[_flashcardIndex]
          // On complete, increment _flashcardIndex
          child: _SingleFlashcardReview(
            cardId: widget.session.flashcardIds[_flashcardIndex],
            onComplete: (rating) {
              SpacedRepetitionService.reviewCard(
                widget.session.flashcardIds[_flashcardIndex],
                '', // deckId looked up from card
                rating,
              );
              setState(() {
                _flashcardIndex++;
                if (_flashcardIndex >= widget.session.flashcardIds.length) {
                  _currentPhase = 1;
                }
              });
            },
          ),
        ),
      ],
    );
  }

  // Similar _buildQuizPhase() and _buildBookmarkPhase()...

  Widget _buildCompletionScreen() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.check_circle, size: 80, color: Color(0xFF16A34A)),
          const SizedBox(height: 16),
          const Text('Daily Review Complete!',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          Text('Reviewed $_totalItems items',
              style: TextStyle(fontSize: 16, color: Colors.grey[600])),
          const SizedBox(height: 32),
          FilledButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Back to Home'),
          ),
        ],
      ),
    );
  }
}
```

### Home Screen CTA Button

```dart
class DailyReviewButton extends StatelessWidget {
  const DailyReviewButton({super.key});

  @override
  Widget build(BuildContext context) {
    final session = DailyReviewService.buildSession(
      ModuleData.allModules.map((m) => m.id).toList(),
    );

    if (session.isEmpty) {
      return const SizedBox.shrink(); // nothing to review
    }

    final minutes = DailyReviewService.estimatedMinutes(session);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: FilledButton.icon(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DailyReviewScreen(session: session),
          ),
        ),
        icon: const Icon(Icons.play_arrow),
        label: Text('Daily Review (~$minutes min)'),
        style: FilledButton.styleFrom(
          minimumSize: const Size.fromHeight(52),
          backgroundColor: const Color(0xFF0D9488),
        ),
      ),
    );
  }
}
```

---

## Feature 6: Study Streaks

### Storage (shared_preferences)

Only two values needed:
- `last_active_date`: ISO date string (yyyy-MM-dd)
- `current_streak`: integer

```dart
class StreakService {
  static const _lastActiveKey = 'last_active_date';
  static const _streakKey = 'current_streak';

  /// Call this whenever a quiz or flashcard session completes.
  static Future<int> recordActivity() async {
    final prefs = await SharedPreferences.getInstance();
    final today = _todayString();
    final lastActive = prefs.getString(_lastActiveKey);
    int streak = prefs.getInt(_streakKey) ?? 0;

    if (lastActive == today) {
      // Already recorded today
      return streak;
    }

    final yesterday = _dateString(DateTime.now().subtract(const Duration(days: 1)));

    if (lastActive == yesterday) {
      // Consecutive day — increment streak
      streak++;
    } else if (lastActive == null) {
      // First ever activity
      streak = 1;
    } else {
      // Gap — quiet reset (no punishment messaging)
      streak = 1;
    }

    await prefs.setString(_lastActiveKey, today);
    await prefs.setInt(_streakKey, streak);
    return streak;
  }

  /// Get current streak count
  static Future<int> currentStreak() async {
    final prefs = await SharedPreferences.getInstance();
    final lastActive = prefs.getString(_lastActiveKey);
    final streak = prefs.getInt(_streakKey) ?? 0;

    if (lastActive == null) return 0;

    final today = _todayString();
    final yesterday = _dateString(DateTime.now().subtract(const Duration(days: 1)));

    // Streak is valid if last activity was today or yesterday
    if (lastActive == today || lastActive == yesterday) {
      return streak;
    }

    // Streak has expired (gap > 1 day), but don't write — just report 0
    return 0;
  }

  static String _todayString() => _dateString(DateTime.now());
  static String _dateString(DateTime dt) =>
      '${dt.year}-${dt.month.toString().padLeft(2, '0')}-${dt.day.toString().padLeft(2, '0')}';
}
```

### Home Screen Widget

```dart
class StreakBadge extends StatelessWidget {
  const StreakBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<int>(
      future: StreakService.currentStreak(),
      builder: (context, snapshot) {
        final streak = snapshot.data ?? 0;
        if (streak == 0) return const SizedBox.shrink();

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: const Color(0xFFFEF3C7),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.local_fire_department,
                  color: Color(0xFFF59E0B), size: 20),
              const SizedBox(width: 4),
              Text(
                '$streak day${streak == 1 ? '' : 's'}',
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFB45309),
                  fontSize: 14,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
```

### Integration Points

- Call `StreakService.recordActivity()` at the end of `ProgressService.recordQuiz()` and `ProgressService.recordFlashcard()`.
- Place `StreakBadge` in the HomeScreen header area (next to app title or in the gradient header).

---

## Feature 7: Font Size Control

### Three-Step Scale

| Setting | Factor | Body Text | Heading |
|---------|--------|-----------|---------|
| Default | 1.0x | 16sp | 22sp |
| Large | 1.15x | 18.4sp | 25.3sp |
| Extra Large | 1.3x | 20.8sp | 28.6sp |

### Implementation via MediaQuery.textScaler

**Do NOT use theme-level font sizes** — that requires manually scaling every `TextStyle`. Instead, wrap the app's `MaterialApp` child with a `MediaQuery` override. This scales all text uniformly, including system widgets.

```dart
class FontScaleService {
  static const _key = 'font_scale';

  static Future<double> getScale() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(_key) ?? 1.0;
  }

  static Future<void> setScale(double scale) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(_key, scale);
  }
}
```

### App Integration

```dart
// In POTrainingApp build method:
@override
Widget build(BuildContext context) {
  return MaterialApp(
    // ...
    builder: (context, child) {
      return MediaQuery(
        data: MediaQuery.of(context).copyWith(
          textScaler: TextScaler.linear(_fontScale),
        ),
        child: child!,
      );
    },
    home: const HomeScreen(),
  );
}
```

Load `_fontScale` the same way as `_themeMode` — in `initState` from `FontScaleService.getScale()`.

### Settings Toggle

```dart
class FontSizeSelector extends StatelessWidget {
  final double currentScale;
  final ValueChanged<double> onChanged;

  const FontSizeSelector({
    super.key,
    required this.currentScale,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<double>(
      segments: const [
        ButtonSegment(value: 1.0, label: Text('Default')),
        ButtonSegment(value: 1.15, label: Text('Large')),
        ButtonSegment(value: 1.3, label: Text('Extra Large')),
      ],
      selected: {currentScale},
      onSelectionChanged: (selection) => onChanged(selection.first),
    );
  }
}
```

### Testing at 1.3x

Things that commonly break at 1.3x text scale:
- **Tab bars**: Text overflows. Fix with `isScrollable: true` on `TabBar`.
- **Tables**: Cell text wraps awkwardly. Fix with `minWidth` constraints and allowing horizontal scroll (already planned).
- **Buttons**: Text may overflow. Use `Flexible` or `FittedBox` wrappers.
- **Module cards**: Title may need 2 lines. Ensure `maxLines: 2` with `overflow: TextOverflow.ellipsis`.

Test checklist:
1. HomeScreen module grid at 1.3x — titles wrap correctly
2. TabBar with 4+ tabs at 1.3x — scrollable, no overflow
3. TableBlock at 1.3x — horizontal scroll still works
4. Quiz answer options at 1.3x — text wraps within option card
5. Flashcard text at 1.3x — no overflow on either side

---

## Feature 8: Optional Daily Notification

### Package: `flutter_local_notifications: ^17.1.2`

No backend required. Notifications are scheduled locally on the device.

### Setup

```dart
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  static final _plugin = FlutterLocalNotificationsPlugin();
  static const _channelId = 'daily_review';
  static const _notificationId = 0;

  static Future<void> initialize() async {
    tz.initializeTimeZones();

    const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosSettings = DarwinInitializationSettings(
      requestAlertPermission: false, // request later on opt-in
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    await _plugin.initialize(
      const InitializationSettings(
        android: androidSettings,
        iOS: iosSettings,
      ),
    );
  }

  /// Request permission (call when user opts in)
  static Future<bool> requestPermission() async {
    final android = _plugin.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();
    if (android != null) {
      final granted = await android.requestNotificationsPermission();
      return granted ?? false;
    }

    final ios = _plugin.resolvePlatformSpecificImplementation<
        IOSFlutterLocalNotificationsPlugin>();
    if (ios != null) {
      final granted = await ios.requestPermissions(
        alert: true,
        badge: true,
        sound: true,
      );
      return granted ?? false;
    }

    return true; // desktop
  }

  /// Schedule daily notification at user-selected time
  static Future<void> scheduleDailyReminder(int hour, int minute) async {
    await _plugin.cancelAll(); // clear existing

    final now = tz.TZDateTime.now(tz.local);
    var scheduled = tz.TZDateTime(
      tz.local, now.year, now.month, now.day, hour, minute,
    );
    if (scheduled.isBefore(now)) {
      scheduled = scheduled.add(const Duration(days: 1));
    }

    const androidDetails = AndroidNotificationDetails(
      _channelId,
      'Daily Review Reminder',
      channelDescription: 'Daily study reminder for P&O Training',
      importance: Importance.defaultImportance,
      priority: Priority.defaultPriority,
    );

    await _plugin.zonedSchedule(
      _notificationId,
      'P&O Training',
      'Your daily review is ready. 5 flashcards, 5 questions.',
      scheduled,
      const NotificationDetails(android: androidDetails),
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time, // repeats daily
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  /// Cancel all notifications (when user opts out)
  static Future<void> cancelAll() async {
    await _plugin.cancelAll();
  }
}
```

### Preferences Storage

```dart
class NotificationPrefs {
  static const _enabledKey = 'notification_enabled';
  static const _hourKey = 'notification_hour';
  static const _minuteKey = 'notification_minute';

  static Future<bool> isEnabled() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_enabledKey) ?? false;
  }

  static Future<TimeOfDay> getTime() async {
    final prefs = await SharedPreferences.getInstance();
    return TimeOfDay(
      hour: prefs.getInt(_hourKey) ?? 9,
      minute: prefs.getInt(_minuteKey) ?? 0,
    );
  }

  static Future<void> save(bool enabled, TimeOfDay time) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_enabledKey, enabled);
    await prefs.setInt(_hourKey, time.hour);
    await prefs.setInt(_minuteKey, time.minute);

    if (enabled) {
      await NotificationService.scheduleDailyReminder(time.hour, time.minute);
    } else {
      await NotificationService.cancelAll();
    }
  }
}
```

### Settings UI

```dart
class NotificationSettings extends StatefulWidget {
  const NotificationSettings({super.key});

  @override
  State<NotificationSettings> createState() => _NotificationSettingsState();
}

class _NotificationSettingsState extends State<NotificationSettings> {
  bool _enabled = false;
  TimeOfDay _time = const TimeOfDay(hour: 9, minute: 0);
  bool _loaded = false;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    _enabled = await NotificationPrefs.isEnabled();
    _time = await NotificationPrefs.getTime();
    setState(() => _loaded = true);
  }

  @override
  Widget build(BuildContext context) {
    if (!_loaded) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SwitchListTile(
          title: const Text('Daily Reminder'),
          subtitle: const Text('Get a daily nudge to review'),
          value: _enabled,
          onChanged: (value) async {
            if (value) {
              final granted = await NotificationService.requestPermission();
              if (!granted) return;
            }
            setState(() => _enabled = value);
            await NotificationPrefs.save(_enabled, _time);
          },
        ),
        if (_enabled)
          ListTile(
            title: const Text('Reminder Time'),
            trailing: Text(_time.format(context),
                style: const TextStyle(fontSize: 16)),
            onTap: () async {
              final picked = await showTimePicker(
                context: context,
                initialTime: _time,
              );
              if (picked != null) {
                setState(() => _time = picked);
                await NotificationPrefs.save(_enabled, _time);
              }
            },
          ),
      ],
    );
  }
}
```

### Platform Setup Required

**Android** (`android/app/src/main/AndroidManifest.xml`):
```xml
<uses-permission android:name="android.permission.POST_NOTIFICATIONS"/>
<uses-permission android:name="android.permission.SCHEDULE_EXACT_ALARM"/>
<uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>

<receiver android:exported="false" android:name="com.dexterous.flutterlocalnotifications.ScheduledNotificationReceiver" />
<receiver android:exported="false" android:name="com.dexterous.flutterlocalnotifications.ScheduledNotificationBootReceiver">
    <intent-filter>
        <action android:name="android.intent.action.BOOT_COMPLETED"/>
    </intent-filter>
</receiver>
```

**iOS** (`ios/Runner/AppDelegate.swift`): No special setup needed beyond requesting permissions at runtime (handled in code above).

---

## Settings Screen (combines Features 3, 7, 8)

```dart
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          const _SectionHeader('Appearance'),
          // Dark mode toggle (Feature 3)
          ListTile(
            title: const Text('Theme'),
            subtitle: const Text('Light, Dark, or System'),
            trailing: ThemeModeSelector(
              currentMode: /* read from app state */,
              onChanged: (mode) => POTrainingApp.setThemeMode(mode),
            ),
          ),
          // Font size (Feature 7)
          ListTile(
            title: const Text('Text Size'),
            trailing: FontSizeSelector(
              currentScale: /* read from app state */,
              onChanged: (scale) {
                FontScaleService.setScale(scale);
                POTrainingApp.setFontScale(scale);
              },
            ),
          ),
          const Divider(),
          const _SectionHeader('Notifications'),
          // Daily notification (Feature 8)
          const NotificationSettings(),
          const Divider(),
          const _SectionHeader('Data'),
          ListTile(
            title: const Text('Study Statistics'),
            leading: const Icon(Icons.bar_chart),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => const StudyStatsScreen())),
          ),
          ListTile(
            title: const Text('Reset Progress'),
            leading: const Icon(Icons.delete_outline, color: Colors.red),
            onTap: () => _confirmReset(context),
          ),
        ],
      ),
    );
  }
}
```

---

## File Organization

```
lib/
├── core/
│   ├── services/
│   │   ├── progress_service.dart       (Feature 1)
│   │   ├── bookmark_service.dart       (Feature 2)
│   │   ├── theme_service.dart          (Feature 3)
│   │   ├── font_scale_service.dart     (Feature 7)
│   │   ├── spaced_repetition_service.dart (Feature 4)
│   │   ├── streak_service.dart         (Feature 6)
│   │   ├── daily_review_service.dart   (Feature 5)
│   │   └── notification_service.dart   (Feature 8)
│   ├── theme/
│   │   ├── app_theme.dart              (light + dark themes)
│   │   └── clinical_colors.dart        (ThemeExtension)
│   └── widgets/
│       ├── bookmark_button.dart
│       ├── streak_badge.dart
│       ├── module_progress_ring.dart
│       └── daily_review_button.dart
├── data/
│   └── models/
│       ├── progress_record.dart        (+.g.dart generated)
│       ├── bookmark.dart               (+.g.dart generated)
│       └── card_state.dart             (+.g.dart generated)
├── features/
│   ├── settings/
│   │   └── settings_screen.dart
│   ├── stats/
│   │   └── study_stats_screen.dart
│   ├── bookmarks/
│   │   └── bookmarks_screen.dart
│   └── daily_review/
│       └── daily_review_screen.dart
```

---

## Updated Navigation Structure

```
HomeScreen
├── [AppBar] Settings icon → SettingsScreen
│   ├── Theme toggle (Light/Dark/System)
│   ├── Font size (Default/Large/Extra Large)
│   ├── Daily notification toggle + time picker
│   └── Study Stats link + Reset Progress
├── [Header] StreakBadge (flame + N days)
├── [CTA] DailyReviewButton ("Daily Review (~8 min)")
├── [AppBar] Bookmarks icon → BookmarksScreen
├── Board Review Quiz → QuizSessionView
│   └── (records to ProgressService + StreakService on complete)
├── Flashcards → FlashcardView
│   └── (records to ProgressService + SpacedRepetitionService + StreakService)
├── Podcasts → PodcastPlayerScreen
└── Module Grid (14 modules, each with ModuleProgressRing)
    └── ModuleContentScreen (tabs with BookmarkButton on each block)
```

---

## Package Summary

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8
  just_audio: ^0.9.36
  url_launcher: ^6.3.1
  # NEW — UX/Engagement Features
  hive_flutter: ^1.1.0
  shared_preferences: ^2.3.0
  fsrs: ^2.0.0
  flutter_local_notifications: ^17.1.2
  timezone: ^0.9.3

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^5.0.0
  hive_generator: ^2.0.1
  build_runner: ^2.4.8
```

---

## Sources

- [Local Storage Comparison in Flutter (Medium)](https://medium.com/@taufik.amary/local-storage-comparison-in-flutter-sharedpreferences-hive-isar-and-objectbox-eb9d9ef9a712)
- [Best Local Database for Flutter Apps (Dinko Marinac)](https://dinkomarinac.dev/best-local-database-for-flutter-apps-a-complete-guide)
- [Hive vs Drift vs Floor vs Isar (Quash)](https://quashbugs.com/blog/hive-vs-drift-vs-floor-vs-isar-2025)
- [dart-fsrs package (GitHub)](https://github.com/open-spaced-repetition/dart-fsrs)
- [fsrs on pub.dev](https://pub.dev/packages/fsrs)
- [Flutter Material 3 Themes (flutter.dev)](https://docs.flutter.dev/cookbook/design/themes)
- [New ColorScheme Roles (flutter.dev)](https://docs.flutter.dev/release/breaking-changes/new-color-scheme-roles)
- [flutter_local_notifications (pub.dev)](https://pub.dev/packages/flutter_local_notifications)
- [Complete Flutter Dark Mode Guide (Medium)](https://medium.com/@amazing_gs/complete-flutter-guide-how-to-implement-dark-mode-dynamic-theming-and-theme-switching-ddabaef48d5a)
- [Flutter Offline-First Architecture (flutter.dev)](https://docs.flutter.dev/app-architecture/design-patterns/offline-first)

# P&O Training App -- Complete File-by-File Implementation Blueprint

**Generated:** 2026-03-21
**Architecture source:** CVA Training, TBI Training, SCI Training (exact pattern match)
**Improvements over siblings:** sealed classes, extracted block widgets with registry, consolidated models, proper AudioPlayer lifecycle, enhanced quiz/flashcard post-results flow

---

## Directory Tree (all files)

```
po_training/
├── pubspec.yaml
├── lib/
│   ├── main.dart
│   ├── core/
│   │   ├── theme/
│   │   │   └── app_theme.dart
│   │   └── widgets/
│   │       ├── content_card.dart
│   │       ├── quiz_session_view.dart
│   │       └── content_blocks/
│   │           ├── content_block_registry.dart
│   │           ├── header_block_widget.dart
│   │           ├── text_block_widget.dart
│   │           ├── pearl_block_widget.dart
│   │           ├── bullet_card_block_widget.dart
│   │           ├── table_block_widget.dart
│   │           ├── comparison_card_block_widget.dart
│   │           ├── numbered_list_block_widget.dart
│   │           ├── mnemonic_block_widget.dart
│   │           ├── medication_card_block_widget.dart
│   │           ├── scale_block_widget.dart
│   │           └── custom_widget_block_widget.dart
│   ├── data/
│   │   ├── models/
│   │   │   ├── quiz_model.dart
│   │   │   ├── module_model.dart
│   │   │   ├── flashcard_model.dart
│   │   │   ├── podcast_model.dart
│   │   │   └── topic_content_model.dart
│   │   ├── module_data.dart
│   │   ├── module_contents/
│   │   │   ├── po_fundamentals_content.dart
│   │   │   ├── le_orthoses_content.dart
│   │   │   ├── ue_orthoses_content.dart
│   │   │   ├── spinal_orthoses_content.dart
│   │   │   ├── prosthetic_components_content.dart
│   │   │   ├── transtibial_content.dart
│   │   │   ├── transfemoral_content.dart
│   │   │   ├── ue_prosthetics_content.dart
│   │   │   ├── gait_analysis_content.dart
│   │   │   ├── materials_fabrication_content.dart
│   │   │   ├── pediatric_po_content.dart
│   │   │   ├── advanced_tech_content.dart
│   │   │   ├── amputation_rehab_content.dart
│   │   │   └── special_populations_content.dart
│   │   └── quiz_banks/
│   │       ├── po_quiz_bank.dart
│   │       ├── fundamentals_orthoses_quiz.dart
│   │       ├── prosthetics_quiz.dart
│   │       ├── gait_rehab_quiz.dart
│   │       ├── fundamentals_orthoses_flashcards.dart
│   │       ├── prosthetic_components_flashcards.dart
│   │       ├── gait_analysis_flashcards.dart
│   │       └── amputation_rehab_flashcards.dart
│   └── features/
│       └── learning/
│           ├── home_screen.dart
│           ├── module_content_screen.dart
│           ├── topic_content_view.dart
│           ├── podcast_player_screen.dart
│           └── widgets/
│               └── flashcard_view.dart
└── assets/
    ├── audio/
    │   ├── orthotic_principles_podcast.m4a
    │   ├── prosthetic_components_podcast.m4a
    │   ├── gait_analysis_podcast.m4a
    │   └── amputation_rehab_podcast.m4a
    ├── images/
    └── icons/
```

Total: **47 Dart files** + pubspec.yaml + asset directories

---

## FILE-BY-FILE BREAKDOWN

---

### 1. pubspec.yaml

**Purpose:** Project configuration, dependencies, and asset declarations.
**Approximate lines:** 70

```yaml
name: po_training
description: "P&O Board Review and Rotation Training"
publish_to: 'none'
version: 1.0.0+1

environment:
  sdk: ^3.11.0

dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8
  just_audio: ^0.9.36
  url_launcher: ^6.3.1

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^6.0.0

flutter:
  uses-material-design: true

  assets:
    - assets/icons/
    - assets/images/
    - assets/audio/
```

**Notes:**
- Identical dependency set to CVA/TBI/SCI Training.
- `just_audio` for podcast playback.
- `url_launcher` for potential external links.
- All audio files must be AAC/M4A format (not WAV). Convert with: `ffmpeg -i input.wav -c:a aac -b:a 128k -movflags +faststart output.m4a`

---

### 2. lib/main.dart

**Purpose:** App entry point. Creates MaterialApp with theme and home screen.
**Key classes:** `POTrainingApp` (StatelessWidget)
**Approximate lines:** 22

```dart
import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'features/learning/home_screen.dart';

void main() {
  runApp(const POTrainingApp());
}

class POTrainingApp extends StatelessWidget {
  const POTrainingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'P&O Training',
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
```

---

### 3. lib/core/theme/app_theme.dart

**Purpose:** Material 3 theme configuration with P&O clinical color palette and 14 module colors.
**Key classes:** `AppTheme` (static utility class)
**Approximate lines:** 105

**Key difference from siblings:** Module colors stored as `List<Color>` instead of 14 named constants.

```dart
import 'package:flutter/material.dart';

class AppTheme {
  // P&O Training uses a clinical prosthetics-inspired palette
  static const Color primaryNavy = Color(0xFF1B2A4A);
  static const Color accentTeal = Color(0xFF0D9488);
  static const Color warningAmber = Color(0xFFF59E0B);
  static const Color dangerRed = Color(0xFFDC2626);
  static const Color successGreen = Color(0xFF16A34A);
  static const Color surfaceLight = Color(0xFFF8FAFC);
  static const Color cardBackground = Color(0xFFFFFFFF);
  static const Color textPrimary = Color(0xFF1E293B);
  static const Color textSecondary = Color(0xFF64748B);

  // Module colors as indexed list (improvement over siblings' named constants)
  static const List<Color> moduleColors = [
    Color(0xFF3B82F6), // 0  Fundamentals
    Color(0xFF8B5CF6), // 1  LE Orthoses
    Color(0xFF0EA5E9), // 2  UE Orthoses
    Color(0xFF6366F1), // 3  Spinal Orthoses
    Color(0xFFDC2626), // 4  Prosthetic Components
    Color(0xFF7C3AED), // 5  Transtibial
    Color(0xFFEA580C), // 6  Transfemoral
    Color(0xFF0D9488), // 7  UE Prosthetics
    Color(0xFFE11D48), // 8  Gait Analysis
    Color(0xFF2563EB), // 9  Materials
    Color(0xFF9333EA), // 10 Pediatric
    Color(0xFF059669), // 11 Advanced Tech
    Color(0xFFF97316), // 12 Amputation Rehab
    Color(0xFF0891B2), // 13 Special Populations
  ];

  // Pearl / special block colors
  static const Color pearlBackground = Color(0xFFFEF3C7);
  static const Color pearlBorder = Color(0xFFF59E0B);
  static const Color mnemonicBackground = Color(0xFFEDE9FE);
  static const Color mnemonicBorder = Color(0xFF7C3AED);
  static const Color avoidBackground = Color(0xFFFEE2E2);
  static const Color avoidBorder = Color(0xFFDC2626);

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryNavy,
        brightness: Brightness.light,
      ),
      scaffoldBackgroundColor: surfaceLight,
      appBarTheme: const AppBarTheme(
        backgroundColor: primaryNavy,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      cardTheme: CardThemeData(
        color: cardBackground,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: textPrimary,
        ),
        headlineMedium: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w700,
          color: textPrimary,
        ),
        titleLarge: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: textPrimary,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          height: 1.6,
          color: textPrimary,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          height: 1.5,
          color: textSecondary,
        ),
      ),
    );
  }
}
```

---

### 4. lib/data/models/topic_content_model.dart

**Purpose:** Sealed ContentBlock hierarchy (Dart 3) plus TopicTab and TopicData containers.
**Key classes:** `ContentBlock` (sealed), `HeaderBlock`, `TextBlock`, `PearlBlock`, `BulletCardBlock`, `TableBlock`, `ComparisonCardBlock`, `NumberedListBlock`, `MnemonicBlock`, `MedicationCardBlock`, `ScaleBlock`, `CustomWidgetBlock`, `CustomWidgetType` (enum), `TopicTab`, `TopicData`
**Approximate lines:** 160

**Critical difference from siblings:** Uses `sealed` keyword instead of `abstract`. This enables exhaustive `switch` expressions -- the compiler will catch any missing block type when you add a new one.

```dart
import 'package:flutter/material.dart';

// ---- Sealed Block Hierarchy (Dart 3) ----

sealed class ContentBlock {}

class HeaderBlock extends ContentBlock {
  final String title;
  HeaderBlock(this.title);
}

class TextBlock extends ContentBlock {
  final String text;
  final bool isIntro;
  TextBlock(this.text, {this.isIntro = false});
}

class PearlBlock extends ContentBlock {
  final String title;
  final String text;
  PearlBlock(this.title, this.text);
}

class BulletCardBlock extends ContentBlock {
  final String title;
  final Color themeColor;
  final Color backgroundColor;
  final List<String> points;
  BulletCardBlock({
    required this.title,
    required this.themeColor,
    required this.backgroundColor,
    required this.points,
  });
}

class NumberedListBlock extends ContentBlock {
  final List<MapEntry<String, String>> items;
  NumberedListBlock(this.items);
}

class TableBlock extends ContentBlock {
  final String title;
  final List<String> columns;
  final List<List<String>> rows;
  final Color? headerColor;
  TableBlock({
    required this.title,
    required this.columns,
    required this.rows,
    this.headerColor,
  });
}

class ComparisonCardBlock extends ContentBlock {
  final String title;
  final Color themeColor;
  final Color backgroundColor;
  final IconData icon;
  final String description;
  final List<String> keyPoints;

  ComparisonCardBlock({
    required this.title,
    required this.themeColor,
    required this.backgroundColor,
    required this.icon,
    required this.description,
    required this.keyPoints,
  });
}

class MnemonicBlock extends ContentBlock {
  final String mnemonic;
  final String explanation;
  MnemonicBlock(this.mnemonic, this.explanation);
}

class ScaleBlock extends ContentBlock {
  final String scaleName;
  final String description;
  final List<String> columns;
  final List<List<String>> rows;
  final String? boardPearl;
  ScaleBlock({
    required this.scaleName,
    required this.description,
    required this.columns,
    required this.rows,
    this.boardPearl,
  });
}

class MedicationCardBlock extends ContentBlock {
  final String name;
  final String drugClass;
  final String mechanism;
  final String indication;
  final String dosing;
  final String sideEffects;
  final String boardPearl;
  final bool isAvoid;

  MedicationCardBlock({
    required this.name,
    required this.drugClass,
    required this.mechanism,
    required this.indication,
    this.dosing = '',
    this.sideEffects = '',
    this.boardPearl = '',
    this.isAvoid = false,
  });
}

// P&O-specific custom widget types
enum CustomWidgetType {
  kLevelClassifier,
  socketSelectionGuide,
  gaitDeviationAnalyzer,
  cervicalOrthosisSelector,
  energyExpenditureCalculator,
}

class CustomWidgetBlock extends ContentBlock {
  final CustomWidgetType type;
  CustomWidgetBlock(this.type);
}

// ---- Tab and Topic Containers ----

class TopicTab {
  final String title;
  final List<ContentBlock> blocks;

  TopicTab({required this.title, required this.blocks});
}

class TopicData {
  final String id;
  final String title;
  final List<TopicTab> tabs;

  TopicData({required this.id, required this.title, required this.tabs});
}
```

---

### 5. lib/data/models/quiz_model.dart

**Purpose:** Quiz question model with difficulty tagging. Consolidated into data/models/ (siblings split this into core/models/).
**Key classes:** `QuizQuestion`
**Approximate lines:** 18

```dart
class QuizQuestion {
  final String question;
  final List<String> options;
  final int correctIndex;
  final String explanation;
  final String? moduleId;
  final String? difficulty; // 'basic', 'intermediate', 'board'

  const QuizQuestion({
    required this.question,
    required this.options,
    required this.correctIndex,
    required this.explanation,
    this.moduleId,
    this.difficulty,
  });
}
```

---

### 6. lib/data/models/module_model.dart

**Purpose:** Module definition model.
**Key classes:** `ModuleModel`
**Approximate lines:** 17

```dart
class ModuleModel {
  final String id;
  final String title;
  final String description;
  final String? icon;
  final List<String> highlights;
  final bool isCompleted;

  ModuleModel({
    required this.id,
    required this.title,
    required this.description,
    this.icon,
    this.highlights = const [],
    this.isCompleted = false,
  });
}
```

---

### 7. lib/data/models/flashcard_model.dart

**Purpose:** Flashcard model for study decks.
**Key classes:** `Flashcard`
**Approximate lines:** 11

```dart
class Flashcard {
  final String front;
  final String back;
  final String? moduleId;

  const Flashcard({
    required this.front,
    required this.back,
    this.moduleId,
  });
}
```

---

### 8. lib/data/models/podcast_model.dart

**Purpose:** Podcast episode model and static episode data.
**Key classes:** `PodcastEpisode`, `PodcastData`
**Approximate lines:** 50

```dart
class PodcastEpisode {
  final String id;
  final String title;
  final String description;
  final String moduleId;
  final String assetPath;

  const PodcastEpisode({
    required this.id,
    required this.title,
    required this.description,
    required this.moduleId,
    required this.assetPath,
  });
}

class PodcastData {
  static const List<PodcastEpisode> episodes = [
    PodcastEpisode(
      id: 'orthotic-principles-podcast',
      title: 'Orthotic Principles Board Review',
      description:
          'Board-focused podcast covering AFO types, spinal orthoses, biomechanics, and UE orthoses by nerve injury.',
      moduleId: 'po-fundamentals',
      assetPath: 'assets/audio/orthotic_principles_podcast.m4a',
    ),
    PodcastEpisode(
      id: 'prosthetic-components-podcast',
      title: 'Prosthetic Components Board Review',
      description:
          'Deep dive into feet, knees, socket designs, suspension systems, and body-powered vs myoelectric.',
      moduleId: 'prosthetic-components',
      assetPath: 'assets/audio/prosthetic_components_podcast.m4a',
    ),
    PodcastEpisode(
      id: 'gait-analysis-podcast',
      title: 'Gait Analysis Board Review',
      description:
          'TT and TF gait deviations, energy expenditure by amputation level, and normal gait cycle.',
      moduleId: 'gait-analysis',
      assetPath: 'assets/audio/gait_analysis_podcast.m4a',
    ),
    PodcastEpisode(
      id: 'amputation-rehab-podcast',
      title: 'Amputation Rehab Board Review',
      description:
          'K-levels, phantom pain, pre-prosthetic rehab, pediatric fitting milestones, and special populations.',
      moduleId: 'amputation-rehab',
      assetPath: 'assets/audio/amputation_rehab_podcast.m4a',
    ),
  ];
}
```

---

### 9. lib/data/module_data.dart

**Purpose:** Static list of all 14 P&O module definitions.
**Key classes:** `ModuleData`
**Approximate lines:** 115

```dart
import 'models/module_model.dart';

class ModuleData {
  static final List<ModuleModel> standardModules = [
    ModuleModel(
      id: 'po-fundamentals',
      title: 'P&O Fundamentals',
      description:
          'Terminology, biomechanical principles, gait cycle phases, and prescription principles.',
      highlights: ['Biomechanics', 'Gait cycle', 'Lever arms'],
    ),
    ModuleModel(
      id: 'le-orthoses',
      title: 'Lower Extremity Orthoses',
      description:
          'AFO types and biomechanics, KAFOs, shoe modifications, and foot orthoses.',
      highlights: ['AFO types', 'FRO', 'Shoe mods'],
    ),
    ModuleModel(
      id: 'ue-orthoses',
      title: 'Upper Extremity Orthoses',
      description:
          'WHO types, nerve injury orthoses, static vs dynamic splinting, and fracture bracing.',
      highlights: ['Nerve injury', 'Tenodesis', 'Splinting'],
    ),
    ModuleModel(
      id: 'spinal-orthoses',
      title: 'Spinal Orthoses',
      description:
          'Cervical orthoses, TLSOs, LSOs, and indications by fracture type and level.',
      highlights: ['C-spine hierarchy', 'SOMI', 'Halo'],
    ),
    ModuleModel(
      id: 'prosthetic-components',
      title: 'Prosthetic Components',
      description:
          'Feet, knees, socket designs, suspension systems, and partial foot prosthetics.',
      highlights: ['SACH', 'Socket design', 'Suspension'],
    ),
    ModuleModel(
      id: 'transtibial',
      title: 'Transtibial Prosthetics',
      description:
          'PTB vs TSB sockets, pressure areas, alignment, liners, and TT gait deviations.',
      highlights: ['PTB', 'TSB', 'Pressure areas'],
    ),
    ModuleModel(
      id: 'transfemoral',
      title: 'Transfemoral Prosthetics',
      description:
          'Quad vs IRC sockets, knee selection, hip disarticulation, and TF gait deviations.',
      highlights: ['IRC', 'Quad socket', 'Knee units'],
    ),
    ModuleModel(
      id: 'ue-prosthetics',
      title: 'Upper Extremity Prosthetics',
      description:
          'Body-powered cables, myoelectric systems, terminal devices, and hybrid systems.',
      highlights: ['VO vs VC', 'Myoelectric', 'Cable systems'],
    ),
    ModuleModel(
      id: 'gait-analysis',
      title: 'Gait Analysis & Deviations',
      description:
          'Normal gait, TT and TF prosthetic gait deviations, orthotic gait, and energy expenditure.',
      highlights: ['Gait deviations', 'Energy cost', 'Vaulting'],
    ),
    ModuleModel(
      id: 'materials-fabrication',
      title: 'Materials & Fabrication',
      description:
          'Thermoplastics, carbon fiber, metals, CAD/CAM, and 3D printing in P&O.',
      highlights: ['Thermoplastics', 'Carbon fiber', 'CAD/CAM'],
    ),
    ModuleModel(
      id: 'pediatric-po',
      title: 'Pediatric P&O',
      description:
          'Congenital limb deficiencies, fitting milestones, scoliosis bracing, and bony overgrowth.',
      highlights: ['Fitting timing', 'Scoliosis', 'Overgrowth'],
    ),
    ModuleModel(
      id: 'advanced-tech',
      title: 'Advanced Technology',
      description:
          'Microprocessor knees, powered prosthetics, osseointegration, TMR, and pattern recognition.',
      highlights: ['C-Leg', 'TMR', 'Osseointegration'],
    ),
    ModuleModel(
      id: 'amputation-rehab',
      title: 'Amputation Surgery & Rehab',
      description:
          'Amputation levels, surgical principles, phantom pain, K-levels, and outcome measures.',
      highlights: ['K-levels', 'Phantom pain', 'Myodesis'],
    ),
    ModuleModel(
      id: 'special-populations',
      title: 'Special Populations',
      description:
          'Dysvascular amputations, Charcot foot, sports prosthetics, bilateral amputees, and geriatric.',
      highlights: ['Dysvascular', 'Charcot', 'Sports'],
    ),
  ];
}
```

---

### 10. lib/core/widgets/content_blocks/content_block_registry.dart

**Purpose:** Maps sealed ContentBlock types to widget builders using exhaustive switch. This is the central dispatch -- TopicContentView calls `buildBlock()` and gets back the correct widget. Adding a new block type requires adding one case here and one widget file.
**Key functions:** `buildBlock(ContentBlock block)` (top-level function)
**Approximate lines:** 45

```dart
import 'package:flutter/material.dart';
import '../../../data/models/topic_content_model.dart';
import 'header_block_widget.dart';
import 'text_block_widget.dart';
import 'pearl_block_widget.dart';
import 'bullet_card_block_widget.dart';
import 'table_block_widget.dart';
import 'comparison_card_block_widget.dart';
import 'numbered_list_block_widget.dart';
import 'mnemonic_block_widget.dart';
import 'medication_card_block_widget.dart';
import 'scale_block_widget.dart';
import 'custom_widget_block_widget.dart';

/// Exhaustive switch on sealed [ContentBlock] hierarchy.
/// The compiler enforces that every subclass is handled.
/// Adding a new ContentBlock subclass without a case here is a compile error.
Widget buildBlock(ContentBlock block) {
  return switch (block) {
    HeaderBlock b       => HeaderBlockWidget(block: b),
    TextBlock b         => TextBlockWidget(block: b),
    PearlBlock b        => PearlBlockWidget(block: b),
    BulletCardBlock b   => BulletCardBlockWidget(block: b),
    TableBlock b        => TableBlockWidget(block: b),
    ComparisonCardBlock b => ComparisonCardBlockWidget(block: b),
    NumberedListBlock b => NumberedListBlockWidget(block: b),
    MnemonicBlock b     => MnemonicBlockWidget(block: b),
    MedicationCardBlock b => MedicationCardBlockWidget(block: b),
    ScaleBlock b        => ScaleBlockWidget(block: b),
    CustomWidgetBlock b => CustomWidgetBlockWidget(block: b),
  };
}
```

**Why this matters:** The siblings use a chain of `if (block is X)` checks with a fallback `SizedBox.shrink()`. If a developer adds a new block type and forgets to handle it, it silently renders nothing. With a sealed class + exhaustive switch, that scenario is a compile-time error.

---

### 11. lib/core/widgets/content_blocks/header_block_widget.dart

**Purpose:** Renders section header text.
**Key classes:** `HeaderBlockWidget` (StatelessWidget)
**Approximate lines:** 25

```dart
import 'package:flutter/material.dart';
import '../../../data/models/topic_content_model.dart';
import '../../theme/app_theme.dart';

class HeaderBlockWidget extends StatelessWidget {
  final HeaderBlock block;
  const HeaderBlockWidget({super.key, required this.block});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, bottom: 12),
      child: Text(
        block.title,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w800,
          color: AppTheme.primaryNavy,
          letterSpacing: -0.5,
        ),
      ),
    );
  }
}
```

---

### 12. lib/core/widgets/content_blocks/text_block_widget.dart

**Purpose:** Renders body text paragraphs with optional intro styling.
**Key classes:** `TextBlockWidget` (StatelessWidget)
**Approximate lines:** 28

```dart
import 'package:flutter/material.dart';
import '../../../data/models/topic_content_model.dart';
import '../../theme/app_theme.dart';

class TextBlockWidget extends StatelessWidget {
  final TextBlock block;
  const TextBlockWidget({super.key, required this.block});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        block.text,
        style: TextStyle(
          fontSize: block.isIntro ? 16 : 14,
          height: 1.6,
          color: block.isIntro ? AppTheme.textPrimary : AppTheme.textSecondary,
          fontStyle: block.isIntro ? FontStyle.italic : FontStyle.normal,
        ),
      ),
    );
  }
}
```

---

### 13. lib/core/widgets/content_blocks/pearl_block_widget.dart

**Purpose:** Renders amber-bordered "Board Pearl" callout boxes.
**Key classes:** `PearlBlockWidget` (StatelessWidget)
**Approximate lines:** 45

```dart
import 'package:flutter/material.dart';
import '../../../data/models/topic_content_model.dart';
import '../../theme/app_theme.dart';

class PearlBlockWidget extends StatelessWidget {
  final PearlBlock block;
  const PearlBlockWidget({super.key, required this.block});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.pearlBackground,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.pearlBorder, width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.lightbulb_rounded, color: AppTheme.pearlBorder, size: 20),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  block.title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF92400E),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            block.text,
            style: const TextStyle(
              fontSize: 13,
              height: 1.5,
              color: Color(0xFF78350F),
            ),
          ),
        ],
      ),
    );
  }
}
```

---

### 14. lib/core/widgets/content_blocks/bullet_card_block_widget.dart

**Purpose:** Renders colored bullet-point cards for key concept lists.
**Key classes:** `BulletCardBlockWidget` (StatelessWidget)
**Approximate lines:** 55

Identical rendering logic to CVA's `_buildBulletCard`. Container with themed border/background, title in theme color, dot-prefixed bullet points.

---

### 15. lib/core/widgets/content_blocks/table_block_widget.dart

**Purpose:** Renders data tables with colored header bar and horizontal scroll.
**Key classes:** `TableBlockWidget` (StatelessWidget)
**Approximate lines:** 65

Identical rendering logic to CVA's `_buildTable`. Container with optional colored title bar, `DataTable` inside `SingleChildScrollView(scrollDirection: Axis.horizontal)`.

---

### 16. lib/core/widgets/content_blocks/comparison_card_block_widget.dart

**Purpose:** Renders side-by-side comparison cards (e.g., PTB vs TSB, body-powered vs myoelectric).
**Key classes:** `ComparisonCardBlockWidget` (StatelessWidget)
**Approximate lines:** 50

Identical rendering logic to CVA's `_buildComparisonCard`. Icon + title row, description, bulleted key points.

---

### 17. lib/core/widgets/content_blocks/numbered_list_block_widget.dart

**Purpose:** Renders sequentially numbered item lists (e.g., gait phases, surgical steps).
**Key classes:** `NumberedListBlockWidget` (StatelessWidget)
**Approximate lines:** 40

Identical rendering logic to CVA's `_buildNumberedList`. Teal-tinted number badge + text for each MapEntry.

---

### 18. lib/core/widgets/content_blocks/mnemonic_block_widget.dart

**Purpose:** Renders purple-bordered memory aid callout boxes.
**Key classes:** `MnemonicBlockWidget` (StatelessWidget)
**Approximate lines:** 45

Identical rendering logic to CVA's `_buildMnemonic`. Purple border/background, brain icon, bold mnemonic text + explanation.

---

### 19. lib/core/widgets/content_blocks/medication_card_block_widget.dart

**Purpose:** Renders medication/drug information cards (for phantom pain meds, etc.).
**Key classes:** `MedicationCardBlockWidget` (StatelessWidget)
**Approximate lines:** 55

Identical rendering logic to CVA's `_buildMedicationCard`. Teal border for indicated drugs, red border for contraindicated (`isAvoid`). Fields: name, class, mechanism, indication, dosing, side effects, board pearl.

---

### 20. lib/core/widgets/content_blocks/scale_block_widget.dart

**Purpose:** Renders assessment scale blocks (K-levels, energy expenditure tables, etc.).
**Key classes:** `ScaleBlockWidget` (StatelessWidget)
**Approximate lines:** 70

Identical rendering logic to CVA's `_buildScaleBlock`. Teal-tinted header with scale name/description, DataTable body, optional amber board pearl footer.

---

### 21. lib/core/widgets/content_blocks/custom_widget_block_widget.dart

**Purpose:** Dispatches CustomWidgetType enum to bespoke interactive widgets (K-level classifier, socket selection guide, etc.).
**Key classes:** `CustomWidgetBlockWidget` (StatelessWidget)
**Approximate lines:** 35

```dart
import 'package:flutter/material.dart';
import '../../../data/models/topic_content_model.dart';

class CustomWidgetBlockWidget extends StatelessWidget {
  final CustomWidgetBlock block;
  const CustomWidgetBlockWidget({super.key, required this.block});

  @override
  Widget build(BuildContext context) {
    return switch (block.type) {
      CustomWidgetType.kLevelClassifier       => _buildPlaceholder('K-Level Classifier'),
      CustomWidgetType.socketSelectionGuide   => _buildPlaceholder('Socket Selection Guide'),
      CustomWidgetType.gaitDeviationAnalyzer  => _buildPlaceholder('Gait Deviation Analyzer'),
      CustomWidgetType.cervicalOrthosisSelector => _buildPlaceholder('Cervical Orthosis Selector'),
      CustomWidgetType.energyExpenditureCalculator => _buildPlaceholder('Energy Expenditure Calculator'),
    };
  }

  Widget _buildPlaceholder(String name) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Center(
        child: Text(
          '$name\n(Interactive widget -- coming soon)',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
        ),
      ),
    );
  }
}
```

**Note:** Each placeholder gets replaced with its interactive implementation. Each custom widget can be extracted into its own file as it grows.

---

### 22. lib/core/widgets/content_card.dart

**Purpose:** Module card displayed on home screen list. Shows module number, icon, title, description, highlight chips.
**Key classes:** `ContentCard` (StatelessWidget)
**Approximate lines:** 180

Structurally identical to CVA's `content_card.dart`. Key difference: uses `AppTheme.moduleColors[index % AppTheme.moduleColors.length]` instead of named color constants.

```dart
import 'package:flutter/material.dart';
import '../../data/models/module_model.dart';
import '../../core/theme/app_theme.dart';

class ContentCard extends StatelessWidget {
  final ModuleModel module;
  final int index;
  final VoidCallback onTap;

  const ContentCard({
    super.key,
    required this.module,
    required this.index,
    required this.onTap,
  });

  Color get _moduleColor => AppTheme.moduleColors[index % AppTheme.moduleColors.length];

  IconData get _moduleIcon {
    const icons = [
      Icons.menu_book_rounded,            // Fundamentals
      Icons.straighten_rounded,           // LE Orthoses
      Icons.back_hand_rounded,            // UE Orthoses
      Icons.airline_seat_legroom_normal,   // Spinal Orthoses
      Icons.settings_rounded,             // Prosthetic Components
      Icons.directions_walk_rounded,      // Transtibial
      Icons.accessibility_new_rounded,    // Transfemoral
      Icons.pan_tool_rounded,             // UE Prosthetics
      Icons.show_chart_rounded,           // Gait Analysis
      Icons.construction_rounded,         // Materials
      Icons.child_care_rounded,           // Pediatric
      Icons.memory_rounded,              // Advanced Tech
      Icons.local_hospital_rounded,       // Amputation Rehab
      Icons.groups_rounded,              // Special Populations
    ];
    return icons[index % icons.length];
  }

  @override
  Widget build(BuildContext context) {
    // ... identical structure to CVA ContentCard using _moduleColor ...
  }
}
```

---

### 23. lib/core/widgets/quiz_session_view.dart

**Purpose:** Full quiz session UI with progress bar, question display, option selection, explanation reveal, and post-results dialog with Home/Retry/Review Missed actions.
**Key classes:** `QuizSessionView` (StatefulWidget), `_QuizSessionViewState`
**Approximate lines:** 350

**Key differences from siblings:**
1. Post-results dialog has three actions (not just "Done")
2. Mid-quiz back button shows confirmation dialog
3. Tracks list of missed questions for "Review Missed" flow

```dart
import 'package:flutter/material.dart';
import '../../data/models/quiz_model.dart';
import '../theme/app_theme.dart';

class QuizSessionView extends StatefulWidget {
  final List<QuizQuestion> questions;
  final String title;

  const QuizSessionView({
    super.key,
    required this.questions,
    required this.title,
  });

  @override
  State<QuizSessionView> createState() => _QuizSessionViewState();
}

class _QuizSessionViewState extends State<QuizSessionView> {
  int _currentIndex = 0;
  int? _selectedIndex;
  bool _answered = false;
  int _correct = 0;
  int _total = 0;
  final List<QuizQuestion> _missedQuestions = [];

  QuizQuestion get _currentQuestion => widget.questions[_currentIndex];
  bool get _isLastQuestion => _currentIndex >= widget.questions.length - 1;

  void _selectAnswer(int index) {
    if (_answered) return;
    setState(() {
      _selectedIndex = index;
      _answered = true;
      _total++;
      if (index == _currentQuestion.correctIndex) {
        _correct++;
      } else {
        _missedQuestions.add(_currentQuestion);
      }
    });
  }

  void _nextQuestion() {
    if (_isLastQuestion) {
      _showResults();
      return;
    }
    setState(() {
      _currentIndex++;
      _selectedIndex = null;
      _answered = false;
    });
  }

  void _showResults() {
    final percentage = ((_correct / _total) * 100).round();
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text('Quiz Complete!'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '$_correct / $_total',
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.w900),
            ),
            const SizedBox(height: 8),
            Text(
              '$percentage% correct',
              style: TextStyle(
                fontSize: 18,
                color: _correct / _total >= 0.7
                    ? AppTheme.successGreen
                    : AppTheme.dangerRed,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        actions: [
          // Back to Home
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              Navigator.of(context).pop();
            },
            child: const Text('Home'),
          ),
          // Try Again (new random set)
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              setState(() {
                _currentIndex = 0;
                _selectedIndex = null;
                _answered = false;
                _correct = 0;
                _total = 0;
                _missedQuestions.clear();
                // Reshuffle the question list
                widget.questions.shuffle();
              });
            },
            child: const Text('Retry'),
          ),
          // Review Missed
          if (_missedQuestions.isNotEmpty)
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (_) => QuizSessionView(
                      questions: List.from(_missedQuestions),
                      title: 'Review Missed',
                    ),
                  ),
                );
              },
              style: TextButton.styleFrom(
                foregroundColor: AppTheme.dangerRed,
              ),
              child: Text('Review Missed (${_missedQuestions.length})'),
            ),
        ],
      ),
    );
  }

  // Mid-quiz abandonment guard
  Future<bool> _onWillPop() async {
    if (_total == 0) return true; // No progress to lose
    final leave = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Leave Quiz?'),
        content: const Text('Your progress will be lost.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: const Text('Continue Quiz'),
          ),
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            style: TextButton.styleFrom(foregroundColor: AppTheme.dangerRed),
            child: const Text('Leave'),
          ),
        ],
      ),
    );
    return leave ?? false;
  }

  Color _getOptionColor(int index) {
    if (!_answered) return Colors.white;
    if (index == _currentQuestion.correctIndex) return const Color(0xFFDCFCE7);
    if (index == _selectedIndex) return const Color(0xFFFEE2E2);
    return Colors.white;
  }

  Color _getOptionBorderColor(int index) {
    if (!_answered) {
      return index == _selectedIndex
          ? AppTheme.accentTeal
          : Colors.grey.shade300;
    }
    if (index == _currentQuestion.correctIndex) return AppTheme.successGreen;
    if (index == _selectedIndex) return AppTheme.dangerRed;
    return Colors.grey.shade200;
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) async {
        if (didPop) return;
        final shouldPop = await _onWillPop();
        if (shouldPop && context.mounted) {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Text(
                  '${_currentIndex + 1}/${widget.questions.length}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Progress bar
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: LinearProgressIndicator(
                  value: (_currentIndex + 1) / widget.questions.length,
                  backgroundColor: Colors.grey.shade200,
                  valueColor: const AlwaysStoppedAnimation(AppTheme.accentTeal),
                  minHeight: 6,
                ),
              ),
              const SizedBox(height: 24),

              // Question
              Text(
                _currentQuestion.question,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  height: 1.4,
                  color: AppTheme.textPrimary,
                ),
              ),
              const SizedBox(height: 20),

              // Options
              ...List.generate(_currentQuestion.options.length, (i) {
                return GestureDetector(
                  onTap: () => _selectAnswer(i),
                  child: Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: _getOptionColor(i),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: _getOptionBorderColor(i),
                        width: 1.5,
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 28,
                          height: 28,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: !_answered
                                ? Colors.grey.shade100
                                : i == _currentQuestion.correctIndex
                                    ? AppTheme.successGreen.withValues(alpha: 0.15)
                                    : i == _selectedIndex
                                        ? AppTheme.dangerRed.withValues(alpha: 0.15)
                                        : Colors.grey.shade100,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            String.fromCharCode(65 + i),
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 13,
                              color: !_answered
                                  ? AppTheme.textSecondary
                                  : i == _currentQuestion.correctIndex
                                      ? AppTheme.successGreen
                                      : i == _selectedIndex
                                          ? AppTheme.dangerRed
                                          : AppTheme.textSecondary,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            _currentQuestion.options[i],
                            style: const TextStyle(fontSize: 14, height: 1.4),
                          ),
                        ),
                        if (_answered && i == _currentQuestion.correctIndex)
                          const Icon(Icons.check_circle,
                              color: AppTheme.successGreen, size: 22),
                        if (_answered &&
                            i == _selectedIndex &&
                            i != _currentQuestion.correctIndex)
                          const Icon(Icons.cancel,
                              color: AppTheme.dangerRed, size: 22),
                      ],
                    ),
                  ),
                );
              }),

              // Explanation
              if (_answered) ...[
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppTheme.pearlBackground,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppTheme.pearlBorder),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Icon(Icons.school_rounded,
                              color: AppTheme.pearlBorder, size: 18),
                          SizedBox(width: 8),
                          Text(
                            'Explanation',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF92400E),
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        _currentQuestion.explanation,
                        style: const TextStyle(
                          fontSize: 13,
                          height: 1.5,
                          color: Color(0xFF78350F),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _nextQuestion,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.accentTeal,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      _isLastQuestion ? 'See Results' : 'Next Question',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
```

---

### 24. lib/features/learning/home_screen.dart

**Purpose:** Main app screen with gradient hero header, quiz button, flashcard/podcast row, and scrollable module list.
**Key classes:** `HomeScreen` (StatelessWidget)
**Approximate lines:** 420

**Structure mirrors CVA's HomeScreen exactly with these changes:**
- Title: "P&O Training"
- Subtitle: "Prosthetics & Orthotics Rotation & Board Review"
- Badge: "14 Modules"
- Flashcard bottom sheet lists 4 decks (not 3)
- Podcast bottom sheet navigates to `PodcastPlayerScreen` (not inline `AudioPlayer`)

```dart
import 'package:flutter/material.dart';
import '../../data/module_data.dart';
import '../../data/quiz_banks/po_quiz_bank.dart';
import '../../data/quiz_banks/fundamentals_orthoses_flashcards.dart';
import '../../data/quiz_banks/prosthetic_components_flashcards.dart';
import '../../data/quiz_banks/gait_analysis_flashcards.dart';
import '../../data/quiz_banks/amputation_rehab_flashcards.dart';
import '../../data/models/podcast_model.dart';
import '../../core/theme/app_theme.dart';
import '../../core/widgets/content_card.dart';
import '../../core/widgets/quiz_session_view.dart';
import 'widgets/flashcard_view.dart';
import 'module_content_screen.dart';
import 'podcast_player_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final modules = ModuleData.standardModules;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // ---- Gradient app bar ----
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [AppTheme.primaryNavy, Color(0xFF2D4A7A)],
                  ),
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 40),
                        const Text(
                          'P&O Training',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                            letterSpacing: -1,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'Prosthetics & Orthotics Rotation & Board Review',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white.withValues(alpha: 0.8),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            _buildBadge('${modules.length} Modules',
                                AppTheme.accentTeal),
                            const SizedBox(width: 8),
                            _buildBadge('Board Ready', AppTheme.warningAmber),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              title: const Text(
                'P&O Training',
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
              ),
            ),
          ),

          // ---- Quiz button ----
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: GestureDetector(
                onTap: () {
                  final questions = POQuizBank.getRandomQuiz(10);
                  if (questions.isNotEmpty) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => QuizSessionView(
                          questions: questions,
                          title: 'Board Review Quiz',
                        ),
                      ),
                    );
                  }
                },
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [AppTheme.accentTeal, Color(0xFF0D7377)],
                    ),
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        color: AppTheme.accentTeal.withValues(alpha: 0.3),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(Icons.quiz_rounded,
                            color: Colors.white, size: 24),
                      ),
                      const SizedBox(width: 14),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Board Review Quiz',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white)),
                            SizedBox(height: 2),
                            Text('10 random questions across all topics',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.white70)),
                          ],
                        ),
                      ),
                      const Icon(Icons.arrow_forward_rounded,
                          color: Colors.white70),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // ---- Flashcard + Podcast row ----
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
              child: Row(
                children: [
                  // Flashcards button
                  Expanded(
                    child: GestureDetector(
                      onTap: () => _showFlashcardPicker(context),
                      child: _buildFeatureButton(
                        icon: Icons.style_rounded,
                        iconColor: AppTheme.warningAmber,
                        title: 'Flashcards',
                        subtitle: '4 decks',
                        borderColor: AppTheme.warningAmber,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  // Podcast button
                  Expanded(
                    child: GestureDetector(
                      onTap: () => _showPodcastPicker(context),
                      child: _buildFeatureButton(
                        icon: Icons.headset_rounded,
                        iconColor: AppTheme.moduleColors[3], // Indigo
                        title: 'Podcasts',
                        subtitle: '4 episodes',
                        borderColor: AppTheme.moduleColors[3],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ---- Section header ----
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
              child: Row(
                children: [
                  Container(
                    width: 4,
                    height: 20,
                    decoration: BoxDecoration(
                      color: AppTheme.accentTeal,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Learning Pathway',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: AppTheme.textPrimary,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ---- Module cards ----
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final module = modules[index];
                return ContentCard(
                  module: module,
                  index: index,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ModuleContentScreen(module: module),
                      ),
                    );
                  },
                );
              },
              childCount: modules.length,
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 32)),
        ],
      ),
    );
  }

  Widget _buildBadge(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withValues(alpha: 0.4)),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: color,
        ),
      ),
    );
  }

  Widget _buildFeatureButton({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    required Color borderColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: borderColor.withValues(alpha: 0.3)),
        boxShadow: [
          BoxShadow(
            color: borderColor.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: iconColor, size: 22),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.textPrimary)),
                Text(subtitle,
                    style: const TextStyle(
                        fontSize: 11, color: AppTheme.textSecondary)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showFlashcardPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Choose Flashcard Deck',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
            const SizedBox(height: 16),
            ListTile(
              leading: Icon(Icons.menu_book_rounded,
                  color: AppTheme.moduleColors[0]),
              title: const Text('Fundamentals & Orthoses'),
              subtitle: Text(
                  '${FundamentalsOrthosesFlashcards.cards.length} cards'),
              onTap: () {
                Navigator.pop(ctx);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => FlashcardView(
                            cards: FundamentalsOrthosesFlashcards.cards,
                            title: 'Fundamentals & Orthoses')));
              },
            ),
            ListTile(
              leading: Icon(Icons.settings_rounded,
                  color: AppTheme.moduleColors[4]),
              title: const Text('Prosthetic Components'),
              subtitle: Text(
                  '${ProstheticComponentsFlashcards.cards.length} cards'),
              onTap: () {
                Navigator.pop(ctx);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => FlashcardView(
                            cards: ProstheticComponentsFlashcards.cards,
                            title: 'Prosthetic Components')));
              },
            ),
            ListTile(
              leading: Icon(Icons.show_chart_rounded,
                  color: AppTheme.moduleColors[8]),
              title: const Text('Gait Analysis & Deviations'),
              subtitle:
                  Text('${GaitAnalysisFlashcards.cards.length} cards'),
              onTap: () {
                Navigator.pop(ctx);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => FlashcardView(
                            cards: GaitAnalysisFlashcards.cards,
                            title: 'Gait Analysis')));
              },
            ),
            ListTile(
              leading: Icon(Icons.local_hospital_rounded,
                  color: AppTheme.moduleColors[12]),
              title: const Text('Amputation Rehab & Special Populations'),
              subtitle:
                  Text('${AmputationRehabFlashcards.cards.length} cards'),
              onTap: () {
                Navigator.pop(ctx);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => FlashcardView(
                            cards: AmputationRehabFlashcards.cards,
                            title: 'Amputation Rehab')));
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showPodcastPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Choose Podcast',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
            const SizedBox(height: 16),
            ...PodcastData.episodes.map((ep) => ListTile(
                  leading: const Icon(Icons.headset_rounded,
                      color: AppTheme.accentTeal),
                  title: Text(ep.title),
                  subtitle: Text(ep.description, maxLines: 1,
                      overflow: TextOverflow.ellipsis),
                  onTap: () {
                    Navigator.pop(ctx);
                    // Navigate to dedicated player (fixes AudioPlayer lifecycle leak)
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => PodcastPlayerScreen(episode: ep),
                      ),
                    );
                  },
                )),
          ],
        ),
      ),
    );
  }
}
```

---

### 25. lib/features/learning/podcast_player_screen.dart

**Purpose:** Dedicated podcast player with proper AudioPlayer lifecycle management. Creates player in initState, disposes in dispose. Includes play/pause, seek bar, position/duration, and playback speed control.
**Key classes:** `PodcastPlayerScreen` (StatefulWidget), `_PodcastPlayerScreenState`
**Approximate lines:** 200

**This is the critical fix over siblings**, which create an AudioPlayer on tap in the home screen and never dispose it.

```dart
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import '../../data/models/podcast_model.dart';
import '../../core/theme/app_theme.dart';

class PodcastPlayerScreen extends StatefulWidget {
  final PodcastEpisode episode;

  const PodcastPlayerScreen({super.key, required this.episode});

  @override
  State<PodcastPlayerScreen> createState() => _PodcastPlayerScreenState();
}

class _PodcastPlayerScreenState extends State<PodcastPlayerScreen> {
  late final AudioPlayer _player;
  double _playbackSpeed = 1.0;
  static const List<double> _speeds = [1.0, 1.25, 1.5, 2.0];

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
    _initAudio();
  }

  Future<void> _initAudio() async {
    try {
      await _player.setAsset(widget.episode.assetPath);
    } catch (e) {
      debugPrint('Error loading audio: $e');
    }
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  void _cycleSpeed() {
    final currentIdx = _speeds.indexOf(_playbackSpeed);
    final nextIdx = (currentIdx + 1) % _speeds.length;
    setState(() {
      _playbackSpeed = _speeds[nextIdx];
    });
    _player.setSpeed(_playbackSpeed);
  }

  String _formatDuration(Duration d) {
    final minutes = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    if (d.inHours > 0) {
      return '${d.inHours}:$minutes:$seconds';
    }
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Podcast')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const Spacer(),
            // Episode artwork placeholder
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: AppTheme.primaryNavy.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(24),
              ),
              child: const Icon(Icons.headset_rounded,
                  size: 80, color: AppTheme.primaryNavy),
            ),
            const SizedBox(height: 32),
            // Title
            Text(
              widget.episode.title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w800,
                color: AppTheme.textPrimary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              widget.episode.description,
              style: const TextStyle(
                fontSize: 14,
                color: AppTheme.textSecondary,
                height: 1.4,
              ),
              textAlign: TextAlign.center,
            ),
            const Spacer(),

            // Seek bar
            StreamBuilder<Duration>(
              stream: _player.positionStream,
              builder: (context, posSnap) {
                final position = posSnap.data ?? Duration.zero;
                final duration = _player.duration ?? Duration.zero;
                return Column(
                  children: [
                    Slider(
                      activeColor: AppTheme.accentTeal,
                      inactiveColor: Colors.grey.shade300,
                      min: 0,
                      max: duration.inMilliseconds.toDouble().clamp(1, double.infinity),
                      value: position.inMilliseconds
                          .toDouble()
                          .clamp(0, duration.inMilliseconds.toDouble()),
                      onChanged: (val) {
                        _player.seek(Duration(milliseconds: val.round()));
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(_formatDuration(position),
                              style: const TextStyle(
                                  fontSize: 12,
                                  color: AppTheme.textSecondary)),
                          Text(_formatDuration(duration),
                              style: const TextStyle(
                                  fontSize: 12,
                                  color: AppTheme.textSecondary)),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 16),

            // Controls row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Speed button
                GestureDetector(
                  onTap: _cycleSpeed,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppTheme.accentTeal.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      '${_playbackSpeed}x',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.accentTeal,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 24),
                // Rewind 15s
                IconButton(
                  icon: const Icon(Icons.replay_10_rounded),
                  iconSize: 36,
                  color: AppTheme.textPrimary,
                  onPressed: () {
                    final newPos =
                        _player.position - const Duration(seconds: 15);
                    _player.seek(
                        newPos < Duration.zero ? Duration.zero : newPos);
                  },
                ),
                const SizedBox(width: 16),
                // Play/Pause
                StreamBuilder<PlayerState>(
                  stream: _player.playerStateStream,
                  builder: (context, snap) {
                    final playing = snap.data?.playing ?? false;
                    return GestureDetector(
                      onTap: () {
                        if (playing) {
                          _player.pause();
                        } else {
                          _player.play();
                        }
                      },
                      child: Container(
                        width: 64,
                        height: 64,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppTheme.accentTeal,
                        ),
                        child: Icon(
                          playing
                              ? Icons.pause_rounded
                              : Icons.play_arrow_rounded,
                          color: Colors.white,
                          size: 36,
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(width: 16),
                // Forward 30s
                IconButton(
                  icon: const Icon(Icons.forward_30_rounded),
                  iconSize: 36,
                  color: AppTheme.textPrimary,
                  onPressed: () {
                    final dur = _player.duration ?? Duration.zero;
                    final newPos =
                        _player.position + const Duration(seconds: 30);
                    _player.seek(newPos > dur ? dur : newPos);
                  },
                ),
              ],
            ),
            const SizedBox(height: 48),
          ],
        ),
      ),
    );
  }
}
```

---

### 26. lib/features/learning/module_content_screen.dart

**Purpose:** Displays content for a selected module. Routes module ID to the correct TopicData. Includes "Quiz This Module" FAB.
**Key classes:** `ModuleContentScreen` (StatelessWidget)
**Approximate lines:** 130

**Key difference from siblings:** Adds a FloatingActionButton for module-specific quizzes.

```dart
import 'package:flutter/material.dart';
import '../../data/models/module_model.dart';
import '../../data/module_contents/po_fundamentals_content.dart';
import '../../data/module_contents/le_orthoses_content.dart';
import '../../data/module_contents/ue_orthoses_content.dart';
import '../../data/module_contents/spinal_orthoses_content.dart';
import '../../data/module_contents/prosthetic_components_content.dart';
import '../../data/module_contents/transtibial_content.dart';
import '../../data/module_contents/transfemoral_content.dart';
import '../../data/module_contents/ue_prosthetics_content.dart';
import '../../data/module_contents/gait_analysis_content.dart';
import '../../data/module_contents/materials_fabrication_content.dart';
import '../../data/module_contents/pediatric_po_content.dart';
import '../../data/module_contents/advanced_tech_content.dart';
import '../../data/module_contents/amputation_rehab_content.dart';
import '../../data/module_contents/special_populations_content.dart';
import '../../data/quiz_banks/po_quiz_bank.dart';
import '../../core/widgets/quiz_session_view.dart';
import 'topic_content_view.dart';
import '../../data/models/topic_content_model.dart';

class ModuleContentScreen extends StatelessWidget {
  final ModuleModel module;

  const ModuleContentScreen({super.key, required this.module});

  TopicData? _getTopicData() {
    return switch (module.id) {
      'po-fundamentals'       => poFundamentalsContent,
      'le-orthoses'           => leOrthosesContent,
      'ue-orthoses'           => ueOrthosesContent,
      'spinal-orthoses'       => spinalOrthosesContent,
      'prosthetic-components' => prostheticComponentsContent,
      'transtibial'           => transtibialContent,
      'transfemoral'          => transfemoralContent,
      'ue-prosthetics'        => ueProstheticsContent,
      'gait-analysis'         => gaitAnalysisContent,
      'materials-fabrication' => materialsFabricationContent,
      'pediatric-po'          => pediatricPOContent,
      'advanced-tech'         => advancedTechContent,
      'amputation-rehab'      => amputationRehabContent,
      'special-populations'   => specialPopulationsContent,
      _                       => null,
    };
  }

  @override
  Widget build(BuildContext context) {
    final topicData = _getTopicData();

    return Scaffold(
      appBar: AppBar(title: Text(module.title)),
      body: topicData != null
          ? TopicContentView(topicData: topicData)
          : _buildComingSoon(),
      // Module-specific quiz FAB
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          final questions = POQuizBank.getModuleQuiz(module.id);
          if (questions.isNotEmpty) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => QuizSessionView(
                  questions: questions,
                  title: '${module.title} Quiz',
                ),
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('No quiz questions available for this module yet.')),
            );
          }
        },
        icon: const Icon(Icons.quiz_rounded),
        label: const Text('Quiz This Module'),
      ),
    );
  }

  Widget _buildComingSoon() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.construction_rounded, size: 64, color: Colors.grey.shade400),
            const SizedBox(height: 16),
            Text(module.title,
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                textAlign: TextAlign.center),
            const SizedBox(height: 8),
            Text('Content coming soon!',
                style: TextStyle(fontSize: 16, color: Colors.grey.shade600)),
          ],
        ),
      ),
    );
  }
}
```

---

### 27. lib/features/learning/topic_content_view.dart

**Purpose:** Renders tabbed topic content. Drastically simplified from siblings (~40 lines vs ~527) because block rendering is delegated to the registry.
**Key classes:** `TopicContentView` (StatelessWidget)
**Approximate lines:** 40

```dart
import 'package:flutter/material.dart';
import '../../data/models/topic_content_model.dart';
import '../../core/theme/app_theme.dart';
import '../../core/widgets/content_blocks/content_block_registry.dart';

class TopicContentView extends StatelessWidget {
  final TopicData topicData;

  const TopicContentView({super.key, required this.topicData});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: topicData.tabs.length,
      child: Column(
        children: [
          TabBar(
            isScrollable: topicData.tabs.length > 3,
            labelColor: AppTheme.primaryNavy,
            unselectedLabelColor: AppTheme.textSecondary,
            indicatorColor: AppTheme.accentTeal,
            indicatorWeight: 3,
            tabs: topicData.tabs.map((t) => Tab(text: t.title)).toList(),
          ),
          Expanded(
            child: TabBarView(
              children: topicData.tabs.map((tab) {
                return ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: tab.blocks.length,
                  itemBuilder: (context, index) {
                    return buildBlock(tab.blocks[index]);
                  },
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
```

**This is the key architectural win.** The siblings pack all block rendering logic (10+ methods, 400+ lines) into this single file. With the registry pattern, this file is purely structural -- tab bar + list view + delegation.

---

### 28. lib/features/learning/widgets/flashcard_view.dart

**Purpose:** Flashcard session UI with flip animation, Knew It / Needs Work buttons, "Needs Work" re-queue, and post-session dialog with Home/Replay/Review Needs Work.
**Key classes:** `FlashcardView` (StatefulWidget), `_FlashcardViewState`
**Approximate lines:** 260

**Key differences from siblings:**
1. "Needs Work" cards are re-appended to the end of the session queue
2. Post-session dialog has Home / Replay / Review Needs Work (not just "Done")
3. Mid-session back button shows confirmation

```dart
import 'package:flutter/material.dart';
import '../../../data/models/flashcard_model.dart';
import '../../../core/theme/app_theme.dart';

class FlashcardView extends StatefulWidget {
  final List<Flashcard> cards;
  final String title;

  const FlashcardView({super.key, required this.cards, required this.title});

  @override
  State<FlashcardView> createState() => _FlashcardViewState();
}

class _FlashcardViewState extends State<FlashcardView> {
  late List<Flashcard> _deck;
  int _currentIndex = 0;
  bool _showBack = false;
  int _knewIt = 0;
  int _needsWork = 0;
  final List<Flashcard> _needsWorkCards = [];

  @override
  void initState() {
    super.initState();
    _deck = List.from(widget.cards)..shuffle();
  }

  Flashcard get _card => _deck[_currentIndex];
  bool get _isLast => _currentIndex >= _deck.length - 1;

  void _flip() => setState(() => _showBack = !_showBack);

  void _next(bool knew) {
    if (knew) {
      _knewIt++;
    } else {
      _needsWork++;
      // Re-append to end of deck for reinforcement
      _deck.add(_card);
      _needsWorkCards.add(_card);
    }

    if (_isLast) {
      _showResults();
    } else {
      setState(() {
        _currentIndex++;
        _showBack = false;
      });
    }
  }

  void _showResults() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text('Session Complete!'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(children: [
                  Text('$_knewIt',
                      style: const TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w900,
                          color: AppTheme.successGreen)),
                  const Text('Knew It',
                      style: TextStyle(
                          fontSize: 13, color: AppTheme.textSecondary)),
                ]),
                Column(children: [
                  Text('$_needsWork',
                      style: const TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w900,
                          color: AppTheme.dangerRed)),
                  const Text('Needs Work',
                      style: TextStyle(
                          fontSize: 13, color: AppTheme.textSecondary)),
                ]),
              ],
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              Navigator.of(context).pop();
            },
            child: const Text('Home'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              setState(() {
                _deck = List.from(widget.cards)..shuffle();
                _currentIndex = 0;
                _showBack = false;
                _knewIt = 0;
                _needsWork = 0;
                _needsWorkCards.clear();
              });
            },
            child: const Text('Replay Deck'),
          ),
          if (_needsWorkCards.isNotEmpty)
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (_) => FlashcardView(
                      cards: _needsWorkCards,
                      title: 'Review: ${widget.title}',
                    ),
                  ),
                );
              },
              style: TextButton.styleFrom(foregroundColor: AppTheme.dangerRed),
              child: Text('Review Needs Work (${_needsWorkCards.length})'),
            ),
        ],
      ),
    );
  }

  Future<bool> _onWillPop() async {
    if (_currentIndex == 0 && !_showBack) return true;
    final leave = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Leave Flashcards?'),
        content: const Text('Your progress will be lost.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: const Text('Continue'),
          ),
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            style: TextButton.styleFrom(foregroundColor: AppTheme.dangerRed),
            child: const Text('Leave'),
          ),
        ],
      ),
    );
    return leave ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) async {
        if (didPop) return;
        final shouldPop = await _onWillPop();
        if (shouldPop && context.mounted) Navigator.of(context).pop();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Text(
                  '${_currentIndex + 1}/${_deck.length}',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // Progress
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: LinearProgressIndicator(
                  value: (_currentIndex + 1) / _deck.length,
                  backgroundColor: Colors.grey.shade200,
                  valueColor:
                      const AlwaysStoppedAnimation(AppTheme.accentTeal),
                  minHeight: 6,
                ),
              ),
              const SizedBox(height: 24),
              // Card (identical visual structure to CVA)
              Expanded(
                child: GestureDetector(
                  onTap: _flip,
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: Container(
                      key: ValueKey('$_currentIndex-$_showBack'),
                      width: double.infinity,
                      padding: const EdgeInsets.all(28),
                      decoration: BoxDecoration(
                        color: _showBack
                            ? const Color(0xFFF0FDFA)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: _showBack
                              ? AppTheme.accentTeal.withValues(alpha: 0.4)
                              : Colors.grey.shade200,
                          width: 2,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.06),
                            blurRadius: 16,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            _showBack ? 'ANSWER' : 'QUESTION',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1.5,
                              color: _showBack
                                  ? AppTheme.accentTeal
                                  : AppTheme.textSecondary,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            _showBack ? _card.back : _card.front,
                            style: TextStyle(
                              fontSize: _showBack ? 18 : 17,
                              fontWeight: _showBack
                                  ? FontWeight.w700
                                  : FontWeight.w500,
                              height: 1.5,
                              color: AppTheme.textPrimary,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          if (!_showBack) ...[
                            const SizedBox(height: 24),
                            Text('Tap to reveal answer',
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey.shade400)),
                          ],
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Buttons
              if (_showBack)
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () => _next(false),
                        icon: const Icon(Icons.refresh_rounded, size: 18),
                        label: const Text('Needs Work'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppTheme.dangerRed,
                          foregroundColor: Colors.white,
                          padding:
                              const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () => _next(true),
                        icon: const Icon(Icons.check_rounded, size: 18),
                        label: const Text('Knew It'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppTheme.successGreen,
                          foregroundColor: Colors.white,
                          padding:
                              const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                        ),
                      ),
                    ),
                  ],
                )
              else
                const SizedBox(height: 52),
            ],
          ),
        ),
      ),
    );
  }
}
```

---

### 29. lib/data/quiz_banks/po_quiz_bank.dart

**Purpose:** Quiz bank aggregator. Provides `getRandomQuiz(10)` with difficulty mixing and `getModuleQuiz(moduleId)` for module-specific quizzes.
**Key classes:** `POQuizBank`
**Approximate lines:** 60

```dart
import '../../data/models/quiz_model.dart';
import 'fundamentals_orthoses_quiz.dart';
import 'prosthetics_quiz.dart';
import 'gait_rehab_quiz.dart';

class POQuizBank {
  POQuizBank._();

  static List<QuizQuestion> get allQuestions => [
        ...FundamentalsOrthosesQuiz.questions,
        ...ProstheticsQuiz.questions,
        ...GaitRehabQuiz.questions,
      ];

  /// Returns 10 random questions with difficulty mix:
  /// 3 basic + 4 intermediate + 3 board-level.
  /// Ensures at least 7 unique modules represented.
  static List<QuizQuestion> getRandomQuiz(int count) {
    final basic = allQuestions
        .where((q) => q.difficulty == 'basic')
        .toList()
      ..shuffle();
    final intermediate = allQuestions
        .where((q) => q.difficulty == 'intermediate')
        .toList()
      ..shuffle();
    final board = allQuestions
        .where((q) => q.difficulty == 'board')
        .toList()
      ..shuffle();

    final selected = <QuizQuestion>[
      ...basic.take(3),
      ...intermediate.take(4),
      ...board.take(3),
    ];

    // Fill remainder if any difficulty bucket was short
    if (selected.length < count) {
      final remaining = allQuestions
          .where((q) => !selected.contains(q))
          .toList()
        ..shuffle();
      selected.addAll(remaining.take(count - selected.length));
    }

    selected.shuffle();
    return selected.take(count).toList();
  }

  /// Returns all questions tagged with a specific module ID.
  static List<QuizQuestion> getModuleQuiz(String moduleId) {
    final questions =
        allQuestions.where((q) => q.moduleId == moduleId).toList()..shuffle();
    return questions;
  }
}
```

---

### 30-32. lib/data/quiz_banks/ (individual quiz files)

**fundamentals_orthoses_quiz.dart**
- **Purpose:** Quiz questions for Modules 1-4 (Fundamentals, LE Orthoses, UE Orthoses, Spinal Orthoses).
- **Key classes:** `FundamentalsOrthosesQuiz`
- **Pattern:** Private constructor, static `const List<QuizQuestion> questions = [...]`
- **Approximate lines:** 400 (25+ questions)

**prosthetics_quiz.dart**
- **Purpose:** Quiz questions for Modules 5-8 (Components, TT, TF, UE Prosthetics).
- **Key classes:** `ProstheticsQuiz`
- **Approximate lines:** 400 (25+ questions)

**gait_rehab_quiz.dart**
- **Purpose:** Quiz questions for Modules 9-14 (Gait, Materials, Pediatric, Advanced, Rehab, Special).
- **Key classes:** `GaitRehabQuiz`
- **Approximate lines:** 400 (25+ questions)

Each file follows the exact pattern of CVA's `fundamentals_quiz.dart`:

```dart
import '../../data/models/quiz_model.dart';

class FundamentalsOrthosesQuiz {
  FundamentalsOrthosesQuiz._();

  static const List<QuizQuestion> questions = [
    QuizQuestion(
      question: 'Which AFO type generates a knee extension moment using ground reaction forces?',
      options: [
        'Posterior leaf spring AFO',
        'Solid ankle AFO',
        'Floor reaction (ground reaction) AFO',
        'Articulated AFO',
      ],
      correctIndex: 2,
      explanation:
          'The FRO (floor reaction orthosis) uses an anterior shell and anterior trim lines to create a knee extension moment via ground reaction forces. It requires intact quadriceps and is indicated for crouch gait (CP, myelomeningocele). It is contraindicated in knee recurvatum.',
      moduleId: 'le-orthoses',
      difficulty: 'board',
    ),
    // ... more questions
  ];
}
```

---

### 33-36. lib/data/quiz_banks/ (flashcard files)

**fundamentals_orthoses_flashcards.dart**
- **Purpose:** Flashcard deck covering Modules 1-4.
- **Key classes:** `FundamentalsOrthosesFlashcards`
- **Approximate lines:** 200 (20-25 cards)

**prosthetic_components_flashcards.dart**
- **Purpose:** Flashcard deck covering Modules 5-8.
- **Key classes:** `ProstheticComponentsFlashcards`
- **Approximate lines:** 200 (20-25 cards)

**gait_analysis_flashcards.dart**
- **Purpose:** Flashcard deck covering Module 9 (Gait).
- **Key classes:** `GaitAnalysisFlashcards`
- **Approximate lines:** 200 (20-25 cards)

**amputation_rehab_flashcards.dart**
- **Purpose:** Flashcard deck covering Modules 10-14.
- **Key classes:** `AmputationRehabFlashcards`
- **Approximate lines:** 200 (20-25 cards)

Each follows CVA's `fundamentals_flashcards.dart` pattern:

```dart
import '../models/flashcard_model.dart';

class FundamentalsOrthosesFlashcards {
  FundamentalsOrthosesFlashcards._();

  static const List<Flashcard> cards = [
    Flashcard(
      front: 'What does a Floor Reaction Orthosis (FRO) do biomechanically?',
      back:
          'Creates a knee extension moment via ground reaction forces using an anterior shell. Requires intact quads. Indicated for crouch gait (CP, myelomeningocele). Contraindicated in knee recurvatum.',
      moduleId: 'le-orthoses',
    ),
    // ... more cards
  ];
}
```

---

### 37-50. lib/data/module_contents/ (14 content files)

Each file follows the exact pattern of CVA's `stroke_fundamentals_content.dart`:

| # | File | Top-level variable | Tabs (typical) | Approx lines |
|---|------|-------------------|----------------|--------------|
| 37 | `po_fundamentals_content.dart` | `poFundamentalsContent` | Terminology, Biomechanics, Gait Cycle, Prescription | 350 |
| 38 | `le_orthoses_content.dart` | `leOrthosesContent` | AFO Types, KAFO/HKAFO, Shoe Mods, Foot Orthoses | 450 |
| 39 | `ue_orthoses_content.dart` | `ueOrthosesContent` | WHO Types, Nerve Injury, Static vs Dynamic, SCI Orthoses | 350 |
| 40 | `spinal_orthoses_content.dart` | `spinalOrthosesContent` | Cervical, Thoracolumbar, Indications, Comparison | 400 |
| 41 | `prosthetic_components_content.dart` | `prostheticComponentsContent` | Feet, Knees, Sockets, Suspension | 400 |
| 42 | `transtibial_content.dart` | `transtibialContent` | Socket Design, Pressure Areas, Alignment, Gait Deviations | 400 |
| 43 | `transfemoral_content.dart` | `transfemoralContent` | Socket Design, Knee Selection, Hip Disartic, Gait Deviations | 400 |
| 44 | `ue_prosthetics_content.dart` | `ueProstheticsContent` | Body-Powered, Myoelectric, TD Types, Comparison | 350 |
| 45 | `gait_analysis_content.dart` | `gaitAnalysisContent` | Normal Gait, TT Deviations, TF Deviations, Energy | 500 |
| 46 | `materials_fabrication_content.dart` | `materialsFabricationContent` | Thermoplastics, Composites, Metals, CAD/CAM | 300 |
| 47 | `pediatric_po_content.dart` | `pediatricPOContent` | Limb Deficiency, Fitting Milestones, Scoliosis, Overgrowth | 350 |
| 48 | `advanced_tech_content.dart` | `advancedTechContent` | MP Knees, Powered, Osseointegration, TMR | 300 |
| 49 | `amputation_rehab_content.dart` | `amputationRehabContent` | Levels, Surgery, Phantom Pain, K-Levels, Outcomes | 450 |
| 50 | `special_populations_content.dart` | `specialPopulationsContent` | Dysvascular, Charcot, Sports, Bilateral, Geriatric | 350 |

**Example structure** (po_fundamentals_content.dart):

```dart
import 'package:flutter/material.dart';
import '../models/topic_content_model.dart';

final TopicData poFundamentalsContent = TopicData(
  id: 'po_fundamentals',
  title: 'P&O Fundamentals',
  tabs: [
    // -- Terminology Tab --
    TopicTab(
      title: 'Terminology',
      blocks: [
        HeaderBlock('P&O Terminology & Definitions'),
        TextBlock(
          'Prosthetics and orthotics is the medical specialty concerned with '
          'the design, fabrication, and fitting of artificial limbs (prostheses) '
          'and supportive devices (orthoses). Understanding the foundational '
          'terminology is essential for effective communication with the '
          'rehabilitation team.',
          isIntro: true,
        ),
        BulletCardBlock(
          title: 'Key Definitions',
          themeColor: Color(0xFF3B82F6),
          backgroundColor: Color(0xFFEFF6FF),
          points: [
            'Prosthesis -- an artificial device that replaces a missing body part',
            'Orthosis -- an external device that supports, aligns, prevents, or corrects deformity',
            'Prosthetics -- the profession/science of prosthesis design and fitting',
            'Orthotics -- the profession/science of orthosis design and fitting',
            'Residual limb -- the remaining portion of the limb after amputation',
          ],
        ),
        PearlBlock(
          'Board Pearl: Naming Convention',
          'Orthoses are named by the joints they span: AFO = ankle-foot orthosis, '
          'KAFO = knee-ankle-foot orthosis, TLSO = thoracolumbosacral orthosis. '
          'This naming convention is the standard on board exams.',
        ),
        // ... more blocks
      ],
    ),

    // -- Biomechanics Tab --
    TopicTab(
      title: 'Biomechanics',
      blocks: [
        HeaderBlock('Biomechanical Principles'),
        // ... blocks covering lever arms, moments, GRF, 3-point pressure
      ],
    ),

    // -- Gait Cycle Tab --
    TopicTab(
      title: 'Gait Cycle',
      blocks: [
        HeaderBlock('Normal Gait Cycle'),
        // ... blocks covering stance phases, swing phases, parameters
        TableBlock(
          title: 'Gait Cycle Phases',
          columns: ['Phase', '% of Cycle', 'Key Event'],
          rows: [
            ['Initial Contact', '0%', 'Heel strikes ground'],
            ['Loading Response', '0-10%', 'Weight acceptance, foot flat'],
            ['Midstance', '10-30%', 'Single limb support, body advances over foot'],
            ['Terminal Stance', '30-50%', 'Heel off, body advances ahead of foot'],
            ['Pre-Swing', '50-60%', 'Toe off, double support ends'],
            ['Initial Swing', '60-73%', 'Foot clears ground'],
            ['Mid-Swing', '73-87%', 'Limb advances'],
            ['Terminal Swing', '87-100%', 'Limb decelerates for next contact'],
          ],
        ),
      ],
    ),

    // -- Prescription Tab --
    TopicTab(
      title: 'Prescription',
      blocks: [
        HeaderBlock('Prescription Principles'),
        // ... blocks covering team approach, prescription writing
      ],
    ),
  ],
);
```

---

## Summary Statistics

| Category | Count |
|----------|-------|
| Total Dart files | 47 |
| Model files | 5 |
| Content block widget files | 11 + 1 registry |
| Module content files | 14 |
| Quiz/flashcard data files | 7 |
| Screen/view files | 5 |
| Theme files | 1 |
| Shared widget files | 2 (ContentCard, QuizSessionView) |
| Total estimated lines (Dart) | ~8,500 (framework) + ~5,500 (content data) = ~14,000 |

## Key Architectural Differences from Siblings

| Feature | CVA/TBI/SCI | P&O (this app) |
|---------|-------------|----------------|
| ContentBlock class | `abstract class` | `sealed class` (compile-time exhaustive switch) |
| Block rendering | 527-line TopicContentView with 10+ private methods | 40-line TopicContentView + 11 separate widget files + registry |
| QuizModel location | `lib/core/models/quiz_model.dart` | `lib/data/models/quiz_model.dart` (consolidated) |
| Module colors | 14 named static constants | `List<Color> moduleColors` indexed by position |
| Quiz post-results | Single "Done" button | Home + Retry + Review Missed |
| Flashcard post-results | Single "Done" button | Home + Replay + Review Needs Work |
| Flashcard "Needs Work" | Counted only | Re-appended to session queue |
| Mid-session back button | Exits immediately | Confirmation dialog |
| Podcast playback | Inline AudioPlayer (leaked) | Dedicated PodcastPlayerScreen with dispose() |
| Podcast controls | Play only | Play/pause, seek, position/duration, speed (1x/1.25x/1.5x/2x) |
| Audio format | WAV (~175MB) | AAC/M4A (~11MB) |
| Module-specific quiz | Not available | "Quiz This Module" FAB on ModuleContentScreen |

## Implementation Order

1. **Phase 1 (scaffolding):** pubspec.yaml, main.dart, app_theme.dart, all 5 model files
2. **Phase 2 (block widgets):** All 11 content block widgets + registry
3. **Phase 3 (screens):** home_screen.dart, module_content_screen.dart, topic_content_view.dart, podcast_player_screen.dart, flashcard_view.dart, quiz_session_view.dart, content_card.dart
4. **Phase 4 (data):** module_data.dart, po_quiz_bank.dart, quiz files, flashcard files
5. **Phase 5 (content):** All 14 module content files (content extraction from PDFs)
6. **Phase 6 (assets):** Convert audio to M4A, add images/icons
7. **Phase 7 (polish):** flutter analyze, flutter test, cross-platform builds

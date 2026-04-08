import 'package:flutter/material.dart';
import '../../data/module_data.dart';
import '../../data/quiz_banks/po_quiz_bank.dart';
import '../../data/quiz_banks/po_flashcards.dart';
import '../../data/models/podcast_model.dart';
import '../../core/theme/app_theme.dart';
import '../../core/widgets/content_card.dart';
import '../../core/widgets/quiz_session_view.dart';
import 'widgets/flashcard_view.dart';
import 'module_content_screen.dart';
import 'podcast_player_screen.dart';
import 'search_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final modules = ModuleData.standardModules;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // ── HEADER ──
          SliverAppBar(
            expandedHeight: 180,
            pinned: true,
            backgroundColor: AppTheme.backgroundDark,
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.search_rounded,
                  color: AppTheme.accentTeal,
                  size: 24,
                ),
                tooltip: 'Search all modules',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const SearchScreen(),
                    ),
                  );
                },
              ),
              const SizedBox(width: 4),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF0A0F18),
                      Color(0xFF141C2B),
                    ],
                  ),
                ),
                child: Stack(
                  children: [
                    // Subtle grid overlay
                    Positioned.fill(
                      child: CustomPaint(painter: _GridPainter()),
                    ),
                    // Content
                    SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 36),
                            Row(
                              children: [
                                Container(
                                  width: 4,
                                  height: 32,
                                  decoration: BoxDecoration(
                                    color: AppTheme.accentTeal,
                                    borderRadius: BorderRadius.circular(2),
                                    boxShadow: [AppTheme.glowTeal(0.5)],
                                  ),
                                ),
                                const SizedBox(width: 12),
                                const Text(
                                  'P&O TRAINING',
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.w900,
                                    color: AppTheme.textPrimary,
                                    letterSpacing: 2,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            const Padding(
                              padding: EdgeInsets.only(left: 16),
                              child: Text(
                                'Prosthetics & Orthotics  |  Board Review',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: AppTheme.textTertiary,
                                  letterSpacing: 1,
                                ),
                              ),
                            ),
                            const SizedBox(height: 14),
                            Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: Row(
                                children: [
                                  _StatusBadge(
                                    label: '${modules.length} MODULES',
                                    color: AppTheme.accentTeal,
                                  ),
                                  const SizedBox(width: 8),
                                  const _StatusBadge(
                                    label: 'BOARD READY',
                                    color: AppTheme.warningAmber,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              title: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 3,
                    height: 16,
                    decoration: BoxDecoration(
                      color: AppTheme.accentTeal,
                      borderRadius: BorderRadius.circular(1),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'P&O TRAINING',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 16,
                      letterSpacing: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ── QUIZ BUTTON ──
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
                    color: AppTheme.surfaceDark,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: AppTheme.accentTeal.withValues(alpha: 0.3),
                      width: 1,
                    ),
                    boxShadow: [AppTheme.glowTeal(0.15)],
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: AppTheme.accentTeal.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: AppTheme.accentTeal.withValues(alpha: 0.25),
                          ),
                        ),
                        child: const Icon(Icons.quiz_rounded, color: AppTheme.accentTeal, size: 22),
                      ),
                      const SizedBox(width: 14),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'BOARD REVIEW QUIZ',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w800,
                                color: AppTheme.accentTeal,
                                letterSpacing: 1,
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              '10 random questions across all topics',
                              style: TextStyle(
                                fontSize: 12,
                                color: AppTheme.textSecondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(Icons.arrow_forward_rounded, color: AppTheme.accentTeal.withValues(alpha: 0.6), size: 20),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // ── FLASHCARD + PODCAST ROW ──
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
              child: Row(
                children: [
                  Expanded(
                    child: _ActionCard(
                      icon: Icons.style_rounded,
                      label: 'FLASHCARDS',
                      subtitle: '4 decks',
                      color: AppTheme.warningAmber,
                      onTap: () => _showFlashcardSheet(context),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _ActionCard(
                      icon: Icons.headset_rounded,
                      label: 'PODCASTS',
                      subtitle: '4 episodes',
                      color: AppTheme.leOrthosesColor,
                      onTap: () => _showPodcastSheet(context),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ── SECTION HEADER ──
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 8),
              child: Row(
                children: [
                  Container(
                    width: 3,
                    height: 16,
                    decoration: BoxDecoration(
                      color: AppTheme.accentTeal,
                      borderRadius: BorderRadius.circular(1),
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'LEARNING PATHWAY',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w800,
                      color: AppTheme.textSecondary,
                      letterSpacing: 2,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      height: 1,
                      color: AppTheme.surfaceBorder,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ── MODULE CARDS ──
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final module = modules[index];
                return Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 800),
                    child: ContentCard(
                      module: module,
                      index: index,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ModuleContentScreen(module: module),
                          ),
                        );
                      },
                    ),
                  ),
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

  void _showFlashcardSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppTheme.surfaceElevated,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (ctx) => Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 3,
                  height: 18,
                  decoration: BoxDecoration(
                    color: AppTheme.warningAmber,
                    borderRadius: BorderRadius.circular(1),
                  ),
                ),
                const SizedBox(width: 10),
                const Text(
                  'FLASHCARD DECKS',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: AppTheme.textPrimary,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _DeckTile(
              icon: Icons.menu_book_rounded,
              color: AppTheme.fundamentalsColor,
              title: 'Fundamentals & Orthoses',
              count: FundamentalsOrthosesFlashcards.cards.length,
              onTap: () {
                Navigator.pop(ctx);
                Navigator.push(context, MaterialPageRoute(builder: (_) => FlashcardView(cards: FundamentalsOrthosesFlashcards.cards, title: 'Fundamentals & Orthoses')));
              },
            ),
            _DeckTile(
              icon: Icons.settings_rounded,
              color: AppTheme.prostheticComponentsColor,
              title: 'Prosthetic Components',
              count: ProstheticComponentsFlashcards.cards.length,
              onTap: () {
                Navigator.pop(ctx);
                Navigator.push(context, MaterialPageRoute(builder: (_) => FlashcardView(cards: ProstheticComponentsFlashcards.cards, title: 'Prosthetic Components')));
              },
            ),
            _DeckTile(
              icon: Icons.trending_up_rounded,
              color: AppTheme.gaitAnalysisColor,
              title: 'Gait Analysis & Deviations',
              count: GaitAnalysisFlashcards.cards.length,
              onTap: () {
                Navigator.pop(ctx);
                Navigator.push(context, MaterialPageRoute(builder: (_) => FlashcardView(cards: GaitAnalysisFlashcards.cards, title: 'Gait Analysis & Deviations')));
              },
            ),
            _DeckTile(
              icon: Icons.local_hospital_rounded,
              color: AppTheme.amputationRehabColor,
              title: 'Amputation Rehab',
              count: AmputationRehabFlashcards.cards.length,
              onTap: () {
                Navigator.pop(ctx);
                Navigator.push(context, MaterialPageRoute(builder: (_) => FlashcardView(cards: AmputationRehabFlashcards.cards, title: 'Amputation Rehab')));
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showPodcastSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppTheme.surfaceElevated,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (ctx) => Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 3,
                  height: 18,
                  decoration: BoxDecoration(
                    color: AppTheme.leOrthosesColor,
                    borderRadius: BorderRadius.circular(1),
                  ),
                ),
                const SizedBox(width: 10),
                const Text(
                  'PODCASTS',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: AppTheme.textPrimary,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ...PodcastData.episodes.map((ep) => _DeckTile(
              icon: Icons.headset_rounded,
              color: AppTheme.accentTeal,
              title: ep.title,
              onTap: () {
                Navigator.pop(ctx);
                Navigator.push(context, MaterialPageRoute(builder: (_) => PodcastPlayerScreen(episode: ep)));
              },
            )),
          ],
        ),
      ),
    );
  }
}

// ── HELPER WIDGETS ──

class _StatusBadge extends StatelessWidget {
  final String label;
  final Color color;
  const _StatusBadge({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: color.withValues(alpha: 0.25)),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w700,
          color: color,
          letterSpacing: 1,
        ),
      ),
    );
  }
}

class _ActionCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String subtitle;
  final Color color;
  final VoidCallback onTap;
  const _ActionCard({
    required this.icon, required this.label, required this.subtitle,
    required this.color, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppTheme.surfaceDark,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: color.withValues(alpha: 0.15)),
        ),
        child: Row(
          children: [
            Icon(icon, color: color, size: 20),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: color, letterSpacing: 0.5)),
                  Text(subtitle, style: const TextStyle(fontSize: 11, color: AppTheme.textTertiary)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DeckTile extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final int? count;
  final VoidCallback onTap;
  const _DeckTile({required this.icon, required this.color, required this.title, this.count, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: AppTheme.surfaceDark,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: color.withValues(alpha: 0.15)),
        ),
        child: Row(
          children: [
            Icon(icon, color: color, size: 20),
            const SizedBox(width: 12),
            Expanded(
              child: Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: AppTheme.textPrimary)),
            ),
            if (count != null)
              Text('$count', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: color)),
            const SizedBox(width: 4),
            Icon(Icons.chevron_right_rounded, color: AppTheme.textTertiary, size: 18),
          ],
        ),
      ),
    );
  }
}

// ── GRID PAINTER ──
class _GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF1A2233).withValues(alpha: 0.5)
      ..strokeWidth = 0.5;

    const spacing = 40.0;
    for (double x = 0; x < size.width; x += spacing) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    for (double y = 0; y < size.height; y += spacing) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

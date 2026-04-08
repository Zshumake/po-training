import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';

// ---------------------------------------------------------------------------
// Data model for a single gait phase
// ---------------------------------------------------------------------------

class _GaitPhaseData {
  final String name;
  final double startPercent;
  final double endPercent;
  final bool isStance;
  final String muscleActivity;
  final String jointPosition;
  final String grfDescription;
  final String clinicalNote;

  const _GaitPhaseData({
    required this.name,
    required this.startPercent,
    required this.endPercent,
    required this.isStance,
    required this.muscleActivity,
    required this.jointPosition,
    required this.grfDescription,
    required this.clinicalNote,
  });

  String get rangeLabel =>
      '${startPercent.toStringAsFixed(0)}% - ${endPercent.toStringAsFixed(0)}%';
}

// ---------------------------------------------------------------------------
// Phase dataset
// ---------------------------------------------------------------------------

const List<_GaitPhaseData> _phases = [
  _GaitPhaseData(
    name: 'Initial Contact',
    startPercent: 0,
    endPercent: 2,
    isStance: true,
    muscleActivity: 'Tibialis anterior (eccentric) — controls plantarflexion at heel strike',
    jointPosition: 'Ankle 0\u00b0  |  Knee 0\u00b0  |  Hip 30\u00b0 flexion',
    grfDescription: 'GRF posterior to ankle, anterior to knee and hip',
    clinicalNote: 'Sets up the loading response. Heel-first contact is critical — absence suggests equinus or foot-drop.',
  ),
  _GaitPhaseData(
    name: 'Loading Response',
    startPercent: 2,
    endPercent: 12,
    isStance: true,
    muscleActivity: 'Quadriceps (eccentric) — controls knee flexion\nTibialis anterior (eccentric) — controls forefoot lowering',
    jointPosition: 'Ankle 0\u00b0 \u2192 15\u00b0 PF  |  Knee 0\u00b0 \u2192 15\u00b0 flex  |  Hip 30\u00b0 flex',
    grfDescription: 'First rocker (heel rocker). GRF posterior to ankle, anterior to knee.',
    clinicalNote: 'Shock absorption phase. Highest fall-risk moment. A weak quad allows excessive knee flexion.',
  ),
  _GaitPhaseData(
    name: 'Midstance',
    startPercent: 12,
    endPercent: 31,
    isStance: true,
    muscleActivity: 'Gastroc-soleus (eccentric) — controls tibial advancement\nGluteus medius (isometric) — pelvis stability',
    jointPosition: 'Ankle 15\u00b0 PF \u2192 10\u00b0 DF  |  Knee 15\u00b0 \u2192 0\u00b0 flex  |  Hip 30\u00b0 \u2192 0\u00b0 flex',
    grfDescription: 'Second rocker (ankle rocker). GRF moves anterior to ankle.',
    clinicalNote: 'Longest single-limb phase. Trendelenburg test phase \u2014 weak glut med causes contralateral pelvis drop.',
  ),
  _GaitPhaseData(
    name: 'Terminal Stance',
    startPercent: 31,
    endPercent: 50,
    isStance: true,
    muscleActivity: 'Gastroc-soleus (concentric) — generates push-off\nHip flexors (passive stretch)',
    jointPosition: 'Ankle 10\u00b0 DF \u2192 20\u00b0 DF  |  Knee 0\u00b0 \u2192 slight flex  |  Hip 0\u00b0 \u2192 10\u00b0 hyperextension',
    grfDescription: 'Third rocker (forefoot rocker). GRF far anterior to ankle.',
    clinicalNote: 'Third rocker. A2 power burst \u2014 the largest power event in the entire gait cycle.',
  ),
  _GaitPhaseData(
    name: 'Preswing',
    startPercent: 50,
    endPercent: 60,
    isStance: true,
    muscleActivity: 'Hip flexors (concentric) — initiates swing\nAdductors (concentric)',
    jointPosition: 'Ankle 20\u00b0 DF \u2192 20\u00b0 PF  |  Knee slight \u2192 35\u00b0 flex  |  Hip 10\u00b0 hyperext \u2192 0\u00b0',
    grfDescription: 'Toe-off. GRF diminishing as weight transfers to contralateral limb.',
    clinicalNote: 'Double support phase. Rapid unloading of the stance limb. Second period of double support.',
  ),
  _GaitPhaseData(
    name: 'Initial Swing',
    startPercent: 60,
    endPercent: 73,
    isStance: false,
    muscleActivity: 'Hip flexors (concentric) — accelerates thigh forward\nTibialis anterior (concentric) — dorsiflexes foot',
    jointPosition: 'Ankle 20\u00b0 PF \u2192 5\u00b0 PF  |  Knee 35\u00b0 \u2192 60\u00b0 flex  |  Hip 0\u00b0 \u2192 20\u00b0 flex',
    grfDescription: 'No ground contact \u2014 swing phase.',
    clinicalNote: 'Foot clearance is critical here. Steppage gait results if dorsiflexors are weak.',
  ),
  _GaitPhaseData(
    name: 'Midswing',
    startPercent: 73,
    endPercent: 87,
    isStance: false,
    muscleActivity: 'Tibialis anterior (isometric) — maintains dorsiflexion\nQuadriceps beginning to fire',
    jointPosition: 'Ankle 5\u00b0 PF \u2192 0\u00b0  |  Knee 60\u00b0 \u2192 25\u00b0 flex  |  Hip 20\u00b0 \u2192 30\u00b0 flex',
    grfDescription: 'No ground contact \u2014 swing phase.',
    clinicalNote: 'Circumduction gait occurs here if the knee or hip cannot flex sufficiently for clearance.',
  ),
  _GaitPhaseData(
    name: 'Terminal Swing',
    startPercent: 87,
    endPercent: 100,
    isStance: false,
    muscleActivity: 'Hamstrings (eccentric) — decelerates the swinging leg\nTibialis anterior (isometric) — holds ankle neutral',
    jointPosition: 'Ankle 0\u00b0  |  Knee 25\u00b0 \u2192 0\u00b0 flex  |  Hip 30\u00b0 flex',
    grfDescription: 'No ground contact \u2014 preparing for initial contact.',
    clinicalNote: 'Hamstrings decelerate the limb. This is the primary hamstring-strain risk phase.',
  ),
];

// ---------------------------------------------------------------------------
// Colors
// ---------------------------------------------------------------------------

const Color _stanceColor = Color(0xFF2DD4BF); // teal
const Color _swingColor = Color(0xFFF59E0B); // amber
const Color _bgColor = Color(0xFF0D1117);
const Color _surfaceColor = Color(0xFF161B22);
const Color _textPrimary = Color(0xFFE6EDF3);
const Color _textSecondary = Color(0xFF8B949E);
const Color _borderColor = Color(0xFF30363D);

// ---------------------------------------------------------------------------
// Main widget
// ---------------------------------------------------------------------------

class GaitCycleWidget extends StatefulWidget {
  const GaitCycleWidget({super.key});

  @override
  State<GaitCycleWidget> createState() => _GaitCycleWidgetState();
}

class _GaitCycleWidgetState extends State<GaitCycleWidget>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  late final AnimationController _animController;
  late Animation<double> _detailOpacity;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );
    _detailOpacity = CurvedAnimation(
      parent: _animController,
      curve: Curves.easeOut,
    );
    _animController.forward();
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  void _selectPhase(int index) {
    if (index == _selectedIndex) return;
    _animController.reverse().then((_) {
      if (!mounted) return;
      setState(() => _selectedIndex = index);
      _animController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    final phase = _phases[_selectedIndex];
    return Container(
      decoration: BoxDecoration(
        color: _bgColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: _borderColor),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title row
          Row(
            children: [
              Icon(Icons.directions_walk_rounded,
                  color: AppTheme.accentTeal, size: 22),
              const SizedBox(width: 8),
              const Expanded(
                child: Text(
                  'Gait Cycle Phases',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: _textPrimary,
                    letterSpacing: 0.3,
                  ),
                ),
              ),
              // Stance / Swing legend
              _LegendDot(color: _stanceColor, label: 'Stance'),
              const SizedBox(width: 12),
              _LegendDot(color: _swingColor, label: 'Swing'),
            ],
          ),
          const SizedBox(height: 20),

          // Timeline bar with walking figure
          _TimelineBar(
            selectedIndex: _selectedIndex,
            onPhaseSelected: _selectPhase,
          ),
          const SizedBox(height: 8),

          // Phase labels beneath the bar
          _PhaseLabels(
            selectedIndex: _selectedIndex,
            onPhaseSelected: _selectPhase,
          ),
          const SizedBox(height: 20),

          // Detail card
          FadeTransition(
            opacity: _detailOpacity,
            child: _PhaseDetailCard(phase: phase),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Legend dot
// ---------------------------------------------------------------------------

class _LegendDot extends StatelessWidget {
  final Color color;
  final String label;
  const _LegendDot({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.85),
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 4),
        Text(label,
            style: const TextStyle(fontSize: 11, color: _textSecondary)),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// Timeline bar — the main horizontal representation
// ---------------------------------------------------------------------------

class _TimelineBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onPhaseSelected;
  const _TimelineBar({
    required this.selectedIndex,
    required this.onPhaseSelected,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final totalWidth = constraints.maxWidth;
      final selectedPhase = _phases[selectedIndex];
      // Walking figure position = midpoint of selected phase
      final figureFraction =
          (selectedPhase.startPercent + selectedPhase.endPercent) / 200;

      return Column(
        children: [
          // Walking figure indicator
          SizedBox(
            height: 28,
            child: Stack(
              children: [
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                  left: (figureFraction * totalWidth) - 12,
                  top: 0,
                  child: Icon(
                    Icons.directions_walk_rounded,
                    size: 24,
                    color: selectedPhase.isStance ? _stanceColor : _swingColor,
                  ),
                ),
              ],
            ),
          ),

          // Percentage labels (0% and 100%)
          SizedBox(
            height: 14,
            child: Stack(
              children: [
                const Positioned(
                  left: 0,
                  child: Text('0%',
                      style: TextStyle(fontSize: 9, color: _textSecondary)),
                ),
                Positioned(
                  left: totalWidth * 0.60 - 10,
                  child: const Text('60%',
                      style: TextStyle(fontSize: 9, color: _textSecondary)),
                ),
                const Positioned(
                  right: 0,
                  child: Text('100%',
                      style: TextStyle(fontSize: 9, color: _textSecondary)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 2),

          // The actual segmented bar
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: SizedBox(
              height: 32,
              child: Row(
                children: List.generate(_phases.length, (i) {
                  final phase = _phases[i];
                  final fraction =
                      (phase.endPercent - phase.startPercent) / 100;
                  final baseColor =
                      phase.isStance ? _stanceColor : _swingColor;
                  final isSelected = i == selectedIndex;

                  return Expanded(
                    flex: (fraction * 1000).round(),
                    child: GestureDetector(
                      onTap: () => onPhaseSelected(i),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeOut,
                        decoration: BoxDecoration(
                          color: isSelected
                              ? baseColor.withValues(alpha: 0.55)
                              : baseColor.withValues(alpha: 0.18),
                          border: Border(
                            right: i < _phases.length - 1
                                ? BorderSide(
                                    color: _bgColor.withValues(alpha: 0.8),
                                    width: 1.5)
                                : BorderSide.none,
                          ),
                        ),
                        child: isSelected
                            ? Center(
                                child: Container(
                                  width: 6,
                                  height: 6,
                                  decoration: BoxDecoration(
                                    color: baseColor,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              )
                            : const SizedBox.shrink(),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),

          // Stance / Swing bracket labels
          const SizedBox(height: 4),
          SizedBox(
            height: 18,
            child: Stack(
              children: [
                // Stance bracket
                Positioned(
                  left: 0,
                  width: totalWidth * 0.60,
                  child: Center(
                    child: Text(
                      'STANCE (0-60%)',
                      style: TextStyle(
                        fontSize: 9,
                        fontWeight: FontWeight.w700,
                        color: _stanceColor.withValues(alpha: 0.7),
                        letterSpacing: 1.0,
                      ),
                    ),
                  ),
                ),
                // Swing bracket
                Positioned(
                  left: totalWidth * 0.60,
                  width: totalWidth * 0.40,
                  child: Center(
                    child: Text(
                      'SWING (60-100%)',
                      style: TextStyle(
                        fontSize: 9,
                        fontWeight: FontWeight.w700,
                        color: _swingColor.withValues(alpha: 0.7),
                        letterSpacing: 1.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}

// ---------------------------------------------------------------------------
// Phase labels row (scrollable chips)
// ---------------------------------------------------------------------------

class _PhaseLabels extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onPhaseSelected;
  const _PhaseLabels({
    required this.selectedIndex,
    required this.onPhaseSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 34,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: _phases.length,
        separatorBuilder: (context, index) => const SizedBox(width: 6),
        itemBuilder: (context, i) {
          final phase = _phases[i];
          final isSelected = i == selectedIndex;
          final baseColor = phase.isStance ? _stanceColor : _swingColor;

          return GestureDetector(
            onTap: () => onPhaseSelected(i),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: isSelected
                    ? baseColor.withValues(alpha: 0.2)
                    : _surfaceColor,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: isSelected
                      ? baseColor.withValues(alpha: 0.6)
                      : _borderColor,
                  width: isSelected ? 1.5 : 1,
                ),
              ),
              child: Text(
                '${i + 1}. ${_shortName(phase.name)}',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                  color: isSelected ? baseColor : _textSecondary,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  String _shortName(String name) {
    // Abbreviate for chip labels
    switch (name) {
      case 'Loading Response':
        return 'Load Resp';
      case 'Terminal Stance':
        return 'Term Stance';
      case 'Initial Swing':
        return 'Init Swing';
      case 'Terminal Swing':
        return 'Term Swing';
      default:
        return name;
    }
  }
}

// ---------------------------------------------------------------------------
// Detail card for the selected phase
// ---------------------------------------------------------------------------

class _PhaseDetailCard extends StatelessWidget {
  final _GaitPhaseData phase;
  const _PhaseDetailCard({required this.phase});

  @override
  Widget build(BuildContext context) {
    final accentColor = phase.isStance ? _stanceColor : _swingColor;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: _surfaceColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: accentColor.withValues(alpha: 0.3),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: accentColor.withValues(alpha: 0.06),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Phase name + badge
          Row(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: accentColor.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                      color: accentColor.withValues(alpha: 0.3)),
                ),
                child: Text(
                  phase.isStance ? 'STANCE' : 'SWING',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                    color: accentColor,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  phase.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: _textPrimary,
                  ),
                ),
              ),
              Text(
                phase.rangeLabel,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: accentColor.withValues(alpha: 0.9),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Info rows
          _DetailRow(
            icon: Icons.fitness_center_rounded,
            title: 'Muscle Activity',
            content: phase.muscleActivity,
            accentColor: accentColor,
          ),
          const SizedBox(height: 12),
          _DetailRow(
            icon: Icons.swap_calls_rounded,
            title: 'Joint Position',
            content: phase.jointPosition,
            accentColor: accentColor,
          ),
          const SizedBox(height: 12),
          _DetailRow(
            icon: Icons.arrow_downward_rounded,
            title: 'Ground Reaction Force',
            content: phase.grfDescription,
            accentColor: accentColor,
          ),
          const SizedBox(height: 14),

          // Clinical pearl
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppTheme.pearlBackground,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: AppTheme.pearlBorder.withValues(alpha: 0.4),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.lightbulb_rounded,
                    size: 16,
                    color: AppTheme.pearlBorder.withValues(alpha: 0.9)),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Clinical Significance',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          color:
                              AppTheme.pearlBorder.withValues(alpha: 0.9),
                          letterSpacing: 0.5,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        phase.clinicalNote,
                        style: const TextStyle(
                          fontSize: 13,
                          height: 1.5,
                          color: _textPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Individual detail row inside the card
// ---------------------------------------------------------------------------

class _DetailRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String content;
  final Color accentColor;

  const _DetailRow({
    required this.icon,
    required this.title,
    required this.content,
    required this.accentColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 2),
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: accentColor.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Icon(icon, size: 14, color: accentColor),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: accentColor.withValues(alpha: 0.85),
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                content,
                style: const TextStyle(
                  fontSize: 13,
                  height: 1.5,
                  color: _textPrimary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';

// ---------------------------------------------------------------------------
// Data models
// ---------------------------------------------------------------------------

class _AmputationLevel {
  final String name;
  final String description;
  final String icon;
  final List<_KLevelPrescription> prescriptions;

  const _AmputationLevel({
    required this.name,
    required this.description,
    required this.icon,
    required this.prescriptions,
  });
}

class _KLevelPrescription {
  final String kLevel;
  final String kDescription;
  final String socket;
  final String suspension;
  final String foot;
  final String knee; // empty for TT
  final String liner;
  final List<String> clinicalPearls;

  const _KLevelPrescription({
    required this.kLevel,
    required this.kDescription,
    required this.socket,
    required this.suspension,
    required this.foot,
    this.knee = '',
    required this.liner,
    required this.clinicalPearls,
  });
}

// ---------------------------------------------------------------------------
// Prescription database
// ---------------------------------------------------------------------------

const List<_AmputationLevel> _levels = [
  _AmputationLevel(
    name: 'Transtibial (BKA)',
    description: 'Below-knee amputation',
    icon: '🦿',
    prescriptions: [
      _KLevelPrescription(
        kLevel: 'K1',
        kDescription: 'Limited household ambulator',
        socket: 'PTB with soft insert',
        suspension: 'Supracondylar cuff or sleeve',
        foot: 'SACH foot',
        liner: 'Pelite or foam liner',
        clinicalPearls: [
          'SACH provides stability with minimal moving parts',
          'Supracondylar cuff is easiest to don/doff for elderly patients',
          'Focus on safe transfers and short-distance ambulation',
        ],
      ),
      _KLevelPrescription(
        kLevel: 'K2',
        kDescription: 'Limited community ambulator',
        socket: 'TSB with gel liner',
        suspension: 'Pin/shuttle lock or suction',
        foot: 'Single-axis or multi-axis foot',
        liner: 'Silicone gel liner with pin',
        clinicalPearls: [
          'Single-axis foot enhances knee stability at loading response',
          'Pin lock provides audible/tactile confirmation of donning',
          'Now eligible for microprocessor knees per Sept 2024 CMS ruling',
        ],
      ),
      _KLevelPrescription(
        kLevel: 'K3',
        kDescription: 'Community ambulator — variable cadence',
        socket: 'TSB with uniform contact',
        suspension: 'Elevated vacuum or suction',
        foot: 'Energy-storing and returning (ESAR)',
        liner: 'Silicone elastomer liner',
        clinicalPearls: [
          'ESAR foot returns energy during push-off, improving efficiency',
          'Elevated vacuum reduces volume fluctuation and pistoning',
          'Consider carbon fiber dynamic response feet for active users',
        ],
      ),
      _KLevelPrescription(
        kLevel: 'K4',
        kDescription: 'High activity / athlete',
        socket: 'TSB with elevated vacuum',
        suspension: 'Elevated vacuum (active system)',
        foot: 'High-performance ESAR or activity-specific',
        liner: 'Custom silicone elastomer',
        clinicalPearls: [
          'Running blades (Flex-Foot Cheetah) return ~90% energy',
          'Multiple prostheses for different activities is common',
          'Consider waterproof components for aquatic activities',
        ],
      ),
    ],
  ),
  _AmputationLevel(
    name: 'Transfemoral (AKA)',
    description: 'Above-knee amputation',
    icon: '🦿',
    prescriptions: [
      _KLevelPrescription(
        kLevel: 'K1',
        kDescription: 'Limited household ambulator',
        socket: 'Quadrilateral socket',
        suspension: 'Silesian belt or pelvic band',
        foot: 'SACH foot',
        knee: 'Manual locking knee',
        liner: 'Foam liner or gel liner',
        clinicalPearls: [
          'Manual locking knee provides maximum stability',
          'Pelvic band offers best suspension for short residual limbs',
          'Expect 60-70% increased energy expenditure (traumatic)',
        ],
      ),
      _KLevelPrescription(
        kLevel: 'K2',
        kDescription: 'Limited community ambulator',
        socket: 'IRC/MAS socket',
        suspension: 'Suction with expulsion valve',
        foot: 'Multi-axis foot',
        knee: 'Stance-control (weight-activated) or microprocessor knee',
        liner: 'Silicone gel liner',
        clinicalPearls: [
          'IRC/MAS provides better hip ROM (~140° vs ~127° quad)',
          'Stance-control knee allows knee flexion in stance only when loaded',
          'K2 patients now eligible for MPK per Sept 2024 CMS ruling',
          'MPK criteria: history of falls, require stability features',
        ],
      ),
      _KLevelPrescription(
        kLevel: 'K3',
        kDescription: 'Community ambulator — variable cadence',
        socket: 'IRC/MAS with flexible inner socket',
        suspension: 'Suction (roll-on liner with seal)',
        foot: 'ESAR foot',
        knee: 'Microprocessor knee (C-Leg, Genium, Rheo)',
        liner: 'Silicone elastomer with seal-in',
        clinicalPearls: [
          'MPK reduces falls by 80% compared to mechanical knees',
          'C-Leg: gold standard — stumble recovery, stair descent step-over-step',
          'Genium X3: waterproof (IP68), ideal for outdoor/wet environments',
          'Flexible inner socket improves sitting comfort significantly',
        ],
      ),
      _KLevelPrescription(
        kLevel: 'K4',
        kDescription: 'High activity / athlete',
        socket: 'Sub-ischial or IRC/MAS',
        suspension: 'Osseointegration or elevated vacuum',
        foot: 'High-performance ESAR or running blade',
        knee: 'Microprocessor (Genium X3/X4) or sport-specific',
        liner: 'Custom elastomer or direct skeletal attachment',
        clinicalPearls: [
          'Osseointegration eliminates socket — direct skeletal fixation',
          'OPRA system: FDA PMA approved Dec 2020, 92% 5-year survival',
          'Rheo Knee: 5% metabolic reduction vs C-Leg',
          'Sport-specific prostheses for running, swimming, cycling',
        ],
      ),
    ],
  ),
  _AmputationLevel(
    name: 'Knee Disarticulation',
    description: 'Through-knee amputation',
    icon: '🦿',
    prescriptions: [
      _KLevelPrescription(
        kLevel: 'K2',
        kDescription: 'Limited community ambulator',
        socket: 'End-bearing socket with medial window',
        suspension: 'Supracondylar (self-suspending)',
        foot: 'Multi-axis foot',
        knee: 'Polycentric (4-bar) knee',
        liner: 'Custom liner for bulbous end',
        clinicalPearls: [
          'End-bearing capability is a major advantage — full weight on distal end',
          'Bulbous condyles provide inherent rotational stability',
          'Polycentric knee shortens effectively so limb lengths can match',
          'Self-suspending via supracondylar flare — no belt needed',
        ],
      ),
      _KLevelPrescription(
        kLevel: 'K3',
        kDescription: 'Community ambulator',
        socket: 'End-bearing with flexible brim',
        suspension: 'Self-suspending supracondylar',
        foot: 'ESAR foot',
        knee: 'Polycentric microprocessor knee',
        liner: 'Custom silicone',
        clinicalPearls: [
          'Longer lever arm = better proprioception and control vs TF',
          'Lower energy cost than TF (closer to TT energy expenditure)',
          'Cosmetic challenge: knee center sits lower than sound side',
        ],
      ),
    ],
  ),
  _AmputationLevel(
    name: 'Syme Amputation',
    description: 'Ankle disarticulation',
    icon: '🦶',
    prescriptions: [
      _KLevelPrescription(
        kLevel: 'K2-K3',
        kDescription: 'Community ambulator',
        socket: 'End-bearing with window or expandable wall',
        suspension: 'Self-suspending (malleolar flare)',
        foot: 'Low-profile SACH or modified ESAR',
        liner: 'Thin pelite or silicone',
        clinicalPearls: [
          'Excellent end-bearing — can walk short distances without prosthesis',
          'Requires intact posterior tibial artery for healing',
          'Lowest energy expenditure of major LE amputations (~0-10% increase)',
          'Cosmetic challenge: bulbous distal end',
          'Medial window or expandable wall needed for donning over malleoli',
        ],
      ),
    ],
  ),
  _AmputationLevel(
    name: 'Hip Disarticulation',
    description: 'Through-hip amputation',
    icon: '🦴',
    prescriptions: [
      _KLevelPrescription(
        kLevel: 'K2',
        kDescription: 'Limited community ambulator',
        socket: 'Containment socket (Canadian-type)',
        suspension: 'Encapsulation of pelvis',
        foot: 'SACH or single-axis foot',
        knee: 'Polycentric with stance lock',
        liner: 'Padded interface',
        clinicalPearls: [
          'Prosthetic hip joint placed ANTERIOR to allow gravity-assisted extension',
          'Energy expenditure: 100-200% increase — most are wheelchair primary',
          'Sitting comfort is a major design consideration',
          'Stride length markedly reduced; hip hiking is primary advancement',
        ],
      ),
    ],
  ),
  _AmputationLevel(
    name: 'Transradial (BEA)',
    description: 'Below-elbow amputation',
    icon: '🦾',
    prescriptions: [
      _KLevelPrescription(
        kLevel: 'Body-Powered',
        kDescription: 'Cable-operated prosthesis',
        socket: 'Muenster (supracondylar) or self-suspending',
        suspension: 'Supracondylar or figure-8 harness',
        foot: '', // not applicable
        knee: '', // not applicable
        liner: 'Silicone or gel liner',
        clinicalPearls: [
          'VO hook: best for precision tasks — grip force proportional to effort',
          'VC hook: anatomically intuitive — open at rest, squeeze to close',
          'Figure-8 harness: axilla-to-cable — shoulder flexion/scapular abduction operates',
          'Most functional UE amputation level — preserves forearm pronation/supination',
        ],
      ),
      _KLevelPrescription(
        kLevel: 'Myoelectric',
        kDescription: 'Externally powered prosthesis',
        socket: 'Self-suspending supracondylar',
        suspension: 'Supracondylar or suction',
        foot: '',
        knee: '',
        liner: 'Conductive electrode liner',
        clinicalPearls: [
          'Wrist extensors = hand open; wrist flexors = hand close',
          'Multi-articulating hands (i-Limb, bebionic) offer multiple grip patterns',
          'Pattern recognition (COAPT): superior to direct control (SHAP p=0.04)',
          'TMR can provide additional control sites if muscles insufficient',
          'Heavier than body-powered — may not suit heavy labor',
        ],
      ),
    ],
  ),
  _AmputationLevel(
    name: 'Transhumeral (AEA)',
    description: 'Above-elbow amputation',
    icon: '🦾',
    prescriptions: [
      _KLevelPrescription(
        kLevel: 'Body-Powered',
        kDescription: 'Dual-control cable system',
        socket: 'Anatomical contour socket',
        suspension: 'Figure-8 harness with chest strap',
        foot: '',
        knee: '',
        liner: 'Gel liner or sock',
        clinicalPearls: [
          'Dual-control system: one cable for elbow lock, one for TD',
          'Operation sequence: position elbow → lock → operate TD',
          'No cable-powered elbow EXTENSION exists — gravity only',
          'Turntable allows passive humeral rotation',
        ],
      ),
      _KLevelPrescription(
        kLevel: 'Myoelectric/Hybrid',
        kDescription: 'Powered elbow + TD',
        socket: 'Anatomical contour with electrodes',
        suspension: 'Suction or harness hybrid',
        foot: '',
        knee: '',
        liner: 'Electrode-embedded liner',
        clinicalPearls: [
          'Hybrid: body-powered elbow + myoelectric hand (most common)',
          'TMR enables simultaneous multi-joint control',
          'LUKE Arm: FDA-approved May 2014 — 10 powered DOF',
          'Higher rejection rate than transradial due to weight and complexity',
        ],
      ),
    ],
  ),
];

// ---------------------------------------------------------------------------
// Widget
// ---------------------------------------------------------------------------

class PrescriptionBuilderWidget extends StatefulWidget {
  const PrescriptionBuilderWidget({super.key});

  @override
  State<PrescriptionBuilderWidget> createState() =>
      _PrescriptionBuilderWidgetState();
}

class _PrescriptionBuilderWidgetState extends State<PrescriptionBuilderWidget>
    with SingleTickerProviderStateMixin {
  int _selectedLevelIndex = 0;
  int _selectedKIndex = 0;
  late AnimationController _animController;
  late Animation<double> _fadeAnim;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );
    _fadeAnim = CurvedAnimation(
      parent: _animController,
      curve: Curves.easeInOut,
    );
    _animController.forward();
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  void _selectLevel(int index) {
    if (index == _selectedLevelIndex) return;
    _animController.reverse().then((_) {
      setState(() {
        _selectedLevelIndex = index;
        _selectedKIndex = 0;
      });
      _animController.forward();
    });
  }

  void _selectK(int index) {
    if (index == _selectedKIndex) return;
    _animController.reverse().then((_) {
      setState(() {
        _selectedKIndex = index;
      });
      _animController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    final level = _levels[_selectedLevelIndex];
    final prescription = level.prescriptions[_selectedKIndex];

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF0F1923),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppTheme.accentTeal.withValues(alpha: 0.3),
        ),
        boxShadow: [
          BoxShadow(
            color: AppTheme.accentTeal.withValues(alpha: 0.05),
            blurRadius: 20,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppTheme.accentTeal.withValues(alpha: 0.15),
                  AppTheme.accentTeal.withValues(alpha: 0.05),
                ],
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppTheme.accentTeal.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.build_circle_rounded,
                    color: AppTheme.accentTeal,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Prosthetic Prescription Builder',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: AppTheme.textPrimary,
                          letterSpacing: 0.3,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'Select amputation level → K-level → view components',
                        style: TextStyle(
                          fontSize: 11,
                          color: AppTheme.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Step 1: Amputation Level Selector
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
            child: Text(
              'STEP 1: Amputation Level',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: AppTheme.accentTeal.withValues(alpha: 0.8),
                letterSpacing: 1.2,
              ),
            ),
          ),
          SizedBox(
            height: 48,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemCount: _levels.length,
              itemBuilder: (context, i) {
                final isSelected = i == _selectedLevelIndex;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: ChoiceChip(
                    label: Text(
                      _levels[i].name,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                        color: isSelected
                            ? AppTheme.backgroundDark
                            : AppTheme.textSecondary,
                      ),
                    ),
                    selected: isSelected,
                    selectedColor: AppTheme.accentTeal,
                    backgroundColor: const Color(0xFF1A2332),
                    side: BorderSide(
                      color: isSelected
                          ? AppTheme.accentTeal
                          : const Color(0xFF2A3545),
                    ),
                    onSelected: (_) => _selectLevel(i),
                  ),
                );
              },
            ),
          ),

          // Step 2: K-Level Selector
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
            child: Text(
              'STEP 2: Functional Level',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: AppTheme.accentTeal.withValues(alpha: 0.8),
                letterSpacing: 1.2,
              ),
            ),
          ),
          SizedBox(
            height: 48,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemCount: level.prescriptions.length,
              itemBuilder: (context, i) {
                final rx = level.prescriptions[i];
                final isSelected = i == _selectedKIndex;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: ChoiceChip(
                    label: Text(
                      rx.kLevel,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                        color: isSelected
                            ? AppTheme.backgroundDark
                            : AppTheme.textSecondary,
                      ),
                    ),
                    selected: isSelected,
                    selectedColor: const Color(0xFFFF9800),
                    backgroundColor: const Color(0xFF1A2332),
                    side: BorderSide(
                      color: isSelected
                          ? const Color(0xFFFF9800)
                          : const Color(0xFF2A3545),
                    ),
                    onSelected: (_) => _selectK(i),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: Text(
              prescription.kDescription,
              style: const TextStyle(
                fontSize: 12,
                fontStyle: FontStyle.italic,
                color: AppTheme.textSecondary,
              ),
            ),
          ),

          // Step 3: Prescription Output
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
            child: Text(
              'PRESCRIPTION',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: AppTheme.accentTeal.withValues(alpha: 0.8),
                letterSpacing: 1.2,
              ),
            ),
          ),
          FadeTransition(
            opacity: _fadeAnim,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 4, 16, 8),
              child: Column(
                children: [
                  _buildComponentRow('Socket', prescription.socket, Icons.circle_outlined),
                  _buildComponentRow('Suspension', prescription.suspension, Icons.link_rounded),
                  _buildComponentRow('Liner', prescription.liner, Icons.layers_rounded),
                  if (prescription.foot.isNotEmpty)
                    _buildComponentRow('Foot', prescription.foot, Icons.directions_walk_rounded),
                  if (prescription.knee.isNotEmpty)
                    _buildComponentRow('Knee', prescription.knee, Icons.settings_rounded),
                ],
              ),
            ),
          ),

          // Clinical Pearls
          if (prescription.clinicalPearls.isNotEmpty)
            FadeTransition(
              opacity: _fadeAnim,
              child: Container(
                margin: const EdgeInsets.fromLTRB(16, 4, 16, 16),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFF1A2A15),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: const Color(0xFF4CAF50).withValues(alpha: 0.3),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.lightbulb_rounded, color: Color(0xFF4CAF50), size: 16),
                        SizedBox(width: 6),
                        Text(
                          'Clinical Pearls',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF4CAF50),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    ...prescription.clinicalPearls.map(
                      (pearl) => Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('• ', style: TextStyle(color: Color(0xFF4CAF50), fontSize: 12)),
                            Expanded(
                              child: Text(
                                pearl,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: AppTheme.textSecondary,
                                  height: 1.4,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildComponentRow(String label, String value, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(bottom: 6),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF152233),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFF2A3545)),
      ),
      child: Row(
        children: [
          Icon(icon, size: 16, color: AppTheme.accentTeal.withValues(alpha: 0.7)),
          const SizedBox(width: 10),
          SizedBox(
            width: 80,
            child: Text(
              label,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: AppTheme.accentTeal.withValues(alpha: 0.9),
                letterSpacing: 0.5,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: AppTheme.textPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../models/topic_content_model.dart';

final advancedTechContent = TopicData(
  id: 'advanced_tech',
  title: 'Advanced Prosthetic Technologies',
  tabs: [
    // ─────────────────────────────────────────────
    // TAB 1: Microprocessor Knees
    // ─────────────────────────────────────────────
    TopicTab(
      title: 'Microprocessor Knees',
      blocks: [
        HeaderBlock('Microprocessor Knee Systems'),
        TextBlock(
          'Microprocessor knees (MPKs) represent a major advancement in transfemoral '
          'prosthetics. These devices use onboard sensors and microprocessors to '
          'continuously adjust hydraulic or pneumatic resistance during stance and swing '
          'phase, providing variable cadence control, stumble recovery, and improved '
          'safety compared to mechanical knee units.',
          isIntro: true,
        ),
        ComparisonCardBlock(
          title: 'C-Leg (Ottobock)',
          themeColor: const Color(0xFF1565C0),
          backgroundColor: const Color(0xFFE3F2FD),
          icon: Icons.memory,
          description: 'The first widely adopted microprocessor knee, introduced in 1997. '
              'Revolutionized transfemoral prosthetics by offering real-time stance '
              'and swing phase control via an onboard microprocessor.',
          keyPoints: [
            'Hydraulic swing AND stance phase control',
            'Microprocessor samples at 50 times per second',
            'Automatically adapts to changes in walking speed',
            'Stumble recovery via rapid stance resistance increase',
            'Accommodates stairs (step-over-step descent), ramps, and uneven terrain',
            'Proven to significantly reduce falls compared to mechanical knees',
            'Not waterproof (original version)',
          ],
        ),
        ComparisonCardBlock(
          title: 'Genium (Ottobock)',
          themeColor: const Color(0xFF0D47A1),
          backgroundColor: const Color(0xFFBBDEFB),
          icon: Icons.rocket_launch,
          description: 'Next-generation microprocessor knee from Ottobock, offering more '
              'intuitive gait patterns and advanced features beyond the C-Leg, including '
              'stair ascent with alternating step pattern.',
          keyPoints: [
            'Alternating stair ascent capability (powered knee extension assist)',
            'OPG (Optimized Physiological Gait) mode for more natural gait cycle',
            'Standing on inclines without active muscle engagement',
            'Intuitive stance function for variable standing postures',
            'Gyroscope and accelerometer for real-time position sensing',
            'Pre-swing phase initiation for smoother gait transitions',
          ],
        ),
        ComparisonCardBlock(
          title: 'Rheo Knee (Ossur)',
          themeColor: const Color(0xFF00838F),
          backgroundColor: const Color(0xFFE0F7FA),
          icon: Icons.water_drop,
          description: 'Uses magnetorheological (MR) fluid technology, where the viscosity '
              'of the fluid changes instantly in response to a magnetic field, providing '
              'exceptionally fast and smooth transitions between stance and swing phase.',
          keyPoints: [
            'Magnetorheological (MR) fluid changes viscosity with magnetic field',
            'Extremely fast response time for stance-to-swing transition',
            'Smooth, continuous resistance modulation (no discrete settings)',
            'Learns and adapts to the user\'s gait pattern over time',
            'Low maintenance due to sealed MR fluid system',
            'Effective stumble recovery and controlled descent',
          ],
        ),
        ComparisonCardBlock(
          title: 'X3 (Ottobock)',
          themeColor: const Color(0xFF2E7D32),
          backgroundColor: const Color(0xFFE8F5E9),
          icon: Icons.pool,
          description: 'The first waterproof microprocessor knee, designed for active users '
              'who require a durable, all-environment prosthetic knee. Based on C-Leg '
              'technology with IP67-rated sealing.',
          keyPoints: [
            'Waterproof (IP67 rated) — can be submerged',
            'Designed for highly active K3-K4 ambulators',
            'Corrosion-resistant components for harsh environments',
            'Same microprocessor stance/swing control as C-Leg platform',
            'Suitable for water sports, outdoor activities, dusty environments',
            'Higher durability for physically demanding lifestyles',
          ],
        ),
        TableBlock(
          title: 'Microprocessor Knee Comparison',
          columns: ['Feature', 'C-Leg', 'Genium', 'Rheo Knee'],
          rows: [
            ['Manufacturer', 'Ottobock', 'Ottobock', 'Ossur'],
            ['Technology', 'Hydraulic + MPU', 'Hydraulic + MPU', 'MR Fluid + MPU'],
            ['Sensor Rate', '50 Hz', '50+ Hz', 'Continuous'],
            ['Stair Ascent', 'Step-to (leading sound)', 'Alternating step', 'Step-to'],
            ['Stair Descent', 'Step-over-step', 'Step-over-step', 'Step-over-step'],
            ['Stumble Recovery', 'Yes', 'Yes', 'Yes'],
            ['Waterproof', 'No (X3 variant)', 'No', 'No'],
            ['Standing Function', 'Flexion lock', 'Intuitive stand', 'Adaptive yield'],
          ],
          headerColor: const Color(0xFF1565C0),
        ),
        HeaderBlock('Advantages of MPKs Over Mechanical Knees'),
        BulletCardBlock(
          title: 'Clinical Benefits',
          themeColor: const Color(0xFF2E7D32),
          backgroundColor: const Color(0xFFE8F5E9),
          points: [
            'Variable cadence response — adjusts to walking speed changes automatically',
            'Stumble recovery — rapid stance resistance increase prevents falls',
            'Reduced incidence of falls (up to 64% reduction in uncontrolled falls)',
            'Improved gait symmetry and more natural gait pattern',
            'Reduced energy expenditure compared to mechanical knees',
            'Controlled step-over-step stair descent',
            'Improved confidence and reduced fear of falling',
            'Better performance on slopes, ramps, and uneven terrain',
          ],
        ),
        HeaderBlock('Disadvantages and Limitations'),
        BulletCardBlock(
          title: 'Drawbacks of Microprocessor Knees',
          themeColor: const Color(0xFFC62828),
          backgroundColor: const Color(0xFFFFEBEE),
          points: [
            'High cost: \$40,000–\$100,000+ per unit',
            'Increased weight compared to mechanical alternatives',
            'Battery dependent — requires regular charging (typically daily)',
            'Ongoing maintenance and software updates required',
            'Not waterproof (except X3) — cannot be used in water or heavy rain',
            'Electronic components susceptible to damage if not cared for properly',
            'Requires prosthetist with specialized training for fitting/programming',
          ],
        ),
        HeaderBlock('Indications & Medicare Coverage'),
        BulletCardBlock(
          title: 'Candidacy and Coverage',
          themeColor: const Color(0xFF6A1B9A),
          backgroundColor: const Color(0xFFF3E5F5),
          points: [
            'Indicated for K3 and K4 functional ambulators',
            'Documented functional need required for Medicare coverage',
            'Must demonstrate ability to use variable cadence',
            'K2 ambulators: some evidence supports MPK use for fall reduction',
            'Coverage may require prior authorization and functional testing',
            'Peer-reviewed literature supports fall reduction and safety benefits',
          ],
        ),
        PearlBlock(
          'Board Pearl — Microprocessor Knees',
          'Microprocessor knees reduce falls and energy expenditure compared to '
          'mechanical knees and are indicated for K3-K4 ambulators. The key clinical '
          'advantages to remember are stumble recovery, variable cadence control, '
          'and improved safety. Medicare covers MPKs for K3-K4 with documented '
          'functional need.',
        ),
      ],
    ),

    // ─────────────────────────────────────────────
    // TAB 2: Powered Prosthetics & Osseointegration
    // ─────────────────────────────────────────────
    TopicTab(
      title: 'Powered & Osseointegration',
      blocks: [
        HeaderBlock('Powered Prosthetic Limbs'),
        TextBlock(
          'Powered (bionic) prosthetics use battery-driven motors to provide active '
          'joint movement, unlike passive or body-powered devices. These systems can '
          'generate net positive work during the gait cycle, reducing compensatory '
          'strategies and energy expenditure for the user.',
          isIntro: true,
        ),
        ComparisonCardBlock(
          title: 'BiOM / Empower Ankle (Ottobock)',
          themeColor: const Color(0xFF00695C),
          backgroundColor: const Color(0xFFE0F2F1),
          icon: Icons.electric_bolt,
          description: 'A powered ankle-foot prosthesis that provides active plantar flexion '
              'push-off at terminal stance, mimicking the gastrocnemius-soleus complex. '
              'The only commercially available powered ankle.',
          keyPoints: [
            'Active push-off at terminal stance via battery-powered motor',
            'Reduces energy expenditure by providing net positive ankle work',
            'Produces more natural, symmetric gait pattern',
            'Enables improved incline and decline walking',
            'Sensors detect terrain and adjust power output accordingly',
            'Significant battery weight and daily charging requirement',
            'Indicated for K3-K4 transtibial amputees',
          ],
        ),
        ComparisonCardBlock(
          title: 'Power Knee (Ossur)',
          themeColor: const Color(0xFF4527A0),
          backgroundColor: const Color(0xFFEDE7F6),
          icon: Icons.settings_accessibility,
          description: 'A powered prosthetic knee that provides active knee extension, '
              'supplementing the user\'s effort during sit-to-stand transfers, stair '
              'ascent, and incline walking.',
          keyPoints: [
            'Active knee extension powered by electric motor',
            'Assists sit-to-stand transfers by generating extension torque',
            'Powered stair ascent with alternating step pattern',
            'Improved incline walking with active extension support',
            'Supplements rather than replaces user\'s muscular effort',
            'Sensors coordinate with user\'s contralateral limb movements',
            'Heavier than passive microprocessor knees',
          ],
        ),
        BulletCardBlock(
          title: 'Combined Powered Knee-Ankle Systems',
          themeColor: const Color(0xFF1565C0),
          backgroundColor: const Color(0xFFE3F2FD),
          points: [
            'Emerging technology combining powered knee and ankle in single system',
            'Promising for bilateral transfemoral amputees and high-level amputations',
            'Coordinated power generation at both knee and ankle joints',
            'Potential to dramatically reduce energy expenditure for high-level amputees',
            'Still largely in research and development phase',
            'Weight and battery life remain significant challenges',
          ],
        ),
        HeaderBlock('Osseointegration'),
        TextBlock(
          'Osseointegration is a revolutionary approach that bypasses the socket '
          'entirely by directly attaching the prosthesis to the skeleton via a '
          'titanium implant placed into the residual bone. This eliminates all '
          'socket-related problems but introduces new risks at the skin-implant '
          'interface.',
        ),
        ComparisonCardBlock(
          title: 'OPRA System (Integrum, Sweden)',
          themeColor: const Color(0xFFBF360C),
          backgroundColor: const Color(0xFFFBE9E7),
          icon: Icons.hardware,
          description: 'The original and most studied osseointegration system, developed '
              'in Sweden. Uses a two-stage surgical procedure to implant a titanium '
              'fixture directly into the medullary canal of the residual bone.',
          keyPoints: [
            'Stage 1: Titanium fixture implanted into medullary canal of bone',
            'Healing period: approximately 6 months for bone ingrowth',
            'Stage 2: Abutment placed through skin, connects fixture to prosthesis',
            'Direct skeletal attachment — no socket needed',
            'Primarily performed for transfemoral amputees',
            'Requires adequate bone quality and length for fixture placement',
          ],
        ),
        BulletCardBlock(
          title: 'Advantages of Osseointegration',
          themeColor: const Color(0xFF2E7D32),
          backgroundColor: const Color(0xFFE8F5E9),
          points: [
            'Eliminates socket completely — no heat, sweating, or skin breakdown',
            'No pressure sores, pistoning, or socket discomfort',
            'Improved proprioception through osseoperception (vibrations transmitted through bone)',
            'Improved hip range of motion (no socket restricting movement)',
            'Better sitting comfort (no socket impingement)',
            'More consistent prosthetic fit (no volume fluctuations)',
            'Faster don/doff — click-on attachment to abutment',
          ],
        ),
        BulletCardBlock(
          title: 'Disadvantages and Risks',
          themeColor: const Color(0xFFC62828),
          backgroundColor: const Color(0xFFFFEBEE),
          points: [
            'Infection at skin-implant interface (stoma) — MOST COMMON complication',
            'Superficial infections: up to 30-50% of patients experience at least one episode',
            'Deep infections (osteomyelitis): rare but serious, may require implant removal',
            'Periprosthetic fracture risk with high-energy trauma',
            'Requires adequate bone stock — not suitable for severely osteoporotic bone',
            'Costly and not widely available (limited specialized centers)',
            'Two-stage surgery with extended rehabilitation timeline',
            'Requires lifelong monitoring of stoma site',
          ],
        ),
        BulletCardBlock(
          title: 'Contraindications',
          themeColor: const Color(0xFFE65100),
          backgroundColor: const Color(0xFFFFF3E0),
          points: [
            'Active infection at the residual limb',
            'Insufficient bone stock or severe osteoporosis',
            'Peripheral vascular disease (impairs healing)',
            'Immunosuppression or immunocompromised state',
            'Active chemotherapy or radiation therapy',
            'Uncontrolled diabetes with poor wound healing',
            'Inability to comply with post-operative rehabilitation protocol',
          ],
        ),
        PearlBlock(
          'Board Pearl — Osseointegration',
          'Osseointegration eliminates the socket and all socket-related problems, '
          'but infection at the abutment (stoma) site is the MOST COMMON complication. '
          'The OPRA system uses a two-stage surgery: fixture implantation → 6 months '
          'healing → abutment placement through skin.',
        ),
      ],
    ),

    // ─────────────────────────────────────────────
    // TAB 3: TMR & Pattern Recognition
    // ─────────────────────────────────────────────
    TopicTab(
      title: 'TMR & Pattern Recognition',
      blocks: [
        HeaderBlock('Targeted Muscle Reinnervation (TMR)'),
        TextBlock(
          'Targeted Muscle Reinnervation (TMR) is a surgical technique that transfers '
          'residual nerves from an amputated limb to new muscle targets, creating '
          'additional myoelectric control signals for improved prosthetic function. '
          'Pioneered by Dr. Todd Kuiken at the Rehabilitation Institute of Chicago.',
          isIntro: true,
        ),
        ComparisonCardBlock(
          title: 'TMR Surgical Technique',
          themeColor: const Color(0xFF6A1B9A),
          backgroundColor: const Color(0xFFF3E5F5),
          icon: Icons.content_cut,
          description: 'Nerves that previously innervated the amputated limb are surgically '
              'transferred to denervated segments of remaining muscles. These muscles '
              'then serve as biological amplifiers of neural intent, providing new '
              'myoelectric signal sites.',
          keyPoints: [
            'Residual nerves are transferred to new denervated muscle targets',
            'Primarily for transhumeral and shoulder disarticulation levels',
            'Creates new independent EMG signal sites for prosthetic control',
            'Patient thinks about moving the missing limb → target muscle contracts',
            'Contraction is detected by surface electrodes → prosthesis responds',
            'Enables simultaneous control of multiple prosthetic joints',
          ],
        ),
        HeaderBlock('TMR for Transhumeral / Shoulder Disarticulation'),
        BulletCardBlock(
          title: 'Nerve Transfer Targets',
          themeColor: const Color(0xFF4527A0),
          backgroundColor: const Color(0xFFEDE7F6),
          points: [
            'Musculocutaneous nerve → clavicular head of pectoralis major (elbow flexion signal)',
            'Median nerve → sternal head of pectoralis major (hand close signal)',
            'Ulnar nerve → pectoralis minor (intrinsic hand function signal)',
            'Radial nerve → serratus anterior or latissimus dorsi (hand open signal)',
            'Each transfer creates an independent, intuitive control site',
            'Up to 4-6 independent control signals achievable',
          ],
        ),
        BulletCardBlock(
          title: 'Clinical Benefits of TMR',
          themeColor: const Color(0xFF2E7D32),
          backgroundColor: const Color(0xFFE8F5E9),
          points: [
            'Simultaneous control of elbow, wrist, and hand (vs sequential control)',
            'More intuitive control — think about the movement, it happens naturally',
            'Reduced training time compared to conventional myoelectric control',
            'Improved prosthesis function and user satisfaction',
            'Reduces neuroma pain — nerve has a target to grow into, preventing neuroma formation',
            'Reduces phantom limb pain in many patients',
            'Can be performed at time of amputation or as secondary procedure',
          ],
        ),
        PearlBlock(
          'Board Pearl — TMR Dual Benefit',
          'TMR provides TWO major benefits: (1) improved myoelectric prosthetic '
          'control with simultaneous multi-joint operation, AND (2) reduced phantom '
          'limb and neuroma pain because the transferred nerves have a target to '
          'reinnervate rather than forming painful neuromas.',
        ),
        HeaderBlock('Pattern Recognition Control'),
        TextBlock(
          'Pattern recognition uses machine learning algorithms to classify complex '
          'EMG patterns from multiple electrode sites, allowing more intuitive and '
          'natural control of multiple grip patterns and wrist positions without '
          'requiring co-contractions or mode switching.',
        ),
        ComparisonCardBlock(
          title: 'Pattern Recognition Systems',
          themeColor: const Color(0xFF0D47A1),
          backgroundColor: const Color(0xFFE3F2FD),
          icon: Icons.psychology,
          description: 'Machine learning classifiers analyze the pattern of muscle activation '
              'across multiple electrodes to determine the user\'s intended movement, '
              'rather than relying on individual muscle site amplitude thresholds.',
          keyPoints: [
            'Uses 8-16 surface electrodes around the residual limb',
            'Classifier is trained on the individual patient\'s specific EMG patterns',
            'Detects patterns (not just amplitude) across all channels simultaneously',
            'Allows intuitive control of multiple grip patterns and wrist movements',
            'Eliminates need for co-contraction mode switching between grips',
            'Patient performs calibration session to train the classifier',
          ],
        ),
        BulletCardBlock(
          title: 'COAPT Pattern Recognition System',
          themeColor: const Color(0xFF1565C0),
          backgroundColor: const Color(0xFFBBDEFB),
          points: [
            'First commercially available pattern recognition system for upper limb prosthetics',
            'FDA-cleared for clinical use in the United States',
            'Compatible with most commercially available myoelectric hands and elbows',
            'Calibration can be performed by the patient independently',
            'Supports 6+ grip patterns without mode switching',
            'Can be recalibrated as muscle patterns change over time',
            'Works synergistically with TMR to maximize available control signals',
          ],
        ),
        HeaderBlock('Implantable Myoelectric Sensors (IMES)'),
        ComparisonCardBlock(
          title: 'IMES Technology',
          themeColor: const Color(0xFF00838F),
          backgroundColor: const Color(0xFFE0F7FA),
          icon: Icons.sensors,
          description: 'Wireless sensors surgically implanted within individual muscles that '
              'detect EMG signals and transmit them wirelessly through the skin to the '
              'prosthetic controller, eliminating surface electrode limitations.',
          keyPoints: [
            'Small wireless sensors implanted directly into target muscles',
            'Eliminates surface electrode problems: no sweating artifacts, no migration',
            'No electrode-to-skin contact issues or cross-talk between channels',
            'More consistent, reliable signal detection than surface electrodes',
            'Powered wirelessly through electromagnetic coupling (no internal batteries)',
            'Currently in early clinical trials — not yet widely available',
            'Potential to dramatically improve myoelectric prosthesis reliability',
          ],
        ),
        TableBlock(
          title: 'Myoelectric Control Evolution',
          columns: ['Generation', 'Method', 'Control'],
          rows: [
            ['Conventional', 'Dual-site surface EMG', 'Sequential (1 DOF at a time)'],
            ['TMR', 'Reinnervated muscle sites', 'Simultaneous (multiple DOF)'],
            ['Pattern Recognition', 'Multi-electrode ML classifier', 'Intuitive grip selection'],
            ['IMES', 'Implanted wireless sensors', 'Reliable multi-DOF (experimental)'],
          ],
          headerColor: const Color(0xFF6A1B9A),
        ),
        PearlBlock(
          'Board Pearl — Pattern Recognition',
          'Pattern recognition classifies EMG patterns across multiple electrodes '
          'to determine user intent, allowing intuitive grip selection without '
          'co-contraction mode switching. The COAPT system is the first commercially '
          'available pattern recognition system. Combined with TMR, it represents '
          'the current state-of-the-art in myoelectric control.',
        ),
      ],
    ),
  ],
);

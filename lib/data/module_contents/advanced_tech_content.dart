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
          backgroundColor: const Color(0xFF1A2332),
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
          backgroundColor: const Color(0xFF1A2332),
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
          backgroundColor: const Color(0xFF152A2E),
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
          backgroundColor: const Color(0xFF152A1A),
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
        ComparisonCardBlock(
          title: 'Plie Knee (Proteor)',
          themeColor: const Color(0xFF5D4037),
          backgroundColor: const Color(0xFF2A2522),
          icon: Icons.precision_manufacturing,
          description: 'Uses a combination of hydraulics and pneumatics for flexion '
              'and extension control. Currently marketed as the Plie 3 by Proteor. '
              'OASIS 1 data showed comparable mobility but lower QoL scores vs C-Leg.',
          keyPoints: [
            'Hydraulic and pneumatic combined resistance mechanism',
            'Functional mobility comparable to other MPKs (OASIS 1)',
            'Quality of life scores significantly lower than C-Leg',
            'Did NOT demonstrate significant falls reduction (unlike C-Leg)',
            'Functional declines noted with advancing age — less suitable for elderly',
            'Step-to stair ascent, step-over-step descent',
          ],
        ),
        TableBlock(
          title: 'Microprocessor Knee Comparison',
          columns: ['Feature', 'C-Leg', 'Genium', 'Rheo Knee', 'Plie 3'],
          rows: [
            ['Manufacturer', 'Ottobock', 'Ottobock', 'Ossur', 'Proteor'],
            ['Technology', 'Hydraulic + MPU', 'Hydraulic + MPU', 'MR Fluid + MPU', 'Hydraulic/Pneumatic'],
            ['Sensor Rate', '50 Hz', '50+ Hz', 'Continuous', 'Variable'],
            ['Stair Ascent', 'Step-to', 'Alternating step', 'Step-to', 'Step-to'],
            ['Stair Descent', 'Step-over-step', 'Step-over-step', 'Step-over-step', 'Step-over-step'],
            ['Stumble Recovery', 'Yes', 'Yes', 'Yes', 'Yes'],
            ['Waterproof', 'No (X3 variant)', 'No', 'No', 'No'],
            ['Falls Evidence', 'Strong', 'Strong', 'Moderate', 'Weak'],
            ['K2 Approved', 'Yes', 'Yes', 'Yes', 'No'],
          ],
          headerColor: const Color(0xFF1565C0),
        ),
        HeaderBlock('C-Leg Falls Reduction Data'),
        TableBlock(
          title: 'C-Leg vs Non-MPK Falls (per 1,000 person-years)',
          columns: ['Population', 'C-Leg', 'Non-MPK'],
          rows: [
            ['Non-diabetic: All falls', '178', '1,102'],
            ['Diabetic: All falls', '203', '1,201'],
            ['Non-diabetic: Fatal falls', '3', '17'],
            ['Diabetic: Fatal falls', '3', '18'],
            ['Non-diabetic: Fall hospitalizations', '20', '134'],
            ['Diabetic: Fall hospitalizations', '23', '146'],
          ],
          headerColor: const Color(0xFFC62828),
        ),
        PearlBlock(
          'Board Pearl — MPK Falls Data',
          'C-Leg data shows approximately 80% reduction in overall falls and '
          '82-85% reduction in fall-related hospitalizations compared to non-MPK. '
          'A 2024 retrospective cohort analysis confirmed fiscal savings to Medicare '
          'when MPKs replace mechanical knees. This cost-effectiveness data supports '
          'the K2 coverage expansion.',
        ),
        CheckpointBlock(
          question: 'The C-Leg microprocessor knee reduces falls by approximately what percentage compared to mechanical knees?',
          options: ['20%', '50%', '80%', '95%'],
          correctIndex: 2,
          explanation: 'The C-Leg reduces falls by approximately 80% compared to mechanical knees (178 vs 1,102 falls per 1,000 person-years). It also reduces stumbles by 59% and has been shown to reduce Medicare costs through fewer fall-related hospitalizations.',
        ),
        HeaderBlock('Advantages of MPKs Over Mechanical Knees'),
        BulletCardBlock(
          title: 'Clinical Benefits',
          themeColor: const Color(0xFF2E7D32),
          backgroundColor: const Color(0xFF152A1A),
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
          backgroundColor: const Color(0xFF2A1519),
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
          backgroundColor: const Color(0xFF2A1A2E),
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
        HeaderBlock('Medicare K2 Coverage Expansion (September 2024)'),
        TextBlock(
          'In September 2024, CMS expanded MPK coverage to K2-level beneficiaries '
          '(limited community ambulators). This landmark policy change was driven by '
          'evidence that K2 ambulators — who are typically older, less stable, and at '
          'higher fall risk — may benefit most from MPK safety features.',
        ),
        BulletCardBlock(
          title: 'K2 Coverage Criteria (All Must Be Met)',
          themeColor: const Color(0xFF6A1B9A),
          backgroundColor: const Color(0xFF2A1A2E),
          points: [
            '1. The electronic/microprocessor knee unit is indicated for functional level 2',
            '2. The knee has integrated stumble-recovery technology with automatic stabilization',
            '3. The beneficiary can manage daily charging requirements',
            '4. The beneficiary can understand and respond to error alerts and alarms',
            'Supporting evidence: ASCENT K2 trial (12-month RCT in K2 ambulators over age 65)',
            'Rationale: fall-prone K2 ambulators benefit most from stumble recovery',
          ],
        ),
        TableBlock(
          title: 'Key MPK L-Codes',
          columns: ['L-Code', 'Description'],
          rows: [
            ['L5856', 'MPK with swing AND stance phase control (most common)'],
            ['L5857', 'MPK with swing phase control only'],
            ['L5858', 'MPK with stance phase control only (fluid-based)'],
          ],
          headerColor: const Color(0xFF6A1B9A),
        ),
        PearlBlock(
          'Board Pearl — K2 MPK Coverage',
          'The K2 MPK expansion is likely to appear on future board examinations. '
          'Key points: (1) MPKs are now covered for K2 ambulators, not just K3/K4, '
          '(2) the knee must have stumble recovery, (3) the patient must manage '
          'charging and error alerts. The rationale is that fall-prone K2 ambulators '
          'benefit most from stumble recovery and stability features.',
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
          backgroundColor: const Color(0xFF152A27),
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
          backgroundColor: const Color(0xFF1F1A2E),
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
          backgroundColor: const Color(0xFF1A2332),
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
          backgroundColor: const Color(0xFF2A1D19),
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
          backgroundColor: const Color(0xFF152A1A),
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
          backgroundColor: const Color(0xFF2A1519),
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
          backgroundColor: const Color(0xFF2A2215),
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
        HeaderBlock('OPRA System — FDA Status & Complication Rates'),
        TextBlock(
          'The OPRA system received full Premarket Approval (PMA) from the FDA in '
          'December 2020, based on data from 65 participants. It is indicated for '
          'transfemoral amputees with rehabilitation problems with conventional sockets.',
        ),
        TableBlock(
          title: 'OPRA 5-Year Complication Rates',
          columns: ['Complication', 'Rate'],
          rows: [
            ['Cumulative fixture survival', '92% at 5 years'],
            ['Revision-free survival', '45% at 5 years'],
            ['Superficial infections', '67% of patients (70 events in 34/51)'],
            ['Deep infections', '22% of patients (14 events in 11/51)'],
            ['Mechanical complications', '29% of patients (abutment/screw fracture)'],
          ],
          headerColor: const Color(0xFFBF360C),
        ),
        ComparisonCardBlock(
          title: 'POP System (Press-Fit Implant)',
          themeColor: const Color(0xFF4E342E),
          backgroundColor: const Color(0xFF2A2522),
          icon: Icons.compress,
          description: 'The POP system uses a press-fit (non-threaded) implant design '
              'rather than the threaded screw design of the OPRA system. It may allow '
              'a shorter osseointegration timeline and shows lower deep infection rates.',
          keyPoints: [
            'Press-fit (non-threaded) implant vs OPRA threaded screw design',
            'Lower deep infection rate: 5% vs OPRA 22%',
            'Zero implant loosening (vs OPRA 6%)',
            'Superficial infections remain common: 77% of patients',
            'FDA-approved randomized multicenter trial ongoing',
            'VA began offering OPRA system in January 2022',
            'POP trial includes male veterans with unilateral transfemoral amputation',
          ],
        ),
        TableBlock(
          title: 'Overall Osseointegration Complication Summary',
          columns: ['Complication', 'Approximate Rate'],
          rows: [
            ['Minor stoma discharge', '67.5%'],
            ['Significant discharge requiring surgery', '13.6%'],
            ['Prosthesis removal', '9%'],
            ['Periprosthetic fracture', '4.5%'],
            ['Infection requiring additional surgery', '5-8%'],
          ],
          headerColor: const Color(0xFFBF360C),
        ),
        PearlBlock(
          'Board Pearl — Osseointegration',
          'Osseointegration eliminates the socket and all socket-related problems, '
          'but infection at the abutment (stoma) site is the MOST COMMON complication. '
          'OPRA = two-stage screw-type, 6-month healing, FDA PMA December 2020. '
          'POP = press-fit, lower deep infection rate (5% vs 22%). Superficial stoma '
          'infections occur in roughly two-thirds of patients with either system.',
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
          backgroundColor: const Color(0xFF2A1A2E),
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
          backgroundColor: const Color(0xFF1F1A2E),
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
          backgroundColor: const Color(0xFF152A1A),
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
        HeaderBlock('TMR Surgical Details'),
        BulletCardBlock(
          title: 'TMR Surgical Procedure',
          themeColor: const Color(0xFF4527A0),
          backgroundColor: const Color(0xFF1F1A2E),
          points: [
            '1. Neuroma identification and excision back to healthy fascicular tissue',
            '2. Proximal nerve stump prepared to expose healthy regenerating fascicles',
            '3. Recipient motor nerve branch identified via intraoperative nerve stimulation',
            '4. Recipient branch divided to denervate target muscle segment',
            '5. Coaptation: donor nerve sutured to recipient using 6-0/7-0 epineural sutures',
            'Surgical duration: 2-4 hours; hospital stay: 1-5 days',
            'Reinnervation period: 4-6 months for detectable EMG signals',
          ],
        ),
        HeaderBlock('TMR Transhumeral Nerve Transfer Targets'),
        TableBlock(
          title: 'Transhumeral TMR Nerve Transfers',
          columns: ['Donor Nerve', 'Target Muscle', 'Control Signal'],
          rows: [
            ['Musculocutaneous', 'Short head of biceps', 'Elbow flexion'],
            ['Median', 'Brachialis', 'Hand close'],
            ['Distal radial', 'Lateral head of triceps', 'Hand open'],
            ['Ulnar', 'Medial head of triceps', 'Wrist rotation / intrinsic hand'],
          ],
          headerColor: const Color(0xFF4527A0),
        ),
        HeaderBlock('TMR Pain Prevention Evidence'),
        BulletCardBlock(
          title: 'Dumanian RCT (2019) — TMR vs Standard Neuroma Excision',
          themeColor: const Color(0xFF2E7D32),
          backgroundColor: const Color(0xFF152A1A),
          points: [
            'First surgical RCT for post-amputation pain (28 amputees with chronic pain)',
            'TMR vs standard neuroma excision with muscle burial',
            'Phantom limb pain improvement: TMR 3.2 points vs standard -0.2 points',
            'Longitudinal analysis: significantly greater PLP improvement (p=0.03)',
            'Mechanism: transferred nerves have a target, preventing neuroma formation',
            'Growing evidence supports acute TMR at time of primary amputation',
            'Acute TMR prevents neuroma formation from the outset',
          ],
        ),
        PearlBlock(
          'Board Pearl — TMR Dual Benefit',
          'TMR provides TWO major benefits: (1) improved myoelectric prosthetic '
          'control with simultaneous multi-joint operation, AND (2) reduced phantom '
          'limb and neuroma pain because the transferred nerves have a target to '
          'reinnervate rather than forming painful neuromas. Acute TMR at time of '
          'amputation is increasingly recommended to prevent neuroma formation.',
        ),
        CheckpointBlock(
          question: 'Targeted muscle reinnervation (TMR) serves a dual purpose. What are its two primary benefits?',
          options: ['Better cosmesis and lighter weight', 'Improved myoelectric control AND reduced phantom limb pain', 'Faster rehabilitation AND lower cost', 'Better socket fit AND improved suspension'],
          correctIndex: 1,
          explanation: 'TMR provides dual benefits: (1) additional myoelectric control sites by transferring amputated limb nerves to new muscle targets, and (2) significant reduction in phantom limb pain (Dumanian RCT, N=28, p=0.03). TMR is now recommended as standard of care at time of primary amputation.',
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
          backgroundColor: const Color(0xFF1A2332),
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
          backgroundColor: const Color(0xFF1A2332),
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
          backgroundColor: const Color(0xFF152A2E),
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
        HeaderBlock('COAPT Clinical Evidence'),
        BulletCardBlock(
          title: 'COAPT RCT Results (Transhumeral Amputees with TMR)',
          themeColor: const Color(0xFF0D47A1),
          backgroundColor: const Color(0xFF1A2332),
          points: [
            '8-subject RCT: pattern recognition vs conventional direct control',
            '6-8 week home trial period in transhumeral amputees with TMR',
            'Significantly superior Southampton Hand Assessment Procedure scores (p=0.04)',
            'Significantly faster Clothespin Relocation Task performance (p=0.02)',
            'Better control for tasks requiring wrist function',
            'Users reported more natural and intuitive control',
            'FDA Class II clearance obtained in 2017',
          ],
        ),
        HeaderBlock('IMES Clinical Status'),
        BulletCardBlock(
          title: 'IMES FDA & Trial Status',
          themeColor: const Color(0xFF00838F),
          backgroundColor: const Color(0xFF152A2E),
          points: [
            'Currently in FDA-approved Early Feasibility Study (NCT03644394)',
            'Two transhumeral amputees enrolled to date',
            'First subject demonstrated greater variety and complexity of tasks vs prior prosthesis',
            'Confirmed feasibility for reliable sensing and wireless EMG transmission',
            'Achieved 3-degree-of-freedom prosthetic arm control',
            'NOT yet FDA-approved for commercial use — investigational device only',
            'Powered wirelessly through electromagnetic coupling (no internal batteries)',
          ],
        ),
        PearlBlock(
          'Board Pearl — Pattern Recognition',
          'Pattern recognition classifies EMG patterns across multiple electrodes '
          'to determine user intent, allowing intuitive grip selection without '
          'co-contraction mode switching. The COAPT system is the first commercially '
          'available pattern recognition system (FDA Class II cleared 2017). '
          'IMES are investigational implanted wireless sensors — not yet FDA-approved. '
          'Combined with TMR, pattern recognition represents the current state-of-the-art.',
        ),
      ],
    ),
  ],
);

import 'package:flutter/material.dart';
import '../models/topic_content_model.dart';
import '../flowcharts/clinical_flowcharts.dart';

final prostheticComponentsContent = TopicData(
  id: 'prosthetic_components',
  title: 'Prosthetic Components',
  tabs: [
    // ─────────────────────────────────────────────
    // TAB 1: Prosthetic Feet
    // ─────────────────────────────────────────────
    TopicTab(
      title: 'Prosthetic Feet',
      blocks: [
        HeaderBlock('Prosthetic Feet Overview'),
        TextBlock(
          'The prosthetic foot is the terminal device of a lower extremity prosthesis. '
          'It must simulate ankle motion, absorb shock at heel strike, provide a stable '
          'base of support, and facilitate rollover during stance. Foot selection depends '
          'on the patient\'s K-level (functional classification), activity demands, and '
          'terrain requirements. This is a heavily tested board topic.',
          isIntro: true,
        ),

        // --- SACH ---
        ComparisonCardBlock(
          title: 'SACH Foot (Solid Ankle Cushion Heel)',
          themeColor: Colors.blue,
          backgroundColor: const Color(0xFF1A2332),
          icon: Icons.square_foot,
          description:
              'The simplest prosthetic foot. A rigid wooden or plastic keel with a '
              'compressible foam heel cushion that simulates plantarflexion at heel '
              'strike. No actual ankle joint or moving parts.',
          keyPoints: [
            'Rigid internal keel (wood or rigid foam) — no articulation',
            'Compressible heel cushion simulates PF at initial contact',
            'NO actual ankle motion (no PF/DF joint)',
            'K-Level: K1 (limited household ambulator)',
            'LIGHTEST, most DURABLE, and CHEAPEST prosthetic foot',
            'Best performance on flat, level surfaces',
            'Poor performance on uneven terrain (no multiaxial motion)',
            'No energy return — all energy absorbed by foam',
            'Low maintenance, long lifespan',
            'Most commonly prescribed prosthetic foot worldwide',
          ],
        ),

        // --- Single-Axis ---
        ComparisonCardBlock(
          title: 'Single-Axis Foot',
          themeColor: Colors.orange,
          backgroundColor: const Color(0xFF2A2215),
          icon: Icons.swap_vert,
          description:
              'A prosthetic foot with a mechanical ankle joint that allows '
              'plantarflexion and dorsiflexion in the sagittal plane. Bumpers '
              'control the range and resistance of motion.',
          keyPoints: [
            'Mechanical ankle joint allows PF and DF in one plane',
            'PF bumper (posterior): controls rate of PF at heel strike',
            'DF bumper (anterior): controls DF range and resistance',
            'Goes to foot-flat QUICKLY — enhances knee stability at heel strike',
            'K-Level: K1-K2',
            'Provides a stabilizing knee extension moment at initial contact via rapid foot-flat — primarily benefits TT patients with weak quadriceps or knee extension instability, and secondarily TF patients needing additional stance-phase knee security',
            'HEAVIER and requires more MAINTENANCE than SACH',
            'PF at heel strike reduces knee flexion moment (stabilizing)',
            'Higher cost and complexity than SACH foot',
          ],
        ),

        // --- Multi-Axis ---
        ComparisonCardBlock(
          title: 'Multi-Axis Foot',
          themeColor: Colors.teal,
          backgroundColor: const Color(0xFF152A27),
          icon: Icons.open_with,
          description:
              'A prosthetic foot allowing motion in multiple planes: plantarflexion/'
              'dorsiflexion, inversion/eversion, and transverse rotation. Designed '
              'for walking on uneven terrain.',
          keyPoints: [
            'Allows PF/DF, inversion/eversion, and transverse rotation',
            'Multiple bumper systems control motion in each plane',
            'Best for UNEVEN TERRAIN and varied walking surfaces',
            'K-Level: K2',
            'Accommodates slopes, ramps, and rough ground',
            'Reduces torque transmitted to the socket and residual limb',
            'HEAVIER and more EXPENSIVE than SACH or single-axis',
            'Requires more maintenance due to moving parts',
            'No significant energy return',
          ],
        ),

        // --- Flexible Keel ---
        ComparisonCardBlock(
          title: 'Flexible Keel Foot (SAFE II)',
          themeColor: Colors.green,
          backgroundColor: const Color(0xFF152A1A),
          icon: Icons.waves,
          description:
              'Replaces the rigid keel of the SACH foot with a flexible keel that '
              'provides smoother rollover during midstance and terminal stance. '
              'A step up from SACH in performance with moderate complexity.',
          keyPoints: [
            'Flexible internal keel replaces rigid SACH keel',
            'Smoother forefoot rollover than SACH foot',
            'Moderate flexibility allows more natural toe-off',
            'K-Level: K2',
            'SAFE = Stationary Ankle Flexible Endoskeletal',
            'Better than SACH for varied cadence walking',
            'Minimal energy return compared to dynamic response feet',
            'Good compromise between simplicity and performance',
          ],
        ),

        // --- Energy Storing ---
        ComparisonCardBlock(
          title: 'Energy-Storing / Dynamic Response Foot',
          themeColor: Colors.deepOrange,
          backgroundColor: const Color(0xFF2A1D19),
          icon: Icons.bolt,
          description:
              'A high-performance prosthetic foot made of carbon fiber or fiberglass '
              'that stores energy during midstance loading and returns it at push-off. '
              'Provides the most efficient and natural gait pattern.',
          keyPoints: [
            'Carbon fiber or fiberglass construction (spring-like keel)',
            'STORES energy during midstance (elastic deformation)',
            'RETURNS energy at push-off (elastic recoil = propulsion)',
            'K-Level: K3-K4 (community and high-activity ambulators)',
            'Most ENERGY EFFICIENT prosthetic foot design',
            'Lightest weight per function of all foot designs',
            'Examples: Flex-Foot, Seattle Foot, Carbon Copy II, Vari-Flex',
            'Best for active individuals, athletes, and variable cadence',
            'Reduces metabolic cost of ambulation vs other foot types',
            'Most expensive prosthetic foot category',
            'Split-toe designs available for uneven terrain',
          ],
        ),

        PearlBlock(
          'Board Pearl: Prosthetic Feet',
          'SACH = simplest, cheapest, lightest, K1. Energy-storing (dynamic '
          'response) = most efficient, K3-K4. Single-axis goes to foot-flat '
          'quickly for knee stability. If the question describes an active '
          'community ambulator, the answer is energy-storing foot.',
        ),

        // --- Comprehensive Comparison Table ---
        TableBlock(
          title: 'Prosthetic Feet Comparison',
          columns: ['Foot Type', 'K-Level', 'Advantages', 'Disadvantages', 'Best For'],
          rows: [
            ['SACH', 'K1', 'Lightest, cheapest, durable, low maintenance', 'No ankle motion, no energy return, flat surfaces only', 'Limited household ambulators'],
            ['Single-Axis', 'K1-K2', 'Quick to foot-flat, knee stability', 'Heavy, high maintenance, no energy return', 'TF amputees needing knee stability'],
            ['Multi-Axis', 'K2', 'Uneven terrain, reduces socket torque', 'Heavy, expensive, high maintenance', 'Uneven terrain walkers'],
            ['Flexible Keel (SAFE)', 'K2', 'Smoother rollover than SACH', 'Minimal energy return', 'Moderate community ambulators'],
            ['Energy-Storing', 'K3-K4', 'Energy return, lightest per function, most efficient', 'Most expensive', 'Active community ambulators, athletes'],
          ],
          headerColor: const Color(0xFFBF360C),
        ),

        // --- Interactive: Annotated Image ---
        AnnotatedImageBlock(
          title: 'Prosthetic Foot Types',
          diagramType: 'prosthetic-feet',
          hotspots: [
            HotspotData(id: 'sach', xPercent: 0.1, yPercent: 0.5, label: 'SACH Foot', description: 'Solid Ankle Cushion Heel. Compressible heel simulates plantarflexion. No moving parts — most durable, lowest maintenance.', clinicalSignificance: 'K1 patients. Best for stability. No energy return.', pinColor: Color(0xFF0D9488)),
            HotspotData(id: 'single', xPercent: 0.3, yPercent: 0.5, label: 'Single-Axis Foot', description: 'Hinged ankle joint allows plantarflexion/dorsiflexion. Rapid foot flat at loading response.', clinicalSignificance: 'Enhances KNEE STABILITY at loading response — good for K2. Key board concept.', pinColor: Color(0xFF3B82F6)),
            HotspotData(id: 'multi', xPercent: 0.5, yPercent: 0.5, label: 'Multi-Axis Foot', description: 'Allows motion in all planes: plantarflexion/dorsiflexion, inversion/eversion, rotation.', clinicalSignificance: 'Best for uneven terrain. Accommodates ground irregularities. K2-K3.', pinColor: Color(0xFF8B5CF6)),
            HotspotData(id: 'flex', xPercent: 0.7, yPercent: 0.5, label: 'Flexible Keel', description: 'Compliant forefoot simulates metatarsal rocker. Smooth rollover in terminal stance.', pinColor: Color(0xFFFF9800)),
            HotspotData(id: 'esar', xPercent: 0.9, yPercent: 0.5, label: 'ESAR (Dynamic Response)', description: 'Carbon fiber stores energy during midstance, returns it at push-off. Highest energy return of passive feet.', clinicalSignificance: 'K3-K4. Running blades (Cheetah) return ~90% energy. Gold standard for active amputees.', pinColor: Color(0xFF16A34A)),
          ],
          aspectRatio: 2.0,
        ),

        // --- Checkpoint: Prosthetic Feet ---
        CheckpointBlock(
          question: 'Which prosthetic foot type ENHANCES knee stability at loading response by allowing rapid plantarflexion to foot flat?',
          options: ['SACH foot', 'Single-axis foot', 'Energy-storing (ESAR) foot', 'Multi-axis foot'],
          correctIndex: 1,
          explanation: 'The single-axis foot has a hinged ankle that allows rapid plantarflexion at loading response, bringing the foot flat quickly. This creates a knee extension moment that enhances knee stability — critical concept for K2 patients with weak quadriceps or knee instability.',
        ),
        prostheticFootFlowchart,
        CustomWidgetBlock(CustomWidgetType.prostheticFootDemo),
      ],
    ),

    // ─────────────────────────────────────────────
    // TAB 2: Prosthetic Knees
    // ─────────────────────────────────────────────
    TopicTab(
      title: 'Prosthetic Knees',
      blocks: [
        HeaderBlock('Prosthetic Knee Units'),
        TextBlock(
          'Prosthetic knee units are needed for transfemoral and knee disarticulation '
          'amputees. The knee unit must provide stance stability (prevent buckling) '
          'and swing control (appropriate cadence). Selection depends on K-level, '
          'stability needs, and functional demands. This is extremely high-yield.',
          isIntro: true,
        ),

        // --- Constant Friction ---
        ComparisonCardBlock(
          title: 'Constant Friction (Single-Axis) Knee',
          themeColor: Colors.grey,
          backgroundColor: const Color(0xFF232A3B),
          icon: Icons.settings,
          description:
              'The simplest prosthetic knee. A single pivot point with a friction '
              'screw that sets one fixed swing speed. Only appropriate for patients '
              'who walk at a SINGLE, CONSTANT cadence.',
          keyPoints: [
            'Single axis of rotation (simple hinge)',
            'Friction screw controls swing phase speed',
            'FIXED CADENCE ONLY — cannot adjust to speed changes',
            'K-Level: K1 (household ambulator)',
            'Simplest, cheapest, lightest knee unit',
            'No inherent stance stability mechanism',
            'May add manual lock for additional stance stability',
            'Not appropriate for variable-speed walkers',
          ],
        ),

        // --- Stance-Control / Safety Knee ---
        ComparisonCardBlock(
          title: 'Stance-Control (Weight-Activated) Safety Knee',
          themeColor: Colors.blue,
          backgroundColor: const Color(0xFF1A2332),
          icon: Icons.security,
          description:
              'A knee unit with a weight-activated friction brake that resists '
              'flexion during stance phase. When the patient loads the prosthesis, '
              'friction increases to prevent knee buckling.',
          keyPoints: [
            'Weight-activated friction brake prevents knee buckling in stance',
            'Loading the prosthesis increases friction (stance stability)',
            'Unloading the prosthesis releases brake for swing phase',
            'K-Level: K1-K2',
            'Must FULLY UNLOAD the prosthesis to initiate swing',
            'CANNOT be used BILATERALLY (cannot unload both to sit down)',
            'Provides good stance security for less stable walkers',
            'Patient must fully extend knee to engage weight-activated brake',
            'Abnormal gait: must deliberately unload to swing through',
          ],
        ),
        PearlBlock(
          'Board Pearl: Stance-Control Knee',
          'The weight-activated stance-control knee CANNOT be used bilaterally. '
          'If both knees are stance-control, the patient cannot unload both '
          'simultaneously to sit down. This is a classic board question.',
        ),

        // --- Polycentric ---
        ComparisonCardBlock(
          title: 'Polycentric (Four-Bar) Knee',
          themeColor: Colors.teal,
          backgroundColor: const Color(0xFF152A27),
          icon: Icons.hub,
          description:
              'A knee with multiple linkage bars creating an instantaneous center '
              'of rotation that moves during flexion. This provides inherent '
              'stance stability and shortens the shank in swing.',
          keyPoints: [
            'Multiple bars (typically 4) create a moving center of rotation',
            'Instantaneous center of rotation (ICR) moves with knee flexion',
            'Inherently STABLE in stance when ICR is above and posterior',
            'SHORTENS the shank during swing (great for knee disarticulation)',
            'K-Level: K2-K3',
            'BEST choice for KNEE DISARTICULATION amputation',
            'Shortening effect prevents foot dragging despite long residual limb',
            'Good cosmesis in sitting due to matching knee centers',
            'More complex and heavier than single-axis designs',
            'Provides stability without need for manual locking',
          ],
        ),
        PearlBlock(
          'Board Pearl: Polycentric Knee',
          'The polycentric (four-bar) knee is BEST for knee disarticulation '
          'amputees because it shortens the shank during swing phase. Without '
          'this shortening, the prosthetic shank would be too long (the knee '
          'center adds length) and the foot would drag.',
        ),

        // --- Manual Locking ---
        ComparisonCardBlock(
          title: 'Manual Locking Knee',
          themeColor: Colors.red,
          backgroundColor: const Color(0xFF2A1519),
          icon: Icons.lock_outline,
          description:
              'A knee unit that is locked in full extension throughout the ENTIRE '
              'gait cycle. The patient walks with a stiff knee and must manually '
              'unlock it to sit. This is the LAST RESORT option.',
          keyPoints: [
            'Locked in full extension during ALL phases of gait',
            'LAST RESORT — only when other options are unsafe',
            'K-Level: K1',
            'Indicated for: blind patients, severe balance deficits, stroke, cognitive impairment',
            'Produces highly abnormal stiff-legged gait',
            'Requires circumduction or hip-hiking to clear limb in swing',
            'Cannot sit normally — must manually unlock to flex knee',
            'Maximum stance security at the cost of normal gait',
            'Very high energy expenditure due to stiff-knee pattern',
          ],
        ),

        // --- Hydraulic ---
        ComparisonCardBlock(
          title: 'Hydraulic Knee',
          themeColor: Colors.indigo,
          backgroundColor: const Color(0xFF1A1D2E),
          icon: Icons.water_drop,
          description:
              'A fluid-controlled knee unit using hydraulic cylinders to provide '
              'VARIABLE CADENCE control. Resistance automatically adjusts to '
              'walking speed, allowing natural speed changes.',
          keyPoints: [
            'Hydraulic fluid cylinders control swing AND stance resistance',
            'VARIABLE CADENCE: automatically adjusts to walking speed',
            'Faster walking = more resistance (higher shear forces in fluid)',
            'K-Level: K3-K4 (community and high-activity ambulators)',
            'Most natural gait pattern of mechanical knee units',
            'Can provide stance phase resistance (stance flexion dampening)',
            'HEAVIER and more EXPENSIVE than friction knees',
            'Requires more maintenance (fluid seals, cylinder servicing)',
            'May leak fluid if seals wear out',
          ],
        ),

        // --- Pneumatic ---
        ComparisonCardBlock(
          title: 'Pneumatic Knee',
          themeColor: Colors.cyan,
          backgroundColor: const Color(0xFF152A2E),
          icon: Icons.air,
          description:
              'An air-controlled knee unit providing swing phase control through '
              'pneumatic (air) cylinders. Lighter than hydraulic but only controls '
              'swing phase (no stance control).',
          keyPoints: [
            'Pneumatic (air) cylinders control SWING PHASE ONLY',
            'Variable cadence in swing phase',
            'LIGHTER than hydraulic knee units',
            'K-Level: K3',
            'Does NOT provide stance phase control',
            'Less resistance range than hydraulic',
            'Good intermediate option between friction and hydraulic',
            'Less maintenance than hydraulic (no fluid to leak)',
          ],
        ),

        // --- Microprocessor ---
        ComparisonCardBlock(
          title: 'Microprocessor-Controlled Knee (MPK)',
          themeColor: Colors.deepPurple,
          backgroundColor: const Color(0xFF1F1A2E),
          icon: Icons.computer,
          description:
              'A computer-controlled knee unit that uses sensors and a '
              'microprocessor to continuously adjust stance and swing resistance. '
              'Provides the most adaptive and natural gait pattern.',
          keyPoints: [
            'Sensors detect gait phase, speed, and terrain in real time',
            'Microprocessor adjusts hydraulic/pneumatic resistance continuously',
            'Controls BOTH stance and swing phases',
            'K-Level: K3-K4',
            'Examples: C-Leg (Otto Bock), Genium, Rheo Knee, POWER KNEE',
            'Stumble recovery: detects and prevents falls',
            'Stance flexion: allows controlled yielding (ramps, stairs)',
            'Reduced falls and improved safety vs mechanical knees',
            'Battery-powered, requires charging',
            'MOST EXPENSIVE knee unit option',
            'Reduced metabolic cost compared to mechanical alternatives',
          ],
        ),

        // --- Knee Units Table ---
        TableBlock(
          title: 'Prosthetic Knee Units Comparison',
          columns: ['Knee Type', 'K-Level', 'Cadence', 'Key Feature', 'Limitation'],
          rows: [
            ['Constant friction', 'K1', 'Fixed only', 'Simplest, cheapest', 'Single speed only'],
            ['Stance-control (safety)', 'K1-K2', 'Fixed', 'Weight-activated brake', 'Cannot use bilaterally'],
            ['Polycentric (4-bar)', 'K2-K3', 'Fixed', 'Shortens in swing', 'Complex, heavy'],
            ['Manual locking', 'K1', 'N/A (locked)', 'Maximum stability', 'Last resort, abnormal gait'],
            ['Hydraulic', 'K3-K4', 'Variable', 'Stance + swing control', 'Heavy, expensive, maintenance'],
            ['Pneumatic', 'K3', 'Variable (swing)', 'Lighter than hydraulic', 'Swing control only'],
            ['Microprocessor', 'K3-K4', 'Variable', 'Computer-controlled, fall prevention', 'Most expensive, needs battery'],
          ],
          headerColor: const Color(0xFF4A148C),
        ),

        PearlBlock(
          'Board Pearl: Knee Unit Selection',
          'Manual locking knee = LAST RESORT (blind, severe balance issues). '
          'Polycentric = BEST for knee disarticulation. '
          'Stance-control = CANNOT use bilaterally. '
          'Hydraulic/MPK = variable cadence for active ambulators (K3-K4).',
        ),
      ],
    ),

    // ─────────────────────────────────────────────
    // TAB 3: Socket Overview
    // ─────────────────────────────────────────────
    TopicTab(
      title: 'Socket Overview',
      blocks: [
        HeaderBlock('Prosthetic Design: Endoskeletal vs Exoskeletal'),
        TextBlock(
          'Prosthetic design refers to the structural framework of the prosthesis. '
          'The two fundamental approaches are endoskeletal (modular) and exoskeletal '
          '(crustacean). Understanding the tradeoffs between these designs and the '
          'socket fabrication process is important for board exams.',
          isIntro: true,
        ),

        // --- Endoskeletal ---
        ComparisonCardBlock(
          title: 'Endoskeletal (Modular) Design',
          themeColor: Colors.blue,
          backgroundColor: const Color(0xFF1A2332),
          icon: Icons.view_column,
          description:
              'An internal pylon (metal tube) provides structural support, covered '
              'by a soft cosmetic foam cover. Components are modular and can be '
              'easily adjusted or replaced.',
          keyPoints: [
            'Internal pylon (aluminum or titanium tube) bears weight',
            'Soft foam cosmetic cover for appearance',
            'MODULAR: components easily interchanged and aligned',
            'ADJUSTABLE: alignment changes without refabrication',
            'LIGHTER weight than exoskeletal',
            'Better cosmesis with shaped foam cover',
            'Cover can be damaged and must be replaced periodically',
            'MOST COMMONLY PRESCRIBED design in developed countries',
            'Allows dynamic alignment adjustments in clinic',
          ],
        ),

        // --- Exoskeletal ---
        ComparisonCardBlock(
          title: 'Exoskeletal (Crustacean) Design',
          themeColor: Colors.brown,
          backgroundColor: const Color(0xFF2A2522),
          icon: Icons.shield,
          description:
              'A rigid outer laminated shell provides both structural support and '
              'cosmetic shape. Named for its resemblance to a crustacean exoskeleton '
              'where the shell is the structure.',
          keyPoints: [
            'Rigid outer shell is BOTH structure and cosmetic shape',
            'Laminated plastic (fiberglass or carbon fiber reinforced)',
            'DURABLE and WATERPROOF (good for wet/dirty environments)',
            'HEAVIER than endoskeletal design',
            'NOT easily adjustable (alignment changes require refabrication)',
            'Components are NOT interchangeable',
            'Better for heavy-duty use and harsh environments',
            'Historical standard — less common in modern prosthetics',
            'Still used in developing countries and for specific needs',
          ],
        ),

        TableBlock(
          title: 'Endoskeletal vs Exoskeletal Comparison',
          columns: ['Feature', 'Endoskeletal', 'Exoskeletal'],
          rows: [
            ['Structure', 'Internal pylon', 'Outer rigid shell'],
            ['Weight', 'Lighter', 'Heavier'],
            ['Adjustability', 'Highly adjustable', 'Not easily adjusted'],
            ['Durability', 'Moderate (cover damage)', 'Very durable'],
            ['Waterproof', 'No (cover absorbs water)', 'Yes'],
            ['Cosmesis', 'Good (foam cover)', 'Moderate'],
            ['Modularity', 'Components interchangeable', 'Fixed components'],
            ['Cost', 'Higher (more components)', 'Lower initial cost'],
            ['Modern use', 'Most common', 'Less common'],
          ],
          headerColor: const Color(0xFF1565C0),
        ),

        // --- Preparatory vs Definitive ---
        HeaderBlock('Preparatory vs Definitive Prosthesis'),
        BulletCardBlock(
          title: 'Preparatory (Temporary) Prosthesis',
          themeColor: Colors.orange,
          backgroundColor: const Color(0xFF2A2215),
          points: [
            'Fabricated early after amputation during limb maturation',
            'Allows immediate or early prosthetic training',
            'Simple construction for easy modification as limb shrinks',
            'Socket can be replaced as residual limb volume decreases',
            'Typically endoskeletal for easy alignment adjustment',
            'Used for 3-6 months until limb volume stabilizes',
            'Goal: gait training, limb shaping, patient evaluation',
          ],
        ),
        BulletCardBlock(
          title: 'Definitive Prosthesis',
          themeColor: Colors.green,
          backgroundColor: const Color(0xFF152A1A),
          points: [
            'Fabricated after residual limb volume has stabilized',
            'Typically 4-6 months post-amputation (volume plateau)',
            'Higher quality components and materials',
            'Better cosmetic finishing and fit',
            'More expensive and time-consuming to fabricate',
            'Expected to last 3-5 years with proper maintenance',
            'May be endoskeletal or exoskeletal',
          ],
        ),

        // --- Socket Fabrication ---
        HeaderBlock('Socket Fabrication Process'),
        NumberedListBlock([
          MapEntry('1', 'CASTING: Negative mold of residual limb using plaster wrap or digital scan'),
          MapEntry('2', 'MODIFICATION (Rectification): Plaster added to pressure-sensitive areas, removed from pressure-tolerant areas on the positive mold'),
          MapEntry('3', 'FABRICATION: Thermoplastic or laminated socket formed over the modified positive mold'),
          MapEntry('4', 'FITTING: Test socket (check socket) evaluated on the patient; adjustments made'),
          MapEntry('5', 'ALIGNMENT: Static and dynamic alignment optimized during gait'),
          MapEntry('6', 'DELIVERY: Final prosthesis delivered with patient education'),
        ]),

        BulletCardBlock(
          title: 'CAD/CAM in Socket Design',
          themeColor: Colors.purple,
          backgroundColor: const Color(0xFF2A1A2E),
          points: [
            'CAD/CAM: Computer-Aided Design / Computer-Aided Manufacturing',
            'Digital scanning replaces plaster casting',
            'Computer software performs socket modification (rectification)',
            'CNC carving machine produces the positive mold',
            'Advantages: reproducibility, digital storage, remote fabrication',
            'Disadvantages: high initial cost, learning curve, less tactile feedback',
            'Increasingly common in modern prosthetic clinics',
          ],
        ),
      ],
    ),

    // ─────────────────────────────────────────────
    // TAB 4: Partial Foot Prosthetics
    // ─────────────────────────────────────────────
    TopicTab(
      title: 'Partial Foot Prosthetics',
      blocks: [
        HeaderBlock('Partial Foot Amputations and Prosthetics'),
        TextBlock(
          'Partial foot amputations range from individual toe amputations to ankle '
          'disarticulation. Each level has specific biomechanical consequences and '
          'prosthetic/orthotic requirements. Understanding the progressive loss of '
          'push-off power and the tendency toward equinovarus with more proximal '
          'amputations is essential.',
          isIntro: true,
        ),

        // --- Toe Amputations ---
        BulletCardBlock(
          title: 'Toe Amputations',
          themeColor: Colors.blue,
          backgroundColor: const Color(0xFF1A2332),
          points: [
            'Great toe amputation: loss of push-off power, balance affected',
            'Lesser toe amputations: minimal functional loss',
            'Prosthetic: toe filler maintains shoe fit and foot shape',
            'Stiff-soled shoe or steel shank limits painful MTP motion',
            'Custom insole redistributes pressure to remaining structures',
            'Great toe loss more significant than lesser toe loss',
          ],
        ),

        // --- TMA ---
        ComparisonCardBlock(
          title: 'Transmetatarsal Amputation (TMA)',
          themeColor: Colors.teal,
          backgroundColor: const Color(0xFF152A27),
          icon: Icons.content_cut,
          description:
              'Amputation through the metatarsal shafts, preserving the entire '
              'tarsus. Provides a good functional residual foot with adequate '
              'lever arm for ambulation.',
          keyPoints: [
            'Amputation through the metatarsal shafts (all 5)',
            'Preserves all tarsal bones and partial metatarsals',
            'Significant loss of push-off power (lost met heads and toes)',
            'Equinus tendency due to loss of toe extensors and anterior lever arm',
            'Prosthetic: rocker bottom sole for smooth rollover',
            'Spring steel shank stiffens sole for push-off substitute',
            'Custom total contact insole for pressure redistribution',
            'Toe filler fills shoe for cosmesis and balance',
            'Good functional outcome with proper prosthetic management',
          ],
        ),

        // --- Lisfranc ---
        ComparisonCardBlock(
          title: 'Lisfranc (Tarsometatarsal) Amputation',
          themeColor: Colors.orange,
          backgroundColor: const Color(0xFF2A2215),
          icon: Icons.low_priority,
          description:
              'Disarticulation through the tarsometatarsal joints. Preserves the '
              'midfoot and hindfoot but removes all metatarsals and toes. '
              'Significant equinovarus tendency without tendon management.',
          keyPoints: [
            'Disarticulation at the tarsometatarsal (Lisfranc) joints',
            'Preserves cuneiforms, navicular, cuboid, talus, calcaneus',
            'All metatarsals and toes removed',
            'EQUINOVARUS tendency: peroneus brevis (5th MT base) and peroneus longus (1st MT base) insertions lost; extensor digitorum and extensor hallucis longus insertions lost',
            'Tibialis anterior insertion on the medial cuneiform may be preserved depending on the disarticulation plane, so dorsiflexion loss is less complete than at Chopart',
            'Must reattach/rebalance tendons to prevent equinovarus',
            'Prosthetic: custom partial foot prosthesis or clamshell AFO',
            'May need ankle-foot orthosis to control equinovarus',
            'Shortened lever arm increases loading on residual foot',
          ],
        ),

        // --- Chopart ---
        ComparisonCardBlock(
          title: 'Chopart (Midtarsal) Amputation',
          themeColor: Colors.red,
          backgroundColor: const Color(0xFF2A1519),
          icon: Icons.warning_amber,
          description:
              'Disarticulation through the midtarsal (talonavicular and calcaneocuboid) '
              'joints. Only the talus and calcaneus remain. Severe equinovarus '
              'tendency and very short lever arm.',
          keyPoints: [
            'Disarticulation at talonavicular and calcaneocuboid joints',
            'Only TALUS and CALCANEUS remain',
            'Very short anterior lever arm for push-off',
            'SEVERE equinovarus tendency: all dorsiflexors and evertors lost',
            'Only plantarflexors (gastrocnemius/soleus) remain attached',
            'Achilles tendon pull causes progressive equinus deformity',
            'MUST address equinovarus surgically (tendon balancing, Achilles lengthening)',
            'Prosthetic: custom prosthetic foot filler with AFO shell',
            'Often requires clamshell-type AFO prosthesis',
            'High risk of skin breakdown on distal residual limb',
          ],
        ),

        PearlBlock(
          'Board Pearl: Lisfranc and Chopart',
          'Both Lisfranc and Chopart amputations develop EQUINOVARUS deformity '
          'without surgical tendon reattachment or rebalancing. This occurs '
          'because dorsiflexors and evertors lose their distal insertions while '
          'the plantarflexors (Achilles) remain intact. This is a classic board '
          'question.',
        ),

        // --- Syme's ---
        ComparisonCardBlock(
          title: 'Syme\'s Amputation (Ankle Disarticulation)',
          themeColor: Colors.indigo,
          backgroundColor: const Color(0xFF1A1D2E),
          icon: Icons.accessibility,
          description:
              'Disarticulation through the ankle joint with preservation of the '
              'heel pad, which is attached to the distal tibia for end-bearing. '
              'Provides excellent functional outcomes but has cosmetic limitations.',
          keyPoints: [
            'Ankle disarticulation: entire foot removed at ankle joint',
            'Heel pad preserved and sutured to distal tibia',
            'END-BEARING: patient can weight-bear directly on distal end',
            'LONG LEVER ARM: entire tibia preserved',
            'Can ambulate short distances without prosthesis (around house)',
            'Prosthetic: custom Syme\'s prosthesis with window or expandable wall',
            'BULBOUS distal end: wider than the opposite ankle',
            'Cosmetic challenge: prosthesis wider at ankle than contralateral side',
            'Self-suspending: bulbous shape helps suspend the prosthesis',
            'Better function than transtibial due to end-bearing and lever arm',
            'Less energy expenditure than transtibial amputation',
          ],
        ),

        PearlBlock(
          'Board Pearl: Syme\'s Amputation',
          'Syme\'s preserves the heel pad for END-BEARING weight transfer. '
          'Advantages: long lever arm, end-bearing, low energy expenditure. '
          'Disadvantage: BULBOUS distal end creates cosmetic challenges. '
          'The prosthesis must accommodate the bulbous shape with a window, '
          'expandable inner wall, or medial opening.',
        ),

        // --- Partial Foot Summary Table ---
        TableBlock(
          title: 'Partial Foot Amputation Levels',
          columns: ['Level', 'Structures Remaining', 'Key Issue', 'Prosthetic/Orthotic'],
          rows: [
            ['Toe amputation', 'All metatarsals', 'Minor push-off loss', 'Toe filler, stiff sole'],
            ['TMA', 'All tarsals, partial mets', 'Push-off loss, equinus', 'Rocker sole, steel shank, insole'],
            ['Lisfranc', 'Tarsals only', 'Equinovarus', 'Partial foot prosthesis or AFO'],
            ['Chopart', 'Talus and calcaneus only', 'Severe equinovarus', 'Custom prosthetic foot + AFO'],
            ['Syme\'s', 'None (heel pad on tibia)', 'Bulbous cosmesis', 'Syme\'s prosthesis (windowed)'],
          ],
          headerColor: const Color(0xFF283593),
        ),

        // --- Energy Expenditure ---
        HeaderBlock('Functional Considerations'),
        BulletCardBlock(
          title: 'Energy Expenditure by Amputation Level',
          themeColor: Colors.deepPurple,
          backgroundColor: const Color(0xFF1F1A2E),
          points: [
            'More proximal amputation = higher energy expenditure',
            'Partial foot < Syme\'s < Transtibial < Knee disartic < Transfemoral',
            'Bilateral amputations: significantly higher energy than unilateral',
            'Vascular amputees: higher energy cost than traumatic amputees',
            'Energy-storing feet reduce metabolic cost for active patients',
            'Prosthetic knee selection significantly impacts TF energy cost',
          ],
        ),
      ],
    ),

    // ─────────────────────────────────────────────
    // TAB 5: Energy Expenditure
    // ─────────────────────────────────────────────
    TopicTab(
      title: 'Energy Expenditure',
      blocks: [
        HeaderBlock('Energy Expenditure in Amputee Ambulation'),
        TextBlock(
          'The metabolic cost of walking with a prosthesis increases with more '
          'proximal amputation levels and with vascular (vs traumatic) etiology. '
          'Two distinct measures are clinically important: oxygen consumption rate '
          '(mL O2/kg/min) and oxygen cost (mL O2/kg/m). Amputees self-select '
          'slower walking speeds to maintain tolerable metabolic rates.',
          isIntro: true,
        ),

        // --- Comprehensive Energy Table ---
        TableBlock(
          title: 'Energy Expenditure by Amputation Level',
          columns: ['Level', 'O2 Cost Increase', 'Speed vs Normal', 'Clinical Implication'],
          rows: [
            ['Unilateral Syme', 'Minimal', 'Minimal decrease', 'Lowest energy cost among amputations'],
            ['Unilateral TT (traumatic)', '10-25%', '10-15% decrease', 'Most achieve community ambulation'],
            ['Unilateral TT (vascular)', '20-40%', 'Moderately decreased', 'Limited community ambulation'],
            ['Unilateral TF (traumatic)', '60-70%', '30-40% decrease', 'Community ambulation possible'],
            ['Unilateral TF (vascular)', '65-100%', 'Significantly decreased', 'Household to limited community'],
            ['Bilateral TT', '~41%', '20-30% decrease', 'Most can ambulate; assistive device often needed'],
            ['Bilateral TF', '>200%', '>50% decrease', 'Often non-ambulatory with prostheses'],
            ['Hip disarticulation', '100-200%', '>40% decrease', 'Very limited ambulation potential'],
            ['Wheelchair (level)', 'Similar to normal walking', 'N/A', 'May be more efficient than prosthetic walking at higher levels'],
          ],
          headerColor: const Color(0xFFC62828),
        ),
        BulletCardBlock(
          title: 'Key Energy Expenditure Concepts',
          themeColor: const Color(0xFFC62828),
          backgroundColor: const Color(0xFF2A1519),
          points: [
            'O2 consumption rate (mL/kg/min): metabolic demand per unit TIME',
            'O2 cost (mL/kg/m): metabolic expense per unit DISTANCE (accounts for speed)',
            'Amputees self-select slower speeds to keep O2 consumption rate tolerable',
            'Per-minute rate may appear near-normal but per-meter cost is elevated',
            'Vascular amputees have HIGHER energy costs than traumatic at SAME level',
            'Hierarchy: Syme < unilateral TT < bilateral TT < unilateral TF < bilateral TF',
          ],
        ),

        // --- Metabolic Comparisons ---
        HeaderBlock('Metabolic Cost Comparisons'),
        BulletCardBlock(
          title: 'Prosthetic Walking vs Alternatives',
          themeColor: const Color(0xFF1565C0),
          backgroundColor: const Color(0xFF1A2332),
          points: [
            'Wheelchair propulsion on level ground: similar to or slightly lower than normal walking',
            'For bilateral TF: wheelchair may be MORE energy-efficient than prosthetic ambulation',
            'Crutch walking (swing-through): requires considerable UE strength and CV fitness',
            'Crutch walking may demand energy comparable to or exceeding prosthetic ambulation',
          ],
        ),
        HeaderBlock('Impact of Advanced Components on Energy Cost'),
        BulletCardBlock(
          title: 'Microprocessor Knees (MPK) Energy Benefits',
          themeColor: Colors.deepPurple,
          backgroundColor: const Color(0xFF1F1A2E),
          points: [
            'C-Leg: significant reductions in O2 consumption at typical and fast walking speeds',
            'Rheo Knee: 5% metabolic rate reduction vs Mauch Knee; 3% reduction vs C-Leg',
            'MPK users show increased physical activity in free-living environments',
            'Reduced cognitive demand during ambulation (less concentration needed)',
          ],
        ),
        BulletCardBlock(
          title: 'Powered Ankle-Foot Systems (BiOM/Empower)',
          themeColor: Colors.teal,
          backgroundColor: const Color(0xFF152A27),
          points: [
            '16% decrease in metabolic rate in highly active individuals vs dynamic-response feet',
            'Significant metabolic cost reduction at speeds >0.75 m/s',
            '15% faster self-selected walking speed',
            'Not all patients benefit equally; outcomes are mixed across population',
          ],
        ),
        PearlBlock(
          'Board Pearl - Energy & Components',
          'Microprocessor knees reduce O2 consumption and cognitive demands. '
          'Rheo Knee: 5% reduction vs Mauch. Powered ankles (BiOM/Empower) '
          'reduce metabolic rate by 16% in highly active users. For bilateral TF '
          'amputees, wheelchair may be more energy-efficient than prosthetic ambulation.',
        ),
      ],
    ),

    // ─────────────────────────────────────────────
    // TAB 6: K-Levels & Classification
    // ─────────────────────────────────────────────
    TopicTab(
      title: 'K-Levels & Classification',
      blocks: [
        HeaderBlock('Medicare K-Level Classification System'),
        TextBlock(
          'The Medicare Functional Classification Level (MFCL) system, known as '
          'the K-level system, classifies amputee functional ability and determines '
          'prosthetic component eligibility for Medicare reimbursement. K-levels '
          'range from K0 (no ambulation) to K4 (high-impact activity).',
          isIntro: true,
        ),
        TableBlock(
          title: 'K-Level Definitions & Component Eligibility',
          columns: ['K-Level', 'Description', 'Components'],
          rows: [
            ['K0', 'No ability to ambulate or transfer with prosthesis', 'No prosthesis; may receive cosmetic cover'],
            ['K1', 'Transfers or ambulation on level surfaces at fixed cadence', 'SACH foot, single-axis knee, manual-locking knee'],
            ['K2', 'Traverses low-level environmental barriers (curbs, stairs)', 'Multiaxial foot, polycentric knee, MPK (since Sept 2024)'],
            ['K3', 'Variable cadence; traverses most barriers; exercise demands', 'Dynamic-response feet, MPK, hydraulic stance/swing control'],
            ['K4', 'Exceeds basic ambulation: high impact, stress, energy', 'Running/sport prostheses, highest technology components'],
          ],
          headerColor: const Color(0xFF4A148C),
        ),

        // --- K2 MPK Expansion ---
        HeaderBlock('CMS K2 Microprocessor Knee Coverage (2024)'),
        BulletCardBlock(
          title: 'K2 MPK Coverage Expansion',
          themeColor: Colors.deepPurple,
          backgroundColor: const Color(0xFF1F1A2E),
          points: [
            'September 2024: CMS extended MPK coverage to K2 beneficiaries',
            'Previously K2 patients were limited to non-microprocessor components',
            'Based on evidence that MPKs reduce fall frequency even in lower-activity patients',
            'Coverage criteria (ALL must be met):',
            '  1. Electronic/microprocessor knee indicated for functional level 2',
            '  2. Knee must have integrated stumble-recovery technology',
            '  3. Beneficiary must manage daily charging requirements',
            '  4. Beneficiary must understand and respond to error alerts',
            'L-codes: L5856 (swing+stance), L5857 (swing only), L5858 (stance only)',
          ],
        ),

        // --- K-Level Limitations ---
        HeaderBlock('K-Level System Limitations'),
        BulletCardBlock(
          title: 'Known Limitations',
          themeColor: const Color(0xFFE65100),
          backgroundColor: const Color(0xFF2A2215),
          points: [
            'NO published validity or reliability evidence',
            'Vague language and subjective assignment by clinician judgment',
            '>50% of patients classified as high-functioning (K3/K4) in clinic exhibit LOW activity in community',
            'Clinic-community discrepancy: clinic assessment frequently overestimates true function',
            'Binary coverage decisions: small K-level differences create dramatic component access differences',
            'No paired standardized assessment instrument',
            'Acceptance driven by reimbursement policy, NOT scientific evidence',
          ],
        ),
        PearlBlock(
          'Board Pearl - K-Level System',
          'K-levels determine prosthetic component eligibility and Medicare coverage. '
          'As of September 2024, MPKs are covered for K2 ambulators (previously K3/K4 only) '
          'with stumble recovery and patient ability to manage charging/alerts. The system '
          'has NO published reliability or validity, and >50% of high-functioning patients '
          'in clinic are low-functioning in the community.',
        ),

        // --- Checkpoint: K-Levels ---
        CheckpointBlock(
          question: 'A K0 patient is classified as:',
          options: ['Limited household ambulator', 'Limited community ambulator', 'Non-ambulatory — does not have ability or potential to ambulate', 'Community ambulator with variable cadence'],
          correctIndex: 2,
          explanation: 'K0 = non-ambulatory. Does not have the ability or potential to ambulate or transfer with a prosthesis. K0 patients do not qualify for a prosthetic limb under Medicare. K1 = limited household, K2 = limited community, K3 = community with variable cadence, K4 = high activity/athlete.',
        ),

        // --- Functional Prognosis ---
        HeaderBlock('Functional Prognosis by Amputation Level'),
        BulletCardBlock(
          title: 'Transtibial (Below-Knee) Prognosis',
          themeColor: const Color(0xFF2E7D32),
          backgroundColor: const Color(0xFF152A1A),
          points: [
            'Generally favorable for prosthetic ambulation',
            'Most TT amputees achieve K2-K3; traumatic TT frequently achieve K3-K4',
            'Energy expenditure: 10-25% above normal (traumatic); 20-40% (vascular)',
            'Highest return-to-work rates among LE amputees',
            'Knee preservation is the MOST CRITICAL determinant of favorable outcomes',
          ],
        ),
        BulletCardBlock(
          title: 'Transfemoral (Above-Knee) Prognosis',
          themeColor: const Color(0xFFE65100),
          backgroundColor: const Color(0xFF2A2215),
          points: [
            'Moderate prognosis; more dependent on etiology, age, comorbidities',
            'Traumatic TF: often K2-K3; Vascular TF: typically K1-K2',
            'Energy expenditure: 60-70% above normal (traumatic); 65-100% (vascular)',
            'Loss of knee eliminates major proprioception and active control source',
            'Requires mastery of prosthetic knee control for safe ambulation',
          ],
        ),
        TableBlock(
          title: 'Factors Modifying Prosthetic Prognosis',
          columns: ['Factor', 'Favorable', 'Unfavorable'],
          rows: [
            ['Etiology', 'Traumatic', 'Vascular/diabetic'],
            ['Age', 'Younger', 'Older (especially >80)'],
            ['Cognitive status', 'Intact', 'Impaired'],
            ['Motivation', 'High', 'Low/depressed'],
            ['Comorbidities', 'Few/mild', 'Multiple/severe'],
            ['Residual limb length', 'Long', 'Short'],
            ['Contralateral limb', 'Intact', 'Compromised'],
            ['Pre-amputation mobility', 'Community ambulatory', 'Non-ambulatory'],
          ],
          headerColor: const Color(0xFF283593),
        ),
        PearlBlock(
          'Board Pearl - Functional Prognosis',
          'Knee preservation is the single most important anatomical factor in '
          'prosthetic prognosis. TT consistently outperforms TF in energy expenditure, '
          'speed, functional level, and satisfaction. The combination of bilateral TF + '
          'age >45 + vascular etiology carries the POOREST prosthetic prognosis.',
        ),
      ],
    ),

    // ─────────────────────────────────────────────
    // TAB 7: Outcome Measures
    // ─────────────────────────────────────────────
    TopicTab(
      title: 'Outcome Measures',
      blocks: [
        HeaderBlock('Amputee Outcome Measures'),
        TextBlock(
          'Validated outcome measures are essential for assessing prosthetic '
          'function, predicting K-level classification, monitoring rehabilitation '
          'progress, and justifying component prescription. Both performance-based '
          'and patient-reported measures are tested on board exams.',
          isIntro: true,
        ),

        // --- AMP ---
        ComparisonCardBlock(
          title: 'Amputee Mobility Predictor (AMP)',
          themeColor: const Color(0xFF1565C0),
          backgroundColor: const Color(0xFF1A2332),
          icon: Icons.assessment,
          description: '21-item performance-based assessment of ambulatory potential. '
              'The AMPnoPRO version (without prosthesis) uniquely predicts K-level '
              'BEFORE fitting.',
          keyPoints: [
            'AMPnoPRO: administered WITHOUT prosthesis — predicts pre-prosthetic potential',
            'AMPPRO: administered WITH prosthesis — documents current function',
            'Interrater reliability: ICC = 0.99 (EXCELLENT)',
            'Intrarater reliability: ICC = 0.96-0.97',
            'Concurrent validity with 6MWT: r = 0.82 (AMPPRO)',
            'Distinguishes among ALL 4 Medicare K-levels',
            'Negatively correlates with age (r = -0.69) and comorbidity (r = -0.43)',
            'Can track functional progress during rehabilitation serially',
          ],
        ),

        // --- PLUS-M ---
        ComparisonCardBlock(
          title: 'PLUS-M (Prosthetic Limb Users Survey of Mobility)',
          themeColor: const Color(0xFF2E7D32),
          backgroundColor: const Color(0xFF152A1A),
          icon: Icons.poll,
          description: 'Self-report measure of prosthetic mobility developed using '
              'Item Response Theory (IRT). Available as 7-item, 12-item short '
              'forms, or computer adaptive testing (CAT) version.',
          keyPoints: [
            'Test-retest reliability: ICC > 0.90 (excellent)',
            'Convergent validity with PEQ-Mobility: r = 0.78',
            'Convergent validity with ABC Scale: r = 0.81',
            'Administration time: 2-3 minutes',
            'Psychometrically SUPERIOR to LCI, LCI-5, PEQ-MS, and PMQ',
            'IRT-based: precise measurement across full range of prosthetic mobility',
            'CAT version adapts items to each respondent for maximum precision',
          ],
        ),

        // --- ABC Scale ---
        ComparisonCardBlock(
          title: 'ABC Scale (Activities-Specific Balance Confidence)',
          themeColor: const Color(0xFF4527A0),
          backgroundColor: const Color(0xFF1F1A2E),
          icon: Icons.balance,
          description: '16-item self-report questionnaire rating confidence (0-100%) '
              'in maintaining balance during specific ambulatory activities.',
          keyPoints: [
            'Test-retest reliability: ICC = 0.91 (excellent)',
            'Internal consistency: Cronbach alpha = 0.95 (excellent)',
            'Concurrent validity with 2-Minute Walk Test: r = 0.72',
            'Concurrent validity with TUG: r = -0.70',
            'Scores BELOW 67% = ELEVATED FALL RISK',
            'Measures perceived balance CONFIDENCE, not actual balance ability',
            'Part of ISPO COMPASS recommended outcome measure battery',
            'Does NOT reliably discriminate by amputation level',
          ],
        ),

        // --- 6MWT ---
        ComparisonCardBlock(
          title: '6-Minute Walk Test (6MWT)',
          themeColor: const Color(0xFF00695C),
          backgroundColor: const Color(0xFF152A27),
          icon: Icons.directions_walk,
          description: 'Performance-based measure of functional walking capacity and '
              'aerobic endurance. Patient walks as far as possible over 6 minutes.',
          keyPoints: [
            'Strong correlation with AMP: r = 0.82 (AMPPRO)',
            'Correlates with oxygen consumption measures',
            'Useful for differentiating K3 vs K4 functional levels',
            'Reference values available stratified by amputation level and age',
            'Sensitive to prosthetic component changes and rehab interventions',
            'Part of COMPASS recommended outcome measure battery',
          ],
        ),

        // --- TUG ---
        ComparisonCardBlock(
          title: 'Timed Up and Go (TUG)',
          themeColor: const Color(0xFFE65100),
          backgroundColor: const Color(0xFF2A2215),
          icon: Icons.timer,
          description: 'Measures basic functional mobility: stand from chair, walk '
              '3 meters, turn, walk back, sit down. Time recorded in seconds.',
          keyPoints: [
            '<12 seconds: independent community ambulator',
            '12-20 seconds: moderate functional mobility; may need assistive device',
            '>30 seconds: dependent in most ADLs; significant fall risk',
            'Amputee-specific cutoffs: 8.17 sec = 1+ falls/year; 9.25 sec = 2+ falls/year',
            'CEILING EFFECT in higher-functioning amputees',
            'Correlates with ABC Scale: r = -0.70',
            'Quick, minimal equipment, widely available',
          ],
        ),

        // --- L-Test ---
        ComparisonCardBlock(
          title: 'L-Test',
          themeColor: const Color(0xFF6A1B9A),
          backgroundColor: const Color(0xFF2A1A2E),
          icon: Icons.turn_right,
          description: 'Modified TUG using an L-shaped path (3m + 7m with 2 '
              'directional changes). Designed to address TUG ceiling effect.',
          keyPoints: [
            'Greater walking distance provides wider measurement range',
            'Two directional changes increase task complexity',
            'Better discriminates higher-functioning patients',
            'Validated specifically for lower limb amputee population',
            'Part of ISPO COMPASS recommended outcome measure battery',
            'Useful for evaluating MPK functional impact during complex tasks',
          ],
        ),

        // --- SCS ---
        ComparisonCardBlock(
          title: 'Socket Comfort Score (SCS)',
          themeColor: Colors.grey,
          backgroundColor: const Color(0xFF232A3B),
          icon: Icons.star_rate,
          description: 'Single-item patient-reported outcome using 0-10 numeric '
              'rating scale for socket comfort.',
          keyPoints: [
            '0 = most uncomfortable; 10 = most comfortable',
            'Test-retest reliability: ICC = 0.63-0.79 (RELATIVELY POOR)',
            'Expanded version (best, worst, average): ICC = 0.77-0.88',
            'Neither version consistently reaches ICC 0.90 threshold',
            'Best used for group-level comparisons or clinical screening',
            'Despite limitations, widely used due to simplicity and face validity',
            'Responsive to socket adjustments, repair, or replacement',
          ],
        ),

        // --- Outcome Summary Table ---
        HeaderBlock('Outcome Measure Quick Reference'),
        TableBlock(
          title: 'Performance-Based Measures',
          columns: ['Measure', 'What It Assesses', 'Key Metric', 'Unique Value'],
          rows: [
            ['AMP', 'Ambulatory potential', 'Predicts K-level; 21 items', 'Pre-prosthetic prediction'],
            ['6MWT', 'Walking endurance', 'Distance in meters/6 min', 'Endurance assessment'],
            ['TUG', 'Basic functional mobility', 'Time in seconds', 'Quick screen; ceiling effect'],
            ['L-Test', 'Advanced functional mobility', 'Time (L-shaped path)', 'Addresses TUG ceiling effect'],
            ['10MWT', 'Walking speed', 'Speed in m/s', 'Differentiates K3 vs K4'],
          ],
          headerColor: const Color(0xFF1565C0),
        ),
        TableBlock(
          title: 'Patient-Reported Outcome Measures (PROMs)',
          columns: ['Measure', 'What It Assesses', 'Key Metric', 'Unique Value'],
          rows: [
            ['PLUS-M', 'Prosthetic mobility', 'T-score (IRT)', 'Superior to older scales'],
            ['ABC Scale', 'Balance confidence', '0-100%', 'Fall risk: <67% = elevated'],
            ['SCS', 'Socket comfort', '0-10 scale', 'Poor reliability (ICC 0.63-0.79)'],
            ['Houghton', 'Prosthetic use patterns', '4 items', 'Quick use screening'],
            ['PEQ', 'Prosthetic QoL', '10 scales/4 domains', 'Most comprehensive QoL'],
            ['TAPES', 'Psychosocial adaptation', '3 domains', 'Psychological adjustment'],
          ],
          headerColor: const Color(0xFF2E7D32),
        ),

        // --- COMPASS Battery ---
        BulletCardBlock(
          title: 'ISPO COMPASS Recommended Battery (2021)',
          themeColor: const Color(0xFF00838F),
          backgroundColor: const Color(0xFF152A2E),
          points: [
            'Houghton Scale',
            'PEQ-Mobility Subscale',
            'PLUS-M',
            'ABC Scale',
            'AMP',
            'CHAMP (Comprehensive High-Level Activity Mobility Predictor)',
            'FSST (Four Square Step Test)',
            'NBWT (Narrow Beam Walk Test)',
            'L-Test',
            '10-Meter Walk Test',
            '6-Minute Walk Test',
          ],
        ),
        PearlBlock(
          'Board Pearl - Outcome Measures',
          'AMP predicts K-level pre-prosthetically (ICC = 0.99). ABC Scale: '
          '<67% = elevated fall risk (ICC = 0.91). PLUS-M is psychometrically '
          'superior to LCI and PEQ-MS (ICC > 0.90). SCS has relatively POOR '
          'reliability (ICC 0.63-0.79). 6MWT and TUG are performance-based '
          'standards. L-Test addresses TUG ceiling effect.',
        ),
      ],
    ),
    TopicTab(
      title: 'Prescription Builder',
      blocks: [
        HeaderBlock('Interactive Prosthetic Prescription Builder'),
        TextBlock(
          'Select an amputation level and functional K-level to see the '
          'recommended prosthetic components. Each prescription includes socket, '
          'suspension, liner, foot, and knee (if applicable) with clinical pearls.',
        ),
        PrescriptionBuilderBlock(),
      ],
    ),
  ],
);

import 'package:flutter/material.dart';
import '../models/topic_content_model.dart';
import '../flowcharts/clinical_flowcharts.dart';

final leOrthosesContent = TopicData(
  id: 'le_orthoses',
  title: 'Lower Extremity Orthoses',
  tabs: [
    // ─────────────────────────────────────────────
    // TAB 1: AFO Types
    // ─────────────────────────────────────────────
    TopicTab(
      title: 'AFO Types',
      blocks: [
        HeaderBlock('Ankle-Foot Orthoses (AFOs)'),
        TextBlock(
          'AFOs are the most commonly prescribed lower extremity orthoses. They span '
          'the ankle joint and extend from below the knee to the foot. AFO selection '
          'depends on the specific motion to be controlled, the presence of '
          'mediolateral instability, muscle tone, and the patient\'s functional goals. '
          'Understanding the biomechanical differences between AFO types is '
          'EXTREMELY HIGH-YIELD for board examinations.',
          isIntro: true,
        ),

        AnnotatedImageBlock(
          title: 'AFO Types: Biomechanical Comparison',
          diagramType: 'afo-types',
          hotspots: [
            HotspotData(id: 'solid', xPercent: 0.125, yPercent: 0.5, label: 'Solid AFO', description: 'Controls dorsiflexion AND plantarflexion. Blocks all ankle motion. Provides maximum stability.', clinicalSignificance: 'Indicated for severe spasticity, flaccid ankle, or when complete ankle control is needed. Contraindicated if patient has adequate ankle strength.', pinColor: Color(0xFF0D9488)),
            HotspotData(id: 'pls', xPercent: 0.375, yPercent: 0.5, label: 'Posterior Leaf Spring', description: 'Thin, flexible posterior strut. Allows controlled plantarflexion at initial contact and assists dorsiflexion in swing via elastic recoil. Lighter and more cosmetic than a solid AFO.', clinicalSignificance: 'Best for pure foot drop (peroneal nerve palsy) with intact ankle plantarflexors. NOT for spasticity or mediolateral instability.', pinColor: Color(0xFF3B82F6)),
            HotspotData(id: 'artic', xPercent: 0.625, yPercent: 0.5, label: 'Articulated AFO', description: 'Has an ankle joint allowing dorsiflexion. Plantarflexion stop prevents foot drop. Most versatile AFO.', clinicalSignificance: 'Best for patients who need foot drop control but benefit from free dorsiflexion (e.g., stroke with mild-moderate spasticity). Selected on the basis of needing foot-drop control combined with preserved dorsiflexion; no specific quadriceps requirement.', pinColor: Color(0xFF8B5CF6)),
            HotspotData(id: 'fro', xPercent: 0.875, yPercent: 0.5, label: 'Floor Reaction (FRO/GRAFO)', description: 'Anterior shell creates knee extension moment via ground reaction force. Requires ankle to be blocked in slight plantarflexion.', clinicalSignificance: 'FRO = Floor Reaction = Knee EXTENSION. Indicated for crouch gait (CP, myelomeningocele). Requires intact quads. Contraindicated in recurvatum.', pinColor: Color(0xFFFF9800)),
          ],
          aspectRatio: 1.5,
        ),

        // --- Solid AFO ---
        ComparisonCardBlock(
          title: 'Solid AFO (Rigid AFO)',
          themeColor: Colors.blue,
          backgroundColor: const Color(0xFF1A2332),
          icon: Icons.shield,
          description:
              'A rigid plastic AFO that completely blocks all ankle motion in all planes. '
              'Provides maximum control of plantarflexion, dorsiflexion, and '
              'mediolateral instability. The posterior trim line is wide and extends '
              'anterior to the malleoli.',
          keyPoints: [
            'Controls ALL ankle motion: PF, DF, inversion, eversion',
            'Indicated for severe spasticity (tone overwhelming flexible orthoses)',
            'Indicated for flaccid foot drop WITH mediolateral instability',
            'Indicated for significant ankle/subtalar instability',
            'LIMITS push-off power at terminal stance (restricts PF at toe-off)',
            'Wider posterior trim lines = more rigidity and control',
            'May increase energy expenditure due to loss of ankle motion',
            'Can be trimmed or modified but NOT as adjustable as metal uprights',
          ],
        ),

        // --- PLS ---
        ComparisonCardBlock(
          title: 'Posterior Leaf Spring (PLS)',
          themeColor: Colors.green,
          backgroundColor: const Color(0xFF152A1A),
          icon: Icons.eco,
          description:
              'A thin, narrow posterior strut AFO that flexes to allow plantarflexion '
              'and provides passive dorsiflexion assist in swing phase via elastic '
              'recoil. The narrow trim line behind the ankle is the key design feature.',
          keyPoints: [
            'Thin narrow posterior strut provides flexibility',
            'Allows plantarflexion at heel strike (controlled descent)',
            'Assists dorsiflexion during swing phase via elastic recoil',
            'Indicated for MILD foot drop WITHOUT mediolateral instability',
            'Does NOT control varus or valgus (no ML control)',
            'Does NOT control moderate-to-severe spasticity',
            'Narrower trim lines = more flexibility, less control',
            'Lighter and more cosmetic than solid AFO',
          ],
        ),
        PearlBlock(
          'Board Pearl: PLS vs Solid AFO',
          'PLS for foot drop WITHOUT ML instability; Solid AFO for foot drop WITH '
          'ML instability. This distinction is one of the most tested concepts in '
          'orthotic board questions. If the question mentions varus/valgus or ML '
          'instability, the answer is NOT a PLS.',
        ),

        // --- Articulated AFO ---
        ComparisonCardBlock(
          title: 'Articulated AFO (Hinged AFO)',
          themeColor: Colors.orange,
          backgroundColor: const Color(0xFF2A2215),
          icon: Icons.compare_arrows,
          description:
              'An AFO with a mechanical ankle joint that allows dorsiflexion while '
              'controlling plantarflexion. Adjustable stops can be added to limit '
              'motion in either direction. Provides a more physiologic gait pattern '
              'than a solid AFO.',
          keyPoints: [
            'Mechanical ankle joint allows adjustable range of motion',
            'PF STOP (anterior stop): prevents foot drop in swing phase',
            'DF STOP (posterior stop): prevents excessive tibial advancement',
            'Allows free dorsiflexion for more normal gait pattern',
            'Better push-off than solid AFO (allows some PF at toe-off)',
            'Can add dorsiflexion assist (spring) for foot drop',
            'PF stop prevents foot slap at initial contact',
            'Indicated for foot drop when DF is desired but PF needs control',
            'More complex and heavier than non-articulated designs',
          ],
        ),

        // --- Floor Reaction Orthosis ---
        ComparisonCardBlock(
          title: 'Floor Reaction Orthosis (FRO / Ground Reaction AFO)',
          themeColor: Colors.red,
          backgroundColor: const Color(0xFF2A1519),
          icon: Icons.arrow_upward,
          description:
              'A solid AFO with an ANTERIOR SHELL (anterior tibial section) that '
              'creates a knee EXTENSION moment by keeping the ground reaction force '
              'vector anterior to the knee joint axis. Blocks ankle dorsiflexion '
              'so that when the tibia tries to advance, the GRF is redirected '
              'to extend the knee.',
          keyPoints: [
            'Solid anterior shell is the defining feature',
            'Creates knee EXTENSION moment via GRF anterior to knee axis',
            'Blocks ankle dorsiflexion to prevent tibial advancement',
            'REQUIRES INTACT QUADRICEPS for effective knee extension',
            'Indicated for crouch gait (excessive knee flexion in stance)',
            'Common diagnoses: cerebral palsy (CP), myelomeningocele',
            'CONTRAINDICATED in knee recurvatum (would worsen hyperextension)',
            'Patient must have adequate hip extension to be effective',
            'Also called Ground Reaction AFO (GRAFO)',
          ],
        ),
        PearlBlock(
          'Board Pearl: FRO Key Points',
          'FRO REQUIRES intact quads and creates a knee EXTENSION moment. '
          'It is CONTRAINDICATED in knee recurvatum (genu recurvatum). '
          'If a question describes crouch gait with intact quads, the answer '
          'is FRO. If the question describes knee hyperextension, FRO is WRONG.',
        ),
        CustomWidgetBlock(CustomWidgetType.froBiomechanicsDemo),

        // --- Metal Double Upright AFO ---
        ComparisonCardBlock(
          title: 'Metal Double Upright AFO',
          themeColor: Colors.blueGrey,
          backgroundColor: const Color(0xFF1E2530),
          icon: Icons.construction,
          description:
              'A traditional metal AFO with medial and lateral metal uprights '
              'attached to a shoe (stirrup). Ankle joints can be adjusted with '
              'stops, springs, or assists. More adjustable than plastic AFOs.',
          keyPoints: [
            'Medial and lateral metal uprights attached to the shoe via stirrup',
            'Adjustable ankle joints: can add PF stop, DF stop, or assists',
            'Heavier than plastic AFOs but more durable',
            'Can accommodate fluctuating edema (not total contact)',
            'Better for patients with insensate skin (not in full contact)',
            'Klenzak ankle joint: spring-loaded dorsiflexion assist with PF stop',
            'Indicated when adjustability is paramount or skin cannot tolerate plastic',
          ],
        ),

        // --- AFO Comparison Table ---
        TableBlock(
          title: 'AFO Types Comparison',
          columns: ['AFO Type', 'Motion Controlled', 'Indication', 'Contraindication', 'Key Effect'],
          rows: [
            ['Solid AFO', 'All ankle motion (PF, DF, ML)', 'Severe spasticity, foot drop WITH ML instability', 'When ankle motion is needed', 'Maximum ankle control'],
            ['PLS', 'Assists DF, allows PF', 'Mild foot drop WITHOUT ML instability', 'Varus/valgus instability, spasticity', 'Swing phase DF assist'],
            ['Articulated AFO', 'PF (adjustable), allows DF', 'Foot drop needing adjustable control', 'Severe ML instability without stabilization', 'Allows DF, blocks PF'],
            ['FRO (GRAFO)', 'DF blocked, creates knee extension', 'Crouch gait (CP, MMC)', 'Knee recurvatum', 'Knee extension via GRF'],
            ['Metal Double Upright', 'Adjustable (PF/DF stops, assists)', 'Fluctuating edema, insensate skin', 'When lightweight design needed', 'Maximum adjustability'],
          ],
          headerColor: const Color(0xFF1565C0),
        ),

        MnemonicBlock(
          'AFO Selection Checklist',
          'Ask: (1) Is there foot drop? (2) Is there ML instability? (3) Is there '
          'spasticity? (4) Is there crouch gait or recurvatum? '
          'Foot drop + no ML instability = PLS. '
          'Foot drop + ML instability = Solid AFO. '
          'Crouch gait + intact quads = FRO. '
          'Recurvatum = avoid FRO.',
        ),

        // --- AFO Selection by Diagnosis ---
        HeaderBlock('AFO Selection by Diagnosis'),
        BulletCardBlock(
          title: 'Stroke AFO Selection',
          themeColor: Colors.indigo,
          backgroundColor: const Color(0xFF1A1D2E),
          points: [
            'AFOs improve walking speed, cadence, step length, stride length, TUG, and FAC in stroke',
            'Also improve Berg Balance Scale, 6MWT, and Timed Up-Stairs',
            'AFOs reduce energy cost of walking in stroke patients',
            'Flaccid foot drop without ML instability: PLS or articulated AFO with PF stop',
            'Spastic foot drop with varus: solid AFO or articulated with ML control',
            'Severe spasticity overwhelming flexible designs: solid AFO',
            'Knee recurvatum: avoid FRO; consider solid AFO set in 5 deg PF to create knee flexion moment',
          ],
        ),
        BulletCardBlock(
          title: 'Foot Drop (Peroneal Nerve Palsy)',
          themeColor: Colors.green,
          backgroundColor: const Color(0xFF152A1A),
          points: [
            'Isolated peroneal nerve palsy = most common indication for PLS AFO',
            'PLS provides swing-phase DF assist via elastic recoil',
            'Foot drop WITH significant subtalar instability: hinged AFO with double-action ankle joints',
            'PLS is WRONG if ML instability is present',
          ],
        ),
        PearlBlock(
          'Board Pearl: AFO by Diagnosis',
          'For stroke with knee recurvatum, set solid AFO in slight (5 deg) plantarflexion '
          'to create a knee FLEXION moment at loading response. This is the OPPOSITE of '
          'FRO strategy. FRO creates extension moment (for crouch); slight PF creates '
          'flexion moment (for recurvatum).',
        ),
        CheckpointBlock(
          question: 'A patient with stroke presents with foot drop and mild spasticity but adequate quadriceps strength. Which AFO is MOST appropriate?',
          options: ['Solid AFO', 'Posterior leaf spring (PLS)', 'Articulated AFO with plantarflexion stop', 'Floor reaction orthosis (FRO)'],
          correctIndex: 2,
          explanation: 'An articulated AFO with plantarflexion stop is ideal: it prevents foot drop (plantarflexion stop), allows free dorsiflexion for tibial advancement in stance, and is appropriate for mild spasticity. PLS lacks the stability for spasticity. Solid AFO is excessive. FRO is for crouch gait, not foot drop.',
        ),
        VideoBlock(
          url: 'https://www.youtube.com/watch?v=OJRsMOJ_U3I',
          title: 'AFO Types: Solid vs Articulated vs PLS',
          description: 'Compare solid AFO (blocks all ankle motion), articulated AFO (allows dorsiflexion, blocks plantarflexion), and PLS (posterior leaf spring — flexible, allows some plantarflexion). Selection depends on spasticity and ankle control.',
        ),
        VideoBlock(
          url: 'https://www.youtube.com/watch?v=xHttY-gyORQ',
          title: 'Foot Drop: Walking With vs Without AFO',
          description: 'Dramatic before/after comparison of gait with foot drop. Without AFO: steppage gait with foot slap. With AFO: normalized heel-toe progression and improved clearance.',
        ),
        afoSelectionFlowchart,
        CaseScenarioBlock(
          title: 'AFO Selection for Stroke Patient',
          vignette: 'A 58-year-old female, 3 months post-right MCA stroke, presents with left hemiparesis. She has foot drop, mild spasticity (Modified Ashworth 1+), adequate but weak quadriceps (4-/5), and knee recurvatum tendency during midstance.',
          decisionPoints: [
            CaseDecisionPoint(
              prompt: 'Given her foot drop and mild spasticity, which AFO type would you initially consider?',
              options: ['Posterior leaf spring', 'Solid AFO', 'Articulated AFO with plantarflexion stop', 'No AFO — use FES instead'],
              optimalIndex: 2,
              explanation: 'Articulated AFO with plantarflexion stop addresses foot drop while allowing free dorsiflexion. PLS is inappropriate for spasticity. Solid AFO would restrict beneficial ankle motion.',
            ),
            CaseDecisionPoint(
              prompt: 'However, you note she has knee recurvatum during midstance. How does this change your AFO prescription?',
              options: ['Switch to solid AFO', 'Add dorsiflexion stop to the articulated AFO', 'Switch to FRO/GRAFO', 'Add a plantarflexion assist spring'],
              optimalIndex: 1,
              explanation: 'Adding a dorsiflexion stop (typically set at 5-10 degrees) prevents the tibia from advancing too far forward, which controls recurvatum. This maintains the benefit of the articulated design while addressing the knee hyperextension.',
            ),
          ],
          summaryPearl: 'AFO selection is iterative: start with the least restrictive option that addresses the primary deficit. Recurvatum requires limiting dorsiflexion — set the dorsiflexion stop at 5-10 degrees. Always reassess as the patient recovers.',
        ),
      ],
    ),

    // ─────────────────────────────────────────────
    // TAB 2: KAFO & HKAFO
    // ─────────────────────────────────────────────
    TopicTab(
      title: 'KAFO & HKAFO',
      blocks: [
        HeaderBlock('Knee-Ankle-Foot Orthoses'),
        TextBlock(
          'KAFOs extend from below the hip to the foot, spanning the knee and ankle. '
          'They are indicated when knee control is needed in addition to ankle/foot '
          'control. The knee joint mechanism determines the level of control, energy '
          'expenditure, and functional capabilities.',
          isIntro: true,
        ),

        // --- Drop-Lock KAFO ---
        ComparisonCardBlock(
          title: 'Drop-Lock KAFO (Ring Lock)',
          themeColor: Colors.indigo,
          backgroundColor: const Color(0xFF1A1D2E),
          icon: Icons.lock,
          description:
              'The most common KAFO knee joint. A metal ring drops over the knee '
              'joint axis to lock the knee in full extension during stance and gait. '
              'Must be manually unlocked by pulling the ring upward to sit.',
          keyPoints: [
            'Locks knee in FULL EXTENSION for stance stability',
            'Manual unlock required to sit (pull ring up)',
            'Simple, reliable, low maintenance',
            'Gait pattern: circumducting or hip-hiking to clear the locked limb',
            'Increased energy expenditure due to stiff-knee gait',
            'Most commonly prescribed KAFO knee joint',
            'Can be bilateral but very energy-demanding',
          ],
        ),

        // --- Offset Knee Joint ---
        ComparisonCardBlock(
          title: 'Offset Knee Joint',
          themeColor: Colors.teal,
          backgroundColor: const Color(0xFF152A27),
          icon: Icons.adjust,
          description:
              'The knee joint axis is positioned POSTERIOR to the weight-bearing '
              'line. This creates an automatic extension moment during stance, '
              'making the knee self-stabilizing without a manual lock.',
          keyPoints: [
            'Knee axis positioned POSTERIOR to the weight-bearing line',
            'Auto-locks in extension during stance via gravitational moment',
            'No manual lock needed for stance stability',
            'Patient must fully extend knee to engage stability',
            'More cosmetic and natural gait than ring-lock',
            'Indicated for patients with quadriceps weakness (grade 3/5)',
            'Less stable than ring-lock in patients with severe weakness',
          ],
        ),

        // --- Stance Control KAFO ---
        ComparisonCardBlock(
          title: 'Stance Control KAFO (SCO)',
          themeColor: Colors.purple,
          backgroundColor: const Color(0xFF2A1A2E),
          icon: Icons.sync_alt,
          description:
              'An advanced KAFO that allows FREE knee motion in swing phase '
              'but LOCKS the knee in stance phase. Uses a sensor or mechanical '
              'mechanism to detect stance vs swing transitions.',
          keyPoints: [
            'Allows free knee flexion/extension during SWING phase',
            'Locks knee during STANCE phase to prevent buckling',
            'More physiologic gait pattern than locked-knee designs',
            'Lower energy expenditure than ring-lock KAFO',
            'Electronic (sensor-based) or mechanical trigger mechanisms',
            'More expensive and complex than traditional KAFOs',
            'Better cosmesis and function than standard locked KAFO',
            'Examples: Horton Stance Control, Otto Bock E-MAG Active',
          ],
        ),

        // --- C-Brace ---
        ComparisonCardBlock(
          title: 'C-Brace (Microprocessor-Controlled KAFO)',
          themeColor: Colors.red,
          backgroundColor: const Color(0xFF2A1519),
          icon: Icons.memory,
          description:
              'The C-Brace (Ottobock) is a microprocessor-controlled stance-control KAFO '
              'that provides real-time knee resistance adjustment throughout the gait cycle. '
              'It represents the most advanced KAFO technology currently available.',
          keyPoints: [
            'Microprocessor sensors monitor knee angle, velocity, and loading continuously',
            'Controlled knee flexion during weight bearing (ramp and stair descent)',
            'Dynamic swing-phase control adjusts to walking speed',
            'Stumble recovery technology detects fall-like movements',
            'RCT (n=102): BBS improved 3.3 points vs conventional KAFO',
            'Mean falls reduced from 4.0 to 1.1 per assessment period',
            'Falls comparison: MPO=5 vs stance-control=38 vs locked KAFO=15',
            'Key differentiator: controlled flexion during weight bearing',
          ],
        ),
        PearlBlock(
          'Board Pearl: C-Brace Falls Data',
          'The C-Brace dramatically reduces falls compared to other KAFOs. In trials, '
          'MPO had only 5 falls vs 38 with stance-control and 15 with locked KAFO. The '
          'ability to provide controlled flexion during weight bearing (for ramp/stair '
          'descent) is what differentiates it from mechanical stance-control designs.',
        ),

        // --- HKAFO ---
        HeaderBlock('Hip-Knee-Ankle-Foot Orthosis (HKAFO)'),
        TextBlock(
          'HKAFOs add a hip joint and pelvic band to a KAFO, providing control '
          'across the hip, knee, and ankle. They are indicated for patients with '
          'paraplegia who lack hip musculature in addition to knee and ankle control.',
        ),
        BulletCardBlock(
          title: 'HKAFO Indications and Features',
          themeColor: Colors.deepOrange,
          backgroundColor: const Color(0xFF2A1D19),
          points: [
            'Adds hip joint and pelvic band to KAFO',
            'Indicated for paraplegia (thoracic or high lumbar spinal cord injury)',
            'Hip joint can be free, locked, or have motion stops',
            'High energy cost limits functional ambulation',
            'Many patients use HKAFO for therapeutic standing only',
            'Bilateral HKAFOs require upper extremity strength for ambulation',
          ],
        ),

        // --- RGO ---
        ComparisonCardBlock(
          title: 'Reciprocating Gait Orthosis (RGO)',
          themeColor: Colors.deepPurple,
          backgroundColor: const Color(0xFF1F1A2E),
          icon: Icons.swap_horiz,
          description:
              'A bilateral HKAFO with cable-linked hip joints. When one hip extends, '
              'the cable drives the contralateral hip into flexion, creating a '
              'reciprocal gait pattern. Designed for thoracic-level paraplegia.',
          keyPoints: [
            'Cable-linked bilateral hip joints provide reciprocal gait',
            'Hip EXTENSION on one side drives hip FLEXION on the other',
            'Creates a more physiologic reciprocal walking pattern',
            'Designed for thoracic-level paraplegia (T6-T12)',
            'Requires strong upper extremities and trunk control',
            'Still very high energy expenditure (200-500% above normal)',
            'Better gait pattern than standard HKAFO swing-to/swing-through',
            'Isocentric RGO: uses a central pivot instead of cables',
          ],
        ),

        // --- Standing Frames ---
        HeaderBlock('Standing Devices'),
        BulletCardBlock(
          title: 'Standing Frames and Walkers',
          themeColor: Colors.brown,
          backgroundColor: const Color(0xFF2A2522),
          points: [
            'Parapodium: static standing frame, allows hands-free standing',
            'Swivel walker: standing frame with swivel base plates for ambulation',
            'Standing frames provide bone loading, pressure relief, bowel/bladder benefits',
            'Typically used for pediatric patients with myelomeningocele or SCI',
            'Do not provide independent functional ambulation',
            'Psychological and physiologic benefits of upright posture',
          ],
        ),

        PearlBlock(
          'Board Pearl: Energy Expenditure',
          'Energy expenditure increases dramatically with higher orthotic levels: '
          'AFO < KAFO < HKAFO/RGO. Many patients with thoracic SCI abandon HKAFOs '
          'for wheelchair mobility due to excessive energy cost. Functional community '
          'ambulation with bilateral KAFOs is rare above L3 level.',
        ),
      ],
    ),

    // ─────────────────────────────────────────────
    // TAB 3: Shoe Modifications
    // ─────────────────────────────────────────────
    TopicTab(
      title: 'Shoe Modifications',
      blocks: [
        HeaderBlock('Shoe Modifications'),
        TextBlock(
          'Shoe modifications are external or internal alterations to footwear '
          'that address biomechanical abnormalities of the foot and ankle. They '
          'are among the simplest and most cost-effective orthotic interventions. '
          'Understanding the specific indication for each modification is high-yield.',
          isIntro: true,
        ),

        // --- Rocker Bottom ---
        ComparisonCardBlock(
          title: 'Rocker Bottom Sole',
          themeColor: Colors.brown,
          backgroundColor: const Color(0xFF2A2522),
          icon: Icons.skateboarding,
          description:
              'A rigid convex sole that allows the foot to roll over the apex '
              'during stance phase, reducing the need for ankle dorsiflexion and '
              'MTP extension during terminal stance and pre-swing.',
          keyPoints: [
            'Rigid convex sole facilitates rollover without ankle/MTP motion',
            'Reduces stress at the ankle and metatarsophalangeal joints',
            'Indicated for hallux rigidus (limited MTP extension)',
            'Indicated for metatarsalgia (reduces pressure under met heads)',
            'Indicated for diabetic neuropathy (reduces shear forces)',
            'Indicated for arthrodesis or limited ankle ROM',
            'Apex placement determines where rollover occurs',
            'Studies show 35-65% pressure reduction under heel and central met heads vs conventional shoes',
            'Combined with total contact insert: mean peak plantar pressure reduction ~50%',
          ],
        ),

        // --- Metatarsal Bar and Pad ---
        HeaderBlock('Metatarsal Pressure Redistribution'),
        BulletCardBlock(
          title: 'Metatarsal Bar (External)',
          themeColor: Colors.teal,
          backgroundColor: const Color(0xFF152A27),
          points: [
            'External bar applied to the sole PROXIMAL to metatarsal heads',
            'Transfers weight-bearing proximal to met heads',
            'Reduces pressure directly under metatarsal heads',
            'Indicated for metatarsalgia and met head pain',
            'Placed just proximal to met heads (NOT on them)',
          ],
        ),
        BulletCardBlock(
          title: 'Metatarsal Pad (Internal)',
          themeColor: Colors.green,
          backgroundColor: const Color(0xFF152A1A),
          points: [
            'Internal pad placed INSIDE the shoe proximal to met heads',
            'Supports the transverse metatarsal arch',
            'Redistributes pressure away from met heads',
            'More cosmetic than external metatarsal bar',
            'Must be placed PROXIMAL to met heads to be effective',
            'Placement error (directly under met heads) INCREASES pain',
          ],
        ),

        // --- Heel Modifications ---
        HeaderBlock('Heel Modifications'),
        ComparisonCardBlock(
          title: 'Thomas Heel',
          themeColor: Colors.indigo,
          backgroundColor: const Color(0xFF1A1D2E),
          icon: Icons.expand,
          description:
              'A heel with a MEDIAL extension (the heel extends anteriorly on the '
              'medial side). Supports the medial longitudinal arch and prevents '
              'excessive pronation.',
          keyPoints: [
            'Medial heel extension (anteromedial flare)',
            'Supports the medial longitudinal arch',
            'Indicated for pes planus (flat foot) and excessive pronation',
            'Prevents calcaneal eversion and midfoot collapse',
          ],
        ),
        ComparisonCardBlock(
          title: 'Reverse Thomas Heel',
          themeColor: Colors.amber,
          backgroundColor: const Color(0xFF2A2515),
          icon: Icons.compare,
          description:
              'A heel with a LATERAL extension (the heel extends anteriorly on the '
              'lateral side). Supports the lateral border and counters excessive '
              'supination.',
          keyPoints: [
            'Lateral heel extension (anterolateral flare)',
            'Supports the lateral longitudinal arch',
            'Indicated for pes cavus (high arch) and excessive supination',
            'Prevents calcaneal inversion',
          ],
        ),

        // --- Other Shoe Mods ---
        HeaderBlock('Additional Shoe Modifications'),
        BulletCardBlock(
          title: 'SACH Heel (Solid Ankle Cushion Heel)',
          themeColor: Colors.blue,
          backgroundColor: const Color(0xFF1A2332),
          points: [
            'Compressible wedge heel cushion',
            'Simulates plantarflexion at initial contact (heel strike)',
            'Absorbs shock and provides smooth heel-to-forefoot transition',
            'Used in both shoes and prosthetic feet',
          ],
        ),
        BulletCardBlock(
          title: 'Heel Lift / Sole Lift',
          themeColor: Colors.orange,
          backgroundColor: const Color(0xFF2A2215),
          points: [
            'Used for limb length discrepancy (LLD) compensation',
            'Internal heel lift: up to 1/4 inch (6 mm) inside shoe',
            'External sole lift: for larger LLD corrections (> 1/4 inch)',
            'Full sole lift preferred over heel lift alone for larger corrections',
            'Typically correct ~50-75% of measured LLD',
          ],
        ),
        BulletCardBlock(
          title: 'Heel Wedges',
          themeColor: Colors.deepOrange,
          backgroundColor: const Color(0xFF2A1D19),
          points: [
            'MEDIAL heel wedge: tilts heel into eversion, corrects pronation',
            'MEDIAL wedge: also effective for plantar fasciitis treatment',
            'LATERAL heel wedge: tilts heel into inversion, corrects supination',
            'Can be placed internally or externally',
            'Used for calcaneal alignment correction',
            'LATERAL wedge for medial knee OA: does NOT reduce pain per meta-analysis',
            'Lateral wedges decrease peak external knee adduction moment biomechanically',
            'But biomechanical change does NOT translate into clinical pain benefit',
            'Current evidence does NOT support lateral wedges for medial knee OA',
          ],
        ),
        PearlBlock(
          'Board Pearl: Lateral Wedge Evidence',
          'Meta-analysis found NO significant pain reduction from lateral wedge insoles '
          'for medial compartment knee OA compared to neutral insoles. Although lateral '
          'wedges do decrease the knee adduction moment biomechanically, this does NOT '
          'translate into clinical benefit. Current evidence does NOT support lateral '
          'wedges for medial knee OA.',
        ),
        BulletCardBlock(
          title: 'Steel Shank',
          themeColor: Colors.blueGrey,
          backgroundColor: const Color(0xFF1E2530),
          points: [
            'Metal reinforcement placed within the sole of the shoe',
            'Stiffens the sole and limits MTP joint motion',
            'Indicated for hallux rigidus (limits painful MTP extension)',
            'Also used for midfoot arthritis or Charcot foot',
            'Often combined with rocker bottom for best effect',
          ],
        ),

        TableBlock(
          title: 'Shoe Modifications Summary',
          columns: ['Modification', 'Location', 'Indication'],
          rows: [
            ['Rocker bottom', 'External sole', 'Hallux rigidus, metatarsalgia, DM neuropathy'],
            ['Metatarsal bar', 'External sole (proximal to met heads)', 'Metatarsalgia'],
            ['Metatarsal pad', 'Internal (proximal to met heads)', 'Metatarsalgia, transverse arch support'],
            ['Thomas heel', 'Medial heel extension', 'Pes planus, pronation'],
            ['Reverse Thomas', 'Lateral heel extension', 'Pes cavus, supination'],
            ['SACH heel', 'Compressible heel cushion', 'Shock absorption, simulates PF'],
            ['Heel/sole lift', 'Internal or external', 'Limb length discrepancy'],
            ['Medial wedge', 'Medial heel', 'Pronation correction'],
            ['Lateral wedge', 'Lateral heel', 'Supination correction'],
            ['Steel shank', 'Within sole', 'Hallux rigidus, limits MTP motion'],
          ],
          headerColor: const Color(0xFF4E342E),
        ),
        CheckpointBlock(
          question: 'A rocker bottom sole modification primarily achieves which biomechanical effect?',
          options: ['Increases ankle dorsiflexion range', 'Substitutes for lost forefoot motion during terminal stance', 'Increases mediolateral stability', 'Reduces heel strike impact'],
          correctIndex: 1,
          explanation: 'A rocker bottom sole substitutes for lost forefoot rocker mechanism, allowing smooth rollover during terminal stance without requiring toe dorsiflexion. This reduces plantar pressure by 35-65% and is critical for patients with rigid ankles (solid AFO users, fused ankles, Charcot foot).',
        ),
      ],
    ),

    // ─────────────────────────────────────────────
    // TAB 4: Foot Orthoses
    // ─────────────────────────────────────────────
    TopicTab(
      title: 'Foot Orthoses',
      blocks: [
        HeaderBlock('Foot Orthoses (FOs)'),
        TextBlock(
          'Foot orthoses are in-shoe devices that control foot alignment, '
          'redistribute plantar pressures, and accommodate foot deformities. '
          'They range from simple prefabricated arch supports to custom-molded '
          'total contact insoles.',
          isIntro: true,
        ),

        // --- UCBL ---
        ComparisonCardBlock(
          title: 'UCBL (University of California Biomechanics Laboratory)',
          themeColor: Colors.blue,
          backgroundColor: const Color(0xFF1A2332),
          icon: Icons.back_hand,
          description:
              'A rigid custom-molded foot orthosis with a deep heel cup and high '
              'medial and lateral flanges that grip the calcaneus. Controls '
              'hindfoot valgus and varus by stabilizing the subtalar joint.',
          keyPoints: [
            'Rigid plastic construction (thermoformed)',
            'Deep heel cup is the defining feature',
            'High medial and lateral flanges grip the calcaneus',
            'Controls hindfoot valgus (calcaneal eversion)',
            'Controls hindfoot varus (calcaneal inversion)',
            'Indicated for FLEXIBLE flatfoot (pes planovalgus)',
            'Does NOT control forefoot deformities',
            'Must be flexible/correctable deformity (rigid flatfoot will not respond)',
            'Custom-molded from a non-weight-bearing cast',
          ],
        ),
        PearlBlock(
          'Board Pearl: UCBL',
          'The UCBL controls HINDFOOT alignment but does NOT control the FOREFOOT. '
          'It is indicated for FLEXIBLE flatfoot only. If the deformity is rigid '
          '(fixed), the UCBL will not correct it and an accommodative orthosis '
          'is needed instead.',
        ),

        // --- Custom Molded Insoles ---
        ComparisonCardBlock(
          title: 'Custom Molded Total Contact Insoles',
          themeColor: Colors.teal,
          backgroundColor: const Color(0xFF152A27),
          icon: Icons.layers,
          description:
              'Custom-fabricated insoles that conform to the exact contours of the '
              'plantar surface, maximizing the weight-bearing area to minimize '
              'focal pressure points. The gold standard for diabetic foot care.',
          keyPoints: [
            'Total contact design maximizes weight-bearing surface area',
            'Reduces peak plantar pressures at high-risk areas',
            'Indicated for diabetic neuropathy and insensate feet',
            'Prevents diabetic foot ulceration by pressure redistribution',
            'Multi-layered construction: firm base with soft top layer',
            'Must be used with extra-depth shoes to accommodate thickness',
            'Accommodative (does not correct deformity, only accommodates)',
            'Requires regular replacement as materials compress over time',
          ],
        ),

        // --- Other FOs ---
        HeaderBlock('Other Foot Orthotic Components'),
        BulletCardBlock(
          title: 'Arch Supports',
          themeColor: Colors.green,
          backgroundColor: const Color(0xFF152A1A),
          points: [
            'Medial longitudinal arch support: most common, for pes planus',
            'Prefabricated (OTC) vs custom-molded',
            'Provides support but less control than UCBL',
            'Often combined with posting (medial or lateral wedging)',
            'Scaphoid pad: placed under the navicular to support the medial arch',
          ],
        ),
        BulletCardBlock(
          title: 'Metatarsal Pads and Bars (In-Shoe)',
          themeColor: Colors.orange,
          backgroundColor: const Color(0xFF2A2215),
          points: [
            'Metatarsal pad: dome-shaped pad proximal to met heads',
            'Supports transverse metatarsal arch',
            'Redistributes pressure from met heads to met shafts',
            'Must be placed PROXIMAL to (behind) met heads',
            'Indicated for metatarsalgia, Morton neuroma, claw toes',
          ],
        ),

        // --- FO Classification ---
        HeaderBlock('Foot Orthosis Classification'),
        BulletCardBlock(
          title: 'Accommodative vs Corrective Orthoses',
          themeColor: Colors.purple,
          backgroundColor: const Color(0xFF2A1A2E),
          points: [
            'ACCOMMODATIVE: soft, conforms to foot, redistributes pressure',
            'Accommodative: for fixed (rigid) deformities, insensate feet, DM',
            'CORRECTIVE (Functional): rigid, realigns foot/ankle biomechanics',
            'Corrective: for flexible (reducible) deformities',
            'UCBL = corrective orthosis for flexible flatfoot',
            'Total contact insole = accommodative orthosis for DM neuropathy',
          ],
        ),

        TableBlock(
          title: 'Foot Orthoses Summary',
          columns: ['Orthosis', 'Type', 'Indication', 'Key Feature'],
          rows: [
            ['UCBL', 'Corrective (rigid)', 'Flexible flatfoot', 'Deep heel cup, controls hindfoot'],
            ['Total contact insole', 'Accommodative (soft)', 'DM neuropathy', 'Pressure redistribution'],
            ['Arch support', 'Corrective or supportive', 'Pes planus, arch pain', 'Medial longitudinal support'],
            ['Metatarsal pad', 'Accommodative', 'Metatarsalgia, Morton neuroma', 'Proximal to met heads'],
            ['Scaphoid pad', 'Supportive', 'Pes planus', 'Under navicular bone'],
          ],
          headerColor: const Color(0xFF1565C0),
        ),

        PearlBlock(
          'Board Pearl: Accommodative vs Corrective',
          'Accommodative orthoses are for RIGID/FIXED deformities and insensate '
          'feet (cannot correct, only accommodate). Corrective orthoses are for '
          'FLEXIBLE deformities that can be realigned. If a question describes '
          'diabetic neuropathy, the answer is accommodative total contact insole.',
        ),
      ],
    ),
  ],
);

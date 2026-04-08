import 'package:flutter/material.dart';
import '../models/topic_content_model.dart';

final ueOrthosesContent = TopicData(
  id: 'ue_orthoses',
  title: 'Upper Extremity Orthoses',
  tabs: [
    // ─────────────────────────────────────────────
    // TAB 1: Wrist-Hand Orthoses
    // ─────────────────────────────────────────────
    TopicTab(
      title: 'Wrist-Hand Orthoses',
      blocks: [
        HeaderBlock('Wrist-Hand Orthoses (WHOs)'),
        TextBlock(
          'Wrist-hand orthoses are among the most commonly prescribed upper '
          'extremity orthoses. They range from simple static splints for '
          'immobilization to complex dynamic devices for mobilization and '
          'functional enhancement. Understanding static vs dynamic principles '
          'and specific splint indications is essential for board exams.',
          isIntro: true,
        ),

        // --- Static vs Dynamic ---
        HeaderBlock('Static vs Dynamic Splinting'),
        BulletCardBlock(
          title: 'Static Splinting Principles',
          themeColor: Colors.blue,
          backgroundColor: const Color(0xFF1A2332),
          points: [
            'NO movable parts; rigid immobilization',
            'Used for REST, protection, and immobilization',
            'Prevents unwanted motion at target joints',
            'Maintains a joint in a specific position',
            'Indicated for acute inflammation, post-surgical, fracture healing',
            'Can be serial static: remolded progressively to increase ROM',
          ],
        ),
        BulletCardBlock(
          title: 'Dynamic Splinting Principles',
          themeColor: Colors.green,
          backgroundColor: const Color(0xFF152A1A),
          points: [
            'Has movable components: rubber bands, springs, or outriggers',
            'Used for MOBILIZATION, exercise, and functional assistance',
            'Applies a constant or adjustable force to promote motion',
            'Allows controlled active or passive range of motion',
            'Indicated for tendon repairs, contractures, nerve palsies',
            'Must apply LOW-LOAD PROLONGED STRETCH for contracture management',
          ],
        ),
        BulletCardBlock(
          title: 'Static-Progressive Splinting Principles',
          themeColor: Colors.orange,
          backgroundColor: const Color(0xFF2A2215),
          points: [
            'Hybrid approach: no elastic/spring components like dynamic splints',
            'Uses adjustable mechanism (turnbuckle, ratchet) for incremental stretch',
            'Holds joint at current end-range WITHOUT dynamic recoil',
            'Exploits tissue CREEP (gradual deformation under sustained load)',
            'Exploits STRESS RELAXATION (decreasing resistance at maintained length)',
            'Example: turnbuckle splint for elbow flexion contracture',
            'Both dynamic and static-progressive produce comparable ROM gains',
          ],
        ),
        PearlBlock(
          'Board Pearl: Dynamic vs Static-Progressive',
          'Dynamic splints apply a CONSTANT mobilizing force through elastic elements '
          '(springs, rubber bands). Static-progressive splints hold the joint at '
          'end-range with a NON-ELASTIC, incrementally adjustable mechanism. Both aim '
          'to improve ROM but use fundamentally different mechanical strategies. This '
          'distinction is frequently tested.',
        ),

        // --- Resting Hand Splint ---
        ComparisonCardBlock(
          title: 'Resting Hand Splint (Static)',
          themeColor: Colors.indigo,
          backgroundColor: const Color(0xFF1A1D2E),
          icon: Icons.back_hand,
          description:
              'A static splint that positions the wrist and hand in a resting '
              'position to minimize joint stress and prevent contracture during '
              'periods of immobilization or rest.',
          keyPoints: [
            'Wrist: 20-30 degrees of extension',
            'MCP joints: 45-70 degrees of flexion',
            'IP joints: slight flexion (15-20 degrees)',
            'Thumb: midway between abduction and opposition',
            'Indicated for inflammatory arthritis (RA) flare',
            'Indicated for burns (anti-deformity position)',
            'Indicated for post-surgical immobilization',
            'Worn primarily at night or during rest periods',
            'Prevents MCP ulnar drift and IP contracture in RA',
          ],
        ),

        // --- Functional Position Splint ---
        ComparisonCardBlock(
          title: 'Functional Position Splint',
          themeColor: Colors.teal,
          backgroundColor: const Color(0xFF152A27),
          icon: Icons.pan_tool,
          description:
              'A static splint that positions the hand in the position of optimal '
              'function. Similar to resting hand splint but with thumb in opposition '
              'for grasp readiness.',
          keyPoints: [
            'Wrist: 20-30 degrees of extension',
            'MCP joints: 45-70 degrees of flexion',
            'IP joints: slight flexion',
            'Thumb: in OPPOSITION (ready for pinch/grasp)',
            'Position of optimal hand function',
            'Used when hand may recover function (stroke, nerve injury)',
            'Combined high median-ulnar palsy: maintains functional position',
          ],
        ),

        // --- Tenodesis Splint ---
        ComparisonCardBlock(
          title: 'Tenodesis Splint (Wrist-Driven Prehension Orthosis)',
          themeColor: Colors.deepOrange,
          backgroundColor: const Color(0xFF2A1D19),
          icon: Icons.precision_manufacturing,
          description:
              'A dynamic orthosis that uses wrist EXTENSION to drive finger '
              'FLEXION through a mechanical linkage, enabling a functional grasp. '
              'The tenodesis effect: wrist extension tightens finger flexor '
              'tendons, producing a pinch grip.',
          keyPoints: [
            'Wrist extension mechanically drives finger flexion (pinch)',
            'Wrist flexion opens the hand (releases grasp)',
            'Exploits the natural tenodesis effect via mechanical linkage',
            'REQUIRES intact wrist extensors (ECRL, ECRB)',
            'Indicated for C6 SCI (intact wrist extensors ECRL/ECRB, absent finger flexors); not indicated for C7, where the patient typically grasps functionally without orthotic assistance',
            'Provides functional three-jaw chuck or lateral pinch',
            'Patient must have at least 3+/5 wrist extension strength',
            'Training required for effective use and coordination',
          ],
        ),

        // --- Cock-Up Splint ---
        ComparisonCardBlock(
          title: 'Cock-Up Splint (Wrist Extension Splint)',
          themeColor: Colors.amber,
          backgroundColor: const Color(0xFF2A2515),
          icon: Icons.front_hand,
          description:
              'A static volar or dorsal splint that maintains the wrist in '
              'extension while leaving the fingers and thumb free for function.',
          keyPoints: [
            'Maintains wrist in 20-30 degrees of extension',
            'Leaves fingers and thumb free for grip and pinch',
            'Volar design: supports wrist from palmar side',
            'Dorsal design: supports wrist from dorsal side, frees palm',
            'Indicated for carpal tunnel syndrome (neutral wrist position)',
            'Indicated for radial nerve palsy (wrist drop)',
            'Indicated for wrist extensor weakness or pain',
            'Often used as a night splint for carpal tunnel',
          ],
        ),

        // --- Thumb Spica ---
        ComparisonCardBlock(
          title: 'Thumb Spica Splint',
          themeColor: Colors.purple,
          backgroundColor: const Color(0xFF2A1A2E),
          icon: Icons.thumb_up,
          description:
              'A static splint that immobilizes the thumb CMC and MCP joints '
              'while leaving the wrist and other fingers free (short thumb spica) '
              'or includes the wrist (long thumb spica).',
          keyPoints: [
            'Immobilizes thumb CMC and/or MCP joints',
            'Short thumb spica: thumb only, wrist free',
            'Long thumb spica: includes wrist immobilization',
            'Indicated for De Quervain tenosynovitis',
            'Indicated for gamekeeper/skier thumb (UCL injury)',
            'Indicated for scaphoid fracture (with wrist immobilization)',
            'Indicated for thumb CMC osteoarthritis (1st CMC OA)',
            'IP joint typically left free to allow pinch function',
          ],
        ),

        // --- Dynamic WHO Applications ---
        HeaderBlock('Dynamic Wrist-Hand Orthoses'),
        TableBlock(
          title: 'Dynamic WHO Applications',
          columns: ['Condition', 'Dynamic WHO Type', 'Mechanism'],
          rows: [
            ['Radial nerve palsy', 'Dynamic wrist-finger extension assist', 'Rubber bands provide MCP extension via outrigger'],
            ['Flexor tendon repair (zone II)', 'Dorsal blocking splint with dynamic traction', 'Wrist/MCP flexed; rubber bands maintain digit flexion (Kleinert protocol)'],
            ['Extensor tendon repair', 'Volar splint with dynamic extension assist', 'Rubber bands pull fingers into extension'],
            ['MCP flexion contracture', 'Dynamic MCP extension splint', 'Low-load spring applies sustained extension force'],
            ['PIP flexion contracture', 'Dynamic PIP extension splint (Capener)', 'Spring-wire mechanism applies extension torque at PIP'],
          ],
          headerColor: Colors.green,
        ),
        PearlBlock(
          'Board Pearl: Kleinert Protocol',
          'The Kleinert protocol for flexor tendon repair uses a dorsal blocking splint '
          'with rubber band traction maintaining protected finger flexion. This allows '
          'controlled passive flexion and active extension, preventing adhesion formation '
          'while protecting the repair from excessive tension.',
        ),
      ],
    ),

    // ─────────────────────────────────────────────
    // TAB 2: Nerve Injury Splints
    // ─────────────────────────────────────────────
    TopicTab(
      title: 'Nerve Injury Splints',
      blocks: [
        HeaderBlock('Peripheral Nerve Injury Splints'),
        TextBlock(
          'Peripheral nerve injuries produce characteristic deformities based on '
          'which muscles are denervated. Each deformity has a specific splint '
          'designed to counteract it. This is one of the HIGHEST-YIELD topics '
          'on PM&R board examinations. Know the nerve, the deformity, and the '
          'corresponding splint.',
          isIntro: true,
        ),

        // --- Radial Nerve ---
        ComparisonCardBlock(
          title: 'Radial Nerve Palsy → Wrist Drop',
          themeColor: Colors.red,
          backgroundColor: const Color(0xFF2A1519),
          icon: Icons.arrow_downward,
          description:
              'Radial nerve injury causes loss of wrist extensors, finger extensors, '
              'and thumb extensors/abductors. The hand falls into a WRIST DROP '
              'position with inability to extend the wrist or fingers.',
          keyPoints: [
            'Deformity: WRIST DROP (loss of wrist and finger extension)',
            'Lost muscles: ECR, ECU, EDC, EPL, APL, supinator, brachioradialis',
            'Cannot extend wrist, MCP joints, or thumb',
            'Grip strength severely weakened (tenodesis effect lost)',
            'Splint: dorsal COCK-UP SPLINT (wrist extension splint)',
            'Dynamic option: outrigger with rubber bands assisting MCP extension',
            'Keeps wrist in 20-30 deg extension to restore tenodesis grip',
            'Sensation lost: dorsal first web space (anatomical snuffbox)',
          ],
        ),

        PearlBlock(
          'Board Pearl: Dynamic vs Static Splinting in Radial Nerve Palsy',
          'Evidence shows dynamic splinting produces significantly greater manual '
          'dexterity than static splinting in radial nerve palsy. In 9-hole peg testing, '
          'patients with dynamic splints completed tasks substantially faster than with '
          'static splints or no splint. Dynamic splints preferred for daytime function; '
          'static cock-up splints for nighttime positioning.',
        ),

        // --- Ulnar Nerve ---
        ComparisonCardBlock(
          title: 'Ulnar Nerve Palsy → Claw Hand',
          themeColor: Colors.orange,
          backgroundColor: const Color(0xFF2A2215),
          icon: Icons.do_not_touch,
          description:
              'Ulnar nerve injury causes loss of intrinsic muscles (interossei, '
              'lumbricals 3-4, hypothenar muscles). The result is CLAW HAND: '
              'MCP hyperextension with IP flexion of the ring and small fingers.',
          keyPoints: [
            'Deformity: CLAW HAND (MCP hyperextension + IP flexion, digits 4-5)',
            'Lost muscles: interossei, lumbricals 3-4, hypothenar, adductor pollicis',
            'MCP hyperextension: loss of intrinsic MCP flexion (lumbricals)',
            'IP flexion: unopposed FDP action with no intrinsic IP extension',
            'Splint: ANTI-CLAW splint (MCP flexion block / lumbrical bar)',
            'Anti-claw splint prevents MCP hyperextension',
            'By blocking MCP hyperextension, extrinsic extensors can extend IPs',
            'Paradox: LOW ulnar palsy has WORSE claw than HIGH (Ulnar Paradox)',
            'Sensation lost: ulnar 1.5 digits (ring/small fingers)',
          ],
        ),
        PearlBlock(
          'Board Pearl: Ulnar Paradox',
          'LOW ulnar nerve lesion (at wrist) produces a WORSE claw deformity '
          'than HIGH ulnar lesion (at elbow). This is because in a high lesion, '
          'FDP to digits 4-5 is also paralyzed, so there is less IP flexion '
          'pull, and the claw is less pronounced. The paradox: the more proximal '
          'the lesion, the LESS severe the claw.',
        ),

        // --- Median Nerve ---
        ComparisonCardBlock(
          title: 'Median Nerve Palsy → Ape Hand',
          themeColor: Colors.green,
          backgroundColor: const Color(0xFF152A1A),
          icon: Icons.swipe,
          description:
              'Median nerve injury causes loss of thenar muscles (opponens pollicis, '
              'abductor pollicis brevis, flexor pollicis brevis superficial head). '
              'The thumb falls into the plane of the palm creating the APE HAND '
              'deformity with loss of opposition.',
          keyPoints: [
            'Deformity: APE HAND (loss of thenar opposition)',
            'Lost muscles: opponens pollicis, APB, FPB (superficial), lumbricals 1-2',
            'Thumb cannot oppose to fingertips (no precision pinch)',
            'Thumb lies flat in the plane of the palm',
            'Splint: OPPONENS SPLINT (thumb opposition splint)',
            'Positions thumb in palmar abduction and opposition',
            'Maintains first web space and prevents adduction contracture',
            'High median palsy: also loses FPL, FDP 2-3, FDS (hand of benediction)',
            'Sensation lost: radial 3.5 digits (thumb, index, middle, radial ring)',
          ],
        ),

        // --- Combined ---
        ComparisonCardBlock(
          title: 'Combined High Median-Ulnar Palsy',
          themeColor: Colors.purple,
          backgroundColor: const Color(0xFF2A1A2E),
          icon: Icons.warning,
          description:
              'Combined injury to both median and ulnar nerves causes loss of ALL '
              'intrinsic hand muscles. The result is a flattened, non-functional '
              'hand requiring comprehensive splinting.',
          keyPoints: [
            'ALL intrinsic muscles of the hand are lost',
            'No opposition, no interossei, no lumbricals',
            'Severe functional impairment of hand',
            'Splint: FUNCTIONAL POSITION SPLINT',
            'Maintains hand in position of optimal function',
            'May need custom orthosis combining multiple components',
            'Prognosis for full recovery is poor',
          ],
        ),

        MnemonicBlock(
          'Radial = Wrist drop, Ulnar = Claw, Median = Ape hand',
          'R-W-U-C-M-A: "Real Wise Unicorns Can Make Art" — '
          'Radial nerve = Wrist drop (cock-up splint), '
          'Ulnar nerve = Claw hand (anti-claw splint), '
          'Median nerve = Ape hand (opponens splint).',
        ),

        // --- Summary Table ---
        TableBlock(
          title: 'Nerve Injury Splint Summary (HIGH YIELD)',
          columns: ['Nerve', 'Deficit', 'Deformity', 'Splint'],
          rows: [
            ['Radial', 'Wrist/finger extension', 'Wrist drop', 'Cock-up (wrist extension) splint'],
            ['Ulnar', 'Intrinsics (digits 4-5)', 'Claw hand', 'Anti-claw (MCP flexion block)'],
            ['Median', 'Thenar opposition', 'Ape hand', 'Opponens splint'],
            ['High median-ulnar', 'All intrinsics', 'Flattened hand', 'Functional position splint'],
          ],
          headerColor: const Color(0xFFC62828),
        ),

        PearlBlock(
          'Board Pearl: Nerve-Deformity-Splint',
          'This is one of the most commonly tested associations in PM&R boards. '
          'If you see "wrist drop" the answer involves radial nerve and cock-up '
          'splint. If you see "claw hand" think ulnar nerve and anti-claw splint. '
          'If you see "ape hand" or "loss of opposition" think median nerve and '
          'opponens splint.',
        ),

        // --- Extended Nerve Injury Table ---
        TableBlock(
          title: 'Complete Nerve Injury Summary (High vs Low)',
          columns: ['Nerve', 'Level', 'Deformity', 'Splint', 'Sensory Loss'],
          rows: [
            ['Radial', 'Any', 'Wrist drop', 'Cock-up splint', 'Dorsal first web space'],
            ['Ulnar', 'Low (wrist)', 'Claw hand (SEVERE)', 'Anti-claw splint', 'Ulnar 1.5 digits'],
            ['Ulnar', 'High (elbow)', 'Claw hand (MILD)', 'Anti-claw splint', 'Ulnar 1.5 digits'],
            ['Median', 'Low (wrist)', 'Ape hand', 'Opponens splint', 'Radial 3.5 digits (palmar)'],
            ['Median', 'High (elbow)', 'Hand of benediction', 'Opponens + functional position', 'Radial 3.5 digits (palmar)'],
            ['Combined median-ulnar', 'Any', 'Flattened hand', 'Functional position splint', 'Most of hand'],
          ],
          headerColor: const Color(0xFFC62828),
        ),
        BulletCardBlock(
          title: 'Additional Nerve Injury Pearls',
          themeColor: Colors.red,
          backgroundColor: const Color(0xFF2A1519),
          points: [
            'Froment sign: thumb IP flexion via FPL compensating for lost adductor pollicis (ulnar nerve)',
            'Hand of benediction: index and middle fingers stay extended during fist attempt (high median)',
            'Anti-claw splint only needs to block MCP hyperextension in digits 4-5',
            'Index and middle fingers spared in ulnar palsy (lumbricals 1-2 = median nerve)',
            'Median sensory loss (thumb/index/middle) may be more disabling than motor loss',
          ],
        ),

        CheckpointBlock(
          question: 'A patient presents with wrist drop after a humeral shaft fracture. Which nerve is most likely injured, and what splint is indicated?',
          options: ['Ulnar nerve — anti-claw splint', 'Median nerve — opponens splint', 'Radial nerve — dorsal wrist cock-up splint', 'Musculocutaneous nerve — elbow extension splint'],
          correctIndex: 2,
          explanation: 'Radial nerve palsy causes wrist drop (loss of wrist and finger extension). The dorsal wrist cock-up splint holds the wrist in extension, allowing finger flexors to function. Radial nerve injury is the most common nerve injury with humeral shaft fractures.',
        ),

        CaseScenarioBlock(
          title: 'Nerve Injury Splinting Case',
          vignette: 'A 35-year-old male sustains a deep laceration to the medial elbow during a construction accident. On examination, he has loss of sensation to the ulnar 1.5 fingers, weakness of finger abduction/adduction, and a positive Froment sign. MCP joints of the ring and small fingers are hyperextended.',
          decisionPoints: [
            CaseDecisionPoint(
              prompt: 'Based on the clinical presentation, which nerve is injured?',
              options: ['Radial nerve', 'Median nerve', 'Ulnar nerve', 'Combined median-ulnar'],
              optimalIndex: 2,
              explanation: 'Ulnar nerve injury at the elbow causes: clawing of ring/small fingers (MCP hyperextension), weak interossei (loss of finger abduction/adduction), positive Froment sign (thumb IP flexion compensating for weak adductor pollicis), and ulnar 1.5 finger sensory loss.',
            ),
            CaseDecisionPoint(
              prompt: 'What orthosis should you prescribe for this patient\'s claw hand deformity?',
              options: ['Dorsal wrist cock-up splint', 'MCP flexion block splint (anti-claw)', 'Opponens splint', 'Resting hand splint'],
              optimalIndex: 1,
              explanation: 'An MCP flexion block (anti-claw) splint prevents MCP hyperextension of the ring and small fingers, redirecting extensor force to the IP joints to allow finger extension. This restores a more functional hand position.',
            ),
          ],
          summaryPearl: 'Ulnar nerve injury = claw hand (ring/small fingers) + Froment sign + weak interossei. The anti-claw splint blocks MCP hyperextension. Remember the ulnar paradox: HIGH ulnar lesions cause LESS clawing than low lesions because the FDP is also paralyzed.',
        ),
      ],
    ),

    // ─────────────────────────────────────────────
    // TAB 3: Elbow & Shoulder
    // ─────────────────────────────────────────────
    TopicTab(
      title: 'Elbow & Shoulder',
      blocks: [
        HeaderBlock('Elbow Orthoses'),
        TextBlock(
          'Elbow and shoulder orthoses range from simple hinged braces to complex '
          'devices supporting a flail upper extremity. Understanding specific '
          'indications and biomechanical principles guides proper selection.',
          isIntro: true,
        ),

        // --- Hinged Elbow ---
        ComparisonCardBlock(
          title: 'Hinged Elbow Orthosis',
          themeColor: Colors.blue,
          backgroundColor: const Color(0xFF1A2332),
          icon: Icons.compare_arrows,
          description:
              'A brace with medial and lateral hinges allowing controlled '
              'flexion and extension. Adjustable ROM stops can block '
              'hyperextension or limit flexion/extension range.',
          keyPoints: [
            'Medial and lateral hinges allow flexion/extension',
            'Adjustable stops to set ROM limits',
            'Can block hyperextension (posterior stop)',
            'Indicated post elbow dislocation or ligament repair',
            'Indicated for elbow instability with preserved ROM goals',
            'Allows progressive ROM increase as healing progresses',
          ],
        ),

        // --- Turnbuckle ---
        ComparisonCardBlock(
          title: 'Turnbuckle Splint',
          themeColor: Colors.orange,
          backgroundColor: const Color(0xFF2A2215),
          icon: Icons.rotate_right,
          description:
              'A static-progressive splint that applies a LOW-LOAD PROLONGED '
              'STRETCH to overcome elbow flexion contracture. The turnbuckle '
              'mechanism allows incremental adjustment of extension.',
          keyPoints: [
            'Static-progressive design for contracture management',
            'Turnbuckle mechanism: incremental stretch adjustment',
            'Applies low-load prolonged stretch (LLPS) principle',
            'Indicated for elbow flexion CONTRACTURE',
            'Goal: gradually increase elbow extension over time',
            'Worn for prolonged periods (hours) at submaximal stretch',
            'More effective than brief high-force stretching',
            'Tissue remodeling occurs through creep and stress relaxation',
          ],
        ),

        // --- Shoulder Orthoses ---
        HeaderBlock('Shoulder Orthoses'),

        ComparisonCardBlock(
          title: 'Airplane Splint (Shoulder Abduction Orthosis)',
          themeColor: Colors.indigo,
          backgroundColor: const Color(0xFF1A1D2E),
          icon: Icons.flight,
          description:
              'A shoulder orthosis that holds the arm in approximately 90 degrees '
              'of abduction. Named for the position resembling an airplane wing.',
          keyPoints: [
            'Holds shoulder in ~90 degrees of abduction',
            'May include adjustable rotation and flexion components',
            'Indicated for axillary nerve injury (deltoid paralysis)',
            'Indicated post rotator cuff repair (especially large tears)',
            'Indicated for shoulder burns (prevents adduction contracture)',
            'Allows deltoid and supraspinatus to heal in shortened position',
            'Can be uncomfortable and heavy for prolonged use',
          ],
        ),

        ComparisonCardBlock(
          title: 'Gunslinger Orthosis',
          themeColor: Colors.brown,
          backgroundColor: const Color(0xFF2A2522),
          icon: Icons.sports_martial_arts,
          description:
              'A forearm trough mounted on a body frame that supports a flail arm '
              'in slight shoulder abduction and flexion, resembling a gunslinger '
              'position.',
          keyPoints: [
            'Supports flail arm in slight abduction and flexion',
            'Forearm trough attached to a body frame/pelvic band',
            'Indicated for brachial plexus injury (flail arm)',
            'Indicated for severe shoulder weakness or subluxation',
            'Relieves traction on brachial plexus during healing',
            'Allows limited hand function if distal muscles preserved',
            'Lighter and more functional than airplane splint',
          ],
        ),

        // --- Fracture Bracing ---
        ComparisonCardBlock(
          title: 'Fracture Bracing (Functional Brace)',
          themeColor: Colors.teal,
          backgroundColor: const Color(0xFF152A27),
          icon: Icons.healing,
          description:
              'A circumferential thermoplastic brace for humeral shaft fractures '
              'that provides fracture stabilization through soft tissue compression '
              'while allowing elbow and shoulder motion.',
          keyPoints: [
            'Circumferential brace for humeral shaft fractures',
            'Sarmiento functional brace: named after Dr. Augusto Sarmiento',
            'Hydraulic mechanism: compresses soft tissue around fracture',
            'Allows ELBOW and SHOULDER motion during healing',
            'Early mobilization promotes fracture healing',
            'Typically applied within the first 1-2 weeks after injury, once initial swelling subsides, replacing the coaptation splint',
            'High union rates (>95%) for isolated humeral shaft fractures',
            'Contraindicated for open fractures, vascular injury, or polytrauma',
            'Radial nerve palsy may occur with humeral shaft fractures',
          ],
        ),

        PearlBlock(
          'Board Pearl: Shoulder Orthosis Selection',
          'Airplane splint = shoulder held in 90 deg abduction (axillary nerve, '
          'RC repair, burns). Gunslinger = flail arm support (brachial plexus). '
          'If the question says "axillary nerve injury" or "deltoid paralysis," '
          'think airplane splint.',
        ),

        PearlBlock(
          'Board Pearl: Sarmiento Brace + Radial Nerve',
          'Humeral shaft fractures carry significant risk of radial nerve palsy '
          'because the radial nerve courses in the spiral groove of the humerus. '
          'When radial nerve palsy accompanies a humeral shaft fracture, add a '
          'cock-up splint to manage wrist drop while the Sarmiento brace treats '
          'the fracture. Union rates exceed 95% with the Sarmiento brace.',
        ),
      ],
    ),

    // ─────────────────────────────────────────────
    // TAB 4: SCI-Specific Orthoses
    // ─────────────────────────────────────────────
    TopicTab(
      title: 'SCI-Specific',
      blocks: [
        HeaderBlock('SCI-Specific Upper Extremity Orthoses'),
        TextBlock(
          'Patients with cervical spinal cord injuries have specific upper extremity '
          'orthotic needs based on their neurological level. Each SCI level determines '
          'which muscles are functional, which drives the choice of orthosis and '
          'functional goals. This is heavily tested on boards.',
          isIntro: true,
        ),

        // --- C4 SCI ---
        ComparisonCardBlock(
          title: 'C4 SCI: No Effective UE Orthosis',
          themeColor: Colors.grey,
          backgroundColor: const Color(0xFF232A3B),
          icon: Icons.block,
          description:
              'C4 SCI patients have no volitional upper extremity function. No UE '
              'orthosis can restore meaningful arm function at this level. The patient '
              'depends entirely on assistive technology for environmental interaction.',
          keyPoints: [
            'Intact: diaphragm (C3-5), upper trapezius, some neck musculature',
            'Lost: ALL shoulder, arm, and hand muscles',
            'No upper extremity orthosis is effective',
            'Sip-and-puff controls for wheelchair and environment',
            'Head-controlled or eye-tracking interfaces',
            'Voice-activated controls',
            'Complete dependence for all UE ADLs',
          ],
        ),

        // --- C5 SCI ---
        ComparisonCardBlock(
          title: 'C5 SCI: Balanced Forearm Orthosis',
          themeColor: Colors.red,
          backgroundColor: const Color(0xFF2A1519),
          icon: Icons.fitness_center,
          description:
              'C5 SCI patients have functional deltoid and biceps but NO wrist '
              'extensors, finger flexors/extensors, or triceps. They require a '
              'mobile arm support to position the hand in space.',
          keyPoints: [
            'Intact muscles: deltoid, biceps, brachialis, rotator cuff',
            'Lost muscles: wrist extensors, hand muscles, triceps',
            'Balanced Forearm Orthosis (BFO) / Mobile Arm Support (MAS)',
            'BFO: mechanical arm support mounted to wheelchair',
            'Uses gravity-eliminated position for proximal arm function',
            'Allows self-feeding, face touching, page turning with assists',
            'Ball-bearing feeder arm assists horizontal arm movement',
            'May also use universal cuff for utensil holding',
            'Cannot perform tenodesis grasp (no wrist extensors)',
          ],
        ),

        // --- C6 SCI ---
        ComparisonCardBlock(
          title: 'C6 SCI: Tenodesis Splint',
          themeColor: Colors.orange,
          backgroundColor: const Color(0xFF2A2215),
          icon: Icons.precision_manufacturing,
          description:
              'C6 SCI patients gain wrist EXTENSORS (ECRL, ECRB) in addition to '
              'C5 muscles. This allows use of the tenodesis effect for functional '
              'grasp through a wrist-driven prehension orthosis.',
          keyPoints: [
            'Intact muscles: C5 muscles + wrist extensors (ECRL, ECRB)',
            'Lost muscles: finger flexors/extensors, triceps, intrinsics',
            'KEY GAIN: wrist extension enables TENODESIS grasp',
            'Tenodesis splint (wrist-driven prehension orthosis)',
            'Wrist extension mechanically drives finger flexion for pinch',
            'Universal cuff: strap holds utensils in palm for self-feeding',
            'Can drive with adaptive equipment',
            'Significant improvement in independence over C5',
            'Wrist extensors must be at least 3+/5 strength',
          ],
        ),

        // --- C7 SCI ---
        ComparisonCardBlock(
          title: 'C7 SCI: Minimal Orthotic Needs',
          themeColor: Colors.green,
          backgroundColor: const Color(0xFF152A1A),
          icon: Icons.check_circle,
          description:
              'C7 SCI patients gain triceps, wrist flexors, and finger extensors. '
              'They are generally functional for most ADLs without orthoses and '
              'represent a major functional milestone.',
          keyPoints: [
            'Intact muscles: C6 muscles + triceps, wrist flexors, finger extensors',
            'Lost muscles: finger flexors (FDP, FDS), intrinsics',
            'KEY GAIN: triceps enables transfers and wheelchair propulsion',
            'Usually functional WITHOUT orthoses for most ADLs',
            'May use short opponens splint for thumb positioning',
            'Can perform independent transfers with triceps',
            'Can propel wheelchair independently',
            'Can drive with minimal adaptive equipment',
            'Major functional independence level in tetraplegia',
          ],
        ),

        // --- SCI Orthosis Table ---
        TableBlock(
          title: 'SCI Level and Upper Extremity Orthoses',
          columns: ['SCI Level', 'Key Muscle Gain', 'Orthosis', 'Functional Goal'],
          rows: [
            ['C4', 'None (UE)', 'No UE orthosis effective', 'Sip-and-puff controls'],
            ['C5', 'Deltoid, biceps', 'BFO / Mobile arm support', 'Assisted feeding, grooming'],
            ['C6', 'Wrist extensors (ECRL)', 'Tenodesis splint, universal cuff', 'Tenodesis grasp, self-feeding'],
            ['C7', 'Triceps, finger extensors', 'Short opponens (if needed)', 'Independent transfers, ADLs'],
            ['C8-T1', 'Finger flexors, intrinsics', 'Rarely needed', 'Near-normal hand function'],
          ],
          headerColor: const Color(0xFFBF360C),
        ),

        PearlBlock(
          'Board Pearl: SCI Orthosis Selection',
          'C5 = BFO (no wrist extensors, need arm support). '
          'C6 = Tenodesis splint (wrist extensors drive finger flexion). '
          'C7 = Usually no orthosis needed (triceps = transfers). '
          'The KEY muscle at C6 is wrist extensors enabling tenodesis. '
          'The KEY muscle at C7 is triceps enabling transfers.',
        ),

        // --- Universal Cuff ---
        HeaderBlock('Assistive Orthotic Devices'),
        BulletCardBlock(
          title: 'Universal Cuff (Palmar Clip)',
          themeColor: Colors.deepPurple,
          backgroundColor: const Color(0xFF1F1A2E),
          points: [
            'Simple strap around the palm with a pocket/slot for utensils',
            'Holds fork, spoon, pen, toothbrush, or other implements',
            'No active grasp needed — passive holding device',
            'Used for C5-C6 SCI, severe hand weakness of any cause',
            'Can be combined with built-up handles for easier use',
            'One of the simplest and most effective adaptive devices',
          ],
        ),
        BulletCardBlock(
          title: 'Wrist-Driven Flexor Hinge Splint',
          themeColor: Colors.cyan,
          backgroundColor: const Color(0xFF152A2E),
          points: [
            'A more precise term for the tenodesis splint mechanism',
            'Flexor hinge at the MCP joints driven by wrist extension',
            'Three-jaw chuck pinch or lateral pinch pattern',
            'Force generated is ~1-2 lbs of pinch strength',
            'Sufficient for light ADL tasks (feeding, writing, grooming)',
            'Requires training for coordination and timing',
          ],
        ),

        PearlBlock(
          'Board Pearl: Key SCI Functional Milestones',
          'C4: dependent for all UE function, needs sip-and-puff controls. '
          'C5: can flex elbow (feed with BFO), no wrist control. '
          'C6: wrist extension = tenodesis grasp, major independence gain. '
          'C7: triceps = transfers, functional independence level. '
          'C8-T1: near-normal hand function, intrinsic weakness only.',
        ),
        PearlBlock(
          'Board Pearl: Preserve Tenodesis in C6 SCI',
          'Therapists must AVOID overstretching finger flexors during C6 SCI rehab. '
          'If finger flexors become too lax, the natural tenodesis effect is lost and '
          'neither natural grasp nor WDFHO will produce adequate pinch. Maintaining '
          'appropriate finger flexor tightness is a critical rehabilitation principle.',
        ),

        CheckpointBlock(
          question: 'A C6 complete SCI patient has wrist extension but no finger flexion. What orthotic principle allows them to grasp objects?',
          options: ['Dynamic finger extension splint', 'Tenodesis (wrist-driven flexor hinge)', 'BFO (balanced forearm orthosis)', 'Opponens splint'],
          correctIndex: 1,
          explanation: 'Tenodesis uses active wrist extension to passively flex the fingers via the tenodesis effect. A WDFHO (wrist-driven flexor hinge orthosis) mechanically links wrist extension to finger flexion. Critical pearl: do NOT overstretch the finger flexors in C6 SCI patients — this destroys the tenodesis grasp.',
        ),
      ],
    ),
  ],
);

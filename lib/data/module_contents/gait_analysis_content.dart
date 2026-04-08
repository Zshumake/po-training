import 'package:flutter/material.dart';
import '../models/topic_content_model.dart';

final gaitAnalysisContent = TopicData(
  id: 'gait_analysis',
  title: 'Gait Analysis',
  tabs: [
    // ─────────────────────────────────────────────
    // TAB 1: Normal Gait Review
    // ─────────────────────────────────────────────
    TopicTab(
      title: 'Normal Gait Review',
      blocks: [
        HeaderBlock('Interactive Gait Cycle'),
        TextBlock('Tap each phase to explore muscle activity, joint positions, and clinical significance.'),
        GaitCycleBlock(),
        HeaderBlock('Pathologic Gait Patterns'),
        TextBlock(
          'Gait deviations result from weakness, spasticity, contracture, pain, '
          'or skeletal deformity. Identifying the deviation and its root cause '
          'is essential for prescribing appropriate treatment and is a high-yield '
          'board topic.',
          isIntro: true,
        ),
        TableBlock(
          title: 'Common Gait Pathologies (Table 6-4)',
          columns: ['Deviation', 'Cause', 'Phase Affected'],
          rows: [
            ['Foot slap', 'Weak dorsiflexors (tibialis anterior); L4-L5 radiculopathy; peroneal nerve palsy', 'Initial contact / Loading response'],
            ['Foot drop (steppage gait)', 'Weak/absent dorsiflexors; peroneal nerve palsy; L5 radiculopathy', 'Swing phase'],
            ['Genu recurvatum', 'Weak quadriceps; plantarflexion contracture; quadriceps spasticity', 'Midstance / Terminal stance'],
            ['Excessive knee flexion', 'Knee flexion contracture; weak quadriceps; hamstring spasticity', 'Stance phase'],
            ['Trendelenburg gait', 'Weak hip abductors (gluteus medius); L5 radiculopathy; superior gluteal nerve palsy', 'Midstance'],
            ['Circumduction', 'Weak dorsiflexors or hip flexors; stiff knee; leg length discrepancy', 'Swing phase'],
            ['Hip hiking', 'Weak dorsiflexors; weak hip flexors; leg length discrepancy', 'Swing phase'],
            ['Vaulting', 'Leg length discrepancy; inadequate knee flexion in swing', 'Swing phase (contralateral stance)'],
            ['Antalgic gait', 'Pain in any lower extremity joint', 'Stance phase (shortened)'],
          ],
          headerColor: Colors.red,
        ),
        HeaderBlock('Trendelenburg Gait: Compensated vs Uncompensated'),
        ComparisonCardBlock(
          title: 'Uncompensated Trendelenburg',
          themeColor: Colors.red,
          backgroundColor: const Color(0xFF2A1519),
          icon: Icons.trending_down,
          description: 'The pelvis drops on the swing side due to weak hip abductors '
              'on the stance side. The trunk remains midline or shifts slightly '
              'to the contralateral side.',
          keyPoints: [
            'Contralateral pelvic drop during single-limb stance',
            'Caused by weak gluteus medius on the STANCE side',
            'Trunk does NOT lean over the affected side',
            'Superior gluteal nerve injury (L4-S1)',
            'Seen in: polio, muscular dystrophy, hip OA, L5 radiculopathy',
          ],
        ),
        ComparisonCardBlock(
          title: 'Compensated Trendelenburg (Gluteus Medius Lurch)',
          themeColor: Colors.orange,
          backgroundColor: const Color(0xFF2A2215),
          icon: Icons.swap_horiz,
          description: 'The patient compensates for hip abductor weakness by leaning '
              'the trunk OVER the affected (stance) side to shift the COG, '
              'thereby reducing the demand on the gluteus medius.',
          keyPoints: [
            'Lateral trunk lean TOWARD the stance (weak) side',
            'Shifts COG over the stance limb to reduce abductor moment demand',
            'Also called gluteus medius lurch or abductor lurch',
            'Reduces the moment arm of body weight about the hip',
            'Can also be caused by hip pain (antalgic adaptation)',
            'A cane in the OPPOSITE hand reduces the compensatory trunk lean',
          ],
        ),
        PearlBlock(
          'Board Pearl',
          'A cane should be used in the hand OPPOSITE the weak hip. '
          'The cane reduces the demand on the hip abductors by ~50%. '
          'Trendelenburg sign tests the stance-side abductors, not the swing side.',
        ),
        AnnotatedImageBlock(
          title: 'Normal vs Trendelenburg Gait',
          diagramType: 'gait-trendelenburg',
          hotspots: [
            HotspotData(id: 'hip-drop', xPercent: 0.7, yPercent: 0.35, label: 'Contralateral Hip Drop', description: 'The pelvis drops on the unsupported side due to weakness of the stance-side hip abductors (gluteus medius/minimus).', clinicalSignificance: 'Key finding in L5 radiculopathy, superior gluteal nerve injury, or hip abductor weakness.', pinColor: Color(0xFFDC2626)),
            HotspotData(id: 'stance-hip', xPercent: 0.3, yPercent: 0.4, label: 'Stance-Side Hip', description: 'The gluteus medius on the stance side fails to stabilize the pelvis during single-limb support.', pinColor: Color(0xFF0D9488)),
            HotspotData(id: 'trunk-lean', xPercent: 0.3, yPercent: 0.2, label: 'Compensated: Trunk Lean', description: 'In compensated Trendelenburg, the patient leans the trunk TOWARD the weak side to shift the center of gravity over the stance limb.', clinicalSignificance: 'Compensated Trendelenburg = trunk lean toward weak side. Uncompensated = contralateral hip drop without trunk lean.', pinColor: Color(0xFFFF9800)),
          ],
          aspectRatio: 1.3,
        ),
        BulletCardBlock(
          title: 'Additional Pathologic Gait Patterns',
          themeColor: Colors.deepPurple,
          backgroundColor: const Color(0xFF1F1A2E),
          points: [
            'Crouch gait: excessive knee and hip flexion throughout stance (cerebral palsy, hamstring spasticity)',
            'Scissor gait: excessive hip adduction and internal rotation (spastic diplegia, UMN lesion)',
            'Ataxic gait: wide-based, unsteady, irregular step length (cerebellar dysfunction)',
            'Parkinsonian gait: shuffling, short steps, reduced arm swing, festination',
            'Waddling gait: bilateral Trendelenburg (bilateral hip abductor weakness, muscular dystrophy)',
            'Quadriceps avoidance: patient leans trunk forward or locks knee in extension to avoid knee buckling',
          ],
        ),
        VideoBlock(
          url: 'https://www.youtube.com/watch?v=5Z6shSu96CM',
          title: 'Normal Gait Cycle Animation',
          description: 'Watch the 8 phases of normal gait: initial contact, loading response, midstance, terminal stance, preswing, initial swing, midswing, terminal swing. Note the 60/40 stance-to-swing ratio.',
        ),
        VideoBlock(
          url: 'https://www.youtube.com/watch?v=olZYoe3gr2Q',
          title: 'Trendelenburg Gait: Compensated vs Uncompensated',
          description: 'Uncompensated = contralateral pelvic drop (weak hip abductors). Compensated = ipsilateral trunk lean over stance leg to reduce abductor demand. Board favorite.',
        ),
        VideoBlock(
          url: 'https://www.youtube.com/watch?v=LjJmZKr_E8g',
          title: 'Steppage Gait (Foot Drop)',
          description: 'Excessive hip and knee flexion during swing to clear the dropped foot. Caused by peroneal nerve palsy, L5 radiculopathy, or CMT. Watch for slapping forefoot contact.',
        ),
        VideoBlock(
          url: 'https://www.youtube.com/watch?v=dc7cnLxbpKU',
          title: 'Circumduction Gait (Hemiplegic)',
          description: 'Swing leg traces a semicircle laterally to advance. Classic post-stroke pattern due to inability to flex hip/knee adequately. Most common hemiplegic gait compensation.',
        ),
        VideoBlock(
          url: 'https://www.youtube.com/watch?v=rLyEZubc4tk',
          title: 'Antalgic Gait',
          description: 'Shortened stance phase on the painful side. Quick unloading. Look for asymmetric step length and reduced weight-bearing time.',
        ),
        VideoBlock(
          url: 'https://www.youtube.com/watch?v=v1SoZ_S31pk',
          title: 'Parkinsonian (Festinating) Gait',
          description: 'Shuffling, short steps, reduced arm swing, forward-flexed posture, start hesitation, freezing. Festination = involuntary acceleration.',
        ),
      ],
    ),

    // ─────────────────────────────────────────────
    // TAB 2: Prosthetic Gait Deviations
    // ─────────────────────────────────────────────
    TopicTab(
      title: 'Prosthetic Gait Deviations',
      blocks: [
        HeaderBlock('Transtibial Prosthetic Gait Deviations'),
        TextBlock(
          'Gait deviations in transtibial amputees can result from prosthetic '
          'causes (socket fit, alignment, components) or patient causes (weakness, '
          'contracture, habits). Distinguishing between the two is critical for '
          'appropriate intervention.',
          isIntro: true,
        ),
        TableBlock(
          title: 'Transtibial Gait Deviations',
          columns: ['Deviation', 'Prosthetic Cause', 'Patient Cause'],
          rows: [
            ['Abrupt heel contact (hard heel strike)', 'Heel too stiff; socket set too far anterior', 'Habitual; knee extension contracture'],
            ['Prolonged heel contact (delayed foot flat)', 'Heel cushion too soft; socket too far posterior', 'Weak quadriceps; fear of knee buckling'],
            ['Jerky/unstable knee motion', 'Socket too far anterior; excessive dorsiflexion', 'Weak quadriceps; short residual limb'],
            ['Early knee flexion (drop-off)', 'Socket flexed too much; foot too dorsiflexed', 'Hip flexion contracture; weak quads'],
            ['Medial socket thrust', 'Foot outset too far; excessive valgus', 'Genu varum of residual limb'],
            ['Lateral socket thrust', 'Foot inset too far; excessive varus', 'Genu valgum of residual limb'],
            ['Pelvis drops (contralateral)', 'Prosthesis too short', 'Weak hip abductors; short residual limb'],
            ['Heel off too early', 'Keel too stiff; socket too far posterior', 'Habitual; too rapid gait'],
            ['Delayed heel off', 'Keel too flexible; socket too far anterior', 'Weak plantar flexors; slow gait'],
            ['Foot drag in swing', 'Prosthesis too long', 'Inadequate hip/knee flexion'],
            ['Uneven step length', 'Socket uncomfortable; poor suspension', 'Fear; hip flexion contracture; pain'],
          ],
          headerColor: Colors.blue,
        ),
        HeaderBlock('Transfemoral Prosthetic Gait Deviations'),
        TableBlock(
          title: 'Transfemoral Gait Deviations',
          columns: ['Deviation', 'Prosthetic Cause', 'Patient Cause'],
          rows: [
            ['Foot rotation at heel strike', 'Heel too stiff; poor rotational control', 'Habitual'],
            ['Knee buckling (excessive knee flexion)', 'Socket too far anterior; insufficient friction; insufficient alignment stability', 'Hip extensor weakness; hip flexion contracture'],
            ['Lateral trunk bend (abductor lurch)', 'Prosthesis too short; medial wall too high; foot inset', 'Weak hip abductors; hip pain; short residual limb; habit'],
            ['Circumduction', 'Prosthesis too long; too much friction; inadequate suspension', 'Weak hip flexors; abduction contracture; habit'],
            ['Medial whip (heel moves medially)', 'Excessive internal rotation of knee; tight socket', 'Internal rotation of residual limb'],
            ['Lateral whip (heel moves laterally)', 'Excessive external rotation of knee', 'External rotation of residual limb'],
            ['Uneven step length', 'Inadequate socket flexion; insufficient friction', 'Hip flexion contracture; fear of falling; distrust of knee'],
            ['Uneven heel rise', 'Insufficient friction/resistance', 'Forceful hip flexion (habit); fear'],
            ['Terminal impact (snap at end of swing)', 'Insufficient extension resistance', 'Forceful hip flexion to ensure full knee extension'],
            ['Foot slap', 'Insufficient plantar flexion resistance', 'N/A (prosthetic cause only)'],
            ['Vaulting', 'Prosthesis too long; inadequate suspension; insufficient knee flexion', 'Habit; fear of stubbing toe'],
            ['Hip hiking', 'Prosthesis too long; inadequate suspension; insufficient knee friction', 'Habit; weak hip flexors'],
          ],
          headerColor: Colors.deepOrange,
        ),
        PearlBlock(
          'Board Pearl',
          'Whips are best observed from behind the patient. MEDIAL whip = heel '
          'kicks medially at initial swing (internal rotation issue). LATERAL whip = '
          'heel kicks laterally (external rotation issue). Whips occur at the '
          'initiation of knee flexion in preswing/initial swing.',
        ),
        PearlBlock(
          'Board Pearl',
          'Circumduction is the most common transfemoral prosthetic gait deviation. '
          'Vaulting is the most energy-consuming compensation. Abducted gait '
          '(wide-based walking) can result from a prosthesis that is too long, '
          'lateral wall discomfort, or inadequate socket alignment.',
        ),
        BulletCardBlock(
          title: 'Key Transfemoral Alignment Concepts',
          themeColor: Colors.amber,
          backgroundColor: const Color(0xFF2A2515),
          points: [
            'TKA line: trochanter-knee-ankle line; GRF should pass through this',
            'Stability in stance: GRF must pass ANTERIOR to knee axis',
            'Too much stability: difficulty initiating swing phase',
            'Too little stability: knee buckling in stance',
            'Socket flexion (5-7 degrees) compensates for hip flexion contracture',
            'Lateral trunk bend can be prosthetic (short, inset) or patient (weak abductors) cause',
          ],
        ),
        VideoBlock(
          url: 'https://www.youtube.com/watch?v=N_lufFd0EoI',
          title: 'Transtibial Prosthetic Gait Deviations',
          description: 'Watch for foot slap (excessive heel lever), drop-off (inadequate toe lever), lateral thrust (loose socket), and vaulting (prosthesis too long or inadequate suspension).',
        ),
        VideoBlock(
          url: 'https://www.youtube.com/watch?v=VtPQrHmnmhw',
          title: 'Transfemoral Prosthetic Gait Deviations',
          description: 'Key deviations: lateral trunk bend (most common TF deviation — weak abductors or short residual limb), circumduction, vaulting, and whips (rotational malalignment).',
        ),
        VideoBlock(
          url: 'https://www.youtube.com/watch?v=i2bxODibvb0',
          title: 'Vaulting: The Most Energy-Costly Deviation',
          description: 'Plantarflexion of the sound limb to swing the prosthetic limb. Most energy-consuming compensatory habit. Caused by prosthesis too long, inadequate suspension, or fear of catching toe.',
        ),
        CheckpointBlock(
          question: 'A transfemoral amputee demonstrates lateral trunk bending toward the prosthetic side during stance. What is the MOST LIKELY prosthetic cause?',
          options: ['Prosthesis too long', 'Prosthesis too short', 'Excessive knee friction', 'Foot set too far anterior'],
          correctIndex: 1,
          explanation: 'Lateral trunk bending toward the prosthetic side is the most common TF gait deviation. The most likely prosthetic cause is a prosthesis that is too short, forcing the patient to lean over the prosthetic side to clear the sound limb. Patient causes include weak hip abductors or a short residual limb.',
        ),
        CaseScenarioBlock(
          title: 'TF Amputee Gait Analysis',
          vignette: 'A 45-year-old male with a left transfemoral amputation (traumatic, K3) presents for gait analysis. He is wearing an IRC socket with suction suspension and a C-Leg microprocessor knee. You observe him walking in the clinic.',
          decisionPoints: [
            CaseDecisionPoint(
              prompt: 'You notice the patient demonstrates a wide-based gait with the prosthetic limb abducted throughout stance. What is your primary assessment?',
              options: ['Prosthesis is too long', 'Medial wall discomfort or inadequate lateral wall support', 'Weak hip flexors', 'Knee unit set in excessive flexion'],
              optimalIndex: 1,
              explanation: 'Abducted gait is most commonly caused by a prosthesis that is too long OR medial wall discomfort forcing the patient to keep the limb away from the body. With an IRC socket, inadequate lateral wall support should be assessed first.',
            ),
            CaseDecisionPoint(
              prompt: 'After socket adjustment, the abducted gait resolves. However, you now notice terminal impact — an audible "clunk" at the end of swing phase. What component adjustment is needed?',
              options: ['Increase knee flexion resistance', 'Decrease knee flexion resistance', 'Increase knee extension resistance', 'Change the prosthetic foot'],
              optimalIndex: 2,
              explanation: 'Terminal impact occurs when the knee reaches full extension too rapidly at the end of swing phase. Increasing extension damping (resistance) in the knee unit slows the shank and eliminates the abrupt stop. With a C-Leg, this is adjusted via software.',
            ),
            CaseDecisionPoint(
              prompt: 'The patient also reports difficulty descending stairs. What is the primary advantage of his microprocessor knee for stair descent?',
              options: ['It provides powered knee extension', 'It allows controlled yielding flexion (step-over-step descent)', 'It locks the knee in full extension', 'It increases walking speed on level ground'],
              optimalIndex: 1,
              explanation: 'Microprocessor knees like the C-Leg allow controlled yielding knee flexion during stance, enabling step-over-step stair descent. This is one of the key functional advantages over mechanical knees, which require step-to gait on stairs.',
            ),
          ],
          summaryPearl: 'TF gait deviations are systematically analyzed: abducted gait → check socket fit and length; terminal impact → adjust extension damping; stair descent → MPK advantage. MPKs including the C-Leg substantially reduce falls and stumbles compared to mechanical knees (approximately 64-80% reduction across studies; Hafner 2007, Kahle 2008, Kaufman 2018).',
        ),
      ],
    ),

    // ─────────────────────────────────────────────
    // TAB 3: Orthotic Gait Deviations
    // ─────────────────────────────────────────────
    TopicTab(
      title: 'Orthotic Gait Deviations',
      blocks: [
        HeaderBlock('Orthotic Gait Analysis'),
        TextBlock(
          'Orthotic gait deviations arise when the orthosis does not properly '
          'compensate for the underlying neuromuscular or skeletal deficit, or '
          'when the orthosis itself introduces biomechanical problems.',
          isIntro: true,
        ),
        TableBlock(
          title: 'AFO-Related Gait Deviations',
          columns: ['Deviation', 'Possible Cause', 'Solution'],
          rows: [
            ['Foot slap at initial contact', 'AFO allows too much plantarflexion; dorsiflexor weakness not adequately supported', 'Increase dorsiflexion assist; stiffer anterior trim line'],
            ['Genu recurvatum in stance', 'AFO set in too much plantarflexion; too flexible posterior leaf', 'Set AFO in slight dorsiflexion (5 degrees); use solid ankle or floor reaction AFO'],
            ['Excessive knee flexion in stance', 'AFO set in too much dorsiflexion', 'Reduce dorsiflexion angle; consider floor reaction AFO (FRAFO)'],
            ['Inadequate push-off', 'Solid ankle AFO blocks plantarflexion; too rigid', 'Use posterior leaf spring or carbon fiber AFO'],
            ['Lateral instability', 'Medial-lateral control insufficient', 'Use solid ankle AFO; add medial/lateral flanges'],
            ['Toe drag in swing', 'Insufficient dorsiflexion assist', 'Increase dorsiflexion stop or assist; check trim lines'],
          ],
          headerColor: Colors.green,
        ),
        ComparisonCardBlock(
          title: 'Floor Reaction AFO (FRAFO)',
          themeColor: Colors.teal,
          backgroundColor: const Color(0xFF152A27),
          icon: Icons.architecture,
          description: 'A solid ankle AFO with an anterior proximal shell/tibial cuff that '
              'creates a knee extension moment by blocking tibial advancement. '
              'Used for excessive knee flexion in stance (crouch gait).',
          keyPoints: [
            'Creates a knee EXTENSION moment during stance',
            'Set in slight plantarflexion to enhance extension effect',
            'Indication: quadriceps weakness, crouch gait (cerebral palsy)',
            'Contraindication: knee recurvatum (would worsen hyperextension)',
            'Also called ground reaction AFO or anti-crouch AFO',
            'Requires intact plantarflexion strength or rigid ankle',
          ],
        ),
        BulletCardBlock(
          title: 'KAFO-Related Gait Deviations',
          themeColor: Colors.indigo,
          backgroundColor: const Color(0xFF1A1D2E),
          points: [
            'Circumduction: KAFO too long or knee lock prevents knee flexion in swing',
            'Vaulting: KAFO too long; compensating by rising on contralateral toes',
            'Wide-based gait: medial upright too prominent; uncomfortable medial knee area',
            'Genu recurvatum: KAFO knee joint axis too anterior to anatomic axis',
            'Knee instability: KAFO knee joint axis too posterior; worn or loose locks',
            'Medial or lateral knee thrust: misaligned knee joint axis',
          ],
        ),
        PearlBlock(
          'Board Pearl',
          'AFO set in dorsiflexion creates a knee FLEXION moment (useful for '
          'recurvatum). AFO set in plantarflexion creates a knee EXTENSION '
          'moment (useful for crouch/quad weakness). This ankle-knee coupling '
          'is a fundamental orthotic biomechanics principle.',
        ),
        TableBlock(
          title: 'Orthotic Ankle Position and Knee Effect',
          columns: ['AFO Ankle Position', 'Effect on Knee', 'Indication'],
          rows: [
            ['Dorsiflexion (>0 degrees)', 'Knee flexion moment', 'Genu recurvatum; quadriceps spasticity'],
            ['Neutral (0 degrees)', 'Neutral', 'General foot drop; mild instability'],
            ['Plantarflexion (<0 degrees)', 'Knee extension moment', 'Quadriceps weakness; crouch gait'],
          ],
          headerColor: Colors.teal,
        ),
        BulletCardBlock(
          title: 'Shoe Modifications and Gait Effects',
          themeColor: Colors.brown,
          backgroundColor: const Color(0xFF2A2522),
          points: [
            'Heel lift: compensates for limb length discrepancy or fixed equinus; reduces recurvatum',
            'Rocker bottom sole: substitutes for lost ankle/forefoot motion (fused ankle or MTP joints)',
            'Lateral heel wedge: shifts weight-bearing medially; used for lateral ankle instability or valgus correction',
            'Medial heel wedge: shifts weight-bearing laterally; used for varus correction',
            'Thomas heel: extends medially for medial longitudinal arch support',
            'SACH heel: solid ankle cushion heel; simulates controlled plantarflexion',
            'Metatarsal bar/pad: relieves pressure on metatarsal heads',
          ],
        ),
      ],
    ),

    // ─────────────────────────────────────────────
    // TAB 4: Energy Expenditure
    // ─────────────────────────────────────────────
    TopicTab(
      title: 'Energy Expenditure',
      blocks: [
        HeaderBlock('Energy Expenditure in Amputee Gait'),
        TextBlock(
          'Energy expenditure increases with higher amputation levels and with '
          'vascular (vs traumatic) etiology. Understanding these values is a '
          'commonly tested board topic and is critical for functional outcome '
          'prediction and rehabilitation planning.',
          isIntro: true,
        ),
        TableBlock(
          title: 'Energy Expenditure by Amputation Level (Table 6-5)',
          columns: ['Amputation Level', 'Increase Over Normal (%)', 'Speed Change'],
          rows: [
            ["Syme's amputation", '15%', 'Slightly decreased'],
            ['Traumatic unilateral TT (BKA)', '10-25%', 'Slightly decreased'],
            ['Traumatic bilateral TT (BKA)', '~41%', 'Moderately decreased'],
            ['Traumatic unilateral TF (AKA)', '60-70%', 'Significantly decreased'],
            ['Traumatic bilateral TF (AKA)', '>200%', 'Most use wheelchair'],
            ['Vascular unilateral TT (BKA)', '20-40%', 'Decreased'],
            ['Vascular unilateral TF (AKA)', '65-100%', 'Markedly decreased'],
            ['Hip disarticulation', '100-200%', 'Markedly decreased'],
          ],
          headerColor: Colors.red,
        ),
        PearlBlock(
          'Board Pearl - Two Key Rules',
          '1) Higher level = higher energy cost (TF > TT > Syme\'s). '
          '2) Vascular etiology costs MORE than traumatic at the same level '
          '(vascular TT 20-40% vs traumatic TT 10-25%). These are heavily tested.',
        ),
        BulletCardBlock(
          title: 'Energy Expenditure Principles',
          themeColor: Colors.red,
          backgroundColor: const Color(0xFF2A1519),
          points: [
            'Energy cost measured as O2 consumption per meter walked (mL O2/kg/m)',
            'Amputees self-select a slower walking speed to maintain a comfortable O2 rate',
            'O2 rate (mL O2/kg/min) may remain near normal at self-selected speed',
            'O2 cost (mL O2/kg/m) is always increased regardless of speed',
            'Longer residual limbs are more energy efficient (better lever arm)',
            'Bilateral amputees have significantly higher energy cost than unilateral',
            'Bilateral TF amputees often choose wheelchair over prosthetic ambulation',
          ],
        ),
        ComparisonCardBlock(
          title: 'Wheelchair vs Prosthetic Ambulation',
          themeColor: Colors.blue,
          backgroundColor: const Color(0xFF1A2332),
          icon: Icons.accessible,
          description: 'For higher-level amputees, wheelchair propulsion may be '
              'more energy-efficient than prosthetic ambulation, which is an '
              'important factor in rehabilitation planning.',
          keyPoints: [
            'Wheelchair propulsion in paraplegia: only ~9% increase over normal walking',
            'Crutch walking without prosthesis requires MORE energy than prosthetic walking',
            'Bilateral TF amputees: >200% increase with prostheses vs ~9% with wheelchair',
            'Many bilateral TF amputees use prostheses for transfers and standing only',
            'Rehabilitation goal should be functional independence, not always ambulation',
          ],
        ),
        PearlBlock(
          'Board Pearl',
          'Wheelchair propulsion in paraplegia increases energy expenditure by '
          'only ~9% above normal walking. This is far less than prosthetic '
          'walking for bilateral TF amputees (>200%). Crutch walking is MORE '
          'energy-expensive than walking with a prosthesis.',
        ),
        BulletCardBlock(
          title: 'Factors Affecting Energy Expenditure',
          themeColor: Colors.orange,
          backgroundColor: const Color(0xFF2A2215),
          points: [
            'Amputation level: most important factor (higher = more energy)',
            'Etiology: vascular > traumatic at same level',
            'Residual limb length: longer is more efficient',
            'Age: older patients have higher relative energy cost',
            'Comorbidities: cardiac, pulmonary disease limit exercise capacity',
            'Prosthetic components: energy-storing feet reduce O2 cost by 5-20%',
            'Socket fit: poor fit increases compensatory movements and energy cost',
            'Gait deviations: each deviation adds to total energy expenditure',
            'Conditioning: aerobic training can improve efficiency',
          ],
        ),
        TableBlock(
          title: 'K-Levels and Functional Classification',
          columns: ['K-Level', 'Description', 'Expected Prosthetic Components'],
          rows: [
            ['K0', 'Does not have ability or potential to ambulate or transfer', 'No prosthesis or cosmetic only'],
            ['K1', 'Has ability to use prosthesis for transfers or household ambulation on level surfaces at fixed cadence (limited/unlimited household ambulator)', 'SACH foot; single-axis knee; basic components'],
            ['K2', 'Has ability to traverse low-level environmental barriers (limited community ambulator)', 'Multiaxis foot; stance-control knee'],
            ['K3', 'Has ability to traverse most environmental barriers; variable cadence (unlimited community ambulator)', 'Energy-storing foot; fluid-controlled knee'],
            ['K4', 'Exceeds basic ambulation; high-impact activities, sports, child prosthetic needs', 'High-activity feet; specialized sport components'],
          ],
          headerColor: Colors.indigo,
        ),
        PearlBlock(
          'Board Pearl',
          'K-levels determine Medicare coverage for prosthetic components. '
          'K0 patients do not receive functional prostheses. K3/K4 patients '
          'qualify for energy-storing feet and microprocessor knees. The '
          'prescribing physician must document the K-level.',
        ),
        PearlBlock(
          'Board Pearl',
          'K-level is based on FUNCTIONAL POTENTIAL, not just current ability. '
          'A fit 45-year-old who just had a traumatic BKA may be classified K3 '
          '(community ambulator) even before receiving a prosthesis, based on '
          'expected recovery trajectory.',
        ),
        CheckpointBlock(
          question: 'Compared to a traumatic transtibial amputee, a vascular transtibial amputee will have:',
          options: ['Lower energy expenditure', 'Same energy expenditure', 'Higher energy expenditure', 'Energy expenditure depends only on prosthetic foot type'],
          correctIndex: 2,
          explanation: 'Vascular amputees consistently require MORE energy than traumatic amputees at the same amputation level. Vascular TT: ~40% increase vs traumatic TT: ~25% increase. This is due to comorbidities (diabetes, PVD, deconditioning) rather than the amputation itself.',
        ),
      ],
    ),

    // ─────────────────────────────────────────────
    // TAB 5: Instrumented Gait Analysis
    // ─────────────────────────────────────────────
    TopicTab(
      title: 'Instrumented Gait Analysis',
      blocks: [
        HeaderBlock('Instrumented Gait Analysis'),
        TextBlock(
          'Instrumented gait analysis provides objective, quantitative measurement '
          'of gait parameters that supplements clinical (observational) gait '
          'analysis. Understanding the components and their measurements is '
          'board-relevant.',
          isIntro: true,
        ),
        TableBlock(
          title: 'Components of Instrumented Gait Analysis',
          columns: ['Component', 'What It Measures'],
          rows: [
            ['Motion capture (kinematics)', 'Joint angles and segment positions in three dimensions'],
            ['Force plates (kinetics)', 'Ground reaction forces in three planes'],
            ['Electromyography (EMG)', 'Timing and relative intensity of muscle activation'],
            ['Metabolic cart', 'Oxygen consumption and energy expenditure'],
            ['Pedobarography', 'Plantar pressure distribution'],
          ],
          headerColor: Colors.blueGrey,
        ),
        PearlBlock(
          'Board Pearl',
          'Marker-based optoelectronic systems (e.g., Vicon, Qualisys) remain '
          'the gold standard for 3D kinematic analysis. Reflective markers are '
          'placed on anatomical landmarks and tracked by multiple infrared cameras.',
        ),
        HeaderBlock('Joint Kinetics Definitions'),
        TableBlock(
          title: 'Key Kinetic Definitions',
          columns: ['Term', 'Definition'],
          rows: [
            ['Joint moment (torque)', 'Net rotational force about a joint; product of internal muscle force and its moment arm'],
            ['Joint power', 'Rate of energy generation or absorption at a joint; product of moment and angular velocity'],
            ['Positive power', 'Concentric muscle contraction; energy is generated'],
            ['Negative power', 'Eccentric muscle contraction; energy is absorbed'],
          ],
          headerColor: Colors.deepPurple,
        ),
        TableBlock(
          title: 'Major Power Events in Gait',
          columns: ['Power Event', 'Joint', 'Phase', 'Type', 'Clinical Significance'],
          rows: [
            ['H1', 'Hip', 'Loading response', 'Absorption (eccentric)', 'Gluteus maximus controls hip flexion'],
            ['H3', 'Hip', 'Preswing', 'Generation (concentric)', 'Iliopsoas advances the limb'],
            ['K1', 'Knee', 'Loading response', 'Absorption (eccentric)', 'Quadriceps absorb shock'],
            ['K3', 'Knee', 'Preswing', 'Absorption (eccentric)', 'Quadriceps control rapid knee flexion'],
            ['A1', 'Ankle', 'Midstance', 'Absorption (eccentric)', 'Plantar flexors control tibial advancement'],
            ['A2', 'Ankle', 'Preswing', 'Generation (concentric)', 'Plantar flexors generate push-off (LARGEST power burst)'],
          ],
          headerColor: Colors.red,
        ),
        PearlBlock(
          'Board Pearl',
          'The A2 power burst at the ankle during preswing (push-off) is the '
          'single largest power event in gait and generates ~80% of the energy '
          'for forward propulsion. The ankle plantar flexors are therefore the '
          'most important muscle group for energy-efficient walking.',
        ),
        HeaderBlock('Anterior-Posterior Ground Reaction Force'),
        BulletCardBlock(
          title: 'AP GRF Components',
          themeColor: Colors.green,
          backgroundColor: const Color(0xFF152A1A),
          points: [
            'Braking force (posteriorly directed): occurs during loading response and early midstance',
            'Propulsive force (anteriorly directed): occurs during terminal stance and preswing (push-off)',
            'In normal symmetric gait, braking impulse of one limb equals propulsive impulse of the other',
            'Prosthetic limbs typically generate reduced peak vertical forces and braking forces vs intact limb',
            'Chronic overloading of the intact (sound) limb may contribute to accelerated joint degeneration',
            'Greater knee adduction moment on intact side = risk factor for medial compartment OA',
          ],
        ),
        PearlBlock(
          'Board Pearl',
          'GRF vector position relative to joint centers determines joint moments. '
          'GRF posterior to knee = flexion moment (quads needed). GRF anterior to '
          'knee = extension moment (passive stability). In TF prosthetics, the socket '
          'is aligned so GRF passes anterior to the prosthetic knee axis for stance stability.',
        ),
      ],
    ),
  ],
);

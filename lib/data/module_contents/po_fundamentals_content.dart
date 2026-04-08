import 'package:flutter/material.dart';
import '../models/topic_content_model.dart';

final poFundamentalsContent = TopicData(
  id: 'po_fundamentals',
  title: 'P&O Fundamentals',
  tabs: [
    // ─────────────────────────────────────────────
    // TAB 1: Terminology
    // ─────────────────────────────────────────────
    TopicTab(
      title: 'Terminology',
      blocks: [
        HeaderBlock('Gait Cycle Terminology'),
        TextBlock(
          'The gait cycle is the fundamental unit of walking, defined as the '
          'interval between two successive initial contacts of the same foot. '
          'Understanding these definitions is essential for board review.',
          isIntro: true,
        ),
        BulletCardBlock(
          title: 'Key Definitions',
          themeColor: Colors.blue,
          backgroundColor: const Color(0xFF1A2332),
          points: [
            'Gait cycle (stride): interval from initial contact of one foot to next initial contact of the SAME foot',
            'Step: interval from initial contact of one foot to initial contact of the OPPOSITE foot',
            'Stride length: distance covered in one full gait cycle (average ~1.4 m)',
            'Step length: distance from heel of one foot to heel of opposite foot at initial contact',
            'Cadence: number of steps per unit time (average ~113 steps/min)',
            'Walking velocity = cadence x step length',
            'Base of support (BOS): lateral distance between two feet during gait (~5-10 cm)',
          ],
        ),
        PearlBlock(
          'Board Pearl',
          'Stride = 2 steps. Stride length is measured from heel to heel of the '
          'SAME foot. Step length is measured from heel to heel of OPPOSITE feet.',
        ),
        BulletCardBlock(
          title: 'Center of Gravity (COG)',
          themeColor: Colors.teal,
          backgroundColor: const Color(0xFF152A27),
          points: [
            'Located 5 cm anterior to S2 vertebral body',
            'Vertical displacement: <5 cm (approximately 5 cm total excursion)',
            'Horizontal (lateral) displacement: <5 cm (approximately 5 cm total excursion)',
            'Lowest point: during double-limb support (loading response)',
            'Highest point: during single-limb support (midstance)',
            'COG follows a sinusoidal path in both vertical and horizontal planes',
          ],
        ),
        PearlBlock(
          'Board Pearl',
          'COG is LOWEST during loading response (double-limb support) and '
          'HIGHEST during midstance (single-limb support). This is a commonly '
          'tested concept.',
        ),
        BulletCardBlock(
          title: 'Normal Gait Parameters',
          themeColor: Colors.indigo,
          backgroundColor: const Color(0xFF1A1D2E),
          points: [
            'Comfortable walking speed: 80 m/min (approximately 3 mph)',
            'Normal cadence: ~113 steps/min',
            'Stance phase: 60% of gait cycle',
            'Swing phase: 40% of gait cycle',
            'Double-limb support: ~20% of gait cycle (two periods of ~10% each)',
            'Single-limb support: ~40% of gait cycle',
            'As speed increases, stance phase shortens and swing phase increases',
            'Running: no double-limb support; instead has a "float" phase',
          ],
        ),
        PearlBlock(
          'Board Pearl',
          'Double-limb support DECREASES with increasing gait speed and '
          'DISAPPEARS entirely in running. In pathologic gait, double-limb '
          'support time INCREASES to improve stability.',
        ),
      ],
    ),

    // ─────────────────────────────────────────────
    // TAB 2: Gait Cycle
    // ─────────────────────────────────────────────
    TopicTab(
      title: 'Gait Cycle',
      blocks: [
        HeaderBlock('Interactive Gait Cycle'),
        TextBlock('Tap each phase below to explore details. The timeline shows stance (teal, 0-60%) vs swing (amber, 60-100%).'),
        GaitCycleBlock(),
        HeaderBlock('Phases of the Gait Cycle'),
        TextBlock(
          'The gait cycle is divided into stance phase (60%) and swing phase (40%). '
          'Rancho Los Amigos terminology is the standard nomenclature used in '
          'rehabilitation medicine and is essential for board review.',
          isIntro: true,
        ),
        HeaderBlock('Stance Phase (60% of Gait Cycle)'),
        MnemonicBlock(
          'I Like My Tea Presweetened',
          'Initial contact, Loading response, Midstance, Terminal stance, Preswing '
          '-- the 5 subdivisions of stance phase.',
        ),
        NumberedListBlock([
          MapEntry(
            'Initial Contact (0-2%)',
            'Heel strikes the ground. Hip is flexed ~30 degrees, knee is extended, '
            'ankle is in neutral dorsiflexion. The pretibial muscles (tibialis anterior) '
            'eccentrically control plantarflexion. Heel rocker (first rocker) begins.',
          ),
          MapEntry(
            'Loading Response (2-12%)',
            'Period of initial double-limb support. Body weight transfers onto the '
            'stance limb. Knee flexes ~15 degrees (shock absorption). Ankle plantarflexes '
            'to foot flat. Quadriceps eccentrically control knee flexion. '
            'COG is at its LOWEST point.',
          ),
          MapEntry(
            'Midstance (12-31%)',
            'Begins when opposite foot lifts off (single-limb support begins). '
            'Body advances over the stationary foot. Ankle rocker (second rocker). '
            'Hip extends from flexion toward neutral. Gluteus medius stabilizes '
            'the pelvis. COG is at its HIGHEST point.',
          ),
          MapEntry(
            'Terminal Stance (31-50%)',
            'Heel rises off ground. Forefoot rocker (third rocker). Body advances '
            'anterior to the forefoot. Hip reaches maximum extension (~10 degrees). '
            'Ankle dorsiflexion peaks at ~10 degrees. Opposite leg contacts ground, '
            'ending single-limb support.',
          ),
          MapEntry(
            'Preswing (50-62%)',
            'Second period of double-limb support. Weight transfers to opposite limb. '
            'Rapid ankle plantarflexion (push-off via gastrocnemius/soleus). '
            'Knee flexes to ~35-40 degrees. Hip begins to flex. Sometimes called '
            '"toe off" in older terminology.',
          ),
        ]),
        HeaderBlock('Swing Phase (40% of Gait Cycle)'),
        MnemonicBlock(
          'In My Teapot',
          'Initial swing, Midswing, Terminal swing '
          '-- the 3 subdivisions of swing phase.',
        ),
        NumberedListBlock([
          MapEntry(
            'Initial Swing (62-75%)',
            'Foot lifts off ground. Hip flexors (iliopsoas) advance the limb. '
            'Knee flexes to maximum (~60 degrees) for ground clearance. '
            'Ankle dorsiflexes toward neutral.',
          ),
          MapEntry(
            'Midswing (75-87%)',
            'Limb passes directly beneath the body. Hip continues to flex. '
            'Knee begins to extend. Ankle dorsiflexes to neutral. Tibialis anterior '
            'maintains dorsiflexion for clearance.',
          ),
          MapEntry(
            'Terminal Swing (87-100%)',
            'Limb decelerates in preparation for next initial contact. Hamstrings '
            'eccentrically decelerate the swinging leg. Knee reaches full extension. '
            'Hip is flexed ~30 degrees. Ankle is in neutral dorsiflexion.',
          ),
        ]),
        TableBlock(
          title: 'Rocker Mechanisms of the Foot',
          columns: ['Rocker', 'Pivot Point', 'Phase', 'Motion'],
          rows: [
            ['First (Heel)', 'Heel', 'Initial contact', 'Ankle plantarflexion'],
            ['Second (Ankle)', 'Ankle', 'Midstance', 'Tibial advancement'],
            ['Third (Forefoot)', 'MTP joints', 'Terminal stance', 'Heel rise'],
          ],
          headerColor: Colors.blueGrey,
        ),
        PearlBlock(
          'Board Pearl',
          'Three rockers: Heel rocker (1st) at initial contact, Ankle rocker '
          '(2nd) at midstance, Forefoot rocker (3rd) at terminal stance. '
          'Loss of any rocker significantly impairs gait efficiency.',
        ),
        CheckpointBlock(
          question: 'During which phase of gait does the body\'s center of gravity reach its highest point?',
          options: ['Loading response', 'Midstance', 'Terminal stance', 'Midswing'],
          correctIndex: 1,
          explanation: 'The center of gravity reaches its highest point during midstance, when the body vaults over the stance limb. This is one of the six determinants of gait that minimizes vertical displacement.',
        ),
      ],
    ),

    // ─────────────────────────────────────────────
    // TAB 3: Biomechanics
    // ─────────────────────────────────────────────
    TopicTab(
      title: 'Biomechanics',
      blocks: [
        HeaderBlock('Muscle Activity During the Gait Cycle'),
        TextBlock(
          'Understanding which muscles are active during each phase of gait is '
          'critical for analyzing gait deviations and prescribing appropriate '
          'orthotic and prosthetic interventions.',
          isIntro: true,
        ),
        TableBlock(
          title: 'Major Muscle Activity During Gait',
          columns: ['Muscle', 'Active Phase(s)', 'Action', 'Contraction Type'],
          rows: [
            ['Tibialis anterior', 'Initial contact, Loading response, Swing', 'Controls plantarflexion at IC; maintains dorsiflexion in swing', 'Eccentric (stance), Concentric (swing)'],
            ['Gastrocnemius/Soleus', 'Midstance, Terminal stance, Preswing', 'Controls tibial advancement; generates push-off power', 'Eccentric (mid), Concentric (pre)'],
            ['Quadriceps', 'Loading response, Terminal swing', 'Controls knee flexion at LR; extends knee at terminal swing', 'Eccentric (LR), Concentric (TS)'],
            ['Hamstrings', 'Terminal swing, Initial contact', 'Decelerates swinging leg; controls hip flexion', 'Eccentric'],
            ['Gluteus maximus', 'Initial contact, Loading response', 'Controls hip flexion; extends hip', 'Eccentric then concentric'],
            ['Gluteus medius', 'Midstance (single-limb support)', 'Stabilizes pelvis; prevents contralateral pelvic drop', 'Isometric/concentric'],
            ['Iliopsoas', 'Preswing, Initial swing', 'Initiates hip flexion for swing advancement', 'Concentric'],
            ['Hip adductors', 'Initial swing, Midswing', 'Stabilize swinging limb', 'Concentric'],
          ],
          headerColor: Colors.deepPurple,
        ),
        PearlBlock(
          'Board Pearl',
          'Tibialis anterior is active at BOTH ends of the gait cycle: eccentrically '
          'at initial contact/loading response to control foot slap, and concentrically '
          'during swing to maintain dorsiflexion for ground clearance.',
        ),
        BulletCardBlock(
          title: 'Joint Moments and Powers',
          themeColor: Colors.deepOrange,
          backgroundColor: const Color(0xFF2A1D19),
          points: [
            'Ankle generates the largest power burst during gait (A2 power burst at push-off)',
            'Push-off generates ~80% of the energy for forward propulsion',
            'Hip extension moment in early stance prevents trunk from falling forward',
            'Knee flexion moment in loading response absorbs shock (K1 absorption)',
            'Hip flexion moment in preswing advances the limb into swing',
            'The ankle plantar flexors are the most important muscle group for normal gait',
          ],
        ),
        BulletCardBlock(
          title: 'Ground Reaction Force (GRF)',
          themeColor: Colors.green,
          backgroundColor: const Color(0xFF152A1A),
          points: [
            'GRF has three components: vertical, anterior-posterior, medial-lateral',
            'Vertical GRF shows M-shaped pattern with peaks at loading response and terminal stance',
            'First peak (F1): body weight acceptance at loading response (~110% body weight)',
            'Trough: occurs at midstance as COG is at highest point',
            'Second peak (F2): push-off at terminal stance (~110% body weight)',
            'GRF vector relationship to joint center determines internal joint moment',
          ],
        ),
        PearlBlock(
          'Board Pearl',
          'The M-shaped vertical GRF pattern with two peaks exceeding body weight '
          'and a trough at midstance is a classic board question. The trough occurs '
          'because COG is at its highest (potential energy peak) at midstance.',
        ),
        CheckpointBlock(
          question: 'Which power event generates the LARGEST burst of energy during normal gait?',
          options: ['H1 (hip flexion at push-off)', 'K1 (knee extension at loading)', 'A2 (ankle plantarflexion at push-off)', 'H3 (hip extension at initial contact)'],
          correctIndex: 2,
          explanation: 'The A2 power burst (ankle plantarflexion at push-off) is the largest power event in normal gait, generating the propulsive force for forward progression. This is why ESAR prosthetic feet that store and return energy at push-off improve gait efficiency.',
        ),
      ],
    ),

    // ─────────────────────────────────────────────
    // TAB 4: Determinants of Gait
    // ─────────────────────────────────────────────
    TopicTab(
      title: 'Determinants of Gait',
      blocks: [
        HeaderBlock('Six Determinants of Gait'),
        TextBlock(
          'The six determinants of gait were described by Saunders, Inman, and '
          'Eberhart (1953). They minimize vertical and lateral excursion of the '
          'center of gravity, thereby reducing energy expenditure during walking. '
          'Without these determinants, the COG would follow an arc of much greater '
          'displacement.',
          isIntro: true,
        ),
        TableBlock(
          title: 'The 6 Determinants of Gait',
          columns: ['#', 'Determinant', 'Mechanism', 'Effect on COG'],
          rows: [
            ['1', 'Pelvic rotation', 'Pelvis rotates ~4 degrees forward on swing side', 'Raises lowest point of COG arc; reduces vertical displacement'],
            ['2', 'Pelvic tilt (list)', 'Swing-side pelvis drops ~5 degrees', 'Lowers highest point of COG arc; reduces vertical displacement'],
            ['3', 'Knee flexion in stance', 'Knee flexes ~15 degrees in loading response', 'Lowers highest point of COG arc; absorbs shock'],
            ['4', 'Foot mechanisms', 'Heel strike with ankle plantarflexion; ankle rocker', 'Smooths transition at initial contact; reduces abrupt COG descent'],
            ['5', 'Knee mechanisms', 'Knee and ankle coordinated flexion/extension', 'Smooths COG pathway at midstance transition'],
            ['6', 'Lateral displacement of pelvis', 'Relative adduction of femur narrows BOS', 'Reduces lateral COG excursion to ~5 cm total'],
          ],
          headerColor: Colors.teal,
        ),
        PearlBlock(
          'Board Pearl',
          'The 6 determinants function to minimize the excursion of the COG. '
          'Determinants 1-3 minimize VERTICAL displacement. Determinant 6 minimizes '
          'LATERAL displacement. This keeps the COG path as a smooth, low-amplitude '
          'sinusoidal wave.',
        ),
        BulletCardBlock(
          title: 'Clinical Significance',
          themeColor: Colors.orange,
          backgroundColor: const Color(0xFF2A2215),
          points: [
            'Loss of any determinant increases energy expenditure of gait',
            'Knee fusion eliminates determinant #3 (knee flexion in stance) and increases vertical COG excursion',
            'Ankle fusion eliminates determinant #4 (foot mechanisms) and disrupts heel and ankle rockers',
            'Hip abductor weakness eliminates effective pelvic tilt control',
            'Trendelenburg gait results from loss of pelvic stability (determinant #2)',
            'Prosthetic and orthotic design aims to restore as many determinants as possible',
          ],
        ),
        ComparisonCardBlock(
          title: 'Compass Gait (Without Determinants)',
          themeColor: Colors.red,
          backgroundColor: const Color(0xFF2A1519),
          icon: Icons.warning_amber_rounded,
          description: 'Without the 6 determinants, walking would resemble the arc of '
              'a compass with stiff legs, resulting in much greater COG displacement '
              'and dramatically increased energy expenditure.',
          keyPoints: [
            'Vertical COG displacement would be ~9.5 cm (vs ~5 cm with determinants)',
            'Abrupt directional changes at each step',
            'Each step would require lifting the entire body weight over a rigid lever',
            'Energy cost would be dramatically higher',
          ],
        ),
        BulletCardBlock(
          title: 'Pathologic Gait Compensations',
          themeColor: Colors.purple,
          backgroundColor: const Color(0xFF2A1A2E),
          points: [
            'Vaulting: rising on toes of stance limb to clear swing limb (compensates for limb length discrepancy or inadequate knee flexion)',
            'Circumduction: semicircular swing of leg (compensates for inability to shorten limb in swing)',
            'Hip hiking: elevation of pelvis on swing side (compensates for weak dorsiflexors or limb length discrepancy)',
            'Lateral trunk lean: leaning trunk over stance limb (compensates for hip abductor weakness)',
            'Steppage gait: exaggerated hip and knee flexion (compensates for foot drop)',
          ],
        ),
        PearlBlock(
          'Board Pearl',
          'Energy expenditure of gait increases whenever the smooth sinusoidal '
          'path of the COG is disrupted. Pathologic compensations themselves '
          'also increase energy cost. This is why prosthetic and orthotic design '
          'focuses on restoring normal gait determinants.',
        ),
        PearlBlock(
          'Board Pearl',
          'Prosthetic and orthotic design aims to restore as many gait '
          'determinants as possible. An energy-storing prosthetic foot partially '
          'restores determinant 4 (foot mechanisms). A microprocessor knee can '
          'partially restore determinants 3 (knee flexion in stance) and 5 '
          '(knee mechanisms).',
        ),
      ],
    ),

    // ─────────────────────────────────────────────
    // TAB 5: Epidemiology of Limb Loss
    // ─────────────────────────────────────────────
    TopicTab(
      title: 'Epidemiology',
      blocks: [
        HeaderBlock('Epidemiology of Limb Loss'),
        TextBlock(
          'Understanding the prevalence, etiology, and trends in limb loss is '
          'essential for board review. The US has a substantial and growing '
          'population of individuals living with limb loss or limb difference.',
          isIntro: true,
        ),
        TableBlock(
          title: 'Limb Loss Prevalence in the United States',
          columns: ['Metric', 'Value'],
          rows: [
            ['Total Americans with limb loss or limb difference', '~5.6 million'],
            ['Acquired limb loss (amputation)', '~2.3 million'],
            ['Congenital limb difference', '~3.4 million'],
            ['New amputations per year', '~465,000'],
            ['Children born with limb difference per year', '~43,000'],
            ['Lower extremity amputations as % of total', '~83%'],
            ['Upper extremity amputations as % of total', '~17%'],
            ['Most common individual procedure', 'Toe amputation'],
          ],
          headerColor: Colors.blue,
        ),
        PearlBlock(
          'Board Pearl',
          'Lower extremity amputations account for 83% of all amputations. '
          'Toe amputations are the single most common procedure. The typical '
          'amputee in the US is an older adult with diabetes and peripheral '
          'vascular disease -- not a young trauma victim.',
        ),
        TableBlock(
          title: 'Ziegler-Graham Prevalence Projections',
          columns: ['Projection Metric', 'Original (2008)', 'Updated (2024)'],
          rows: [
            ['Baseline prevalence', '1.6 million (2005)', '2.3 million (2019)'],
            ['2050 projection', '3.6 million', 'Significantly higher than original'],
            ['2060 projection', 'Not calculated', '145% increase from 2019 baseline'],
            ['Primary disease driver', 'Dysvascular/diabetes (54%)', 'Diabetes (+67% by 2060); PVD (+36% by 2060)'],
          ],
          headerColor: Colors.orange,
        ),
        PearlBlock(
          'Board Pearl',
          'The prevalence of limb loss in the US is projected to more than '
          'double by 2060, driven primarily by the diabetes epidemic. Current '
          'estimates already exceed original Ziegler-Graham projections.',
        ),
        BulletCardBlock(
          title: 'Etiology of Amputation',
          themeColor: Colors.red,
          backgroundColor: const Color(0xFF2A1519),
          points: [
            'Dysvascular/diabetic: leading cause (~54% of all amputations)',
            'Trauma: second leading cause (typical patient: young to middle-aged male)',
            'Malignancy: ~5-10% (osteosarcoma, Ewing sarcoma, chondrosarcoma)',
            'Congenital limb deficiency: ~43,000 children born/year in the US',
            'Trauma is the leading cause of UPPER extremity amputations',
            'Dysvascular disease is the leading cause of LOWER extremity amputations',
            'Adults aged 65+ comprise ~45% of limb loss population',
            'Adults aged 45-64 account for ~42%',
          ],
        ),
        BulletCardBlock(
          title: 'Age Distribution',
          themeColor: Colors.purple,
          backgroundColor: const Color(0xFF2A1A2E),
          points: [
            'Adults aged 65+: approximately 45% of limb loss population',
            'Adults aged 45-64: approximately 42%',
            'Combined 45+: vast majority of amputees in the US',
            'Traumatic amputees tend to be younger with better functional outcomes',
            'Traumatic amputees typically have longer residual limbs (better tissue perfusion)',
          ],
        ),
        CheckpointBlock(
          question: 'What is the most common level of lower extremity amputation?',
          options: ['Transtibial (BKA)', 'Transfemoral (AKA)', 'Toe amputation', 'Syme amputation'],
          correctIndex: 2,
          explanation: 'Toe amputation is the most common level of LE amputation, largely due to the high prevalence of diabetes and peripheral vascular disease. However, transtibial is the most common major amputation level.',
        ),
      ],
    ),

    // ─────────────────────────────────────────────
    // TAB 6: Amputation Levels
    // ─────────────────────────────────────────────
    TopicTab(
      title: 'Amputation Levels',
      blocks: [
        HeaderBlock('Lower Extremity Amputation Levels'),
        TextBlock(
          'Amputation levels are classified from proximal to distal. Each '
          'level carries different implications for healing, prosthetic fitting, '
          'functional outcome, and energy expenditure.',
          isIntro: true,
        ),
        TableBlock(
          title: 'LE Amputation Levels (Proximal to Distal)',
          columns: ['Level', 'Description', 'Key Features'],
          rows: [
            ['Hemipelvectomy', 'Removal of entire LE including half the pelvis', 'Most proximal LE amputation; rarely performed; pelvic tumors'],
            ['Hip disarticulation', 'Through the hip joint', 'No residual femoral lever arm; significant prosthetic challenges'],
            ['Transfemoral (AKA)', 'Through femoral shaft, above the knee', 'Loss of anatomic knee; energy expenditure traumatic TF 60-70% / vascular TF 65-100% above normal'],
            ['Knee disarticulation', 'Through the knee joint', 'Excellent end-bearing; bulbous distal end; long lever arm'],
            ['Transtibial (BKA)', 'Through tibia and fibula, below the knee', 'Preserves the knee; most common major LE amputation for prosthetic rehab'],
            ['Syme amputation', 'Ankle disarticulation with heel pad preservation', 'Allows limited end-bearing; requires patent posterior tibial artery'],
            ['Chopart', 'Through talonavicular and calcaneocuboid joints', 'Preserves hindfoot; risk of equinovarus without tendon balancing'],
            ['Lisfranc', 'Through tarsometatarsal joints', 'Preserves hindfoot and midfoot; may require AFO for push-off'],
            ['Transmetatarsal', 'Through metatarsal shafts', 'Good functional outcome; shoe filler often sufficient'],
            ['Ray resection', 'Removal of toe and corresponding metatarsal', 'Narrows forefoot; minimal gait impact with single ray'],
            ['Toe amputation', 'Removal of one or more toes', 'Most common amputation overall; great toe loss most significant'],
          ],
          headerColor: Colors.indigo,
        ),
        PearlBlock(
          'Board Pearl',
          'Toe amputation is the most common amputation procedure overall. '
          'Among major amputations, transtibial (BKA) is most important for '
          'prosthetic rehab because it preserves the knee -- ~90% of TT amputees '
          'achieve prosthetic walking vs only ~25% of geriatric vascular TF amputees.',
        ),
        HeaderBlock('Transtibial Amputation - Optimal Residual Limb'),
        BulletCardBlock(
          title: 'TT Residual Limb Considerations',
          themeColor: Colors.blue,
          backgroundColor: const Color(0xFF1A2332),
          points: [
            'Ideal tibial length: 12-15 cm retained',
            'Fibula cut 1-2 cm shorter than tibia to prevent distal prominence',
            'Anterior tibial crest beveled to reduce pressure on overlying skin',
            'Avoid distal third of tibia (poorest soft tissue coverage)',
            'Need 17-22 cm clearance between residual limb end and ground for prosthetic foot-pylon system',
          ],
        ),
        HeaderBlock('Transfemoral Amputation Considerations'),
        BulletCardBlock(
          title: 'TF Residual Limb Considerations',
          themeColor: Colors.deepOrange,
          backgroundColor: const Color(0xFF2A1D19),
          points: [
            'Longer residual limb is generally preferable (greater lever arm, more muscle retention)',
            'Minimum ~10 cm above knee joint line needed for prosthetic fitting',
            'Very short TF limbs (<5-7 cm below greater trochanter) function like hip disarticulations',
            'Insufficient lever arm for effective prosthetic control with very short limbs',
          ],
        ),
        HeaderBlock('Knee Disarticulation'),
        TableBlock(
          title: 'Knee Disarticulation: Advantages vs Disadvantages',
          columns: ['Advantages', 'Disadvantages'],
          rows: [
            ['Excellent end-bearing surface (femoral condyles)', 'Bulbous distal end creates cosmetic/fitting challenges'],
            ['Long lever arm for prosthetic control', 'Knee center of prosthetic knee is distal to contralateral knee'],
            ['Easier donning/doffing (self-suspending shape)', 'Prosthetic knee options more limited than shorter TF limbs'],
            ['Preserves femoral muscle attachments', 'Leg length discrepancy with prosthetic knee added distally'],
            ['Good proprioceptive feedback via intact condyles', ''],
          ],
          headerColor: Colors.teal,
        ),
        HeaderBlock('Upper Extremity Amputation Levels'),
        TableBlock(
          title: 'UE Amputation Levels (Proximal to Distal)',
          columns: ['Level', 'Description', 'Prosthetic Implications'],
          rows: [
            ['Forequarter (interscapulothoracic)', 'Removal of entire UE including scapula and lateral clavicle', 'Most proximal UE amputation; primarily cosmetic'],
            ['Shoulder disarticulation', 'Through the glenohumeral joint', 'Very limited prosthetic function'],
            ['Transhumeral (AEA)', 'Through the humeral shaft, above the elbow', 'Loss of anatomic elbow; dual-cable body-powered system needed'],
            ['Elbow disarticulation', 'Through the elbow joint', 'Preserves humeral rotation; self-suspending; cosmetic length issue'],
            ['Transradial (BEA)', 'Through radius and ulna, below the elbow', 'Preserves elbow; MOST FUNCTIONAL level for prosthetic use'],
            ['Wrist disarticulation', 'Through the wrist joint', 'Excellent forearm rotation; limited space for wrist unit'],
            ['Transcarpal (partial hand)', 'Through the carpal bones', 'Preserves some wrist function'],
            ['Finger amputation', 'Through the phalanges', 'Thumb loss is most functionally significant'],
          ],
          headerColor: Colors.deepPurple,
        ),
        PearlBlock(
          'Board Pearl',
          'Trauma is the leading cause of UPPER extremity amputation (unlike '
          'LE, where vascular disease predominates). The transradial level is '
          'the most functional UE amputation level because it preserves the '
          'elbow, provides good lever arm, and retains forearm rotation.',
        ),
        PearlBlock(
          'Board Pearl',
          'Syme amputation requires a patent posterior tibial artery. Despite '
          'being more proximal than Chopart or Lisfranc, it is often more '
          'energy-efficient because midfoot amputations frequently develop '
          'equinovarus contracture that impairs function.',
        ),
      ],
    ),

    // ─────────────────────────────────────────────
    // TAB 7: Level Selection & MESS
    // ─────────────────────────────────────────────
    TopicTab(
      title: 'Level Selection & MESS',
      blocks: [
        HeaderBlock('Amputation Level Selection Principles'),
        TextBlock(
          'The decision regarding amputation level balances maximizing healing '
          'potential (favors proximal) versus maximizing functional outcome '
          '(favors distal to preserve joints and lever arm).',
          isIntro: true,
        ),
        TableBlock(
          title: 'Fundamental Decision-Making Principles',
          columns: ['Principle', 'Clinical Application'],
          rows: [
            ['Preserve length whenever possible', 'Longer residual limbs provide better lever arms and retain more musculature'],
            ['Preserve joints whenever possible', 'Knee preservation is the single most important factor for prosthetic walking success'],
            ['Ensure adequate tissue perfusion', 'TcPO2 >40 mmHg at proposed level predicts healing'],
            ['Provide adequate soft tissue coverage', 'Muscle and skin flaps must cover bone end without tension'],
            ['Preserve functional muscle attachments', 'Myodesis or myoplasty secures muscles to bone for active control'],
            ['Create a durable, pain-free residual limb', 'Free of adherent scars, neuromas, bone spurs, bony prominences'],
          ],
          headerColor: Colors.blue,
        ),
        HeaderBlock('Knee Preservation - The Critical Decision'),
        TableBlock(
          title: 'BKA vs AKA Comparison',
          columns: ['Factor', 'Transtibial (BKA)', 'Transfemoral (AKA)'],
          rows: [
            ['Prosthetic walking success rate', '~90% (overall); higher in traumatic', '~25% (geriatric vascular)'],
            ['Energy cost increase', '~25-40% above normal', '~60-100% above normal'],
            ['Healing rate', 'Lower in vascular patients', 'Higher in vascular patients'],
            ['Rehabilitation potential', 'Substantially better', 'Substantially worse'],
          ],
          headerColor: Colors.green,
        ),
        PearlBlock(
          'Board Pearl',
          'Knee preservation is the single most important factor for prosthetic '
          'rehabilitation success. ~90% of transtibial amputees achieve prosthetic '
          'walking vs only ~25% of geriatric vascular transfemoral amputees. Every '
          'effort should be made to preserve the knee when tissue perfusion is adequate.',
        ),
        HeaderBlock('Tissue Perfusion Assessment'),
        TableBlock(
          title: 'Methods for Predicting Healing',
          columns: ['Assessment Method', 'Threshold for Predicted Healing'],
          rows: [
            ['Transcutaneous oxygen pressure (TcPO2)', '>40 mmHg predicts healing; <20 mmHg predicts failure'],
            ['Ankle-brachial index (ABI)', '>0.5 suggests adequate perfusion for TTA healing'],
            ['Skin perfusion pressure', '>30 mmHg associated with healing'],
            ['Clinical assessment', 'Skin color, temperature, capillary refill, bleeding at incision'],
          ],
          headerColor: Colors.red,
        ),
        PearlBlock(
          'Board Pearl',
          'TcPO2 >40 mmHg predicts healing at the proposed amputation level. '
          'TcPO2 <20 mmHg predicts failure. This is the most commonly tested '
          'perfusion assessment threshold.',
        ),
        HeaderBlock('Impact of Fixed Flexion Contractures'),
        BulletCardBlock(
          title: 'Contracture Thresholds for Level Selection',
          themeColor: Colors.orange,
          backgroundColor: const Color(0xFF2A2215),
          points: [
            'Hip flexion contracture >15 degrees: makes TT prosthetic fitting extremely difficult',
            'Knee flexion contracture >15 degrees: renders TT prosthesis unusable (foot cannot be loaded properly)',
            'Knee flexion contracture >45 degrees: associated with stump healing failure at TT level',
            'Patients with knee flexion contractures >15 degrees often better served by TF amputation',
          ],
        ),
        HeaderBlock('Mangled Extremity Severity Score (MESS)'),
        TextBlock(
          'The MESS is a clinical scoring system to assist surgeons in deciding '
          'between limb salvage and primary amputation following severe extremity '
          'trauma. It is the most widely used scoring system for this purpose.',
        ),
        TableBlock(
          title: 'MESS Score Components',
          columns: ['Component', 'Points', 'Criteria'],
          rows: [
            ['Skeletal/soft tissue injury', '1', 'Low energy (stab, simple fracture, civilian GSW)'],
            ['', '2', 'Medium energy (open or multiple fractures, dislocation)'],
            ['', '3', 'High energy (high speed MVA or rifle GSW)'],
            ['', '4', 'Very high energy (high speed trauma + gross contamination)'],
            ['Limb ischemia', '1', 'Reduced/absent pulses but normal perfusion'],
            ['', '2', 'Pulseless, paresthesias, diminished cap refill'],
            ['', '3', 'Cool, paralyzed, insensate, numb'],
            ['', '*', 'DOUBLE score if ischemia >6 hours'],
            ['Shock', '0', 'SBP consistently >90 mmHg'],
            ['', '1', 'Transient hypotension'],
            ['', '2', 'Persistent hypotension'],
            ['Age', '0', '<30 years'],
            ['', '1', '30-50 years'],
            ['', '2', '>50 years'],
          ],
          headerColor: Colors.red,
        ),
        PearlBlock(
          'Board Pearl',
          'MESS score >=7 predicts the need for amputation with high specificity '
          '(100% amputation rate in original validation). The ischemia score is '
          'DOUBLED if ischemia has been present >6 hours, reflecting the critical '
          'importance of revascularization timing.',
        ),
        BulletCardBlock(
          title: 'MESS Interpretation',
          themeColor: Colors.red,
          backgroundColor: const Color(0xFF2A1519),
          points: [
            'MESS score >=7: amputation recommended (100% amputation rate in original study)',
            'MESS score <7: limb salvage may be attempted',
            'Ischemia score is DOUBLED if ischemia >6 hours',
            'Four components: skeletal/soft tissue injury, limb ischemia, shock, age',
            'LEAP study: no single scoring system reliably predicts amputation with both high sensitivity and specificity',
            'Clinical judgment remains essential alongside MESS scoring',
          ],
        ),
      ],
    ),
  ],
);

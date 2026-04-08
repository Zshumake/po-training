import '../models/quiz_model.dart';

class POQuizBank {
  static const List<QuizQuestion> allQuestions = [
    // ============================================================
    // MODULE: po-fundamentals (Questions 1-6)
    // ============================================================
    QuizQuestion(
      question:
          'Which phase of the gait cycle accounts for approximately 60% of the total cycle?',
      options: ['Swing phase', 'Stance phase', 'Double limb support', 'Single limb support'],
      correctIndex: 1,
      explanation:
          'Stance phase comprises approximately 60% of the gait cycle, while swing phase accounts for 40%. Double limb support occurs during the first and last 10% of stance phase, totaling about 20% of the full gait cycle. Understanding these percentages is essential for analyzing gait deviations in both orthotic and prosthetic patients.',
      moduleId: 'po-fundamentals',
      difficulty: 'basic',
    ),
    QuizQuestion(
      question:
          'During normal gait, what percentage of the gait cycle is spent in double limb support?',
      options: ['10%', '20%', '30%', '40%'],
      correctIndex: 1,
      explanation:
          'Double limb support accounts for approximately 20% of the normal gait cycle, split between initial double support (first 10%) and terminal double support (last 10% of stance). As walking speed increases, double limb support decreases. In running, double limb support is eliminated entirely and replaced by a float phase.',
      moduleId: 'po-fundamentals',
      difficulty: 'basic',
    ),
    QuizQuestion(
      question:
          'What is the normal cadence for an adult during comfortable walking speed?',
      options: [
        '70-80 steps per minute',
        '90-100 steps per minute',
        '110-120 steps per minute',
        '130-140 steps per minute',
      ],
      correctIndex: 2,
      explanation:
          'Normal adult cadence during comfortable walking speed is approximately 110-120 steps per minute (about 60 strides per minute). Women tend to have a slightly higher cadence than men. Cadence is one of the temporal parameters of gait and is often altered in patients with lower extremity prostheses or orthoses.',
      moduleId: 'po-fundamentals',
      difficulty: 'basic',
    ),
    QuizQuestion(
      question:
          'Which subphase of the gait cycle occurs immediately after initial contact?',
      options: ['Midstance', 'Loading response', 'Pre-swing', 'Terminal stance'],
      correctIndex: 1,
      explanation:
          'Loading response immediately follows initial contact and comprises approximately 0-10% of the gait cycle. During loading response, body weight is transferred onto the stance limb, the knee flexes approximately 15-20 degrees for shock absorption, and the ankle plantarflexes. This is the first period of double limb support.',
      moduleId: 'po-fundamentals',
      difficulty: 'intermediate',
    ),
    QuizQuestion(
      question: 'What is the primary purpose of an orthosis?',
      options: [
        'To replace a missing body part',
        'To support, align, prevent, or correct musculoskeletal dysfunction',
        'To provide cosmetic restoration',
        'To increase muscle strength through resistance',
      ],
      correctIndex: 1,
      explanation:
          'An orthosis is an externally applied device used to support, align, prevent, or correct musculoskeletal deformities or to improve the function of movable parts of the body. This differentiates it from a prosthesis, which replaces a missing body part. Orthoses can be static (no motion) or dynamic (allowing or assisting motion).',
      moduleId: 'po-fundamentals',
      difficulty: 'basic',
    ),
    QuizQuestion(
      question:
          'In the ICF framework, what does "activity limitation" refer to in prosthetic and orthotic care?',
      options: [
        'A problem with body structure or function',
        'Difficulty executing tasks or actions',
        'Problems experienced in life situations',
        'Environmental barriers to participation',
      ],
      correctIndex: 1,
      explanation:
          'In the International Classification of Functioning, Disability and Health (ICF) framework, activity limitation refers to difficulties an individual may have in executing tasks or actions. This is distinct from impairments (problems in body function or structure) and participation restrictions (problems in life situations). The ICF model guides comprehensive P&O assessment and goal-setting.',
      moduleId: 'po-fundamentals',
      difficulty: 'intermediate',
    ),

    // ============================================================
    // MODULE: le-orthoses (Questions 7-18)
    // ============================================================
    QuizQuestion(
      question:
          'A patient with foot drop and normal quadriceps strength would benefit most from which type of AFO?',
      options: [
        'Solid ankle AFO',
        'Posterior leaf spring (PLS) AFO',
        'Floor reaction orthosis (FRO)',
        'Metal double upright AFO with ankle lock',
      ],
      correctIndex: 1,
      explanation:
          'A posterior leaf spring (PLS) AFO is the ideal choice for isolated foot drop with intact quadriceps. The PLS provides dorsiflexion assist during swing phase to clear the foot while allowing near-normal plantarflexion during stance. It is lightweight, fits in most shoes, and provides only minimal mediolateral ankle control — so it should be reserved for patients whose primary deficit is dorsiflexor weakness without significant ML instability.',
      moduleId: 'le-orthoses',
      difficulty: 'board',
    ),
    QuizQuestion(
      question:
          'A floor reaction orthosis (FRO) is indicated for a patient with which condition?',
      options: [
        'Isolated foot drop with normal quadriceps',
        'Knee extensor weakness with intact ankle function',
        'Severe mediolateral ankle instability',
        'Complete flaccid paralysis below the knee',
      ],
      correctIndex: 1,
      explanation:
          'A floor reaction orthosis (FRO) requires intact quadriceps for effective function. The FRO is a rigid, solid-ankle AFO set in slight plantarflexion that creates a ground reaction force anterior to the knee during stance, producing a knee extension moment. This is specifically indicated for patients with knee extensor weakness (such as in myelomeningocele or post-polio) who retain adequate quadriceps function to work with the orthotic design.',
      moduleId: 'le-orthoses',
      difficulty: 'board',
    ),
    QuizQuestion(
      question:
          'A solid ankle AFO is most appropriate for a patient with which presentation?',
      options: [
        'Isolated dorsiflexor weakness',
        'Mediolateral ankle instability with spasticity',
        'Weak quadriceps requiring knee extension assist',
        'Mild ankle weakness during swing only',
      ],
      correctIndex: 1,
      explanation:
          'A solid ankle AFO is indicated when there is significant mediolateral instability at the ankle, often combined with spasticity or plantarflexion contracture. The solid AFO blocks all ankle motion in sagittal, frontal, and transverse planes, providing maximum stability. It is preferred over a PLS when mediolateral control is needed and over an FRO when the primary goal is ankle stabilization rather than knee extension assistance.',
      moduleId: 'le-orthoses',
      difficulty: 'board',
    ),
    QuizQuestion(
      question:
          'Which AFO design provides the most mediolateral control at the ankle?',
      options: [
        'Posterior leaf spring AFO',
        'Hinged AFO',
        'Solid ankle AFO',
        'Spiral AFO',
      ],
      correctIndex: 2,
      explanation:
          'A solid ankle AFO provides the greatest mediolateral control because it encompasses the leg and foot in a rigid shell that prevents motion in all planes at the ankle. The PLS and spiral AFOs allow some mediolateral motion, and the hinged AFO primarily controls sagittal plane motion. For patients with significant varus or valgus instability, the solid AFO is the most appropriate choice.',
      moduleId: 'le-orthoses',
      difficulty: 'intermediate',
    ),
    QuizQuestion(
      question:
          'A patient with a common peroneal nerve palsy presents with foot drop. Which orthosis is most appropriate?',
      options: [
        'KAFO with drop lock',
        'Solid ankle AFO',
        'Posterior leaf spring AFO',
        'Floor reaction orthosis',
      ],
      correctIndex: 2,
      explanation:
          'Common peroneal nerve palsy causes weakness of the dorsiflexors (tibialis anterior) and evertors, resulting in foot drop. A posterior leaf spring AFO is ideal because it provides dorsiflexion assistance during swing phase while allowing relatively normal gait mechanics. The PLS is lightweight and flexible enough to permit plantarflexion during loading response while maintaining toe clearance during swing.',
      moduleId: 'le-orthoses',
      difficulty: 'board',
    ),
    QuizQuestion(
      question:
          'A KAFO is indicated for a patient with weakness in which muscle group?',
      options: [
        'Hip abductors only',
        'Ankle dorsiflexors only',
        'Quadriceps (knee extensors)',
        'Hip flexors only',
      ],
      correctIndex: 2,
      explanation:
          'A KAFO is indicated when the patient has quadriceps weakness (knee extensor weakness) that prevents safe stance phase stability. If the knee buckles during weight-bearing, the KAFO provides the necessary stability through a locked or stance-control knee joint. Isolated dorsiflexor weakness requires only an AFO, while hip weakness alone does not typically require a KAFO.',
      moduleId: 'le-orthoses',
      difficulty: 'intermediate',
    ),
    QuizQuestion(
      question:
          'What is the primary advantage of a stance-control KAFO over a locked-knee KAFO?',
      options: [
        'Greater mediolateral stability',
        'Allows free knee flexion during swing phase',
        'Lower cost and simpler design',
        'Better control of ankle dorsiflexion',
      ],
      correctIndex: 1,
      explanation:
          'A stance-control KAFO automatically locks the knee during stance phase for stability and unlocks during swing phase to allow free knee flexion. This provides a more normal gait pattern compared to a locked-knee KAFO, which keeps the knee rigid throughout the gait cycle and forces the patient to circumduct or hip-hike to clear the limb during swing. Stance-control KAFOs reduce energy expenditure and improve cosmesis.',
      moduleId: 'le-orthoses',
      difficulty: 'intermediate',
    ),
    QuizQuestion(
      question:
          'A Thomas heel shoe modification is used to provide which type of support?',
      options: [
        'Metatarsal arch support',
        'Medial longitudinal arch support',
        'Lateral ankle stabilization',
        'Rocker bottom toe-off assistance',
      ],
      correctIndex: 1,
      explanation:
          'A Thomas heel extends the medial border of the heel anteriorly by approximately 1/2 to 3/4 inch to provide support for the medial longitudinal arch. It is commonly used for patients with pes planus (flat foot) or pronation problems. The extended medial heel provides a buttress effect that supports the sustentaculum tali and helps maintain the arch during weight-bearing.',
      moduleId: 'le-orthoses',
      difficulty: 'board',
    ),
    QuizQuestion(
      question:
          'A rocker bottom sole shoe modification is primarily indicated for patients with which condition?',
      options: [
        'Ankle instability',
        'Limited ankle or MTP joint motion',
        'Knee hyperextension',
        'Hip flexion contracture',
      ],
      correctIndex: 1,
      explanation:
          'A rocker bottom sole is indicated for patients with limited ankle dorsiflexion or restricted metatarsophalangeal (MTP) joint motion, such as in hallux rigidus or ankle arthrodesis. The rocker sole facilitates forward progression during terminal stance and pre-swing by rolling the foot over the convex sole, compensating for the loss of normal ankle and forefoot motion during the push-off phase of gait.',
      moduleId: 'le-orthoses',
      difficulty: 'board',
    ),
    QuizQuestion(
      question:
          'Which type of UCBL orthosis is used for?',
      options: [
        'Knee instability',
        'Flexible pes planus (flatfoot)',
        'Ankle dorsiflexion weakness',
        'Metatarsalgia',
      ],
      correctIndex: 1,
      explanation:
          'The University of California Biomechanics Laboratory (UCBL) orthosis is a rigid foot orthosis that cups the heel and extends along the medial and lateral borders of the foot. It is specifically designed for flexible pes planus (flatfoot) to maintain the subtalar joint in a neutral position and support the medial longitudinal arch. It is only effective for flexible deformities and will not correct rigid flatfoot.',
      moduleId: 'le-orthoses',
      difficulty: 'intermediate',
    ),
    QuizQuestion(
      question:
          'A patient with an L4 spinal cord injury level would most likely require which orthotic device for ambulation?',
      options: [
        'AFO bilaterally',
        'KAFO bilaterally',
        'HKAFO bilaterally',
        'RGO (reciprocating gait orthosis)',
      ],
      correctIndex: 0,
      explanation:
          'An L4 spinal cord injury preserves quadriceps function (L2-L4) and hip flexion but results in weakness of dorsiflexors and plantarflexors. Bilateral AFOs provide the necessary ankle support while taking advantage of intact knee extension strength. Higher-level injuries (L2-L3) may require KAFOs due to insufficient quadriceps, and thoracic-level injuries typically require HKAFOs or RGOs for any community ambulation.',
      moduleId: 'le-orthoses',
      difficulty: 'board',
    ),
    QuizQuestion(
      question:
          'Which orthotic knee joint is most appropriate for a patient who requires maximum stability but can manually unlock the knee for sitting?',
      options: [
        'Polycentric knee joint',
        'Offset knee joint',
        'Drop ring lock knee joint',
        'Fan lock knee joint',
      ],
      correctIndex: 2,
      explanation:
          'The drop ring lock (drop lock) is the most common locking mechanism for KAFOs. A metal ring drops over the knee joint axis when the knee is fully extended, preventing flexion. The patient manually lifts the ring to unlock the knee for sitting. It provides maximum stability during stance and is the standard choice for patients who need consistent knee stabilization but also the ability to sit.',
      moduleId: 'le-orthoses',
      difficulty: 'intermediate',
    ),

    // ============================================================
    // MODULE: ue-orthoses (Questions 19-24)
    // ============================================================
    QuizQuestion(
      question:
          'A patient with a radial nerve injury would most appropriately be fitted with which orthosis?',
      options: [
        'Anti-claw splint',
        'Opponens splint',
        'Wrist drop splint (wrist extension orthosis)',
        'Resting hand splint',
      ],
      correctIndex: 2,
      explanation:
          'Radial nerve injury results in wrist drop due to loss of wrist and finger extension. A wrist drop splint (dynamic wrist extension orthosis) holds the wrist in extension, allowing the patient to use intact finger flexors for grip. Without wrist extension, tenodesis effect is lost and the patient cannot effectively grasp objects. Ulnar nerve injury requires anti-claw splint, and median nerve injury requires opponens splint.',
      moduleId: 'ue-orthoses',
      difficulty: 'board',
    ),
    QuizQuestion(
      question:
          'An anti-claw splint is indicated for a patient with which nerve injury?',
      options: [
        'Radial nerve injury',
        'Median nerve injury',
        'Ulnar nerve injury',
        'Musculocutaneous nerve injury',
      ],
      correctIndex: 2,
      explanation:
          'Ulnar nerve injury causes clawing of the ring and small fingers due to loss of the lumbricals and interossei that flex the MCP joints and extend the IP joints. An anti-claw splint (MCP flexion block splint or Zancolli lasso) prevents MCP hyperextension, thereby allowing the intact extrinsic extensors to extend the IP joints. The splint holds the MCPs in slight flexion to optimize the mechanical advantage of the extensor mechanism.',
      moduleId: 'ue-orthoses',
      difficulty: 'board',
    ),
    QuizQuestion(
      question:
          'A patient with median nerve injury at the wrist would benefit most from which orthosis?',
      options: [
        'Wrist drop splint',
        'Anti-claw splint',
        'Opponens splint (thumb abduction orthosis)',
        'Dynamic finger extension splint',
      ],
      correctIndex: 2,
      explanation:
          'Median nerve injury at the wrist affects the thenar muscles (opponens pollicis, abductor pollicis brevis, and flexor pollicis brevis), resulting in loss of thumb opposition. An opponens splint positions the thumb in palmar abduction and opposition to enable functional pinch and grasp. This is distinct from radial nerve injury (wrist drop splint) and ulnar nerve injury (anti-claw splint).',
      moduleId: 'ue-orthoses',
      difficulty: 'board',
    ),
    QuizQuestion(
      question:
          'Which type of upper extremity orthosis is commonly used after flexor tendon repair?',
      options: [
        'Dynamic extension splint',
        'Dorsal blocking splint with rubber band traction',
        'Opponens splint',
        'Wrist cock-up splint',
      ],
      correctIndex: 1,
      explanation:
          'After flexor tendon repair, a dorsal blocking splint (Kleinert protocol) with rubber band traction is commonly used. The splint holds the wrist and MCP joints in flexion to protect the repair from excessive tension, while rubber bands provide passive flexion with active extension allowed to a limited range. This controlled motion protocol promotes tendon healing while preventing adhesions and rupture of the repair.',
      moduleId: 'ue-orthoses',
      difficulty: 'intermediate',
    ),
    QuizQuestion(
      question:
          'A resting hand splint positions the hand in which functional position?',
      options: [
        'Wrist neutral, MCPs extended, IPs extended',
        'Wrist 20-30 degrees extension, MCPs 60-70 degrees flexion, IPs slightly flexed, thumb abducted',
        'Wrist flexed, MCPs hyperextended, IPs flexed',
        'Wrist neutral, MCPs 90 degrees flexion, thumb adducted',
      ],
      correctIndex: 1,
      explanation:
          'A resting hand splint positions the hand in the "intrinsic plus" or safe position: wrist in 20-30 degrees extension, MCP joints in 60-70 degrees flexion, IP joints in slight flexion, and thumb in palmar abduction. This position maintains the collateral ligaments at maximal length to prevent contracture, protects edematous or post-surgical hands, and preserves the transverse and longitudinal arches of the hand.',
      moduleId: 'ue-orthoses',
      difficulty: 'intermediate',
    ),
    QuizQuestion(
      question:
          'Which orthosis is most appropriate for a patient with swan neck deformity?',
      options: [
        'Boutonniere splint (PIP extension splint)',
        'Silver ring splint blocking PIP hyperextension',
        'Dynamic MCP flexion splint',
        'Wrist cock-up splint',
      ],
      correctIndex: 1,
      explanation:
          'Swan neck deformity involves PIP hyperextension and DIP flexion. A silver ring splint or figure-of-eight splint blocks PIP hyperextension while allowing full PIP flexion, correcting the deformity and improving hand function. This is distinct from boutonniere deformity (PIP flexion with DIP hyperextension) which requires a splint that promotes PIP extension.',
      moduleId: 'ue-orthoses',
      difficulty: 'intermediate',
    ),

    // ============================================================
    // MODULE: spinal-orthoses (Questions 25-32)
    // ============================================================
    QuizQuestion(
      question:
          'Which cervical orthosis provides the greatest restriction of flexion?',
      options: [
        'Philadelphia collar',
        'SOMI (sternal occipital mandibular immobilizer)',
        'Halo vest',
        'Miami J collar',
      ],
      correctIndex: 1,
      explanation:
          'The SOMI orthosis restricts cervical flexion the most effectively at approximately 93% restriction. The SOMI accomplishes this through a sternal plate, occipital piece, and mandibular support that prevent forward head motion. While the halo vest is the gold standard for overall cervical motion restriction, the SOMI specifically excels at flexion control. This is a high-yield board topic.',
      moduleId: 'spinal-orthoses',
      difficulty: 'board',
    ),
    QuizQuestion(
      question:
          'Which cervical orthosis is considered the gold standard for overall cervical motion restriction?',
      options: [
        'SOMI',
        'Philadelphia collar',
        'Halo vest',
        'Four-poster brace',
      ],
      correctIndex: 2,
      explanation:
          'The halo vest is the gold standard for overall cervical spine immobilization, restricting motion in all planes (flexion, extension, lateral bending, and rotation) more effectively than any other cervical orthosis. It consists of a metal ring fixed to the skull with pins, attached to a vest by uprights. It is used for unstable cervical fractures, post-surgical stabilization, and high cervical injuries.',
      moduleId: 'spinal-orthoses',
      difficulty: 'board',
    ),
    QuizQuestion(
      question:
          'The SOMI orthosis restricts cervical flexion by approximately what percentage?',
      options: ['65%', '75%', '85%', '93%'],
      correctIndex: 3,
      explanation:
          'The SOMI (sternal occipital mandibular immobilizer) restricts cervical flexion by approximately 93%, making it the most effective orthosis specifically for flexion control. However, it is less effective at restricting extension (about 65%) compared to the halo vest. The SOMI is commonly used for upper to mid-cervical fractures where flexion restriction is the primary concern.',
      moduleId: 'spinal-orthoses',
      difficulty: 'board',
    ),
    QuizQuestion(
      question:
          'A TLSO (thoracolumbosacral orthosis) typically covers which spinal levels?',
      options: ['C7-T6', 'T6-L3', 'L1-S1', 'T1-L5'],
      correctIndex: 1,
      explanation:
          'A standard TLSO covers approximately T6 to L3, providing three-point pressure systems to control thoracolumbar spinal motion. The TLSO cannot effectively control motion above T6 because the rib cage limits the orthosis ability to apply corrective forces to the upper thoracic spine. For higher thoracic control, a CTLSO with cervical extension is needed.',
      moduleId: 'spinal-orthoses',
      difficulty: 'board',
    ),
    QuizQuestion(
      question:
          'The Williams flexion orthosis is designed to promote which spinal position?',
      options: [
        'Lumbar extension',
        'Lumbar flexion',
        'Thoracic extension',
        'Cervical neutral',
      ],
      correctIndex: 1,
      explanation:
          'The Williams flexion orthosis promotes lumbar flexion and restricts lumbar extension. It is indicated for conditions that benefit from a flexed posture, such as spondylolisthesis, spinal stenosis, and facet joint arthropathy. By maintaining the lumbar spine in flexion, it opens the intervertebral foramina and reduces facet joint loading. This contrasts with the Jewett and CASH orthoses, which promote extension.',
      moduleId: 'spinal-orthoses',
      difficulty: 'board',
    ),
    QuizQuestion(
      question:
          'The Jewett hyperextension orthosis is indicated for which type of spinal fracture?',
      options: [
        'Cervical compression fracture',
        'Anterior thoracolumbar compression fracture',
        'Posterior element fracture',
        'Sacral insufficiency fracture',
      ],
      correctIndex: 1,
      explanation:
          'The Jewett hyperextension orthosis uses a three-point pressure system (sternal pad, suprapubic pad, and posterior lumbar pad) to maintain thoracolumbar extension. It is specifically indicated for stable anterior compression fractures of the thoracolumbar spine (T6-L3) where promoting extension unloads the anterior column. It is contraindicated for posterior element fractures because extension would increase stress on the posterior structures.',
      moduleId: 'spinal-orthoses',
      difficulty: 'board',
    ),
    QuizQuestion(
      question:
          'Which spinal orthosis uses a three-point force system with sternal and suprapubic pads?',
      options: [
        'Boston brace',
        'Jewett hyperextension orthosis',
        'Milwaukee brace',
        'Williams flexion orthosis',
      ],
      correctIndex: 1,
      explanation:
          'The Jewett orthosis applies a three-point force system using an anterior sternal pad, an anterior suprapubic pad, and a posterior thoracolumbar pad. These three forces create an extension moment that opposes the flexion forces on an anteriorly compressed vertebral body. The CASH (cruciform anterior spinal hyperextension) orthosis works on the same principle but uses a cruciform anterior frame instead of individual pads.',
      moduleId: 'spinal-orthoses',
      difficulty: 'intermediate',
    ),
    QuizQuestion(
      question:
          'The Milwaukee brace (CTLSO) is primarily used to treat which condition?',
      options: [
        'Lumbar spinal stenosis',
        'Adolescent idiopathic scoliosis',
        'Cervical fracture',
        'Lumbar disc herniation',
      ],
      correctIndex: 1,
      explanation:
          'The Milwaukee brace is a CTLSO developed specifically for the management of adolescent idiopathic scoliosis. It extends from the pelvis to the occiput with lateral pads that apply corrective forces to the scoliotic curves. While the Boston brace (underarm TLSO) has largely replaced the Milwaukee brace for curves with an apex below T7, the Milwaukee brace remains indicated for high thoracic curves with an apex at T7 or above.',
      moduleId: 'spinal-orthoses',
      difficulty: 'intermediate',
    ),

    // ============================================================
    // MODULE: prosthetic-components (Questions 33-40)
    // ============================================================
    QuizQuestion(
      question:
          'Which prosthetic foot is most appropriate for a K1-level (household) ambulator?',
      options: [
        'Dynamic response (energy-storing) foot',
        'Microprocessor-controlled foot',
        'SACH foot',
        'Running-specific prosthetic foot',
      ],
      correctIndex: 2,
      explanation:
          'A SACH (solid ankle cushion heel) foot is most appropriate for K1-level (household) ambulators. It is simple, durable, lightweight, and has no moving parts. The cushion heel compresses during loading to simulate plantarflexion. Higher-activity feet such as dynamic response and energy-storing designs are indicated for K3-K4 ambulators who can benefit from energy return during push-off.',
      moduleId: 'prosthetic-components',
      difficulty: 'board',
    ),
    QuizQuestion(
      question:
          'Energy-storing prosthetic feet are most appropriate for which K-level classification?',
      options: ['K0-K1', 'K1-K2', 'K2-K3', 'K3-K4'],
      correctIndex: 3,
      explanation:
          'Energy-storing (dynamic response) prosthetic feet are indicated for K3-K4 level ambulators who are community or high-activity ambulators. These feet use carbon fiber or composite keels that deflect during loading and return energy during push-off, enabling a more efficient and dynamic gait pattern. K3 patients are variable cadence community ambulators and K4 patients exceed basic ambulation, including high-impact activities and sports.',
      moduleId: 'prosthetic-components',
      difficulty: 'board',
    ),
    QuizQuestion(
      question: 'What does the K0 functional level designation indicate?',
      options: [
        'Household ambulator',
        'Limited community ambulator',
        'Does not have the ability or potential to ambulate',
        'Community ambulator with variable cadence',
      ],
      correctIndex: 2,
      explanation:
          'K0 indicates the patient does not have the ability or potential to ambulate or transfer safely with or without assistance, and a prosthesis does not enhance quality of life or mobility. K1 is household ambulator, K2 is limited community ambulator, K3 is community ambulator with variable cadence, and K4 exceeds basic ambulation (high activity, sports). K-level determines Medicare coverage for prosthetic components.',
      moduleId: 'prosthetic-components',
      difficulty: 'board',
    ),
    QuizQuestion(
      question:
          'Which prosthetic knee mechanism is considered a "last resort" option?',
      options: [
        'Polycentric knee',
        'Single-axis with constant friction',
        'Microprocessor knee',
        'Manual locking knee',
      ],
      correctIndex: 3,
      explanation:
          'The manual locking knee is considered a last resort because it eliminates knee flexion during walking, resulting in a stiff-legged gait. The patient must circumduct or hip-hike to clear the locked limb during swing. It is reserved for patients with very poor balance, strength, or cognitive ability who cannot safely control a free-swinging knee. It can be unlocked manually for sitting.',
      moduleId: 'prosthetic-components',
      difficulty: 'board',
    ),
    QuizQuestion(
      question:
          'A polycentric prosthetic knee is particularly advantageous for which amputation level?',
      options: [
        'Hip disarticulation',
        'Transfemoral',
        'Knee disarticulation',
        'Transtibial',
      ],
      correctIndex: 2,
      explanation:
          'Polycentric (four-bar or multiaxial) knees are especially advantageous for knee disarticulation amputees. The polycentric design shortens the shank during swing phase through its linkage mechanism, improving cosmesis and toe clearance when the patient is seated. In a four-bar polycentric knee, the instantaneous center of rotation (ICR) sits posterior and proximal to the anatomical knee in extension/early stance — this places the weight line anterior to the ICR and provides voluntary stance stability. As the knee flexes for swing, the ICR translates anteriorly and distally, allowing the knee to break into swing.',
      moduleId: 'prosthetic-components',
      difficulty: 'board',
    ),
    QuizQuestion(
      question:
          'What is the primary advantage of a microprocessor-controlled knee?',
      options: [
        'Lower cost than mechanical knees',
        'Real-time adjustment of swing and stance resistance',
        'Lighter weight than other knee options',
        'No need for battery charging',
      ],
      correctIndex: 1,
      explanation:
          'Microprocessor-controlled knees use sensors and onboard processors to continuously adjust swing and stance phase resistance in real time based on the users walking speed, terrain, and activity. This provides more natural gait, improved stability on uneven surfaces and stairs, and reduced falls compared to mechanical knees. They are indicated for K3-K4 ambulators and require regular battery charging.',
      moduleId: 'prosthetic-components',
      difficulty: 'intermediate',
    ),
    QuizQuestion(
      question:
          'What is the key difference between a voluntary opening (VO) and voluntary closing (VC) terminal device?',
      options: [
        'VO requires muscle contraction to open; VC requires contraction to close',
        'VO is always a hand; VC is always a hook',
        'VO provides variable grip force; VC has constant grip',
        'VO is only for myoelectric systems; VC is only for body-powered',
      ],
      correctIndex: 0,
      explanation:
          'In a voluntary opening (VO) device, rubber bands or springs hold the device closed and the user applies cable force to open it. In a voluntary closing (VC) device, the user applies cable force to close and grip, providing proportional grip strength. VC devices offer more natural prehension with variable grip force but require sustained effort to maintain grip. VO devices are more common because they provide a constant holding force without sustained effort.',
      moduleId: 'prosthetic-components',
      difficulty: 'board',
    ),
    QuizQuestion(
      question:
          'In a body-powered prosthesis, the control cable transmits force from which motion?',
      options: [
        'Wrist flexion and extension',
        'Glenohumeral flexion and scapular abduction (protraction)',
        'Elbow flexion and extension',
        'Trunk rotation',
      ],
      correctIndex: 1,
      explanation:
          'In a transradial body-powered prosthesis, the single control cable is activated primarily by glenohumeral flexion and scapular abduction (protraction). These motions pull on the cable via a figure-of-eight or figure-of-nine harness to operate the terminal device. For higher-level amputations, additional cables and motions may be needed to control elbow lock and forearm lift independently.',
      moduleId: 'prosthetic-components',
      difficulty: 'board',
    ),

    // ============================================================
    // MODULE: transtibial (Questions 41-50)
    // ============================================================
    QuizQuestion(
      question:
          'The ideal transtibial amputation level is at what percentage of the tibial length?',
      options: [
        'Distal 25%',
        'Proximal 25%',
        'Proximal 50% (mid-third junction)',
        'Distal 50%',
      ],
      correctIndex: 2,
      explanation:
          'The ideal transtibial amputation level is at the junction of the proximal and middle thirds of the tibia, or approximately the proximal 50%. This provides adequate lever arm for prosthetic control while preserving enough soft tissue for padding. The fibula is typically cut 2-3 cm shorter than the tibia to prevent distal pressure. Shorter residual limbs have less lever arm, while longer ones may have inadequate soft tissue coverage.',
      moduleId: 'transtibial',
      difficulty: 'board',
    ),
    QuizQuestion(
      question:
          'In a transtibial amputation, the fibula is typically cut how much shorter than the tibia?',
      options: ['Even with the tibia', '1 cm shorter', '2-3 cm shorter', '5 cm shorter'],
      correctIndex: 2,
      explanation:
          'The fibula is typically cut 2-3 cm shorter than the tibia in a transtibial amputation. This prevents the distal fibula from creating a bony prominence that could cause pressure and skin breakdown within the prosthetic socket. The shorter fibula also allows the soft tissue to be shaped into a smooth, well-padded residual limb that distributes pressure more evenly within the socket.',
      moduleId: 'transtibial',
      difficulty: 'board',
    ),
    QuizQuestion(
      question:
          'In a PTB (patellar tendon bearing) socket, which area is the primary weight-bearing (pressure-tolerant) surface?',
      options: [
        'Tibial crest',
        'Patellar tendon',
        'Fibular head',
        'Distal tibia',
      ],
      correctIndex: 1,
      explanation:
          'The patellar tendon is the primary weight-bearing surface in a PTB socket. It can tolerate significant loading because it is a dense connective tissue structure accustomed to bearing the forces of quadriceps contraction. Other pressure-tolerant areas include the medial tibial flare, the anterior-lateral muscular compartment, the popliteal fossa, and the medial tibial shaft.',
      moduleId: 'transtibial',
      difficulty: 'board',
    ),
    QuizQuestion(
      question:
          'Which of the following is a pressure-SENSITIVE area in a PTB socket?',
      options: [
        'Patellar tendon',
        'Medial tibial flare',
        'Fibular head',
        'Lateral tibial shaft muscular compartment',
      ],
      correctIndex: 2,
      explanation:
          'The fibular head is a pressure-sensitive (relief) area in the PTB socket because the common peroneal nerve wraps around it superficially. Pressure on the fibular head can cause peroneal nerve palsy and foot drop. Other pressure-sensitive areas include the tibial crest (anterior tibial border), the distal tibia, the hamstring tendons, and any bony prominences. These areas require relief or padding in the socket design.',
      moduleId: 'transtibial',
      difficulty: 'board',
    ),
    QuizQuestion(
      question:
          'Which areas are considered pressure-tolerant in a transtibial PTB socket?',
      options: [
        'Tibial crest, fibular head, hamstring tendons',
        'Patellar tendon, medial tibial flare, lateral muscular compartment',
        'Distal tibia, fibular head, tibial crest',
        'Hamstring tendons, anterior crest, cut end of fibula',
      ],
      correctIndex: 1,
      explanation:
          'Pressure-tolerant areas in the PTB socket include the patellar tendon (primary weight-bearing), medial tibial flare, anterolateral muscular compartment, popliteal fossa (for counter-pressure), and the shaft of the tibia between the crest and medial border. These areas have adequate soft tissue coverage or dense tissue that can handle loading forces. Relief must be provided over the tibial crest, fibular head, distal tibia, and hamstring tendons.',
      moduleId: 'transtibial',
      difficulty: 'board',
    ),
    QuizQuestion(
      question:
          'A pin lock suspension system for a transtibial prosthesis is most appropriate for which patient population?',
      options: [
        'Patients with severe volume fluctuation',
        'Active patients and athletes',
        'Patients with very short residual limbs',
        'Geriatric patients with limited hand dexterity',
      ],
      correctIndex: 1,
      explanation:
          'Pin lock (shuttle lock) suspension is popular among active patients and athletes because it provides secure, reliable suspension during high-activity levels. A pin attached to the distal end of a gel liner engages a locking mechanism in the socket. It is easy to don with an audible click confirming engagement. It is less ideal for patients with significant volume changes as it provides a fixed distal attachment point.',
      moduleId: 'transtibial',
      difficulty: 'intermediate',
    ),
    QuizQuestion(
      question:
          'Suction suspension for a transtibial prosthesis requires which condition for optimal function?',
      options: [
        'A very short residual limb',
        'Stable residual limb volume',
        'Significant soft tissue redundancy',
        'Bony prominences for locking',
      ],
      correctIndex: 1,
      explanation:
          'Suction suspension relies on a seal between the socket and the residual limb (often via a sealing liner or elevated vacuum) to create negative pressure that holds the prosthesis in place. This requires stable residual limb volume, as volume fluctuation would break the seal and cause pistoning. Suction provides excellent proprioceptive feedback and reduced pistoning when properly fitted on a mature, stable residual limb.',
      moduleId: 'transtibial',
      difficulty: 'board',
    ),
    QuizQuestion(
      question:
          'Which transtibial socket design uses total surface bearing principles?',
      options: [
        'PTB socket with cuff strap',
        'TSB (total surface bearing) socket',
        'PTS (patellar tendon supracondylar) socket',
        'KBM (Kondylen Bettung Munster) socket',
      ],
      correctIndex: 1,
      explanation:
          'The TSB (total surface bearing) socket distributes weight uniformly across the entire surface of the residual limb, rather than concentrating load on specific pressure-tolerant areas as in the traditional PTB design. TSB sockets use gel liners to achieve hydrostatic loading, where the liner acts as a fluid medium to equalize pressure. This design reduces peak pressures and is more comfortable for many patients.',
      moduleId: 'transtibial',
      difficulty: 'intermediate',
    ),
    QuizQuestion(
      question:
          'What is the most common cause of skin breakdown on the distal anterior tibia in a transtibial prosthesis user?',
      options: [
        'Socket is too loose',
        'Socket is too long anteriorly or excessive pressure on tibial crest',
        'Liner is too thick',
        'Prosthetic foot is set in too much dorsiflexion',
      ],
      correctIndex: 1,
      explanation:
          'Skin breakdown on the distal anterior tibia is most commonly caused by excessive pressure on the tibial crest or the socket trimlines extending too far distally anteriorly. The tibial crest is a pressure-sensitive area with minimal soft tissue coverage, and direct loading causes tissue ischemia and breakdown. Proper socket design must provide relief over the tibial crest to prevent this complication.',
      moduleId: 'transtibial',
      difficulty: 'intermediate',
    ),
    QuizQuestion(
      question:
          'What is the primary advantage of an elevated vacuum suspension system?',
      options: [
        'Easiest to don and doff',
        'Lowest cost of all suspension methods',
        'Reduces pistoning and maintains limb volume',
        'Works best with short residual limbs',
      ],
      correctIndex: 2,
      explanation:
          'Elevated vacuum (active vacuum) suspension uses an electric or mechanical pump to maintain a constant sub-atmospheric pressure between the liner and socket. This reduces pistoning (vertical movement of the limb within the socket) to near zero and helps maintain residual limb volume throughout the day by preventing dependent edema. Studies show improved proprioception and gait symmetry with elevated vacuum systems.',
      moduleId: 'transtibial',
      difficulty: 'intermediate',
    ),

    // ============================================================
    // MODULE: transfemoral (Questions 51-58)
    // ============================================================
    QuizQuestion(
      question:
          'What is the primary difference between a quadrilateral and an ischial containment (IRC) transfemoral socket?',
      options: [
        'Quad socket is narrower in ML dimension; IRC is wider',
        'Quad socket seats the ischium on top of the posterior wall; IRC contains the ischial tuberosity within the socket',
        'IRC is used only for K1 ambulators; quad is for K3-K4',
        'There is no significant difference between the two designs',
      ],
      correctIndex: 1,
      explanation:
          'In a quadrilateral socket, the ischial tuberosity sits on top of the flat posterior brim, providing a shelf for weight-bearing. In an ischial containment (IRC or narrow ML) socket, the ischium and ramus are contained within the socket walls, locking the pelvis into the socket for better rotational control and more anatomical loading. The IRC socket has a narrower ML dimension and wider AP dimension compared to the quad socket.',
      moduleId: 'transfemoral',
      difficulty: 'board',
    ),
    QuizQuestion(
      question:
          'The quadrilateral transfemoral socket shape is characterized by which dimensions?',
      options: [
        'Wider ML than AP',
        'Wider AP than ML',
        'Equal AP and ML dimensions',
        'Circular cross-section',
      ],
      correctIndex: 0,
      explanation:
          'The quadrilateral socket has a wider mediolateral (ML) dimension than anteroposterior (AP) dimension. This creates a broad, flat shape that provides a posterior shelf (ischial seat) for the ischial tuberosity to rest upon. In contrast, the IRC socket has a narrower ML dimension and wider AP dimension to contain the ischium within the socket and provide more anatomical femoral alignment.',
      moduleId: 'transfemoral',
      difficulty: 'board',
    ),
    QuizQuestion(
      question:
          'In a transfemoral prosthesis, the prosthetic knee is typically aligned in which position relative to the TKA (trochanter-knee-ankle) line?',
      options: [
        'Anterior to the TKA line for stability',
        'Posterior to the TKA line for easier initiation of swing',
        'Directly on the TKA line',
        'Lateral to the TKA line',
      ],
      correctIndex: 0,
      explanation:
          'For stability, the prosthetic knee axis is typically aligned slightly anterior to the TKA (trochanter-knee-ankle) line. This alignment creates a knee extension moment during stance phase, making the knee resistant to buckling. Aligning the knee more anteriorly increases stability but makes swing initiation more difficult; aligning more posteriorly makes swing easier but reduces stance stability.',
      moduleId: 'transfemoral',
      difficulty: 'board',
    ),
    QuizQuestion(
      question:
          'The energy expenditure for a traumatic transfemoral amputee walking at comfortable speed is approximately what percent above normal?',
      options: ['25%', '40%', '60-70%', '100%'],
      correctIndex: 2,
      explanation:
          'A traumatic transfemoral amputee expends approximately 60-70% more energy than a non-amputee walking at the same speed. Energy expenditure increases with higher amputation levels and with vascular etiology. Traumatic TT is about 25% above normal, vascular TT is about 40% above normal, and vascular TF is approximately 100% above normal. This hierarchy of energy expenditure is a high-yield board topic.',
      moduleId: 'transfemoral',
      difficulty: 'board',
    ),
    QuizQuestion(
      question:
          'What is the approximate energy expenditure increase for a vascular transfemoral amputee compared to normal?',
      options: ['25%', '40-60%', '100%', '150%'],
      correctIndex: 2,
      explanation:
          'A vascular transfemoral amputee expends approximately 100% more energy (double the normal energy cost) when walking at a comfortable speed. This is the highest energy expenditure among common amputation levels. The increased cost is due to both the higher amputation level requiring greater compensatory mechanisms and the underlying vascular disease that impairs cardiovascular efficiency.',
      moduleId: 'transfemoral',
      difficulty: 'board',
    ),
    QuizQuestion(
      question:
          'What is the approximate increase in energy expenditure for a traumatic transtibial amputee?',
      options: ['10%', '25%', '50%', '75%'],
      correctIndex: 1,
      explanation:
          'A traumatic transtibial amputee expends approximately 25% more energy than a non-amputee at comfortable walking speed. This is the lowest energy expenditure increase among major lower limb amputation levels. The preserved knee joint is the key factor, allowing more efficient gait mechanics. By comparison, vascular TT is approximately 40%, traumatic TF is 60-70%, and vascular TF is approximately 100% above normal.',
      moduleId: 'transfemoral',
      difficulty: 'board',
    ),
    QuizQuestion(
      question:
          'What is the approximate energy expenditure increase for a vascular transtibial amputee?',
      options: ['10%', '25%', '40%', '65%'],
      correctIndex: 2,
      explanation:
          'A vascular transtibial amputee expends approximately 40% more energy than normal at comfortable walking speed. The higher energy cost compared to traumatic TT (25%) is attributed to the underlying peripheral vascular disease, reduced cardiovascular reserve, and potential contralateral limb involvement. Despite this, vascular TT amputees generally remain functional community ambulators with appropriate prosthetic fitting and rehabilitation.',
      moduleId: 'transfemoral',
      difficulty: 'board',
    ),
    QuizQuestion(
      question:
          'Which surgical technique involves suturing the muscle directly to bone at the distal end of the residual limb?',
      options: ['Myoplasty', 'Myodesis', 'Myotomy', 'Tenodesis'],
      correctIndex: 1,
      explanation:
          'Myodesis is the surgical technique of suturing muscle directly to bone through drill holes at the distal end of the residual limb. This provides a secure fixation that maintains muscle tension and function, allowing better prosthetic control and limb shaping. Myoplasty, by contrast, involves suturing the agonist and antagonist muscles to each other over the bone end. Myodesis generally provides superior prosthetic function.',
      moduleId: 'transfemoral',
      difficulty: 'board',
    ),

    // ============================================================
    // MODULE: ue-prosthetics (Questions 59-64)
    // ============================================================
    QuizQuestion(
      question:
          'What is the primary advantage of a myoelectric prosthesis over a body-powered prosthesis?',
      options: [
        'Greater grip strength and more natural appearance',
        'Lighter weight and lower cost',
        'Greater proprioceptive feedback',
        'Simpler maintenance and longer durability',
      ],
      correctIndex: 0,
      explanation:
          'Myoelectric prostheses offer greater grip strength (typically 20-30 lbs vs 5-7 lbs for body-powered hooks) and superior cosmetic appearance. They are controlled by EMG signals from residual limb muscles, eliminating the need for a cable and harness system. However, they are heavier, more expensive, require battery charging, are less durable in wet or dirty environments, and provide less proprioceptive feedback than body-powered systems.',
      moduleId: 'ue-prosthetics',
      difficulty: 'board',
    ),
    QuizQuestion(
      question:
          'What is the primary advantage of a body-powered prosthesis over a myoelectric?',
      options: [
        'Greater grip strength',
        'Better cosmetic appearance',
        'Greater proprioceptive feedback through cable system',
        'Does not require any training',
      ],
      correctIndex: 2,
      explanation:
          'Body-powered prostheses provide greater proprioceptive feedback because the user can feel the resistance through the cable and harness system. This "extended physiological proprioception" allows the user to sense how much force they are applying and how far the terminal device is open. Body-powered systems are also lighter, less expensive, more durable, and water-resistant compared to myoelectric systems.',
      moduleId: 'ue-prosthetics',
      difficulty: 'board',
    ),
    QuizQuestion(
      question:
          'In myoelectric prosthesis control, two-site control uses electrodes placed over which muscles?',
      options: [
        'Biceps and triceps',
        'Wrist flexors and extensors of the residual forearm',
        'Deltoid and pectoralis major',
        'Thenar and hypothenar eminences',
      ],
      correctIndex: 1,
      explanation:
          'In two-site myoelectric control for a transradial prosthesis, surface electrodes are placed over the wrist flexor and extensor muscle groups of the residual forearm. Contraction of the flexors typically closes the hand/hook, while contraction of the extensors opens it. The amplitude of the EMG signal determines the speed of movement. For higher-level amputations, different muscle pairs may be used.',
      moduleId: 'ue-prosthetics',
      difficulty: 'intermediate',
    ),
    QuizQuestion(
      question:
          'A Syme amputation is characterized by which anatomical feature?',
      options: [
        'Amputation through the tarsometatarsal joints',
        'Disarticulation at the ankle with preserved heel pad',
        'Amputation through the midfoot',
        'Amputation at the knee joint',
      ],
      correctIndex: 1,
      explanation:
          'A Syme amputation is an ankle disarticulation that preserves the heel pad, which is secured to the distal end of the tibia to provide direct end-bearing capability. The characteristic bulbous distal end created by the malleoli can make prosthetic fitting challenging cosmetically, but the intact heel pad provides excellent weight-bearing tolerance. A Syme amputation typically allows for longer residual limb length and potentially better function than a standard transtibial amputation.',
      moduleId: 'ue-prosthetics',
      difficulty: 'board',
    ),
    QuizQuestion(
      question:
          'At what age is the first upper extremity prosthesis typically introduced for a pediatric patient with a congenital limb deficiency?',
      options: ['At birth', '3-4 months', '6 months (when sitting)', '12 months'],
      correctIndex: 2,
      explanation:
          'The first upper extremity prosthesis is typically introduced at approximately 6 months of age, coinciding with independent sitting. At this stage, a passive mitt or terminal device is provided to promote bilateral hand use and midline play. This early fitting encourages incorporation of the prosthesis into the child s body scheme. Active terminal device use is introduced later, around 15-18 months, and body-powered components around 2-3 years.',
      moduleId: 'ue-prosthetics',
      difficulty: 'board',
    ),
    QuizQuestion(
      question:
          'At what age is a lower extremity prosthesis typically first provided for a pediatric amputee?',
      options: [
        '3 months',
        '6 months',
        '9-12 months (when pulling to stand)',
        '18-24 months',
      ],
      correctIndex: 2,
      explanation:
          'A lower extremity prosthesis is typically introduced at 9-12 months of age, coinciding with the developmental milestone of pulling to stand. The initial prosthesis is usually simple with a SACH foot and no articulating knee (for transfemoral levels). This timing supports normal developmental progression and weight-bearing exploration. Upper extremity prostheses are introduced earlier, at approximately 6 months when the child begins sitting independently.',
      moduleId: 'ue-prosthetics',
      difficulty: 'board',
    ),

    // ============================================================
    // MODULE: gait-analysis (Questions 65-72)
    // ============================================================
    QuizQuestion(
      question:
          'Lateral trunk bending toward the prosthetic side during stance phase is most commonly caused by which factor?',
      options: [
        'Prosthesis too long',
        'Weak hip abductors on the amputated side or prosthesis too short',
        'Inadequate socket flexion',
        'Excessive prosthetic foot dorsiflexion',
      ],
      correctIndex: 1,
      explanation:
          'Lateral trunk bending (Trendelenburg-like gait) toward the prosthetic side is most commonly caused by weak hip abductors (gluteus medius) on the amputated side or a prosthesis that is too short. The patient compensates by shifting the trunk over the prosthetic side to move the center of gravity over the base of support. Other causes include a laterally placed socket, discomfort during weight-bearing, or an excessively wide ML socket.',
      moduleId: 'gait-analysis',
      difficulty: 'board',
    ),
    QuizQuestion(
      question:
          'Circumduction during prosthetic swing phase is most commonly caused by which factor?',
      options: [
        'Prosthesis too short',
        'Prosthesis too long or insufficient knee flexion',
        'Weak hip flexors',
        'Excessive socket flexion',
      ],
      correctIndex: 1,
      explanation:
          'Circumduction (swinging the prosthesis outward in an arc during swing phase) is most commonly caused by a prosthesis that is too long or insufficient knee flexion during swing. When the prosthesis is too long, the patient must swing the limb outward to clear the ground. Other causes include a locked knee, excessive stability in the prosthetic knee, or weak hip flexors that cannot achieve adequate swing phase advancement.',
      moduleId: 'gait-analysis',
      difficulty: 'board',
    ),
    QuizQuestion(
      question:
          'Vaulting during prosthetic gait is characterized by which movement?',
      options: [
        'Excessive knee flexion during stance',
        'Rising on the toe of the sound foot during prosthetic swing',
        'Dropping the pelvis on the prosthetic side',
        'Rotating the trunk toward the prosthetic side',
      ],
      correctIndex: 1,
      explanation:
          'Vaulting is a compensatory gait deviation where the patient rises on the toe (plantarflexes the ankle) of the sound limb during prosthetic swing phase to provide additional clearance for the prosthesis. It is typically caused by a prosthesis that is too long, inadequate suspension causing the prosthesis to drop, or insufficient prosthetic knee flexion. Vaulting increases energy expenditure and should be addressed through proper prosthetic alignment.',
      moduleId: 'gait-analysis',
      difficulty: 'board',
    ),
    QuizQuestion(
      question:
          'A whip at the prosthetic heel during initial swing phase in a transfemoral amputee is most commonly caused by which factor?',
      options: [
        'Prosthesis too long',
        'Excessive socket flexion',
        'Rotational malalignment of the socket relative to the knee and foot',
        'Weak hip extensors',
      ],
      correctIndex: 2,
      explanation:
          'A medial or lateral whip at the heel during initial flexion of the prosthetic knee is caused by rotational malalignment between the socket, knee, and foot. A medial whip (heel kicks inward) indicates the knee is externally rotated relative to the line of progression, while a lateral whip (heel kicks outward) indicates internal rotation. Correction involves adjusting the rotational alignment of the socket or knee-foot complex.',
      moduleId: 'gait-analysis',
      difficulty: 'board',
    ),
    QuizQuestion(
      question:
          'In a transtibial amputee, excessive knee flexion during stance (drop-off) is most commonly caused by which factor?',
      options: [
        'Socket set in too much extension',
        'Socket set in too much flexion or SACH heel is too soft',
        'Prosthetic foot set in too much inversion',
        'Suspension is too tight',
      ],
      correctIndex: 1,
      explanation:
          'Excessive knee flexion (drop-off) during mid-to-late stance in a transtibial prosthesis is most commonly caused by the socket being set in too much flexion or the prosthetic heel being too soft. Excessive socket flexion directs the ground reaction force posterior to the knee, creating a flexion moment. A heel cushion that is too soft allows too much tibial progression, also promoting knee flexion. This can cause the patient to feel unstable and report knee buckling.',
      moduleId: 'gait-analysis',
      difficulty: 'board',
    ),
    QuizQuestion(
      question:
          'An amputee demonstrates terminal impact (abrupt extension) at the end of prosthetic swing phase. The most likely cause is:',
      options: [
        'Insufficient friction in the knee unit',
        'Prosthesis is too short',
        'Excessive socket adduction',
        'Too much toe-out alignment',
      ],
      correctIndex: 0,
      explanation:
          'Terminal impact refers to an abrupt, audible extension of the prosthetic knee at the end of swing phase, just before initial contact. It is caused by insufficient friction or extension resistance in the prosthetic knee unit. The knee swings too freely and reaches full extension with excessive force, creating a jarring impact. Increasing the extension dampening or friction in the knee unit resolves this deviation.',
      moduleId: 'gait-analysis',
      difficulty: 'intermediate',
    ),
    QuizQuestion(
      question:
          'Unequal step length in a prosthetic user, with a longer step on the prosthetic side, is most commonly caused by:',
      options: [
        'Prosthesis is too long',
        'Insufficient confidence in the prosthetic limb and limited stance time',
        'Excessive hip flexion contracture on the sound side',
        'Prosthetic foot is set in too much plantarflexion',
      ],
      correctIndex: 1,
      explanation:
          'A longer step on the prosthetic side (shorter step on the sound side) occurs when the patient spends less time on the prosthesis during stance phase, rushing to place the sound foot down. This is typically due to insufficient confidence, pain, or instability on the prosthetic side. The patient takes a shorter step with the sound limb to quickly return to the more secure support of the intact leg.',
      moduleId: 'gait-analysis',
      difficulty: 'intermediate',
    ),
    QuizQuestion(
      question:
          'A wide-based gait in a transfemoral prosthetic user is most commonly attributed to:',
      options: [
        'Prosthesis too short',
        'Prosthesis aligned in excessive abduction or an excessively wide socket',
        'Excessive knee flexion resistance',
        'Heel cushion too firm',
      ],
      correctIndex: 1,
      explanation:
          'A wide-based gait in transfemoral prosthetic users is most commonly caused by excessive abduction alignment of the prosthesis, an excessively wide or poorly fitting socket, or a long residual limb that creates a bulge on the lateral distal aspect of the socket. The patient walks with the feet far apart to accommodate the prosthesis. This increases lateral displacement of the center of gravity and wastes energy.',
      moduleId: 'gait-analysis',
      difficulty: 'intermediate',
    ),

    // ============================================================
    // MODULE: materials-fabrication (Questions 73-76)
    // ============================================================
    QuizQuestion(
      question:
          'Which material is most commonly used for dynamic response (energy-storing) prosthetic feet?',
      options: [
        'Wood',
        'Carbon fiber composite',
        'Stainless steel',
        'Silicone',
      ],
      correctIndex: 1,
      explanation:
          'Carbon fiber composite is the most commonly used material for dynamic response prosthetic feet. Carbon fiber has an excellent strength-to-weight ratio and can store and release energy efficiently during the gait cycle. The carbon fiber keel deflects during loading response and midstance, storing elastic energy, then returns to its original shape during push-off, providing an energy return effect that improves walking efficiency.',
      moduleId: 'materials-fabrication',
      difficulty: 'intermediate',
    ),
    QuizQuestion(
      question:
          'What is the primary advantage of thermoplastic materials in orthotic fabrication?',
      options: [
        'Superior strength compared to all other materials',
        'Can be remolded and adjusted with heat after initial fabrication',
        'Lowest cost of all orthotic materials',
        'Do not require any special equipment for fabrication',
      ],
      correctIndex: 1,
      explanation:
          'Thermoplastics can be repeatedly softened with heat and reformed, allowing post-fabrication modifications and adjustments. This is particularly advantageous in P&O because patients often need socket or orthosis modifications as their condition changes. Common thermoplastics include polypropylene, polyethylene, and copolymers. Thermosets (like carbon fiber laminates), by contrast, cannot be remolded once cured.',
      moduleId: 'materials-fabrication',
      difficulty: 'basic',
    ),
    QuizQuestion(
      question:
          'Which liner material provides the best shock absorption and is commonly used in prosthetic gel liners?',
      options: [
        'Pelite foam',
        'Silicone or thermoplastic elastomer (TPE)',
        'Leather',
        'Cork',
      ],
      correctIndex: 1,
      explanation:
          'Silicone and thermoplastic elastomer (TPE) gel liners provide excellent shock absorption and skin protection in prosthetic sockets. These materials distribute pressure evenly through their viscoelastic properties, reduce shear forces on the skin, and provide cushioning over bony prominences. Silicone offers better durability while TPE is more affordable. Both are available in various thicknesses and configurations for different residual limb shapes.',
      moduleId: 'materials-fabrication',
      difficulty: 'intermediate',
    ),
    QuizQuestion(
      question:
          'Polypropylene is classified as which type of material?',
      options: [
        'Thermoset plastic',
        'Thermoplastic',
        'Elastomer',
        'Composite',
      ],
      correctIndex: 1,
      explanation:
          'Polypropylene is a thermoplastic material widely used in orthotics and prosthetics for socket fabrication, AFOs, and other custom devices. As a thermoplastic, it can be heated to a pliable state and molded over a positive model, then cooled to maintain its shape. It can be reheated and adjusted as needed. Polypropylene offers a good balance of rigidity, flexibility, durability, and ease of fabrication.',
      moduleId: 'materials-fabrication',
      difficulty: 'basic',
    ),

    // ============================================================
    // MODULE: pediatric-po (Questions 77-80)
    // ============================================================
    QuizQuestion(
      question:
          'A pediatric patient with myelomeningocele at the L3 level would most likely require which orthotic device for ambulation?',
      options: [
        'AFOs bilaterally',
        'KAFOs bilaterally',
        'HKAFOs with RGO',
        'Shoe modifications only',
      ],
      correctIndex: 1,
      explanation:
          'An L3 myelomeningocele results in functional hip flexion and adduction, knee extension (partial quadriceps), but absent knee flexion, ankle dorsiflexion, and plantarflexion. Bilateral KAFOs are typically required because the quadriceps are partially innervated but not strong enough for consistent stance stability without orthotic support. HKAFOs would be needed for higher-level lesions (T12-L2), while AFOs would suffice for lower-level lesions (L5-S1).',
      moduleId: 'pediatric-po',
      difficulty: 'board',
    ),
    QuizQuestion(
      question:
          'What is the most common reason for prosthetic revision in a growing child?',
      options: [
        'Socket wear and tear',
        'Growth of the residual limb requiring larger socket',
        'Component failure',
        'Change in activity level',
      ],
      correctIndex: 1,
      explanation:
          'Growing children require frequent prosthetic revisions primarily due to residual limb growth. Children may need socket changes every 6-12 months during rapid growth periods and full prosthesis replacement every 12-18 months. The residual limb outgrows the socket, causing discomfort, pistoning, and loss of function. Adjustable sockets and modular components can extend the time between replacements.',
      moduleId: 'pediatric-po',
      difficulty: 'intermediate',
    ),
    QuizQuestion(
      question:
          'In a congenital below-elbow limb deficiency, when is the first myoelectric terminal device typically introduced?',
      options: [
        '6 months',
        '12-15 months',
        '2.5-3 years',
        '5-6 years',
      ],
      correctIndex: 2,
      explanation:
          'A myoelectric terminal device is typically introduced at approximately 2.5-3 years of age for congenital upper extremity limb deficiency. Before this, a passive mitt (at 6 months) and then a body-powered CAPP terminal device (at 15-18 months) are provided. The sequence follows developmental milestones: sitting (passive prosthesis), active grasping (body-powered), and cognitive readiness for myoelectric control (2.5-3 years).',
      moduleId: 'pediatric-po',
      difficulty: 'board',
    ),
    QuizQuestion(
      question:
          'Appositional bone growth in pediatric amputees can lead to which complication?',
      options: [
        'Joint contracture',
        'Bony overgrowth (terminal overgrowth) that requires surgical revision',
        'Phantom pain',
        'Skin hyperpigmentation',
      ],
      correctIndex: 1,
      explanation:
          'Appositional bone growth (terminal overgrowth) is a phenomenon unique to pediatric amputees where the bone continues to grow at the transected end, creating a sharp spur that can penetrate the soft tissue and skin. This is most common in the humerus, fibula, tibia, and femur (in that order). It is not related to longitudinal growth from growth plates. Surgical revision (stump capping or revision amputation) is often required.',
      moduleId: 'pediatric-po',
      difficulty: 'board',
    ),

    // ============================================================
    // MODULE: advanced-tech (Questions 81-83)
    // ============================================================
    QuizQuestion(
      question:
          'Targeted muscle reinnervation (TMR) improves myoelectric prosthesis control by:',
      options: [
        'Strengthening the existing residual limb muscles',
        'Transferring amputated limb nerves to new muscle sites to create additional EMG control signals',
        'Implanting electrodes directly into peripheral nerves',
        'Using brain-computer interface technology',
      ],
      correctIndex: 1,
      explanation:
          'Targeted muscle reinnervation (TMR) is a surgical procedure that transfers residual nerves from the amputated limb to alternative muscle sites (typically the pectoralis or residual limb muscles). When the patient thinks about moving the missing hand, the reinnervated muscles contract, producing EMG signals that can be detected by surface electrodes to control multiple prosthetic functions simultaneously. TMR also helps reduce phantom and neuroma pain.',
      moduleId: 'advanced-tech',
      difficulty: 'board',
    ),
    QuizQuestion(
      question:
          'Osseointegration in lower limb prosthetics involves which principle?',
      options: [
        'Bonding a prosthetic liner to the skin',
        'Directly implanting a metal fixture into the bone for prosthetic attachment',
        'Using vacuum suspension through the skin',
        'Injecting cement into the medullary canal',
      ],
      correctIndex: 1,
      explanation:
          'Osseointegration involves surgically implanting a titanium fixture directly into the medullary canal of the residual bone, allowing direct skeletal attachment of the prosthesis without a socket. This eliminates socket-related problems such as skin breakdown, heat, and pistoning. It provides excellent osseoperception (the ability to sense the ground through the prosthesis). Candidates must have good bone quality and accept the risk of infection at the percutaneous implant site.',
      moduleId: 'advanced-tech',
      difficulty: 'intermediate',
    ),
    QuizQuestion(
      question:
          'Pattern recognition control in myoelectric prostheses uses which principle?',
      options: [
        'A single EMG channel controlling one function',
        'Machine learning algorithms that identify unique patterns from multiple EMG channels',
        'Voice-activated commands',
        'Pressure sensors in the socket wall',
      ],
      correctIndex: 1,
      explanation:
          'Pattern recognition control uses machine learning algorithms to analyze EMG signal patterns from multiple electrodes placed over the residual limb muscles. Instead of proportional control from one or two sites, the system recognizes distinct patterns of muscle activation associated with different intended movements (e.g., hand open, wrist rotation, grip types). This allows more intuitive, simultaneous control of multiple degrees of freedom.',
      moduleId: 'advanced-tech',
      difficulty: 'intermediate',
    ),

    // ============================================================
    // MODULE: amputation-rehab (Questions 84-88)
    // ============================================================
    QuizQuestion(
      question:
          'Rigid dressing applied immediately post-amputation provides all of the following benefits EXCEPT:',
      options: [
        'Edema control',
        'Wound protection',
        'Immediate weight-bearing with a pylon',
        'Eliminates phantom limb pain permanently',
      ],
      correctIndex: 3,
      explanation:
          'Rigid dressings (IPOP - immediate postoperative prosthesis) provide edema control, wound protection, residual limb shaping, and can allow early protected weight-bearing with an attached pylon. They do NOT eliminate phantom limb pain permanently. Phantom limb sensation and pain are complex neurological phenomena that may persist regardless of the dressing type. Rigid dressings may reduce acute phantom pain through compression and sensory input.',
      moduleId: 'amputation-rehab',
      difficulty: 'intermediate',
    ),
    QuizQuestion(
      question:
          'The primary purpose of residual limb wrapping with elastic bandage in a figure-of-eight pattern is:',
      options: [
        'Wound healing',
        'Shaping the residual limb into a cylindrical or conical shape for socket fitting',
        'Preventing phantom limb pain',
        'Increasing blood flow to the residual limb',
      ],
      correctIndex: 1,
      explanation:
          'Elastic bandage wrapping in a figure-of-eight pattern is performed to shape the residual limb into a conical or cylindrical shape optimal for prosthetic socket fitting and to control post-surgical edema. The wrapping should apply more pressure distally than proximally (distal-to-proximal gradient) to prevent a tourniquet effect and promote venous return. Improper wrapping with proximal constriction can cause a bulbous distal residual limb.',
      moduleId: 'amputation-rehab',
      difficulty: 'intermediate',
    ),
    QuizQuestion(
      question:
          'What is the most common contracture pattern in a transfemoral amputee?',
      options: [
        'Hip extension and adduction',
        'Hip flexion, abduction, and external rotation',
        'Hip internal rotation and flexion',
        'Hip extension and internal rotation',
      ],
      correctIndex: 1,
      explanation:
          'The most common contracture pattern in transfemoral amputees is hip flexion, abduction, and external rotation. This occurs because the hip flexors (iliopsoas), abductors (gluteus medius and TFL), and external rotators are unopposed when their antagonists are weakened by the amputation. Prolonged sitting and wheelchair use contribute to hip flexion contracture. Prevention involves prone positioning, stretching, and strengthening of hip extensors and adductors.',
      moduleId: 'amputation-rehab',
      difficulty: 'board',
    ),
    QuizQuestion(
      question:
          'What is the most common contracture position in a transtibial amputee?',
      options: [
        'Knee extension contracture',
        'Knee flexion contracture',
        'Hip flexion contracture',
        'Ankle plantarflexion contracture',
      ],
      correctIndex: 1,
      explanation:
          'Knee flexion contracture is the most common contracture in transtibial amputees. The hamstrings pull the tibia into flexion without adequate counterbalance from the amputated limb, and patients often rest with the knee flexed on a pillow for comfort. Prevention strategies include prone lying, knee extension exercises, avoiding pillows under the knee, and early prosthetic fitting to encourage weight-bearing in extension.',
      moduleId: 'amputation-rehab',
      difficulty: 'board',
    ),
    QuizQuestion(
      question:
          'Which prosthetic management approach involves fitting a prosthesis in the operating room immediately after amputation?',
      options: [
        'Delayed prosthetic fitting',
        'Early prosthetic fitting',
        'Immediate postoperative prosthesis (IPOP)',
        'Preparatory prosthetic fitting',
      ],
      correctIndex: 2,
      explanation:
          'An immediate postoperative prosthesis (IPOP) involves applying a rigid dressing with a pylon and prosthetic foot in the operating room immediately after amputation surgery. Benefits include wound protection, edema control, early weight-bearing, psychological benefit, and faster rehabilitation. Studies show IPOP leads to faster prosthetic fitting and potentially higher rates of successful prosthetic ambulation compared to delayed fitting approaches.',
      moduleId: 'amputation-rehab',
      difficulty: 'intermediate',
    ),

    // ============================================================
    // MODULE: special-populations (Questions 89-92)
    // ============================================================
    QuizQuestion(
      question:
          'In a patient with diabetes and peripheral neuropathy, which factor is the most important consideration for prosthetic socket design?',
      options: [
        'Maximum energy return',
        'Pressure distribution and skin protection to prevent breakdown',
        'Lightest possible weight regardless of fit',
        'Maximum range of motion at all joints',
      ],
      correctIndex: 1,
      explanation:
          'For diabetic patients with peripheral neuropathy, pressure distribution and skin protection are the highest priority in socket design. These patients cannot feel excessive pressure or early skin breakdown due to sensory loss, making them highly vulnerable to wounds that heal poorly due to vascular compromise. Total contact sockets, gel liners, careful monitoring of skin integrity, and regular follow-up appointments are essential for this population.',
      moduleId: 'special-populations',
      difficulty: 'intermediate',
    ),
    QuizQuestion(
      question:
          'The leading cause of lower extremity amputation in the United States is:',
      options: [
        'Trauma',
        'Cancer',
        'Peripheral vascular disease and diabetes',
        'Congenital limb deficiency',
      ],
      correctIndex: 2,
      explanation:
          'Peripheral vascular disease (PVD) and diabetes account for approximately 82% of all lower extremity amputations in the United States, making dysvascular disease the leading cause by a wide margin. Trauma accounts for about 16%, cancer about 1%, and congenital about 1%. The incidence of dysvascular amputation increases with age and is higher in patients with poorly controlled diabetes, smoking, and peripheral arterial disease.',
      moduleId: 'special-populations',
      difficulty: 'board',
    ),
    QuizQuestion(
      question:
          'A bilateral transfemoral amputee should have their prostheses set at what height relative to their pre-amputation height?',
      options: [
        'Same height as prior to amputation',
        '1-2 inches shorter than pre-amputation height',
        '2-4 inches shorter than pre-amputation height',
        '1 inch taller than pre-amputation height',
      ],
      correctIndex: 2,
      explanation:
          'Bilateral transfemoral amputees typically have their prostheses set 2-4 inches shorter than their pre-amputation height. The reduced height lowers the center of gravity, improving balance and stability. It also reduces the energy expenditure required for ambulation, which is already extremely high for bilateral TF amputees. Stubby prostheses (short prostheses without knee joints) may be used initially during training.',
      moduleId: 'special-populations',
      difficulty: 'board',
    ),
    QuizQuestion(
      question:
          'Which of the following is a characteristic of a Chopart amputation?',
      options: [
        'Disarticulation through the tarsometatarsal joints',
        'Disarticulation through the midtarsal (talonavicular and calcaneocuboid) joints',
        'Transection through the metatarsal shafts',
        'Removal of all toes at the MTP joints',
      ],
      correctIndex: 1,
      explanation:
          'A Chopart amputation is a disarticulation through the midtarsal joint (talonavicular and calcaneocuboid joints), preserving the talus and calcaneus. The primary challenge is the tendency for the residual foot to develop an equinovarus deformity due to the unopposed pull of the triceps surae (Achilles tendon) after loss of the anterior tibialis and peroneal insertions. A Lisfranc amputation occurs through the tarsometatarsal joints.',
      moduleId: 'special-populations',
      difficulty: 'board',
    ),
  ];

  static List<QuizQuestion> getRandomQuiz(int count) {
    final shuffled = List<QuizQuestion>.from(allQuestions)..shuffle();
    return shuffled.take(count).toList();
  }

  static List<QuizQuestion> getQuestionsByModule(String moduleId) {
    return allQuestions.where((q) => q.moduleId == moduleId).toList();
  }

  static List<QuizQuestion> getQuestionsByDifficulty(String difficulty) {
    return allQuestions.where((q) => q.difficulty == difficulty).toList();
  }
}

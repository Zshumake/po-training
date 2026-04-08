import '../models/topic_content_model.dart';

// =============================================================================
// 1. AFO Selection Algorithm
// =============================================================================

final afoSelectionFlowchart = FlowchartBlock(
  title: 'AFO Selection Algorithm',
  rootNodeId: 'root',
  nodes: {
    'root': const FlowchartNode(
      id: 'root',
      text: 'Patient presents with ankle/foot dysfunction',
      options: [
        FlowchartOption(label: 'Is foot drop present?', targetNodeId: 'footDrop'),
      ],
    ),
    'footDrop': const FlowchartNode(
      id: 'footDrop',
      text: 'Is foot drop present?',
      options: [
        FlowchartOption(label: 'Yes', targetNodeId: 'spasticity'),
        FlowchartOption(label: 'No', targetNodeId: 'crouchGait'),
      ],
    ),
    'spasticity': const FlowchartNode(
      id: 'spasticity',
      text: 'Is spasticity present?',
      options: [
        FlowchartOption(label: 'Yes', targetNodeId: 'quads'),
        FlowchartOption(label: 'No', targetNodeId: 'plsAfo'),
      ],
    ),
    'plsAfo': const FlowchartNode(
      id: 'plsAfo',
      text: 'PLS AFO',
      recommendation: 'PLS AFO',
      rationale: 'Pure foot drop with intact plantarflexors. A posterior leaf spring AFO provides dorsiflexion assist during swing without restricting plantarflexion at terminal stance.',
      boardPearl: 'PLS AFO is the least restrictive AFO option — use when only dorsiflexion weakness is present with no spasticity.',
    ),
    'quads': const FlowchartNode(
      id: 'quads',
      text: 'Is quadriceps strength adequate (\u22653+/5)?',
      options: [
        FlowchartOption(label: 'Yes', targetNodeId: 'recurvatum'),
        FlowchartOption(label: 'No', targetNodeId: 'solidAfo'),
      ],
    ),
    'solidAfo': const FlowchartNode(
      id: 'solidAfo',
      text: 'Solid AFO',
      recommendation: 'Solid AFO',
      rationale: 'Controls all ankle motion and provides maximum stability. Because the solid AFO blocks plantarflexion at initial contact, the ground reaction force vector falls posterior to the knee, producing an external knee FLEXION moment at heel strike (not extension).',
      boardPearl: 'Solid AFO blocks both dorsiflexion and plantarflexion. By blocking plantarflexion at heel strike it creates a knee FLEXION moment — patients need adequate quadriceps to resist knee buckling in early stance.',
    ),
    'recurvatum': const FlowchartNode(
      id: 'recurvatum',
      text: 'Is knee recurvatum present?',
      options: [
        FlowchartOption(label: 'Yes', targetNodeId: 'articulatedPfDfStop'),
        FlowchartOption(label: 'No', targetNodeId: 'articulatedPfStop'),
      ],
    ),
    'articulatedPfStop': const FlowchartNode(
      id: 'articulatedPfStop',
      text: 'Articulated AFO with PF stop',
      recommendation: 'Articulated AFO with plantarflexion stop',
      rationale: 'Controls foot drop during swing phase while allowing free dorsiflexion during stance. The PF stop prevents foot slap at initial contact.',
      boardPearl: 'Articulated AFO with PF stop allows tibial progression over the foot in stance — critical for a more normal gait pattern.',
    ),
    'articulatedPfDfStop': const FlowchartNode(
      id: 'articulatedPfDfStop',
      text: 'Articulated AFO with PF AND DF stop',
      recommendation: 'Articulated AFO with plantarflexion and dorsiflexion stop',
      rationale: 'Controls both foot drop and knee recurvatum. The DF stop prevents excessive tibial advancement that drives the knee into hyperextension.',
      boardPearl: 'DF stop set at 5\u00b0 dorsiflexion prevents recurvatum by blocking further tibial progression.',
    ),
    'crouchGait': const FlowchartNode(
      id: 'crouchGait',
      text: 'Is the primary problem crouch gait (excessive knee flexion)?',
      options: [
        FlowchartOption(label: 'Yes', targetNodeId: 'crouchQuads'),
        FlowchartOption(label: 'No', targetNodeId: 'mlInstability'),
      ],
    ),
    'crouchQuads': const FlowchartNode(
      id: 'crouchQuads',
      text: 'Does patient have intact quadriceps?',
      options: [
        FlowchartOption(label: 'Yes', targetNodeId: 'fro'),
        FlowchartOption(label: 'No', targetNodeId: 'kafo'),
      ],
    ),
    'fro': const FlowchartNode(
      id: 'fro',
      text: 'Floor Reaction Orthosis / GRAFO',
      recommendation: 'Floor Reaction Orthosis (FRO) / Ground Reaction AFO (GRAFO)',
      rationale: 'Creates a knee extension moment by blocking dorsiflexion and redirecting the ground reaction force anterior to the knee. Requires adequate quadriceps to be effective.',
      boardPearl: 'FRO requires intact quads (\u22653+/5) to work. It creates a knee extension moment by blocking tibial progression.',
    ),
    'kafo': const FlowchartNode(
      id: 'kafo',
      text: 'KAFO needed',
      recommendation: 'Knee-Ankle-Foot Orthosis (KAFO)',
      rationale: 'Quadriceps are insufficient for a floor reaction orthosis to be effective. A KAFO provides direct knee stabilization.',
      boardPearl: 'When quads are <3/5 and crouch gait is present, an FRO will fail — escalate to a KAFO.',
    ),
    'mlInstability': const FlowchartNode(
      id: 'mlInstability',
      text: 'Is mediolateral instability the primary issue?',
      options: [
        FlowchartOption(label: 'Yes', targetNodeId: 'mlAfo'),
        FlowchartOption(label: 'No', targetNodeId: 'shoeModification'),
      ],
    ),
    'mlAfo': const FlowchartNode(
      id: 'mlAfo',
      text: 'Solid AFO or double upright AFO',
      recommendation: 'Solid AFO or double upright AFO',
      rationale: 'Provides mediolateral stability at the ankle. Double upright metal AFOs offer superior ML control and are adjustable.',
      boardPearl: 'Double upright AFOs provide the best mediolateral control and are preferred for significant ankle instability.',
    ),
    'shoeModification': const FlowchartNode(
      id: 'shoeModification',
      text: 'Consider shoe modification or foot orthosis',
      recommendation: 'Shoe modification or foot orthosis',
      rationale: 'If no foot drop, no crouch gait, and no ML instability, the dysfunction may be addressable with less restrictive interventions such as custom foot orthoses or shoe modifications.',
    ),
  },
);

// =============================================================================
// 2. Prosthetic Foot Selection by K-Level
// =============================================================================

final prostheticFootFlowchart = FlowchartBlock(
  title: 'Prosthetic Foot Selection by K-Level',
  rootNodeId: 'root',
  nodes: {
    'root': const FlowchartNode(
      id: 'root',
      text: 'Select prosthetic foot based on functional level',
      options: [
        FlowchartOption(label: 'What is the patient\'s K-level?', targetNodeId: 'kLevel'),
      ],
    ),
    'kLevel': const FlowchartNode(
      id: 'kLevel',
      text: 'What is the patient\'s K-level?',
      options: [
        FlowchartOption(label: 'K1', targetNodeId: 'k1Sach'),
        FlowchartOption(label: 'K2', targetNodeId: 'k2KneeStability'),
        FlowchartOption(label: 'K3', targetNodeId: 'k3Esar'),
        FlowchartOption(label: 'K4', targetNodeId: 'k4Sport'),
      ],
    ),
    'k1Sach': const FlowchartNode(
      id: 'k1Sach',
      text: 'SACH foot',
      recommendation: 'SACH foot',
      rationale: 'No moving parts provides maximum stability for household ambulators. Durable, lightweight, and lowest maintenance of all prosthetic feet.',
      boardPearl: 'SACH = Solid Ankle Cushion Heel. The compressible heel simulates plantarflexion at initial contact. Best for K1 (household) ambulators.',
    ),
    'k2KneeStability': const FlowchartNode(
      id: 'k2KneeStability',
      text: 'Is knee stability a concern?',
      options: [
        FlowchartOption(label: 'Yes', targetNodeId: 'k2SingleAxis'),
        FlowchartOption(label: 'No', targetNodeId: 'k2MultiAxis'),
      ],
    ),
    'k2SingleAxis': const FlowchartNode(
      id: 'k2SingleAxis',
      text: 'Single-axis foot',
      recommendation: 'Single-axis foot',
      rationale: 'Rapid achievement of foot flat enhances knee stability by quickly moving the ground reaction force vector anterior to the knee joint. Ideal for K2 ambulator with transfemoral amputation.',
      boardPearl: 'Single-axis foot achieves foot flat faster than any other foot — creates rapid knee extension moment. Best for TF amputees needing knee stability.',
    ),
    'k2MultiAxis': const FlowchartNode(
      id: 'k2MultiAxis',
      text: 'Multi-axis foot',
      recommendation: 'Multi-axis foot',
      rationale: 'Allows motion in all three planes (sagittal, frontal, transverse), improving accommodation on uneven terrain for limited community ambulators.',
      boardPearl: 'Multi-axis feet allow inversion/eversion and transverse rotation — best for uneven terrain ambulation.',
    ),
    'k3Esar': const FlowchartNode(
      id: 'k3Esar',
      text: 'Energy-storing and returning (ESAR) foot',
      recommendation: 'Energy-storing and returning (ESAR) foot',
      rationale: 'Carbon fiber keel stores energy during mid-stance and returns it at push-off, reducing metabolic cost for unlimited community ambulators.',
      boardPearl: 'ESAR feet return 90%+ of stored energy at push-off. Carbon fiber construction provides dynamic response for K3 community ambulators.',
    ),
    'k4Sport': const FlowchartNode(
      id: 'k4Sport',
      text: 'Is this for a specific sport?',
      options: [
        FlowchartOption(label: 'Yes', targetNodeId: 'k4ActivitySpecific'),
        FlowchartOption(label: 'No', targetNodeId: 'k4HighPerformance'),
      ],
    ),
    'k4ActivitySpecific': const FlowchartNode(
      id: 'k4ActivitySpecific',
      text: 'Activity-specific prosthesis',
      recommendation: 'Activity-specific prosthesis',
      rationale: 'Dedicated sport prostheses (running blade, swimming foot, cycling foot) are optimized for the biomechanical demands of specific activities.',
      boardPearl: 'Running blades (e.g., Cheetah) are J-shaped carbon fiber designs that maximize energy return for sprinting. Not appropriate for walking.',
    ),
    'k4HighPerformance': const FlowchartNode(
      id: 'k4HighPerformance',
      text: 'High-performance ESAR or microprocessor ankle',
      recommendation: 'High-performance ESAR foot or microprocessor ankle (BiOM/Empower)',
      rationale: 'Microprocessor ankles actively generate push-off power, reducing metabolic cost by up to 12% compared to passive ESAR feet. High-performance ESAR feet offer maximum energy return for active K4 users.',
      boardPearl: 'The BiOM/Empower is the only powered ankle — it generates active push-off, approaching biological ankle power output.',
    ),
  },
);

// =============================================================================
// 3. Cervical Orthosis Selection
// =============================================================================

final cervicalOrthosisFlowchart = FlowchartBlock(
  title: 'Cervical Orthosis Selection',
  rootNodeId: 'root',
  nodes: {
    'root': const FlowchartNode(
      id: 'root',
      text: 'Cervical spine injury requiring external immobilization',
      options: [
        FlowchartOption(label: 'Is the injury at the upper cervical spine (C1-C2)?', targetNodeId: 'upperCervical'),
      ],
    ),
    'upperCervical': const FlowchartNode(
      id: 'upperCervical',
      text: 'Is the injury at the upper cervical spine (C1-C2)?',
      options: [
        FlowchartOption(label: 'Yes', targetNodeId: 'upperUnstable'),
        FlowchartOption(label: 'No', targetNodeId: 'lowerMotionControl'),
      ],
    ),
    'upperUnstable': const FlowchartNode(
      id: 'upperUnstable',
      text: 'Is the fracture unstable?',
      options: [
        FlowchartOption(label: 'Yes', targetNodeId: 'haloUpper'),
        FlowchartOption(label: 'No', targetNodeId: 'ctoSomi'),
      ],
    ),
    'haloUpper': const FlowchartNode(
      id: 'haloUpper',
      text: 'Halo vest',
      recommendation: 'Halo vest',
      rationale: 'Gold standard for unstable upper cervical spine injuries. Provides the greatest restriction of cervical motion of any orthosis (>95% restriction in all planes).',
      boardPearl: 'Halo vest provides the most cervical restriction of any orthosis. Pin torque: 8 in-lb (adults), 2-4 in-lb (children). Watch for pin-site infections.',
    ),
    'ctoSomi': const FlowchartNode(
      id: 'ctoSomi',
      text: 'CTO or SOMI',
      recommendation: 'Cervicothoracic orthosis (CTO) or sternal-occipital-mandibular immobilizer (SOMI)',
      rationale: 'For stable upper cervical fractures, a CTO or SOMI provides adequate immobilization without the complications of halo pin fixation.',
      boardPearl: 'SOMI is best for mid-cervical (C2-C5) flexion control (~93% restriction) but does NOT effectively restrict C1-C2 motion and is poor in extension (~42%). CTO provides more balanced multiplanar control.',
    ),
    'lowerMotionControl': const FlowchartNode(
      id: 'lowerMotionControl',
      text: 'Lower C-spine (C3-C7): What motion needs primary control?',
      options: [
        FlowchartOption(label: 'Flexion', targetNodeId: 'somiFlexion'),
        FlowchartOption(label: 'Extension', targetNodeId: 'fourPoster'),
        FlowchartOption(label: 'All planes', targetNodeId: 'allPlanes'),
      ],
    ),
    'somiFlexion': const FlowchartNode(
      id: 'somiFlexion',
      text: 'SOMI brace',
      recommendation: 'SOMI brace',
      rationale: 'Best single-plane flexion control of any cervical orthosis, restricting 93% of flexion. Sternal and mandibular plates provide anterior support.',
      boardPearl: 'SOMI = best flexion control. Remember: SOMI has NO posterior component — it is an anterior-only design with head band.',
    ),
    'fourPoster': const FlowchartNode(
      id: 'fourPoster',
      text: 'Four-poster brace',
      recommendation: 'Four-poster brace',
      rationale: 'Better extension control than SOMI due to bilateral posterior uprights connecting occipital and thoracic plates.',
      boardPearl: 'Four-poster provides better extension control than SOMI. Two anterior + two posterior uprights with mandibular and occipital supports.',
    ),
    'allPlanes': const FlowchartNode(
      id: 'allPlanes',
      text: 'Is maximum restriction needed?',
      options: [
        FlowchartOption(label: 'Yes', targetNodeId: 'haloLower'),
        FlowchartOption(label: 'No', targetNodeId: 'stableFracture'),
      ],
    ),
    'haloLower': const FlowchartNode(
      id: 'haloLower',
      text: 'Halo vest',
      recommendation: 'Halo vest',
      rationale: 'When maximum multiplanar restriction is required in the lower C-spine, halo vest is the most effective external immobilizer.',
      boardPearl: 'Halo vest is the gold standard for maximum cervical restriction at any level. However, paradoxical motion (snaking) can occur at C1-C2 with lower C-spine halo use.',
    ),
    'stableFracture': const FlowchartNode(
      id: 'stableFracture',
      text: 'Is it a stable fracture?',
      options: [
        FlowchartOption(label: 'Yes', targetNodeId: 'collar'),
        FlowchartOption(label: 'No', targetNodeId: 'ctoYaleMinerva'),
      ],
    ),
    'collar': const FlowchartNode(
      id: 'collar',
      text: 'Philadelphia or Miami J collar',
      recommendation: 'Philadelphia collar or Miami J collar',
      rationale: 'For stable lower cervical fractures requiring multiplanar control without maximum restriction. These rigid collars restrict approximately 70% of flexion/extension.',
      boardPearl: 'Miami J is a modified Philadelphia collar with improved ventilation and adjustability. Both restrict ~70% of overall cervical motion.',
    ),
    'ctoYaleMinerva': const FlowchartNode(
      id: 'ctoYaleMinerva',
      text: 'CTO (Yale or Minerva)',
      recommendation: 'CTO: Yale brace or Minerva body jacket',
      rationale: 'Unstable lower cervical fractures requiring multi-planar control benefit from CTOs that extend to the thorax for improved lever arm and motion restriction.',
      boardPearl: 'Yale brace = Philadelphia collar + thoracic extension. Minerva provides circumferential head/thorax control without halo pins.',
    ),
  },
);

// =============================================================================
// 4. TF Knee Unit Selection
// =============================================================================

final tfKneeSelectionFlowchart = FlowchartBlock(
  title: 'Transfemoral Knee Unit Selection',
  rootNodeId: 'root',
  nodes: {
    'root': const FlowchartNode(
      id: 'root',
      text: 'Select knee unit for transfemoral amputee',
      options: [
        FlowchartOption(label: 'What is the patient\'s K-level?', targetNodeId: 'kLevel'),
      ],
    ),
    'kLevel': const FlowchartNode(
      id: 'kLevel',
      text: 'What is the patient\'s K-level?',
      options: [
        FlowchartOption(label: 'K1', targetNodeId: 'k1Locking'),
        FlowchartOption(label: 'K2', targetNodeId: 'k2Falls'),
        FlowchartOption(label: 'K3-K4', targetNodeId: 'k3k4Active'),
      ],
    ),
    'k1Locking': const FlowchartNode(
      id: 'k1Locking',
      text: 'Manual locking knee',
      recommendation: 'Manual locking knee',
      rationale: 'Maximum stance stability with the simplest mechanism. The knee remains locked during stance and swing, producing a stiff-legged gait but maximum safety for household ambulators.',
      boardPearl: 'Manual locking knee = safest option for K1. Locked in full extension during ambulation. Patient unlocks to sit. Circumducted gait pattern is expected.',
    ),
    'k2Falls': const FlowchartNode(
      id: 'k2Falls',
      text: 'Does patient have history of falls or need stability features?',
      options: [
        FlowchartOption(label: 'Yes', targetNodeId: 'k2Mpk'),
        FlowchartOption(label: 'No', targetNodeId: 'k2StanceControl'),
      ],
    ),
    'k2Mpk': const FlowchartNode(
      id: 'k2Mpk',
      text: 'Microprocessor knee (C-Leg)',
      recommendation: 'Microprocessor knee (C-Leg)',
      rationale: 'Eligible per September 2024 CMS ruling for K2 patients with documented fall history. Microprocessor knees reduce falls by up to 80% through real-time stumble recovery.',
      boardPearl: 'Sept 2024 CMS ruling: K2 patients with fall history now qualify for MPKs. Previously limited to K3-K4. C-Leg reduces falls by 80% vs mechanical knees.',
    ),
    'k2StanceControl': const FlowchartNode(
      id: 'k2StanceControl',
      text: 'Stance-control (weight-activated) knee',
      recommendation: 'Stance-control (weight-activated) knee',
      rationale: 'Allows swing phase flexion for a more natural gait while locking in stance phase when weight is applied. Good balance of stability and function for K2 ambulators.',
      boardPearl: 'Weight-activated stance-control knees lock when loaded (stance) and unlock when unloaded (swing). High friction = more stability but stiffer swing.',
    ),
    'k3k4Active': const FlowchartNode(
      id: 'k3k4Active',
      text: 'Is the patient highly active or an athlete?',
      options: [
        FlowchartOption(label: 'Yes', targetNodeId: 'k3k4Waterproof'),
        FlowchartOption(label: 'No', targetNodeId: 'k3k4CLeg'),
      ],
    ),
    'k3k4Waterproof': const FlowchartNode(
      id: 'k3k4Waterproof',
      text: 'Is waterproofing needed?',
      options: [
        FlowchartOption(label: 'Yes', targetNodeId: 'geniumX3'),
        FlowchartOption(label: 'No', targetNodeId: 'clegOrRheo'),
      ],
    ),
    'geniumX3': const FlowchartNode(
      id: 'geniumX3',
      text: 'Genium X3',
      recommendation: 'Genium X3',
      rationale: 'IP68 waterproof microprocessor knee suitable for swimming, showering, and aquatic activities. Also features running mode and intuitive stance function.',
      boardPearl: 'Genium X3 is the only fully waterproof (IP68) microprocessor knee. Ideal for active patients requiring aquatic activities.',
    ),
    'clegOrRheo': const FlowchartNode(
      id: 'clegOrRheo',
      text: 'C-Leg 4 or Rheo Knee 3',
      recommendation: 'C-Leg 4 or Rheo Knee 3',
      rationale: 'Both are top-tier microprocessor knees. The Rheo Knee uses magnetorheological fluid and demonstrates 5% less metabolic cost compared to the C-Leg in studies.',
      boardPearl: 'Rheo Knee 3 uses magnetorheological (MR) fluid — 5% less metabolic cost vs C-Leg. C-Leg uses hydraulic cylinder with microprocessor control.',
    ),
    'k3k4CLeg': const FlowchartNode(
      id: 'k3k4CLeg',
      text: 'C-Leg 4',
      recommendation: 'C-Leg 4',
      rationale: 'Gold standard microprocessor knee for K3-K4 ambulators. Provides 80% reduction in falls, step-over-step stair descent, and variable cadence control.',
      boardPearl: 'C-Leg 4 is the most studied MPK: 80% fall reduction, step-over-step stairs, and real-time stance/swing adaptation. Gold standard for community ambulators.',
    ),
  },
);

// =============================================================================
// 5. UE Prosthetic Type Selection
// =============================================================================

final ueProstheticFlowchart = FlowchartBlock(
  title: 'Upper Extremity Prosthetic Type Selection',
  rootNodeId: 'root',
  nodes: {
    'root': const FlowchartNode(
      id: 'root',
      text: 'Select upper extremity prosthetic system',
      options: [
        FlowchartOption(label: 'What is the amputation level?', targetNodeId: 'ampLevel'),
      ],
    ),
    'ampLevel': const FlowchartNode(
      id: 'ampLevel',
      text: 'What is the amputation level?',
      options: [
        FlowchartOption(label: 'Transradial', targetNodeId: 'trEnvironment'),
        FlowchartOption(label: 'Transhumeral', targetNodeId: 'thPriority'),
        FlowchartOption(label: 'Shoulder+', targetNodeId: 'shoulder'),
      ],
    ),
    'trEnvironment': const FlowchartNode(
      id: 'trEnvironment',
      text: 'What is the primary use environment?',
      options: [
        FlowchartOption(label: 'Manual labor / outdoor', targetNodeId: 'trBodyPowered'),
        FlowchartOption(label: 'Office / community', targetNodeId: 'trMyoelectric'),
        FlowchartOption(label: 'Cosmesis only', targetNodeId: 'trPassive'),
      ],
    ),
    'trBodyPowered': const FlowchartNode(
      id: 'trBodyPowered',
      text: 'Body-powered with VO hook',
      recommendation: 'Body-powered prosthesis with voluntary-opening hook',
      rationale: 'Durable, water-resistant, and provides proprioceptive feedback through the cable system. Most functional terminal device for heavy-duty and outdoor work environments.',
      boardPearl: 'VO hook: opens with cable tension, closes with rubber bands. Provides excellent grip force and proprioceptive feedback via cable tension. Most durable TD option.',
    ),
    'trMyoelectric': const FlowchartNode(
      id: 'trMyoelectric',
      text: 'Myoelectric hand',
      recommendation: 'Myoelectric multi-articulating hand (i-Limb, bebionic)',
      rationale: 'Multi-articulating hands offer superior cosmesis and multiple grip patterns for office and community activities. Pattern recognition systems allow intuitive grip selection.',
      boardPearl: 'Multi-articulating hands (i-Limb, bebionic) offer 20+ grip patterns. Pattern recognition (e.g., COAPT) replaces dual-site control with intuitive muscle pattern decoding.',
    ),
    'trPassive': const FlowchartNode(
      id: 'trPassive',
      text: 'Passive cosmetic restoration',
      recommendation: 'Passive cosmetic restoration',
      rationale: 'Lightest prosthetic option with the most realistic appearance. Custom silicone restorations match skin tone, texture, and features. No functional prehension.',
      boardPearl: 'Passive hands are the lightest option and have the lowest rejection rate. High-definition silicone restorations can include freckles, hair, and fingerprints.',
    ),
    'thPriority': const FlowchartNode(
      id: 'thPriority',
      text: 'Body-powered or hybrid?',
      options: [
        FlowchartOption(label: 'Function priority', targetNodeId: 'thHybrid'),
        FlowchartOption(label: 'Cosmesis priority', targetNodeId: 'thMyoelectric'),
      ],
    ),
    'thHybrid': const FlowchartNode(
      id: 'thHybrid',
      text: 'Hybrid prosthesis',
      recommendation: 'Hybrid prosthesis (body-powered elbow + myoelectric hand)',
      rationale: 'Most common transhumeral prosthetic setup. Body-powered elbow provides reliable elbow control and proprioceptive feedback while myoelectric hand offers superior grip function and cosmesis.',
      boardPearl: 'Hybrid = body-powered elbow + myoelectric TD. Most common TH setup. Combines cable proprioception at elbow with powered grip at hand.',
    ),
    'thMyoelectric': const FlowchartNode(
      id: 'thMyoelectric',
      text: 'Full myoelectric with TMR',
      recommendation: 'Full myoelectric prosthesis with targeted muscle reinnervation (TMR)',
      rationale: 'TMR surgery transfers residual arm nerves to chest muscles, creating new EMG sites for intuitive, simultaneous multi-joint control. Best cosmesis and most natural control.',
      boardPearl: 'TMR: median, ulnar, radial, musculocutaneous nerves transferred to pectoralis/serratus. Enables intuitive "think and move" control + reduces phantom pain.',
    ),
    'shoulder': const FlowchartNode(
      id: 'shoulder',
      text: 'Canadian-type socket with body-powered components',
      recommendation: 'Canadian-type socket with body-powered components',
      rationale: 'Limited function at shoulder disarticulation and above. High rejection rate (~50%). Consider activity-specific terminal devices for targeted functional tasks rather than general-purpose prosthesis.',
      boardPearl: 'Shoulder disarticulation and above: ~50% rejection rate. Recommend activity-specific TDs (e.g., gym, cycling, cooking). Canadian socket uses thoracic cage for suspension.',
    ),
  },
);

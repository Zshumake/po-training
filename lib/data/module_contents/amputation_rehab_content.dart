import 'package:flutter/material.dart';
import '../models/topic_content_model.dart';

final amputationRehabContent = TopicData(
  id: 'amputation_rehab',
  title: 'Amputation & Rehabilitation',
  tabs: [
    // ─────────────────────────────────────────────
    // TAB 1: Amputation Levels
    // ─────────────────────────────────────────────
    TopicTab(
      title: 'Amputation Levels',
      blocks: [
        HeaderBlock('Lower Extremity Amputation Levels'),
        TextBlock(
          'Understanding amputation levels is essential for prosthetic prescription, '
          'rehabilitation planning, and predicting functional outcomes. The level of '
          'amputation determines energy expenditure, prosthetic options, and expected '
          'functional mobility. Preservation of length is a guiding surgical principle.',
          isIntro: true,
        ),
        TableBlock(
          title: 'Lower Extremity Amputation Levels',
          columns: ['Level', 'Description'],
          rows: [
            ['Partial Toe', 'Excision of any part of one or more toes'],
            ['Toe Disarticulation', 'Disarticulation at metatarsophalangeal joint'],
            ['Partial Foot / Ray Resection', 'Removal of toe and corresponding metatarsal'],
            ['Transmetatarsal (TMA)', 'Amputation through the metatarsal shafts'],
            ['Lisfranc', 'Disarticulation at tarsometatarsal joints'],
            ['Chopart', 'Disarticulation at midtarsal (talonavicular and calcaneocuboid) joints'],
            ['Syme\'s', 'Ankle disarticulation with heel pad preserved; end-bearing capable'],
            ['Transtibial — Long', 'Greater than 50% of tibial length preserved'],
            ['Transtibial — Standard', '20-50% of tibial length preserved (ideal)'],
            ['Transtibial — Short', 'Less than 20% of tibial length preserved'],
            ['Knee Disarticulation', 'Disarticulation at the knee joint; end-bearing, long lever arm'],
            ['Transfemoral — Long', 'Greater than 60% of femoral length preserved'],
            ['Transfemoral — Standard', '35-60% of femoral length preserved'],
            ['Transfemoral — Short', 'Less than 35% of femoral length preserved'],
            ['Hip Disarticulation', 'Removal of entire lower extremity at the hip joint'],
            ['Hemipelvectomy', 'Removal of lower extremity plus ipsilateral hemipelvis'],
            ['Hemicorporectomy', 'Translumbar amputation; removal of body below L4-L5'],
          ],
          headerColor: const Color(0xFF1565C0),
        ),
        HeaderBlock('Upper Extremity Amputation Levels'),
        TableBlock(
          title: 'Upper Extremity Amputation Levels',
          columns: ['Level', 'Description'],
          rows: [
            ['Transphalangeal', 'Amputation through a phalanx'],
            ['Transmetacarpal', 'Amputation through the metacarpal shafts'],
            ['Transcarpal', 'Amputation through the carpal bones'],
            ['Wrist Disarticulation', 'Disarticulation at the radiocarpal joint'],
            ['Transradial — Long', 'Greater than 55% of forearm length preserved'],
            ['Transradial — Standard', '35-55% of forearm length preserved'],
            ['Transradial — Short', 'Less than 35% of forearm length preserved'],
            ['Elbow Disarticulation', 'Disarticulation at the elbow; preserves humeral rotation'],
            ['Transhumeral — Long', 'Greater than 50% of humeral length preserved'],
            ['Transhumeral — Standard', '30-50% of humeral length preserved'],
            ['Transhumeral — Short', 'Less than 30% of humeral length preserved'],
            ['Shoulder Disarticulation', 'Removal of entire upper extremity at glenohumeral joint'],
            ['Forequarter', 'Removal of upper extremity plus scapula and clavicle'],
          ],
          headerColor: const Color(0xFF6A1B9A),
        ),
        HeaderBlock('Etiology by Age Group'),
        TableBlock(
          title: 'Most Common Cause of Amputation by Age',
          columns: ['Age Group', 'Primary Cause'],
          rows: [
            ['0-5 years', 'Congenital limb deficiency'],
            ['5-15 years', 'Cancer (osteosarcoma) and trauma'],
            ['15-50 years', 'Trauma (most common cause in this age group)'],
            ['50+ years', 'Vascular disease / Diabetes (most common overall)'],
          ],
          headerColor: const Color(0xFF00695C),
        ),
        HeaderBlock('Distribution of LE Amputations'),
        BulletCardBlock(
          title: 'LE Amputation Level Distribution',
          themeColor: const Color(0xFF1565C0),
          backgroundColor: const Color(0xFFE3F2FD),
          points: [
            'Transtibial (BKA): 59% — most common LE amputation level',
            'Transfemoral (AKA): 35%',
            'Syme\'s: 3%',
            'Hip disarticulation: 2%',
            'Knee disarticulation: 1%',
            'Overall: LE amputations outnumber UE amputations ~10:1',
          ],
        ),
        PearlBlock(
          'Board Pearl — Amputation Epidemiology',
          'Transtibial is the most common LE amputation level (59%). The majority '
          'of LE amputations are due to dysvascular disease (82%), with diabetes '
          'contributing to approximately two-thirds of all LE amputations.',
        ),
        PearlBlock(
          'Board Pearl — Vascular Amputee Prognosis',
          'Nearly 50% of dysvascular amputees die within 5 years of amputation. '
          'Up to 55% of diabetic amputees require contralateral amputation within '
          '2-3 years. These statistics underscore the systemic nature of vascular '
          'disease and the importance of contralateral limb surveillance.',
        ),
      ],
    ),

    // ─────────────────────────────────────────────
    // TAB 2: Surgical Principles
    // ─────────────────────────────────────────────
    TopicTab(
      title: 'Surgical Principles',
      blocks: [
        HeaderBlock('Muscle Stabilization Techniques'),
        TextBlock(
          'Surgical technique significantly impacts prosthetic rehabilitation outcomes. '
          'Proper muscle stabilization maintains limb shape, prevents contracture, '
          'and provides adequate soft tissue coverage for comfortable socket fit. '
          'Two primary techniques exist for securing muscles over the bone end.',
          isIntro: true,
        ),
        ComparisonCardBlock(
          title: 'Myodesis',
          themeColor: const Color(0xFF2E7D32),
          backgroundColor: const Color(0xFFE8F5E9),
          icon: Icons.link,
          description: 'Muscle is sutured directly to bone through drill holes in the '
              'distal residual bone. Creates a strong, stable muscle attachment that '
              'resists displacement during prosthetic loading.',
          keyPoints: [
            'Muscle sutured DIRECTLY TO BONE through drill holes',
            'Stronger, more stable attachment than myoplasty',
            'Preferred for traumatic amputations with good vascularity',
            'Maintains muscle tension and function at the bone end',
            'Critical for TF amputations: adductors myodesis maintains femoral adduction',
            'Contraindicated in severely dysvascular limbs (impaired healing)',
            'Requires adequate bone quality for drill hole placement',
          ],
        ),
        ComparisonCardBlock(
          title: 'Myoplasty',
          themeColor: const Color(0xFF1565C0),
          backgroundColor: const Color(0xFFE3F2FD),
          icon: Icons.compare_arrows,
          description: 'Opposing muscle groups are sutured to each other over the bone '
              'end, creating a padded soft tissue envelope. Faster and less demanding '
              'surgically than myodesis.',
          keyPoints: [
            'Opposing muscles sutured TO EACH OTHER over the bone end',
            'Faster surgery with less surgical dissection',
            'Less tension on suture line than myodesis',
            'May be preferred for dysvascular limbs (less surgical stress)',
            'Less stable fixation — muscles may migrate with repeated loading',
            'Adequate padding over bone end but weaker stabilization',
            'Often used in combination with myodesis (hybrid approach)',
          ],
        ),
        PearlBlock(
          'Board Pearl — Myodesis vs Myoplasty',
          'Myodesis = muscle to BONE (stronger, preferred for traumatic amputations). '
          'Myoplasty = muscle to MUSCLE (preferred for dysvascular patients). '
          'For transfemoral amputations, myodesis of the adductors is critical to '
          'maintain femoral adduction within the socket.',
        ),
        HeaderBlock('Transfemoral Surgical Considerations'),
        BulletCardBlock(
          title: 'TF Amputation Key Principles',
          themeColor: const Color(0xFF4527A0),
          backgroundColor: const Color(0xFFEDE7F6),
          points: [
            'Adductor myodesis is essential — maintains femoral adduction in socket',
            'Without adductor stabilization: femur falls into abduction → lateral distal pressure',
            'Ideal TF residual limb shape: CONICAL (tapers distally)',
            'Preserve maximum femoral length for lever arm and prosthetic control',
            'Very short TF (just below lesser trochanter): poor prosthetic lever arm',
            'Knee disarticulation preserves full femoral length and is end-bearing capable',
          ],
        ),
        HeaderBlock('Transtibial Surgical Considerations'),
        BulletCardBlock(
          title: 'TT Amputation Key Principles',
          themeColor: const Color(0xFF00695C),
          backgroundColor: const Color(0xFFE0F2F1),
          points: [
            'Ideal TT residual limb shape: CYLINDRICAL',
            'Fibula cut 2-3 cm shorter than tibia to avoid distal lateral pressure',
            'Tibia beveled anteriorly at 45 degrees to prevent skin breakdown at sharp edge',
            'Preserve length in proximal 50% of tibia for optimal lever arm',
            'Long posterior flap (Burgess technique): most common for dysvascular BKA',
            'Equal anterior-posterior flaps: used for traumatic amputations',
            'Bone bridge (Ertl procedure): creates tibia-fibula synostosis for potential end-bearing',
          ],
        ),
        HeaderBlock('Unsatisfactory Amputation Levels'),
        BulletCardBlock(
          title: 'Levels to Avoid',
          themeColor: const Color(0xFFC62828),
          backgroundColor: const Color(0xFFFFEBEE),
          points: [
            'Distal 2/5 of tibia: poor soft tissue coverage, tendinous area, poor healing',
            'Very short BKA proximal to tibial tubercle: insufficient lever arm for prosthetic control',
            'Very short AKA just below lesser trochanter: inadequate lever arm, poor myodesis options',
            'Chopart (without tendon balancing): equinovarus deformity from unopposed Achilles',
            'These levels often require revision to a more proximal level',
          ],
        ),
        ComparisonCardBlock(
          title: 'Ertl Procedure',
          themeColor: const Color(0xFFE65100),
          backgroundColor: const Color(0xFFFFF3E0),
          icon: Icons.construction,
          description: 'A bone bridge procedure creating a synostosis between the distal '
              'tibia and fibula, potentially creating an end-bearing residual limb '
              'and preventing fibular migration.',
          keyPoints: [
            'Bone bridge (synostosis) formed between distal tibia and fibula',
            'Creates a more stable, broader distal weight-bearing surface',
            'Potential for end-bearing (direct weight on bone end)',
            'Prevents fibular instability and migration',
            'Originally described for traumatic amputations',
            'Longer healing time than standard BKA due to bone bridging',
            'Some controversy regarding clinical superiority over standard technique',
          ],
        ),
        PearlBlock(
          'Board Pearl — Ideal Residual Limb Shapes',
          'Transtibial ideal shape = CYLINDRICAL. Transfemoral ideal shape = CONICAL. '
          'For BKA: fibula is cut 2-3 cm shorter than tibia, and the tibia is '
          'beveled anteriorly. For AKA: adductor myodesis maintains femoral adduction.',
        ),
        TableBlock(
          title: 'Myodesis vs Myoplasty Comparison',
          columns: ['Feature', 'Myodesis', 'Myoplasty'],
          rows: [
            ['Definition', 'Muscles sutured directly to bone through drill holes', 'Muscles sutured to each other (agonist to antagonist)'],
            ['Anchor point', 'Bone', 'Opposing muscle group'],
            ['Muscle tension', 'Maintained at physiologic resting length', 'Less consistent; muscles may atrophy more'],
            ['Residual limb shaping', 'Firm, stable envelope resisting displacement', 'Softer distal padding; adequate for lower-demand'],
            ['Preferred use', 'TF amputation (hip abductors/extensors to femur); active patients', 'TT amputation (gastrosoleus flap); less active patients'],
            ['Prosthetic implications', 'Better active control; stabilizes bone in soft tissue', 'Adequate for most TT prosthetic users'],
          ],
          headerColor: const Color(0xFF2E7D32),
        ),
        PearlBlock(
          'Board Pearl — Myodesis Preserves Function',
          'Myodesis (muscle-to-bone) maintains physiologic tension on severed muscles, '
          'preserving contractile function and preventing atrophy. It is the preferred '
          'technique for TF amputation, where hip adductors and extensors must remain '
          'under tension to resist the abduction-flexion posture that hip flexors and '
          'abductors would otherwise produce unopposed.',
        ),
        TableBlock(
          title: 'Ertl Procedure Complication Profile',
          columns: ['Complication', 'Rate'],
          rows: [
            ['Overall complications', 'Significantly higher than Burgess'],
            ['Infection', '34%'],
            ['Neuroma requiring excision', '18%'],
            ['Heterotopic ossification requiring excision', '15%'],
            ['Delayed union/nonunion of synostosis', '11%'],
            ['Implant-related complications', '27%'],
            ['Myodesis failure', '4%'],
            ['Scar revision', '7%'],
          ],
          headerColor: const Color(0xFFE65100),
        ),
        PearlBlock(
          'Board Pearl — Ertl vs Burgess',
          'The Ertl procedure creates a tibiofibular bone bridge for distal weight '
          'bearing and has shown higher return-to-duty rates in military populations '
          '(46% vs 22%). However, its complication rate is significantly higher than '
          'standard Burgess technique, including infection (34%), neuroma excision '
          '(18%), and HO excision (15%). The TAOS RCT will provide definitive data.',
        ),
        HeaderBlock('Nerve Management — TMR and RPNI'),
        TextBlock(
          'Targeted Muscle Reinnervation (TMR) and Regenerative Peripheral Nerve '
          'Interface (RPNI) represent paradigm-shifting surgical innovations for '
          'preventing neuroma formation and phantom limb pain after amputation.',
        ),
        ComparisonCardBlock(
          title: 'Targeted Muscle Reinnervation (TMR)',
          themeColor: const Color(0xFF1565C0),
          backgroundColor: const Color(0xFFE3F2FD),
          icon: Icons.electrical_services,
          description: 'TMR transfers severed peripheral nerve stumps to nearby motor '
              'nerve entry points in residual muscles. Regenerating axons find '
              'denervated motor end plates, preventing disorganized neuroma formation.',
          keyPoints: [
            'Originally developed for intuitive myoelectric prosthetic control',
            'Pain prevention benefit was discovered subsequently',
            'Requires accessible motor nerve targets nearby',
            'Can serve as EMG signal source for myoelectric control',
            'Dumanian RCT (N=28): greater phantom pain reduction vs standard neurectomy at 1 year',
            'Prophylactic TMR at initial amputation: 27% symptomatic neuroma rate (lower than historical)',
            'Secondary TMR for existing neuromas: ~90% near-complete pain resolution',
          ],
        ),
        ComparisonCardBlock(
          title: 'Regenerative Peripheral Nerve Interface (RPNI)',
          themeColor: const Color(0xFF2E7D32),
          backgroundColor: const Color(0xFFE8F5E9),
          icon: Icons.healing,
          description: 'RPNI wraps each transected nerve end in a small autologous free '
              'muscle graft. The graft revascularizes and reinnervates, providing a '
              'biologic target that absorbs regenerating nerve fibers.',
          keyPoints: [
            'Uses autologous free muscle graft — no nearby motor nerve needed',
            'Simpler technique than TMR (muscle graft wrapping)',
            'Can be applied to any nerve in any location',
            'Prophylactic RPNI: 0% symptomatic neuroma (vs 13.3% controls)',
            'Prophylactic RPNI: phantom limb pain 51.1% vs 91.1% controls',
            'At latest follow-up: 97% free of neuroma pain and PLP',
            'In oncology patients: 90% opioid discontinuation within 6 months (vs 50% controls)',
          ],
        ),
        TableBlock(
          title: 'TMR vs RPNI Comparison',
          columns: ['Feature', 'TMR', 'RPNI'],
          rows: [
            ['Mechanism', 'Nerve-to-motor-point transfer', 'Nerve wrapped in free muscle graft'],
            ['Requires nearby motor nerve', 'Yes', 'No (uses autologous muscle graft)'],
            ['Myoelectric signal source', 'Yes (primary purpose originally)', 'Yes (emerging application)'],
            ['Evidence for pain prevention', '1 RCT + prospective studies', 'Prospective cohort studies (no RCT yet)'],
            ['Applicability', 'Requires accessible motor nerve targets', 'Any nerve in any location'],
            ['Surgical complexity', 'Moderate (nerve coaptation under magnification)', 'Simpler technique (muscle graft wrapping)'],
          ],
          headerColor: const Color(0xFF4527A0),
        ),
        PearlBlock(
          'Board Pearl — TMR and RPNI',
          'TMR was originally developed for myoelectric prosthetic control but was '
          'subsequently found to prevent neuroma and phantom limb pain. RPNI achieved '
          '0% symptomatic neuroma incidence prophylactically (vs 13.3% controls) and '
          '97% combined neuroma/PLP-free rate at latest follow-up. Both represent a '
          'conceptual advance: providing a physiologic target for nerve regeneration '
          'rather than suppressing it.',
        ),
      ],
    ),

    // ─────────────────────────────────────────────
    // TAB 3: Rehabilitation Program
    // ─────────────────────────────────────────────
    TopicTab(
      title: 'Rehabilitation Program',
      blocks: [
        HeaderBlock('Pre-Prosthetic Rehabilitation'),
        TextBlock(
          'The pre-prosthetic phase begins immediately after surgery and continues '
          'until the patient is fitted with a prosthesis. Goals focus on wound healing, '
          'edema control, contracture prevention, strengthening, and psychological '
          'adjustment. This phase is critical for prosthetic success.',
          isIntro: true,
        ),
        BulletCardBlock(
          title: 'Pre-Prosthetic Phase Goals',
          themeColor: const Color(0xFF1565C0),
          backgroundColor: const Color(0xFFE3F2FD),
          points: [
            'Pain control: pharmacologic and non-pharmacologic interventions',
            'Wound healing: monitor incision, prevent infection',
            'Edema management: compression wrapping, shrinker socks, rigid dressings',
            'Range of motion preservation: prevent contractures at hip and knee',
            'Strengthening: core, upper extremity, intact limb, residual limb',
            'Independent mobility: transfers, wheelchair skills, single-limb ambulation',
            'Psychological support: adjustment counseling, peer support, goal setting',
          ],
        ),
        HeaderBlock('Postoperative Residual Limb Management'),
        ComparisonCardBlock(
          title: 'Rigid Removable Dressing (RRD)',
          themeColor: const Color(0xFF2E7D32),
          backgroundColor: const Color(0xFFE8F5E9),
          icon: Icons.shield,
          description: 'A plaster or fiberglass cast applied over the residual limb '
              'postoperatively. Provides the most effective edema control while '
              'protecting the surgical site from trauma.',
          keyPoints: [
            'Plaster or fiberglass cast over the residual limb',
            'BEST method for edema control among all dressing types',
            'Allows daily inspection when removed for wound checks',
            'Protects limb from trauma and dependent positioning',
            'Can be modified as limb volume decreases',
            'Provides some pain control through immobilization',
            'Often preferred by rehabilitation teams for optimal outcomes',
          ],
        ),
        ComparisonCardBlock(
          title: 'Elastic Bandage (Figure-8 Wrap)',
          themeColor: const Color(0xFF6A1B9A),
          backgroundColor: const Color(0xFFF3E5F5),
          icon: Icons.wrap_text,
          description: 'Traditional compression bandaging using double-length elastic wraps '
              'applied in a figure-8 pattern with distal-to-proximal pressure gradient.',
          keyPoints: [
            'Double-length 4-inch bandage for transtibial (figure-8 pattern)',
            'Double-length 6-inch bandage for transfemoral',
            'Must be applied in figure-8 pattern — never circular (tourniquet effect)',
            'Pressure gradient: greatest distally, decreasing proximally',
            'Less effective than RRD for edema control',
            'Requires rewrapping every 4-6 hours (loosens with activity)',
            'Most commonly available but technique-dependent',
          ],
        ),
        ComparisonCardBlock(
          title: 'Elastic Shrinker Socks',
          themeColor: const Color(0xFF00695C),
          backgroundColor: const Color(0xFFE0F2F1),
          icon: Icons.compress,
          description: 'Pre-fabricated elastic compression garments shaped for the residual '
              'limb, providing uniform compression with easy application.',
          keyPoints: [
            'Pre-fabricated, easy to apply (no wrapping technique needed)',
            'Uniform compression throughout the garment',
            'Available in various sizes for different limb dimensions',
            'Patient and caregiver can apply independently',
            'Less effective than RRD but more user-friendly than elastic wraps',
            'Good option for patients unable to perform figure-8 wrapping',
          ],
        ),
        BulletCardBlock(
          title: 'Shrinkage Device Guidelines',
          themeColor: const Color(0xFFE65100),
          backgroundColor: const Color(0xFFFFF3E0),
          points: [
            'Worn 24 hours per day EXCEPT during bathing',
            'Remove only for wound inspection and hygiene',
            'Continue until fitted with prosthesis and limb volume stabilizes',
            'Monitor skin regularly for signs of pressure or circulatory compromise',
            'Replace as limb volume decreases (maintain snug fit)',
          ],
        ),
        HeaderBlock('Contracture Prevention'),
        TextBlock(
          'Contractures are the most preventable yet most common complication in the '
          'early rehabilitation phase. Once established, contractures are extremely '
          'difficult to correct and can prevent successful prosthetic fitting.',
        ),
        BulletCardBlock(
          title: 'Hip Flexion Contracture Prevention (TF)',
          themeColor: const Color(0xFFC62828),
          backgroundColor: const Color(0xFFFFEBEE),
          points: [
            'DO NOT place pillow under the thigh when supine',
            'Lie PRONE for 15 minutes, 3 times per day',
            'Avoid prolonged sitting (limits time in wheelchair/chair)',
            'Active and passive hip extension stretching daily',
            'Position residual limb in extension when resting',
          ],
        ),
        BulletCardBlock(
          title: 'Hip Abduction Contracture Prevention (TF)',
          themeColor: const Color(0xFFBF360C),
          backgroundColor: const Color(0xFFFBE9E7),
          points: [
            'DO NOT place pillow between legs when side-lying',
            'Keep residual limb in adduction when resting',
            'Active hip adduction exercises against gravity',
            'Avoid resting limb in abducted, externally rotated position',
          ],
        ),
        BulletCardBlock(
          title: 'Knee Flexion Contracture Prevention (TT)',
          themeColor: const Color(0xFF4527A0),
          backgroundColor: const Color(0xFFEDE7F6),
          points: [
            'DO NOT hang residual limb off the edge of the bed',
            'DO NOT place pillow under the knee when supine',
            'Keep knee EXTENDED on a board when resting',
            'Avoid prolonged sitting with knee flexed',
            'Active knee extension exercises daily',
            'Prone lying also stretches knee into extension',
          ],
        ),
        PearlBlock(
          'Board Pearl — Contracture Prevention',
          'Contractures are easy to prevent but extremely difficult to correct once '
          'established. Prone positioning prevents hip flexion contracture in TF amputees. '
          'For TT amputees, never place a pillow under the knee — keep it extended. '
          'These are high-yield board concepts.',
        ),
        TableBlock(
          title: 'Common Contracture Patterns by Amputation Level',
          columns: ['Level', 'Contracture', 'Muscles Responsible', 'Prevention'],
          rows: [
            ['Transtibial', 'Knee flexion', 'Hamstrings (gastrocnemius removed)', 'Knee extension positioning; avoid pillow under knee; prone lying'],
            ['Transfemoral', 'Hip flexion', 'Iliopsoas (gluteus maximus detached/weakened)', 'Prone lying; hip extension stretching; avoid prolonged sitting'],
            ['Transfemoral', 'Hip abduction', 'Tensor fasciae latae / IT band', 'Avoid abduction pillow; adduction stretching'],
            ['Transfemoral', 'Hip external rotation', 'External rotators', 'Neutral positioning; avoid ER postures'],
          ],
          headerColor: const Color(0xFFC62828),
        ),
        TableBlock(
          title: 'Critical Contracture Thresholds',
          columns: ['Contracture', 'Threshold', 'Prosthetic Consequence'],
          rows: [
            ['Knee flexion >15 degrees', 'Makes TT prosthesis unusable', 'Cannot fully load prosthetic foot; dramatic energy cost increase'],
            ['Knee flexion >45 degrees', 'Healing failure at TT level', 'Should undergo TF amputation instead'],
            ['Hip flexion >15-20 degrees', 'Impairs TF prosthetic alignment', 'Socket cannot compensate adequately; increased lumbar lordosis'],
            ['Hip abduction contracture', 'Widens prosthetic base', 'Increases lateral trunk bending and energy expenditure'],
          ],
          headerColor: const Color(0xFFBF360C),
        ),
        PearlBlock(
          'Board Pearl — Knee Flexion Contracture Threshold',
          'A knee flexion contracture greater than 15 degrees renders a transtibial '
          'prosthesis unusable because the foot cannot be loaded in terminal stance. '
          'A contracture greater than 45 degrees at the TT level indicates healing '
          'failure and the patient should undergo TF amputation instead.',
        ),
        HeaderBlock('Prosthetic Fitting Timeline'),
        NumberedListBlock([
          MapEntry('1', 'Immediate post-op: wound care, pain control, edema management, '
              'psychological support, mobility training'),
          MapEntry('2', 'Pre-prosthetic phase: shaping, strengthening, ROM, functional '
              'independence (2-6 weeks)'),
          MapEntry('3', 'Temporary/preparatory prosthesis: fit at 3-6 months post-op when '
              'wound healed and initial shrinkage achieved'),
          MapEntry('4', 'Prosthetic training: gait training progression from parallel bars '
              'through independent ambulation'),
          MapEntry('5', 'Definitive prosthesis: when residual limb matured and volume '
              'stabilized (~4+ months), replaced every 3-5 years'),
        ]),
        BulletCardBlock(
          title: 'Gait Training Progression',
          themeColor: const Color(0xFF00838F),
          backgroundColor: const Color(0xFFE0F7FA),
          points: [
            'Stage 1: Parallel bars — weight shifting, balance, step initiation',
            'Stage 2: Walker — increased independence with support',
            'Stage 3: Crutches (axillary or forearm) — less support, more challenge',
            'Stage 4: Cane (single point or quad) — community ambulation preparation',
            'Stage 5: Independent ambulation — no assistive device',
            'Not all patients progress through every stage',
          ],
        ),
        PearlBlock(
          'Board Pearl — VA/DoD CPG Dressing Recommendation',
          'The VA/DoD CPG (2017 and 2025) strongly recommends rigid or semi-rigid '
          'dressings following transtibial amputation. Rigid dressings provide superior '
          'edema control, wound protection, and knee contracture prevention compared to '
          'soft dressings or elastic wraps. Elastic bandages must be applied in a '
          'figure-of-eight pattern (never circular) to avoid tourniquet effect.',
        ),
        TableBlock(
          title: 'Postoperative Dressing Comparison',
          columns: ['Feature', 'Rigid Removable (RRD)', 'Elastic Bandage', 'IPOP'],
          rows: [
            ['Edema control', 'Excellent', 'Moderate (technique-dependent)', 'Excellent'],
            ['Wound protection', 'Excellent', 'Moderate', 'Excellent'],
            ['Knee contracture prevention', 'Excellent (maintains extension)', 'Poor', 'Excellent'],
            ['Allows early ambulation', 'No', 'No', 'Yes (pylon and foot attached)'],
            ['Wound inspection', 'Possible (removable)', 'Easy', 'Difficult (requires removal)'],
            ['Skill required', 'Moderate (casting)', 'Variable (wrapping critical)', 'High (prosthetist/surgeon)'],
            ['VA/DoD CPG', 'Strongly recommended for TTA', 'Acceptable alternative', 'Acceptable; requires experienced team'],
          ],
          headerColor: const Color(0xFF2E7D32),
        ),
        HeaderBlock('Nine-Phase Rehabilitation Model'),
        TableBlock(
          title: 'Amputation Rehabilitation Phases',
          columns: ['Phase', 'Timeline', 'Key Activities'],
          rows: [
            ['1. Preoperative', 'Before surgery', 'Education; psychological preparation; contralateral limb strengthening'],
            ['2. Acute postoperative', 'Days 0-14', 'Wound care; edema control; pain management; bed mobility; positioning'],
            ['3. Pre-prosthetic', 'Weeks 2-8+', 'Limb shaping; desensitization; strengthening; cardiovascular conditioning'],
            ['4. Prosthetic prescription', '~6-8 weeks', 'Team assessment; K-level determination; component selection'],
            ['5. Prosthetic fabrication', 'Variable', 'Preparatory prosthesis fitting; alignment optimization'],
            ['6. Prosthetic training', 'Weeks to months', 'Donning/doffing; gait training; stair/ramp negotiation; fall recovery'],
            ['7. Community integration', 'Months 3-12', 'Advanced gait; uneven surfaces; vocational planning; driving assessment'],
            ['8. Vocational rehabilitation', 'Months 6+', 'Return-to-work assessment; workplace modifications'],
            ['9. Lifelong follow-up', 'Ongoing', 'Annual assessments; socket replacements; component upgrades; monitoring'],
          ],
          headerColor: const Color(0xFF1565C0),
        ),
        HeaderBlock('Prosthetic Fitting Milestones'),
        TableBlock(
          title: 'Key Prosthetic Milestones',
          columns: ['Milestone', 'Timeline', 'Notes'],
          rows: [
            ['Hospital discharge', '3-10 days post-op', 'Depends on wound healing, medical stability'],
            ['Wound healing', '3-6 weeks', 'Sutures/staples removed at 2-3 weeks'],
            ['Prosthetic casting/fitting', '6-8 weeks post-op (minimum)', 'Earlier in traumatic; later in vascular'],
            ['Preparatory prosthesis', '8-12 weeks post-op', 'Adjustable socket; standard components'],
            ['Intensive gait training', '8-16 weeks post-op', 'Inpatient or intensive outpatient'],
            ['Definitive prosthesis', '6-18 months post-op', 'After residual limb volume stabilizes'],
          ],
          headerColor: const Color(0xFF00695C),
        ),
        PearlBlock(
          'Board Pearl — Definitive Prosthesis Timing',
          'The definitive prosthesis should not be fabricated until residual limb '
          'volume has stabilized, typically 6-18 months after amputation. A preparatory '
          'prosthesis with a modifiable socket accommodates rapid volume changes. '
          'Premature definitive fitting results in a socket that quickly becomes too large.',
        ),
        HeaderBlock('Energy Expenditure by Amputation Level'),
        TableBlock(
          title: 'Metabolic Cost of Prosthetic Ambulation',
          columns: ['Amputation Level', 'Traumatic', 'Vascular'],
          rows: [
            ['Transtibial (unilateral)', '~10-25% above normal', '~40% above normal'],
            ['Transfemoral (unilateral)', '~60-70% above normal', '~100% above normal'],
            ['Bilateral transtibial', '~40% above normal', '~60-80% above normal'],
          ],
          headerColor: const Color(0xFF4527A0),
        ),
        PearlBlock(
          'Board Pearl — Energy Expenditure',
          'Vascular amputees require significantly more energy than traumatic amputees '
          'at the same amputation level. This reflects older age, cardiovascular disease, '
          'and limited reserve. Knee preservation (TT vs TF) is critical because '
          'the energy cost drops dramatically: ~40% (TT vascular) vs ~100% (TF vascular).',
        ),
        HeaderBlock('Phantom Limb Pain'),
        TextBlock(
          'Phantom limb pain (PLP) affects 50-80% of amputees and can persist for '
          'years. It is distinct from residual limb pain (stump pain localized to the '
          'remaining limb) and phantom sensation (non-painful awareness of the missing '
          'limb, which is very common and not pathologic).',
        ),
        TableBlock(
          title: 'PLP Mechanisms',
          columns: ['Level', 'Mechanism', 'Description'],
          rows: [
            ['Peripheral', 'Neuroma formation', 'Disorganized nerve sprouting produces ectopic, spontaneous firing'],
            ['Spinal', 'Dorsal horn hyperexcitability', 'Loss of afferent input leads to increased sensitivity and widened receptive fields'],
            ['Central (cortical)', 'Cortical reorganization', 'Cortical representation of amputated limb invaded by adjacent areas; correlates with pain intensity'],
          ],
          headerColor: const Color(0xFF6A1B9A),
        ),
        TableBlock(
          title: 'PLP Treatment Evidence Summary',
          columns: ['Treatment', 'Evidence', 'Key Finding'],
          rows: [
            ['TMR (surgical)', '1 RCT (N=28)', 'Significant PLP reduction vs standard neurectomy at 1 year'],
            ['RPNI (surgical)', 'Prospective cohorts', '97% prophylactic patients free of PLP; 53% reduction with secondary RPNI'],
            ['Mirror therapy', 'Mixed (5 RCTs)', 'Only 1 of 5 RCTs showed significant benefit'],
            ['Graded motor imagery (GMI)', 'Moderate', 'Expert consensus endorsement; weighted mean difference -21.29'],
            ['Gabapentin', 'Negative', '2.4 g/day for 6 weeks showed no benefit over placebo'],
            ['Memantine', 'Negative', 'No benefit over placebo'],
            ['Amitriptyline', 'Negative', 'No benefit over placebo'],
          ],
          headerColor: const Color(0xFFC62828),
        ),
        PearlBlock(
          'Board Pearl — Phantom Limb Pain Treatments',
          'Traditional pharmacologic treatments for PLP (gabapentin, amitriptyline, '
          'memantine) have failed to show benefit over placebo in rigorous trials. '
          'Surgical prevention with TMR or RPNI at the time of amputation represents '
          'a paradigm shift. Among non-surgical approaches, graded motor imagery has '
          'the most expert consensus support.',
        ),
      ],
    ),

    // ─────────────────────────────────────────────
    // TAB 4: Outcome Measures
    // ─────────────────────────────────────────────
    TopicTab(
      title: 'Outcome Measures',
      blocks: [
        HeaderBlock('Medicare K-Level Classification'),
        TextBlock(
          'The Medicare Functional Classification Level (K-Level) system is the '
          'standard used to classify amputee functional ability and determine '
          'prosthetic component eligibility for insurance coverage. K-levels range '
          'from K0 (no ambulation potential) to K4 (high-impact activity).',
          isIntro: true,
        ),
        ScaleBlock(
          scaleName: 'Medicare K-Level Classification',
          description: 'Functional classification system that determines prosthetic '
              'component eligibility. Assessed by the physician and/or prosthetist.',
          columns: ['Level', 'Description', 'Component Eligibility'],
          rows: [
            ['K0', 'Does not have the ability or potential to ambulate or '
                'transfer with a prosthesis', 'No prosthesis indicated '
                '(may receive cosmetic device)'],
            ['K1', 'Has ability or potential to use a prosthesis for transfers '
                'or ambulation on level surfaces at a fixed cadence '
                '(household ambulator)', 'Basic components: SACH foot, '
                'single-axis knee, manual-lock knee'],
            ['K2', 'Has ability or potential for ambulation with the ability '
                'to traverse low-level environmental barriers such as '
                'curbs, stairs, or uneven surfaces (limited community '
                'ambulator)', 'Multiaxial foot, polycentric knee, '
                'hydraulic swing control'],
            ['K3', 'Has ability or potential for ambulation with variable '
                'cadence. Typical community ambulator with ability to '
                'traverse most environmental barriers', 'Dynamic response '
                'feet, microprocessor knees, multiaxial components'],
            ['K4', 'Has ability or potential that exceeds basic ambulation '
                'skills, exhibiting high impact, stress, or energy '
                'levels (child, athlete, active adult)', 'Running/sport '
                'prostheses, highest technology components'],
          ],
          boardPearl: 'K-levels are based on FUNCTIONAL POTENTIAL, not just '
              'current ability. As of September 2024, K2 patients are eligible '
              'for microprocessor knees with integrated stumble-recovery technology.',
        ),
        PearlBlock(
          'Board Pearl — K-Level Is Functional Potential',
          'The K-level is assigned based on the patient\'s functional POTENTIAL — '
          'their expected highest level of function with appropriate components and '
          'rehabilitation — not solely their current ability. This prevents '
          'inappropriate underclassification of recently injured patients who have '
          'not yet had the opportunity to demonstrate their capabilities.',
        ),
        TableBlock(
          title: 'K-Level Assignment Considerations',
          columns: ['Factor', 'Influence on K-Level'],
          rows: [
            ['Pre-amputation activity level', 'Higher pre-amp activity predicts higher K-level'],
            ['Age', 'Younger patients generally have higher potential'],
            ['Comorbidities', 'Cardiac, pulmonary, neurologic disease may limit potential'],
            ['Cognitive status', 'Must understand and participate in prosthetic training'],
            ['Motivation/psychosocial support', 'Strong motivation improves outcomes'],
            ['Residual limb characteristics', 'Length, shape, skin quality, ROM, strength'],
            ['Amputation etiology', 'Traumatic patients generally achieve higher K-levels'],
            ['Contralateral limb status', 'Intact contralateral limb improves function'],
          ],
          headerColor: const Color(0xFF6A1B9A),
        ),
        HeaderBlock('Amputee Mobility Predictor (AMP)'),
        ComparisonCardBlock(
          title: 'AMP / AMPnoPRO / AMPPRO',
          themeColor: const Color(0xFF6A1B9A),
          backgroundColor: const Color(0xFFF3E5F5),
          icon: Icons.assessment,
          description: 'A 21-item clinical assessment tool that predicts K-level '
              'functional classification. Can be administered with prosthesis '
              '(AMPPRO) or without prosthesis (AMPnoPRO) to predict prosthetic '
              'potential before fitting.',
          keyPoints: [
            '21-item objective functional assessment',
            'Validated predictor of Medicare K-level classification',
            'AMPnoPRO: performed WITHOUT prosthesis — predicts prosthetic potential pre-fitting',
            'AMPPRO: performed WITH prosthesis — confirms current functional level',
            'Assesses sitting balance, transfers, standing, gait, stairs, and more',
            'Score correlates with predicted K-level for prosthetic prescription',
            'Useful for justifying prosthetic components to payers',
          ],
        ),
        PearlBlock(
          'Board Pearl — AMP',
          'The Amputee Mobility Predictor (AMP) predicts K-level and can be performed '
          'PRE-prosthetically (AMPnoPRO) to predict prosthetic potential BEFORE fitting. '
          'This is key for determining candidacy and appropriate componentry.',
        ),
        HeaderBlock('Functional Performance Measures'),
        ComparisonCardBlock(
          title: '6-Minute Walk Test (6MWT)',
          themeColor: const Color(0xFF2E7D32),
          backgroundColor: const Color(0xFFE8F5E9),
          icon: Icons.directions_walk,
          description: 'Measures functional endurance by recording the distance walked '
              'in 6 minutes on a flat, measured course.',
          keyPoints: [
            'Distance walked in 6 minutes on a level surface',
            'Reflects functional endurance and cardiovascular fitness',
            'Widely used as outcome measure in amputee rehabilitation',
            'Track progress over time during prosthetic training',
            'Sensitive to changes in prosthetic componentry',
            'Normative data available by amputation level and age',
          ],
        ),
        ComparisonCardBlock(
          title: 'Timed Up and Go (TUG)',
          themeColor: const Color(0xFF1565C0),
          backgroundColor: const Color(0xFFE3F2FD),
          icon: Icons.timer,
          description: 'Measures basic functional mobility: stand from a chair, walk '
              '3 meters, turn around, walk back, and sit down. Timed in seconds.',
          keyPoints: [
            'Stand from standard chair, walk 3 meters, turn, return, sit',
            'Total time recorded in seconds',
            'Less than 12 seconds: independent community ambulator',
            'Greater than 30 seconds: dependent in most ADLs, significant fall risk',
            'Quick, reliable, requires minimal equipment',
            'Useful for screening fall risk in amputee population',
          ],
        ),
        ComparisonCardBlock(
          title: 'L-Test',
          themeColor: const Color(0xFF00695C),
          backgroundColor: const Color(0xFFE0F2F1),
          icon: Icons.turn_right,
          description: 'A modified TUG with an L-shaped path that adds complexity '
              'by requiring two turns, more closely simulating real-world ambulation.',
          keyPoints: [
            'Modified TUG with L-shaped walking path',
            'Requires two directional changes (more challenging than TUG)',
            'Better simulates real-world indoor ambulation demands',
            'More sensitive to detecting functional differences between MPK users',
            'Timed in seconds, lower time indicates better function',
            'Validated specifically for lower-limb amputee population',
          ],
        ),
        HeaderBlock('Patient-Reported Outcome Measures'),
        BulletCardBlock(
          title: 'Houghton Scale',
          themeColor: const Color(0xFF4527A0),
          backgroundColor: const Color(0xFFEDE7F6),
          points: [
            'Questionnaire assessing prosthesis use in daily activities',
            'Evaluates frequency and context of prosthetic wear',
            'Questions about indoor, outdoor, and community use',
            'Validated for lower-limb amputees',
            'Simple, quick to administer',
          ],
        ),
        BulletCardBlock(
          title: 'Socket Comfort Score (SCS)',
          themeColor: const Color(0xFFBF360C),
          backgroundColor: const Color(0xFFFBE9E7),
          points: [
            'Patient-reported 0-10 numeric rating scale for socket comfort',
            '0 = most uncomfortable socket imaginable',
            '10 = most comfortable socket imaginable',
            'Quick, simple, validated outcome measure',
            'Tracks socket fit changes over time',
            'Useful for comparing pre- and post-socket modification comfort',
          ],
        ),
        BulletCardBlock(
          title: 'Activities-specific Balance Confidence (ABC) Scale',
          themeColor: const Color(0xFFE65100),
          backgroundColor: const Color(0xFFFFF3E0),
          points: [
            '16-item self-report measure of balance confidence',
            'Patient rates confidence (0-100%) for specific activities',
            'Activities include reaching, bending, walking outdoors, escalators',
            'Scores below 67%: associated with increased fall risk',
            'Validated for lower-limb amputee population',
            'Assesses perceived (not actual) balance ability',
          ],
        ),
        TableBlock(
          title: 'Outcome Measure Quick Reference',
          columns: ['Measure', 'Type', 'Key Metric'],
          rows: [
            ['AMP', 'Performance', 'Predicts K-level (with or without prosthesis)'],
            ['6MWT', 'Performance', 'Distance walked in 6 minutes (endurance)'],
            ['TUG', 'Performance', '<12 sec = independent community ambulator'],
            ['L-Test', 'Performance', 'Modified TUG with L-shaped path'],
            ['Houghton', 'Self-report', 'Prosthesis use frequency in daily life'],
            ['SCS', 'Self-report', '0-10 socket comfort rating'],
            ['ABC Scale', 'Self-report', 'Balance confidence; <67% = fall risk'],
            ['PEQ', 'Self-report', 'Prosthetic satisfaction (function, appearance, frustration)'],
            ['TAPES', 'Self-report', 'Psychosocial adjustment, activity restriction, satisfaction'],
          ],
          headerColor: const Color(0xFF00838F),
        ),
        HeaderBlock('VA/DoD Clinical Practice Guidelines'),
        TableBlock(
          title: 'VA/DoD 2017 CPG — Four Strong Recommendations',
          columns: ['#', 'Recommendation'],
          rows: [
            ['1', 'Patient and caregiver education throughout rehabilitation'],
            ['2', 'Rigid or semi-rigid dressings after transtibial amputation'],
            ['3', 'Microprocessor knees over mechanical knees for appropriate candidates'],
            ['4', 'Annual transdisciplinary assessments for lifetime care'],
          ],
          headerColor: const Color(0xFF1565C0),
        ),
        TableBlock(
          title: 'VA/DoD 2025 CPG — Key Updates',
          columns: ['Topic', 'Recommendation'],
          rows: [
            ['MPK units', 'Suggested over non-MPK for reducing falls, improving mobility and satisfaction'],
            ['ESAR / MPC foot-ankle', 'Suggested over SACH feet for eligible candidates'],
            ['Osseointegration', 'Suggested as option for eligible TFA patients who cannot tolerate sockets'],
            ['Postoperative dressing', 'Rigid/semi-rigid for TTA maintained from 2017'],
            ['Rehabilitation setting', 'IRF suggested over other post-acute care settings'],
          ],
          headerColor: const Color(0xFF2E7D32),
        ),
        PearlBlock(
          'Board Pearl — VA/DoD CPG High-Yield',
          'The 2017 VA/DoD CPG had 18 total recommendations, with only 4 reaching '
          '"strong" evidence level: (1) education, (2) rigid dressings, (3) MPK, '
          'and (4) annual assessments. These four are most likely to appear on board '
          'examinations. The 2025 update adds osseointegration and ESAR feet.',
        ),
        PearlBlock(
          'Board Pearl — K2 MPK Coverage Expansion',
          'As of September 2024, K2 patients are eligible for microprocessor knees '
          'under Medicare if: the knee has integrated stumble-recovery technology, '
          'the patient can manage daily charging and error alerts, and the medical '
          'record documents the functional level and clinical rationale. This is a '
          'major expansion of access reflecting MPK safety evidence.',
        ),
      ],
    ),
  ],
);

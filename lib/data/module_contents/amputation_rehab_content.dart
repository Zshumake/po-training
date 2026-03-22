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
          boardPearl: 'K-levels determine prosthetic component eligibility. '
              'Microprocessor knees require K3 or K4 classification. K2 ambulators '
              'get hydraulic swing control but not microprocessor features.',
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
          ],
          headerColor: const Color(0xFF00838F),
        ),
      ],
    ),
  ],
);

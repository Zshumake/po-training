import 'package:flutter/material.dart';
import '../models/topic_content_model.dart';

final pediatricPOContent = TopicData(
  id: 'pediatric_po',
  title: 'Pediatric P&O',
  tabs: [
    // ─────────────────────────────────────────────
    // TAB 1: Congenital Limb Deficiencies
    // ─────────────────────────────────────────────
    TopicTab(
      title: 'Congenital Limb Deficiencies',
      blocks: [
        HeaderBlock('Congenital Limb Deficiencies'),
        TextBlock(
          'Congenital limb deficiencies are present at birth and result from '
          'failure of normal limb formation during embryologic development. '
          'Classification, common types, and surgical management options are '
          'important board topics in pediatric P&O.',
          isIntro: true,
        ),

        // --- Classification ---
        HeaderBlock('ISO/ISPO Classification System'),
        ComparisonCardBlock(
          title: 'Transverse Deficiency',
          themeColor: Colors.blue,
          backgroundColor: const Color(0xFFE3F2FD),
          icon: Icons.horizontal_rule,
          description: 'The limb is normally formed to a certain level, then absent '
              'distally. Resembles a surgical amputation. The limb simply ends '
              'at the level of deficiency with no distal structures present.',
          keyPoints: [
            'Limb normally developed to a certain point, then absent',
            'Resembles a surgical amputation in appearance',
            'MORE COMMON than longitudinal deficiencies',
            'No distal structures present beyond the level of deficiency',
            'Named by the level where the limb ends (e.g., transverse transradial)',
            'Prosthetic fitting similar to acquired amputation at that level',
            'Example: congenital below-elbow deficiency (most common UE)',
          ],
        ),
        ComparisonCardBlock(
          title: 'Longitudinal Deficiency',
          themeColor: Colors.teal,
          backgroundColor: const Color(0xFFE0F2F1),
          icon: Icons.straighten,
          description: 'A specific bone or segment is absent or deficient along the '
              'long axis of the limb, but distal structures may be partially '
              'or fully present. More complex management because distal '
              'anatomy exists but may be malformed.',
          keyPoints: [
            'Specific bone absent or deficient along the long axis',
            'Distal structures may be partially or fully present',
            'Less common but more complex to manage',
            'Examples: fibular hemimelia, PFFD, radial club hand',
            'Named by the absent bone (e.g., longitudinal deficiency of fibula)',
            'May require surgical reconstruction or amputation for prosthetic fitting',
            'Often associated with other skeletal anomalies in the same limb',
          ],
        ),

        // --- Terminal vs Intercalary ---
        HeaderBlock('Terminal vs Intercalary'),
        TableBlock(
          title: 'Terminal vs Intercalary Deficiencies',
          columns: ['Type', 'Definition', 'Distal Structures', 'Example'],
          rows: [
            ['Terminal', 'Absence extends to the end of the limb',
                'No distal structures present', 'Congenital below-elbow (transverse)'],
            ['Intercalary', 'Middle segment absent, distal structures present',
                'Distal parts ARE present (hand, foot)', 'Phocomelia (hands attached to trunk)'],
          ],
          headerColor: Colors.indigo,
        ),

        // --- Common Deficiencies ---
        HeaderBlock('Common Congenital Deficiencies'),
        ComparisonCardBlock(
          title: 'Fibular Hemimelia',
          themeColor: Colors.orange,
          backgroundColor: const Color(0xFFFFF3E0),
          icon: Icons.accessibility_new,
          description: 'The MOST COMMON congenital long bone deficiency in the lower '
              'extremity. The fibula is partially or completely absent, leading '
              'to limb length discrepancy, ankle instability, and foot deformity.',
          keyPoints: [
            'MOST COMMON congenital long bone deficiency (LE)',
            'Fibula partially or completely absent',
            'Associated findings: absent lateral rays (4th/5th toes), ankle valgus',
            'Tibial shortening and bowing common',
            'Anterolateral bowing of tibia',
            'Ball-and-socket ankle joint may develop',
            'Limb length discrepancy (LLD) is the primary functional problem',
            'Mild: limb lengthening or shoe lift may suffice',
            'Severe: Syme amputation (ankle disarticulation) + prosthesis',
            'Decision based on predicted LLD at skeletal maturity',
          ],
        ),
        ComparisonCardBlock(
          title: 'Proximal Femoral Focal Deficiency (PFFD)',
          themeColor: Colors.red,
          backgroundColor: const Color(0xFFFFEBEE),
          icon: Icons.accessibility,
          description: 'A deficiency of the proximal femur ranging from mild shortening '
              'to complete absence. Classified by the Aitken classification '
              '(A through D). Severe cases may require rotationplasty.',
          keyPoints: [
            'Proximal femur absent or deficient',
            'Aitken classification: A (mildest) through D (most severe)',
            'Class A: femoral head present, short femur, subtrochanteric defect',
            'Class B: femoral head present, no connection to shaft',
            'Class C: femoral head absent, short femoral shaft',
            'Class D: femoral head and acetabulum absent',
            'Severe LLD (limb may be 50%+ shorter)',
            'Rotationplasty (Van Nes procedure): foot rotated 180\u00B0 so ankle acts as knee',
            'Knee fusion + rotationplasty: ankle plantar/dorsiflexion = knee flex/ext',
            'Extension prosthesis: for mild cases to equalize limb length',
            'Often associated with fibular hemimelia',
          ],
        ),
        BulletCardBlock(
          title: 'Other Congenital Deficiencies',
          themeColor: Colors.deepPurple,
          backgroundColor: const Color(0xFFEDE7F6),
          points: [
            'Radial club hand: absent/deficient radius, hand deviates radially',
            'Ulnar club hand: absent/deficient ulna, hand deviates ulnarly (less common)',
            'Tibial hemimelia: absent tibia (less common than fibular hemimelia)',
            'Amniotic band syndrome: constriction bands cause in-utero amputation',
            'Amniotic bands can cause finger, hand, or limb amputation',
            'Polydactyly: extra digits (most common congenital hand anomaly)',
            'Syndactyly: fused digits (second most common hand anomaly)',
            'Phocomelia: intercalary deficiency, hands/feet attached near trunk',
            'Historically associated with thalidomide exposure',
          ],
        ),
        PearlBlock(
          'Board Pearl',
          'Fibular hemimelia is the most common congenital long bone deficiency. '
          'It is often associated with absent lateral foot rays and ankle valgus. '
          'Management depends on predicted limb length discrepancy at maturity: '
          'mild cases may use lengthening; severe cases undergo Syme amputation.',
        ),

        // --- Fibular Hemimelia Management Decision Table ---
        HeaderBlock('Fibular Hemimelia: Syme vs Lengthening'),
        TableBlock(
          title: 'Syme Amputation vs Limb Lengthening',
          columns: ['Factor', 'Syme Amputation', 'Limb Lengthening'],
          rows: [
            ['Number of surgeries', '~2', '~7'],
            ['Estimated cost', 'Lower (~\$7,000)', 'Higher (~\$27,000)'],
            ['Complication rate', 'Lower', 'Higher'],
            ['Time to functional recovery', 'Shorter', 'Significantly longer'],
            ['Patient satisfaction', 'High', 'Improving with modern techniques'],
          ],
          headerColor: Colors.orange,
        ),

        // --- PFFD: Paley Classification ---
        HeaderBlock('PFFD: Paley Classification'),
        BulletCardBlock(
          title: 'Paley Classification (Treatment-Oriented)',
          themeColor: Colors.red,
          backgroundColor: const Color(0xFFFFEBEE),
          points: [
            'Type 1: Intact femur with mobile hip and knee (1a: normal ossification, 1b: delayed)',
            'Type 2: Mobile pseudarthrosis with femoral head in acetabulum (2a: neck, 2b: subtrochanteric)',
            'Type 3: Diaphyseal deficiency with femoral head mobile in acetabulum (3a: knee ROM >45\u00B0, 3b: <45\u00B0)',
            'Type 4: Distal femoral deficiency with absent or fused knee joint',
            'Types 1-2 (Aitken A/B): limb lengthening and reconstruction preferred',
            'Types 3-4 (Aitken C/D): iliofemoral fusion, extension prosthesis, or rotationplasty',
            'Hip arthrography useful for differentiating Paley types 2a and 2b',
          ],
        ),
      ],
    ),

    // ─────────────────────────────────────────────
    // TAB 2: Prosthetic Milestones
    // ─────────────────────────────────────────────
    TopicTab(
      title: 'Prosthetic Milestones',
      blocks: [
        HeaderBlock('Pediatric Prosthetic Fitting Milestones'),
        TextBlock(
          'Timing of prosthetic fitting in children is based on developmental '
          'milestones, not chronological age alone. Early fitting promotes '
          'incorporation of the prosthesis into the child\'s body image and '
          'motor development. This is a HIGH-YIELD board topic.',
          isIntro: true,
        ),

        // --- UE Milestones ---
        HeaderBlock('Upper Extremity Fitting Timeline'),
        NumberedListBlock([
          MapEntry('6 mo', 'First UE prosthesis: fit when child begins SITTING. Passive mitt or hand to promote bilateral hand use and midline play.'),
          MapEntry('12 mo', 'Begin training with voluntary opening (VO) terminal device. Child learns cause-and-effect of cable activation.'),
          MapEntry('18-24 mo', 'Active use of VO terminal device during play. Pre-prehension activities: reach, touch, bat objects.'),
          MapEntry('3 yr', 'Body-powered prosthesis with active cable control. Child can learn single-control cable operation. Dual-control (transhumeral) cable training can begin.'),
          MapEntry('3-4 yr', 'Myoelectric training can begin. Child can understand and perform voluntary muscle contraction on command.'),
          MapEntry('5+ yr', 'Refinement of prosthetic skills. Activity-specific terminal devices introduced (sports, music).'),
        ]),

        // --- LE Milestones ---
        HeaderBlock('Lower Extremity Fitting Timeline'),
        NumberedListBlock([
          MapEntry('6-9 mo', 'SYME or below-knee: non-articulated prosthesis for standing support when child begins PULLING TO STAND.'),
          MapEntry('9-12 mo', 'First LE prosthesis typically fit. Coincides with pulling to stand and cruising along furniture.'),
          MapEntry('12-15 mo', 'Begin ambulation training. Simple prosthetic design: no articulating joints initially.'),
          MapEntry('3 yr', 'Add articulating knee joint for above-knee amputees as child develops balance and coordination.'),
          MapEntry('5+ yr', 'More advanced componentry as child grows. Activity-specific feet for sports.'),
        ]),

        PearlBlock(
          'Board Pearl - Fitting Milestones',
          'UE prosthesis at 6 months (when sitting begins). LE prosthesis '
          'at 9-12 months (when pulling to stand begins). These are the most '
          'commonly tested fitting milestones. Early fitting promotes body '
          'image incorporation and bilateral motor development.',
        ),

        // --- Prosthesis Replacement Schedule ---
        HeaderBlock('Prosthesis Replacement Schedule During Growth'),
        TableBlock(
          title: 'Replacement Frequency by Age',
          columns: ['Age Range', 'Replacement Frequency'],
          rows: [
            ['Birth to 5 years', 'New prosthesis approximately every year'],
            ['5-12 years', 'New prosthesis approximately every 2 years'],
            ['12-21 years', 'New prosthesis approximately every 3-4 years'],
          ],
          headerColor: Colors.green,
        ),
        PearlBlock(
          'Board Pearl - Early Fitting Evidence',
          'Prosthetic fitting BEFORE one year of age is associated with continued '
          'prosthetic use for at least four years, suggesting that early fitting '
          'enhances long-term acceptance. For TF amputees under age 3, the initial '
          'prosthesis should NOT include an articulating knee joint.',
        ),

        // --- Terminal Bony Overgrowth ---
        HeaderBlock('Terminal Bony Overgrowth'),
        ComparisonCardBlock(
          title: 'Terminal Bony Overgrowth',
          themeColor: Colors.red,
          backgroundColor: const Color(0xFFFFEBEE),
          icon: Icons.warning,
          description: 'Appositional bone growth at the distal end of the residual '
              'limb in PEDIATRIC amputees. New bone grows beyond the cut end '
              'of the bone and can perforate the skin. This is UNIQUE to '
              'children and does NOT occur in adults.',
          keyPoints: [
            'UNIQUE to pediatric amputees (does NOT occur in adults)',
            'Appositional new bone growth at the cut bone end',
            'Bone grows distally and can perforate through the skin',
            'Most common in: humerus and fibula',
            'Also occurs in tibia and femur (less frequently)',
            'NOT caused by the prosthesis (not a socket problem)',
            'NOT caused by epiphyseal growth plate activity',
            'Caused by periosteal appositional bone formation at the bone stump',
            'Treatment: surgical revision (bone resection and soft tissue capping)',
            'May require multiple revisions during growth years',
            'Capping procedures (osteochondral cap) may reduce recurrence',
          ],
        ),
        PearlBlock(
          'Board Pearl',
          'Terminal bony overgrowth is UNIQUE to pediatric amputees and does '
          'NOT occur in adults. It is most common in the humerus and fibula. '
          'It is NOT a prosthetic problem and NOT caused by the socket. It is '
          'caused by appositional bone growth at the distal stump and may '
          'require surgical revision.',
        ),
        BulletCardBlock(
          title: 'Terminal Bony Overgrowth: Additional Key Facts',
          themeColor: Colors.red,
          backgroundColor: const Color(0xFFFFEBEE),
          points: [
            'Occurs ONLY in transosseous amputations (through the bone shaft)',
            'Does NOT occur after disarticulation (through the joint)',
            'Does NOT occur after approximately age 12 years',
            'Younger children at time of amputation have higher incidence',
            'Incidence: 4-50% of pediatric amputations',
            'Bone frequency order: Humerus > Fibula > Tibia > Radius/Ulna',
            'This is why disarticulation is PREFERRED over through-bone amputation in children',
          ],
        ),
        HeaderBlock('Surgical Management of Terminal Bony Overgrowth'),
        BulletCardBlock(
          title: 'Surgical Options',
          themeColor: Colors.deepOrange,
          backgroundColor: const Color(0xFFFBE9E7),
          points: [
            'Simple distal resection and stump revision: most straightforward but high recurrence (25-50%)',
            'Modified Ertl tibiofibular osteomyoplasty: bone bridge between tibia and fibula',
            'Non-biological capping: silicone or PTFE caps over bone end',
            'Biological stump capping (Marquardt-Corell technique): autologous osteocartilaginous cap',
            'Marquardt-Corell limits recurrence to ~10% and provides partial end-bearing capacity',
            'Multiple revisions may be required during growth years',
          ],
        ),

        // --- Growth Considerations ---
        HeaderBlock('Growth Considerations'),
        BulletCardBlock(
          title: 'Prosthetic Management During Growth',
          themeColor: Colors.green,
          backgroundColor: const Color(0xFFE8F5E9),
          points: [
            'Growth plates (physes) remain active until skeletal maturity',
            'Prosthesis must accommodate ongoing limb growth',
            'Frequent prosthetic replacements needed: every 12-18 months',
            'Socket replacement most common reason (limb outgrows socket)',
            'Younger children: more frequent replacements (faster growth)',
            'Adolescent growth spurt: may need even more frequent changes',
            'Adjustable-length pylons can extend time between replacements',
            'Growth of contralateral limb requires prosthetic length adjustments',
            'Disarticulations preferred in children: preserve growth plates',
            'Through-bone amputations in children: risk of terminal bony overgrowth',
          ],
        ),
        BulletCardBlock(
          title: 'Psychosocial Considerations',
          themeColor: Colors.purple,
          backgroundColor: const Color(0xFFF3E5F5),
          points: [
            'Early prosthetic fitting promotes incorporation into body image',
            'Peer acceptance important during school-age years',
            'Adolescence: body image concerns may increase',
            'Rejection rates higher in adolescence (especially UE)',
            'Activity-specific devices maintain engagement in sports and hobbies',
            'Family education and support critical for compliance',
            'May benefit from peer support groups with other limb-different children',
          ],
        ),
      ],
    ),

    // ─────────────────────────────────────────────
    // TAB 3: Pediatric Orthoses
    // ─────────────────────────────────────────────
    TopicTab(
      title: 'Pediatric Orthoses',
      blocks: [
        HeaderBlock('Pediatric Orthotic Devices'),
        TextBlock(
          'Pediatric orthoses address congenital and developmental musculoskeletal '
          'conditions. Familiarity with common conditions, their orthotic management, '
          'and age-appropriate interventions is essential for board preparation.',
          isIntro: true,
        ),

        // --- Pavlik Harness ---
        ComparisonCardBlock(
          title: 'Pavlik Harness',
          themeColor: Colors.blue,
          backgroundColor: const Color(0xFFE3F2FD),
          icon: Icons.child_care,
          description: 'The primary orthotic treatment for developmental dysplasia of '
              'the hip (DDH) in infants. Maintains the hips in flexion and '
              'abduction to center the femoral head in the acetabulum and '
              'promote normal hip joint development.',
          keyPoints: [
            'Indication: developmental dysplasia of the hip (DDH)',
            'Age range: 0-6 months (most effective in newborns)',
            'Maintains hips in flexion (90-100\u00B0) and abduction (50-70\u00B0)',
            'Centers femoral head in acetabulum for proper joint development',
            'Chest strap with anterior shoulder straps and stirrups',
            'Allows active hip flexion and abduction (dynamic positioning)',
            'Prevents hip extension and adduction',
            'Worn full-time (23 hours/day) for 6-12 weeks typically',
            'Success rate: ~90% for Ortolani-positive hips diagnosed early',
            'Complication: avascular necrosis of femoral head if over-abducted',
            'After 6 months of age: rigid abduction brace or surgical reduction may be needed',
          ],
        ),

        // --- Pavlik Harness Efficacy & Complications ---
        TableBlock(
          title: 'Pavlik Harness Success by Age at Initiation',
          columns: ['Age at Initiation', 'Success Rate', 'Notable Risks'],
          rows: [
            ['Under 4 weeks', '~96%', 'Minimal'],
            ['Under 3 months', '>90%', 'AVN 0.9%, residual dysplasia 1.8%'],
            ['3-6 months', '~88%', 'AVN 9.7%, residual dysplasia 20.3%'],
            ['After 6 months', 'Not recommended', 'High failure rate; rigid orthosis or surgery needed'],
          ],
          headerColor: Colors.blue,
        ),
        BulletCardBlock(
          title: 'Pavlik Harness Complications & Failure Factors',
          themeColor: Colors.red,
          backgroundColor: const Color(0xFFFFEBEE),
          points: [
            'AVN of femoral head: most feared complication (1-30% depending on age/severity)',
            'AVN risk increases with EXCESSIVE ABDUCTION (compresses lateral epiphyseal vessels)',
            'Femoral nerve palsy: can occur with excessive hip flexion',
            'Femoral nerve palsy recognized by loss of active knee extension — reduce flexion immediately',
            'Failure factors: older age, higher displacement severity (Graf Type IV), male sex',
            'Failure factors: bilateral involvement, poor parental compliance',
            'After failure: rigid abduction bracing, closed reduction with spica cast, or open reduction',
          ],
        ),

        // --- Clubfoot ---
        HeaderBlock('Clubfoot (Talipes Equinovarus) Management'),
        ComparisonCardBlock(
          title: 'Ponseti Method',
          themeColor: Colors.teal,
          backgroundColor: const Color(0xFFE0F2F1),
          icon: Icons.sync,
          description: 'The gold standard treatment for congenital clubfoot (talipes '
              'equinovarus). Involves serial manipulation and casting to '
              'gradually correct the deformity, followed by a Denis Browne bar '
              'for maintenance.',
          keyPoints: [
            'Gold standard for clubfoot treatment',
            'Serial casting: weekly cast changes with gradual correction',
            'Correction sequence: cavus first, then adductus, varus, and equinus last',
            'Typically 5-7 casts over 5-7 weeks',
            'Percutaneous Achilles tenotomy: often needed to correct residual equinus',
            'After casting: Denis Browne bar for maintenance',
            'High success rate (>95%) when performed correctly',
            'Much less invasive than traditional surgical release',
          ],
        ),
        ComparisonCardBlock(
          title: 'Denis Browne Bar (Foot Abduction Brace)',
          themeColor: Colors.indigo,
          backgroundColor: const Color(0xFFE8EAF6),
          icon: Icons.straighten,
          description: 'A bar connecting two shoes/boots in abduction and dorsiflexion. '
              'Used as a maintenance device after successful Ponseti serial casting '
              'to prevent clubfoot recurrence.',
          keyPoints: [
            'Bar connects shoes in 60-70\u00B0 external rotation (affected side)',
            'Shoes set in ~10-15\u00B0 dorsiflexion',
            'Worn 23 hours/day for first 3 months after casting',
            'Then nighttime and nap time only until age 4-5 years',
            'Prevents recurrence of corrected clubfoot',
            'Compliance is critical: high recurrence rate if not worn',
            'Bar prevents internal rotation and equinus recurrence',
            'Bilateral clubfoot: both feet set at 70\u00B0 external rotation',
          ],
        ),

        PearlBlock(
          'Board Pearl - Ponseti Method',
          'The Ponseti correction sequence is: cavus FIRST, then adductus and '
          'varus, and equinus LAST. Correcting equinus prematurely creates a '
          'rocker-bottom deformity. 80-90% of patients require percutaneous '
          'Achilles tenotomy for residual equinus. Denis Browne bar compliance '
          'is critical: non-adherent patients have 78% recurrence vs only 7% '
          'in compliant families.',
        ),

        // --- Legg-Calve-Perthes ---
        HeaderBlock('Legg-Calv\u00E9-Perthes Disease'),
        BulletCardBlock(
          title: 'Legg-Calv\u00E9-Perthes: Orthotic Management',
          themeColor: Colors.orange,
          backgroundColor: const Color(0xFFFFF3E0),
          points: [
            'Idiopathic avascular necrosis (AVN) of the femoral head in children',
            'Age of onset: typically 4-10 years (peak 5-7 years)',
            'More common in boys (4:1 ratio)',
            'Goal of orthotic treatment: containment of femoral head in acetabulum',
            'Abduction orthosis maintains femoral head centered in acetabulum',
            'Scottish Rite orthosis: most commonly used, allows ambulation',
            'Atlanta brace (Scottish Rite variant): hip abduction, free knee motion',
            'Petrie casts: abduction casts (used less frequently now)',
            'Containment prevents femoral head deformity during revascularization',
            'Younger children (<6 years): better prognosis, more likely to remodel',
          ],
        ),

        PearlBlock(
          'Board Pearl - Legg-Calv\u00E9-Perthes',
          'Scottish Rite brace is the most commonly used orthosis but evidence '
          'supporting its efficacy is limited. Children over age 8 at onset have '
          'a worse prognosis due to less remodeling time before skeletal maturity. '
          'Surgical containment (femoral varus osteotomy, Salter innominate osteotomy) '
          'may be superior for severe cases.',
        ),

        // --- Myelomeningocele ---
        HeaderBlock('Myelomeningocele (Spina Bifida) Orthoses'),
        BulletCardBlock(
          title: 'Orthotic Management by Neurologic Level',
          themeColor: Colors.red,
          backgroundColor: const Color(0xFFFFEBEE),
          points: [
            'Thoracic level: standing frame or parapodium for supported standing',
            'Thoracic level: RGO (Reciprocating Gait Orthosis) for reciprocal gait',
            'High lumbar (L1-L2): HKAFO or RGO; household ambulation at best',
            'Mid lumbar (L3): KAFO; may achieve community ambulation with aids',
            'Low lumbar (L4): AFO; community ambulation likely',
            'Sacral level: AFO or foot orthosis; near-normal ambulation',
            'Higher neurologic level = more extensive orthosis needed',
            'Wheelchair often becomes primary mobility by adolescence for thoracic/high lumbar',
          ],
        ),
        ComparisonCardBlock(
          title: 'Reciprocating Gait Orthosis (RGO)',
          themeColor: Colors.deepPurple,
          backgroundColor: const Color(0xFFEDE7F6),
          icon: Icons.directions_walk,
          description: 'A bilateral HKAFO with a hip joint coupling mechanism that '
              'links hip extension on one side to hip flexion on the other, '
              'enabling a reciprocal gait pattern in children with thoracic-level '
              'paraplegia.',
          keyPoints: [
            'Bilateral HKAFO with coupled hip mechanism',
            'Hip extension on one side drives hip flexion on the other',
            'Enables reciprocal (alternating) gait pattern',
            'Indicated for thoracic-level myelomeningocele',
            'Requires upper extremity strength for walker/crutch use',
            'Very high energy cost for ambulation',
            'Promotes bone health, renal function, and bowel motility',
            'Standing benefits: reduces osteoporosis, improves circulation',
            'Most children transition to wheelchair by adolescence',
          ],
        ),
        BulletCardBlock(
          title: 'Standing Frames & Parapodia',
          themeColor: Colors.green,
          backgroundColor: const Color(0xFFE8F5E9),
          points: [
            'Static standing frames: support non-ambulatory children in upright position',
            'Parapodium (swivel walker): standing frame with swivel base for limited mobility',
            'Benefits of standing: bone density maintenance, pressure relief, renal function',
            'Improved bowel and bladder function with upright positioning',
            'Psychosocial benefits: eye-level interaction with peers',
            'Typically used starting at standing age (9-12 months)',
            'Supine stander: for children with poor trunk control',
            'Prone stander: promotes upper extremity use during standing',
          ],
        ),
      ],
    ),

    // ─────────────────────────────────────────────
    // TAB 4: Scoliosis Bracing
    // ─────────────────────────────────────────────
    TopicTab(
      title: 'Scoliosis Bracing',
      blocks: [
        HeaderBlock('Scoliosis Bracing'),
        TextBlock(
          'Scoliosis bracing is used to prevent curve progression in skeletally '
          'immature patients with moderate curves. It is critical to understand '
          'the indications, brace types, and limitations of orthotic management. '
          'Bracing does NOT correct scoliosis; it prevents progression.',
          isIntro: true,
        ),

        // --- Indications ---
        HeaderBlock('Indications for Scoliosis Bracing'),
        BulletCardBlock(
          title: 'Bracing Criteria',
          themeColor: Colors.blue,
          backgroundColor: const Color(0xFFE3F2FD),
          points: [
            'Cobb angle 25-45 degrees (moderate curves)',
            'Skeletal immaturity: Risser sign 0, 1, or 2',
            'Risser 0-2 indicates significant remaining growth',
            'Must have growth remaining for bracing to be effective',
            'Curves <25\u00B0: observation with serial radiographs',
            'Curves >45-50\u00B0: surgical intervention indicated (bracing unlikely to help)',
            'Bracing most effective in curves 25-40\u00B0 in growing children',
            'SRS/AAOS guidelines: brace if Cobb 25-40\u00B0 and Risser 0-2',
          ],
        ),
        PearlBlock(
          'Board Pearl',
          'Bracing does NOT correct scoliosis. It PREVENTS PROGRESSION of the '
          'curve during growth. Indications: Cobb angle 25-45\u00B0 in a skeletally '
          'immature patient (Risser 0-2). Surgery is considered when the curve '
          'exceeds 45-50\u00B0 despite bracing.',
        ),

        // --- BrAIST Trial ---
        HeaderBlock('BrAIST Trial (Landmark Evidence)'),
        BulletCardBlock(
          title: 'BrAIST Trial Key Results',
          themeColor: Colors.deepPurple,
          backgroundColor: const Color(0xFFEDE7F6),
          points: [
            'Published 2013 (Weinstein et al, NEJM): highest level evidence for scoliosis bracing',
            'Multicenter study: 25 sites, 242 participants with adolescent idiopathic scoliosis',
            'Inclusion: Cobb 20-40\u00B0, Risser 0-2, age 10-15 years',
            'Treatment success (bracing): 72% combined; 75% randomized ITT',
            'Treatment success (observation): 48% combined; 42% randomized ITT',
            'Number Needed to Treat (NNT) = 3',
            'Trial STOPPED EARLY: evidence for bracing efficacy so strong it was unethical to continue',
            'Boston brace (TLSO) was the primary brace used in the trial',
          ],
        ),
        TableBlock(
          title: 'BrAIST Dose-Response: Wear Time vs Success',
          columns: ['Daily Wear Time', 'Success Rate'],
          rows: [
            ['Any wear (>0 hours/day)', '~50%'],
            ['6 hours/day', '~68%'],
            ['12 hours/day', '~80%'],
            ['>13 hours/day', '90-93%'],
          ],
          headerColor: Colors.deepPurple,
        ),
        PearlBlock(
          'Board Pearl - BrAIST Trial',
          'The BrAIST trial showed NNT of 3 for bracing to prevent surgical '
          'threshold progression. A clear dose-response relationship exists: '
          '>13 hours/day yields 90-93% success. The trial was stopped early '
          'because bracing efficacy was so strong. Compliance is the most '
          'critical modifiable factor.',
        ),

        // --- Milwaukee Brace ---
        ComparisonCardBlock(
          title: 'Milwaukee Brace (CTLSO)',
          themeColor: Colors.teal,
          backgroundColor: const Color(0xFFE0F2F1),
          icon: Icons.accessibility_new,
          description: 'The oldest and most traditional scoliosis brace. A cervico-'
              'thoraco-lumbo-sacral orthosis (CTLSO) with a pelvic girdle, '
              'metal uprights, and a neck ring with occipital and throat molds. '
              'Used for curves with apex ABOVE T8.',
          keyPoints: [
            'Type: CTLSO (cervico-thoraco-lumbo-sacral orthosis)',
            'Extends from pelvis to chin/occipital ring',
            'Neck ring: occipital and throat molds (mandibular pads)',
            'Metal superstructure with lateral pads at curve apex',
            'Indicated for curves with apex ABOVE T8 (high thoracic)',
            'Can address high thoracic and double major curves',
            'Poorly tolerated cosmetically (visible at neckline)',
            'Lower compliance due to appearance and discomfort',
            'Largely replaced by TLSO braces for lower curves',
            'Wearing schedule: 16-23 hours/day',
          ],
        ),

        // --- Boston Brace ---
        ComparisonCardBlock(
          title: 'Boston Brace (TLSO)',
          themeColor: Colors.indigo,
          backgroundColor: const Color(0xFFE8EAF6),
          icon: Icons.view_module,
          description: 'A custom-molded thoraco-lumbo-sacral orthosis (TLSO) without '
              'a neck ring. The most commonly prescribed scoliosis brace. '
              'Indicated for curves with apex at T8 or BELOW.',
          keyPoints: [
            'Type: TLSO (thoraco-lumbo-sacral orthosis)',
            'Custom-molded, no neck ring or superstructure',
            'Indicated for curves with apex at T8 or BELOW',
            'Underarm design: better cosmesis than Milwaukee',
            'Higher compliance due to less visible profile',
            'Corrective pads placed at the convexity of the curve',
            'Relief areas (windows) on the concave side allow curve correction',
            'Three-point pressure system: applies corrective forces',
            'Most commonly prescribed scoliosis brace in the US',
            'Wearing schedule: 16-23 hours/day',
          ],
        ),

        // --- Charleston ---
        ComparisonCardBlock(
          title: 'Charleston Bending Brace',
          themeColor: Colors.orange,
          backgroundColor: const Color(0xFFFFF3E0),
          icon: Icons.nightlight,
          description: 'A nighttime-only scoliosis brace that overcorrects the curve '
              'during sleep by bending the patient toward the convexity. '
              'Designed for single curves in the 25-35 degree range.',
          keyPoints: [
            'NIGHTTIME ONLY brace (worn during sleep only)',
            'Overcorrects curve by bending patient toward convexity',
            'Indicated for single (C-type) curves 25-35 degrees',
            'NOT for double (S-type) curves (would worsen compensatory curve)',
            'Better compliance: only worn at night',
            'Side-bending mold: custom-molded in maximum correction',
            'Less effective for larger or double curves',
            'Appealing to adolescents who refuse daytime bracing',
            'Wearing schedule: nighttime only (8+ hours during sleep)',
            'Evidence: ~50% higher surgical rates compared to full-time rigid bracing',
          ],
        ),

        // --- SpineCor ---
        BulletCardBlock(
          title: 'SpineCor Dynamic Brace',
          themeColor: Colors.green,
          backgroundColor: const Color(0xFFE8F5E9),
          points: [
            'Flexible dynamic scoliosis brace',
            'Uses elastic bands rather than rigid plastic',
            'Allows more trunk mobility during wear',
            'Corrective forces applied through elastic band tension',
            'Better patient acceptance due to flexibility and low profile',
            'Can be worn under clothing more easily',
            'Evidence for efficacy is mixed compared to rigid braces',
            'Reported success rates ~59% (lower than rigid bracing in some studies)',
            'Wearing schedule: ~20 hours/day',
            'May be appropriate for smaller, flexible curves',
          ],
        ),

        // --- Comparison Table ---
        TableBlock(
          title: 'Scoliosis Brace Comparison',
          columns: ['Brace', 'Type', 'Apex Level', 'Wearing Schedule', 'Key Feature'],
          rows: [
            ['Milwaukee', 'CTLSO', 'Above T8', '16-23 hrs/day',
                'Neck ring; oldest design; for high thoracic curves'],
            ['Boston', 'TLSO', 'T8 and below', '16-23 hrs/day',
                'No neck ring; most commonly prescribed; better cosmesis'],
            ['Charleston', 'TLSO', 'Single curves 25-35\u00B0', 'Nighttime only',
                'Overcorrects during sleep; NOT for double curves'],
            ['SpineCor', 'Dynamic', 'Variable', '16-23 hrs/day',
                'Flexible bands; allows trunk mobility; low profile'],
          ],
          headerColor: Colors.deepOrange,
        ),

        // --- Extended Cobb Angle Management ---
        TableBlock(
          title: 'Cobb Angle Management Guide',
          columns: ['Cobb Angle', 'Management'],
          rows: [
            ['<10\u00B0', 'Within normal limits; not scoliosis'],
            ['10-24\u00B0', 'Observation with serial radiographs every 6 months'],
            ['20-25\u00B0 with documented 5-10\u00B0 progression', 'Bracing indicated'],
            ['25-40\u00B0 (Risser 0-2)', 'Bracing indicated'],
            ['40-45\u00B0', 'Bracing may be attempted; approaching surgical threshold'],
            ['>45-50\u00B0', 'Surgical consideration (posterior spinal fusion)'],
          ],
          headerColor: Colors.indigo,
        ),

        // --- Wearing & Outcomes ---
        HeaderBlock('Wearing Schedule & Outcomes'),
        BulletCardBlock(
          title: 'Bracing Outcomes & Key Concepts',
          themeColor: Colors.deepPurple,
          backgroundColor: const Color(0xFFEDE7F6),
          points: [
            'Typical wearing schedule: 16-23 hours per day (varies by protocol)',
            'Charleston brace: nighttime only (8+ hours during sleep)',
            'BRAIST study (2013): bracing effective in preventing curve progression to 50\u00B0',
            'Compliance is the single most important factor in brace effectiveness',
            'Full-time bracing continues until skeletal maturity (Risser 4-5)',
            'Gradual weaning protocol after skeletal maturity is reached',
            'Bracing does NOT correct existing curvature',
            'Bracing PREVENTS PROGRESSION during remaining growth',
            'If curve progresses beyond 45-50\u00B0 despite bracing: surgery indicated',
            'Surgical options: posterior spinal fusion with instrumentation',
          ],
        ),

        // --- Risser Sign ---
        ScaleBlock(
          scaleName: 'Risser Sign (Skeletal Maturity)',
          description: 'The Risser sign measures skeletal maturity by assessing iliac '
              'crest apophysis ossification on AP pelvis radiograph. Higher '
              'Risser = more skeletal maturity = less growth remaining. '
              'Critical for scoliosis bracing decisions.',
          columns: ['Risser Grade', 'Ossification', 'Growth Remaining'],
          rows: [
            ['0', 'No ossification', 'Maximum growth remaining'],
            ['1', '25% ossification (lateral)', 'Significant growth remaining'],
            ['2', '50% ossification', 'Moderate growth remaining'],
            ['3', '75% ossification', 'Some growth remaining'],
            ['4', '100% ossification (not fused)', 'Minimal growth remaining'],
            ['5', 'Complete fusion to iliac crest', 'Skeletal maturity reached'],
          ],
          boardPearl: 'Bracing indicated for Risser 0-2 (significant growth remaining). '
              'Risser 4-5 indicates near or complete skeletal maturity; bracing '
              'has minimal benefit. Risser 0 = highest risk of progression.',
        ),
        PearlBlock(
          'Board Pearl',
          'Milwaukee brace (CTLSO) for curve apex ABOVE T8. Boston brace (TLSO) '
          'for curve apex at T8 and BELOW. Charleston is nighttime-only for '
          'single curves 25-35\u00B0. Bracing prevents progression but does NOT '
          'correct existing curvature. Compliance is the key to success.',
        ),
      ],
    ),
  ],
);

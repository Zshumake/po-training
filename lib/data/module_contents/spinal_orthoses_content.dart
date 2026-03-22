import 'package:flutter/material.dart';
import '../models/topic_content_model.dart';

final spinalOrthosesContent = TopicData(
  id: 'spinal_orthoses',
  title: 'Spinal Orthoses',
  tabs: [
    // ─────────────────────────────────────────────
    // TAB 1: Cervical Orthoses
    // ─────────────────────────────────────────────
    TopicTab(
      title: 'Cervical Orthoses',
      blocks: [
        HeaderBlock('Cervical Orthoses Overview'),
        TextBlock(
          'Cervical orthoses range from soft collars providing minimal restriction '
          'to the halo vest providing near-complete immobilization. Selecting the '
          'appropriate cervical orthosis depends on the level and stability of injury, '
          'the planes of motion requiring restriction, and patient tolerance. '
          'The cervical orthosis motion restriction table is one of the HIGHEST-YIELD '
          'tables on PM&R board examinations.',
          isIntro: true,
        ),

        // --- Soft Collar ---
        ComparisonCardBlock(
          title: 'Soft Collar',
          themeColor: Colors.grey,
          backgroundColor: const Color(0xFFF5F5F5),
          icon: Icons.accessibility_new,
          description:
              'A flexible foam collar that provides minimal cervical motion restriction. '
              'Primarily used for comfort, proprioceptive feedback, and as a reminder '
              'to limit neck movement. Does NOT provide meaningful immobilization.',
          keyPoints: [
            'Minimal restriction in ALL planes of motion',
            'Made of soft foam with a fabric cover',
            'Indicated for minor cervical strain, whiplash, post-collar weaning',
            'Provides warmth and proprioceptive input only',
            'Should NOT be used for cervical instability or fractures',
            'Often used for comfort after minor injuries or post-surgical weaning',
          ],
        ),

        // --- Philadelphia Collar ---
        ComparisonCardBlock(
          title: 'Philadelphia Collar',
          themeColor: Colors.blue,
          backgroundColor: const Color(0xFFE3F2FD),
          icon: Icons.shield,
          description:
              'A two-piece rigid plastic collar (anterior and posterior sections) connected '
              'with Velcro straps. Provides moderate restriction of cervical motion in all '
              'planes. One of the most commonly prescribed rigid cervical orthoses.',
          keyPoints: [
            'Two-piece rigid polyethylene foam with anterior/posterior components',
            'Restricts flexion ~71%, extension ~70%, lateral bending ~66%, rotation ~74%',
            'Anterior opening allows tracheostomy access',
            'Lightweight and relatively comfortable for a rigid collar',
            'Indicated for stable cervical fractures (C3-C7), post-surgical support',
            'Cannot adequately control upper cervical (C1-C2) injuries',
          ],
        ),

        // --- Miami J Collar ---
        ComparisonCardBlock(
          title: 'Miami J Collar',
          themeColor: Colors.teal,
          backgroundColor: const Color(0xFFE0F2F1),
          icon: Icons.tune,
          description:
              'A two-piece rigid cervical collar similar to the Philadelphia collar but '
              'with improved adjustability and ventilation. Offers slightly better motion '
              'restriction due to improved fit and design features.',
          keyPoints: [
            'Two-piece rigid plastic design with adjustable height',
            'Better ventilation than Philadelphia due to perforated padding',
            'Removable/washable padded liners reduce skin breakdown',
            'Motion restriction similar to or slightly better than Philadelphia',
            'Indicated for stable C-spine fractures, post-operative immobilization',
            'Anterior opening for tracheostomy access',
            'Sizing is adjustable, allowing better fit across body types',
          ],
        ),

        // --- Aspen Collar ---
        ComparisonCardBlock(
          title: 'Aspen Collar',
          themeColor: Colors.green,
          backgroundColor: const Color(0xFFE8F5E9),
          icon: Icons.settings,
          description:
              'A rigid two-piece cervical collar with a four-piece padded liner system '
              'that can be independently replaced. Provides moderate cervical motion '
              'restriction with superior adjustability and ventilation.',
          keyPoints: [
            'Four-piece padded liner allows independent pad replacement',
            'Excellent ventilation reduces skin maceration and breakdown',
            'Adjustable circumference and height for customizable fit',
            'Moderate restriction of flexion, extension, lateral bending, rotation',
            'Indicated for stable cervical injuries, post-surgical support',
            'Improved patient comfort and compliance over Philadelphia',
          ],
        ),

        HeaderBlock('Extended Cervical Orthoses'),

        // --- SOMI ---
        ComparisonCardBlock(
          title: 'SOMI (Sternal Occipital Mandibular Immobilizer)',
          themeColor: Colors.deepOrange,
          backgroundColor: const Color(0xFFFBE9E7),
          icon: Icons.vertical_align_top,
          description:
              'A cervicothoracic orthosis with a rigid sternal plate, occipital plate, '
              'and mandibular support connected by metal uprights. The SOMI is the best '
              'non-halo orthosis for controlling cervical FLEXION but provides the WORST '
              'extension control. This is a critical board distinction.',
          keyPoints: [
            'Sternal plate provides anterior chest support',
            'Occipital band supports the posterior skull',
            'Mandibular piece can be removed for eating',
            'BEST non-halo flexion control: 93% restriction',
            'WORST extension control of any rigid cervical orthosis: only 42%',
            'Can be applied in the supine position (advantage for trauma patients)',
            'Does not have a posterior thoracic component — explains poor extension control',
            'Indicated for mid-cervical flexion instability where halo is not needed',
          ],
        ),
        PearlBlock(
          'Board Pearl — SOMI',
          'SOMI is the #1 board-tested cervical orthosis. Remember: SOMI = "SOMI Stops '
          'forward Motion" (flexion). It has the BEST flexion control (93%) among non-halo '
          'devices but the WORST extension control (42%) because it lacks a posterior '
          'thoracic component. Boards love to test this discrepancy.',
        ),
        MnemonicBlock(
          'SOMI Stops forward Motion (flexIon)',
          'The SOMI brace is best at controlling flexion (forward motion) of the '
          'cervical spine. The "S" in SOMI can remind you of "Stops" and "Sternal" — '
          'the sternal plate resists forward flexion. It is weakest for extension '
          'because it lacks a posterior thoracic plate.',
        ),

        // --- Four-Poster Brace ---
        ComparisonCardBlock(
          title: 'Four-Poster Brace',
          themeColor: Colors.brown,
          backgroundColor: const Color(0xFFEFEBE9),
          icon: Icons.view_column,
          description:
              'A cervical orthosis consisting of four adjustable metal posts connecting '
              'anterior mandibular and posterior occipital plates to anterior and posterior '
              'thoracic plates. Provides moderate restriction in all planes.',
          keyPoints: [
            'Four adjustable metal uprights (posts) connect head to chest plates',
            'Mandibular plate anteriorly, occipital plate posteriorly',
            'Anterior and posterior chest plates for thoracic anchoring',
            'Restricts flexion ~79%, extension ~73%, lateral bending ~53%, rotation ~56%',
            'Less effective at lateral bending and rotation control',
            'Indicated for moderate cervical instability requiring multi-planar control',
            'Height-adjustable posts allow customization of chin-to-chest distance',
          ],
        ),

        // --- CTO / Yale / Minerva ---
        HeaderBlock('Cervicothoracic Orthoses (CTO)'),
        TextBlock(
          'Cervicothoracic orthoses extend from the cervical spine down to the thorax, '
          'providing greater immobilization than collars alone. They are indicated when '
          'mid-to-lower cervical instability requires more control than a collar can '
          'provide but a halo is not warranted.',
        ),
        ComparisonCardBlock(
          title: 'Yale Brace (CTO)',
          themeColor: Colors.indigo,
          backgroundColor: const Color(0xFFE8EAF6),
          icon: Icons.security,
          description:
              'A cervicothoracic orthosis that combines a rigid cervical collar with '
              'anterior and posterior thoracic extensions. Provides good flexion control '
              'and moderate control in other planes.',
          keyPoints: [
            'Rigid cervical collar with thoracic vest extension',
            'Restricts flexion ~87%, extension ~75%, lateral bending ~61%, rotation ~56%',
            'Better flexion control than four-poster but not as good as SOMI',
            'More comfortable than SOMI for ambulatory patients',
            'Indicated for mid-to-lower cervical injuries (C3-C7)',
            'Thoracic component improves overall motion restriction',
          ],
        ),
        ComparisonCardBlock(
          title: 'Minerva Body Jacket (CTO)',
          themeColor: Colors.purple,
          backgroundColor: const Color(0xFFF3E5F5),
          icon: Icons.shield_outlined,
          description:
              'A custom-molded cervicothoracic orthosis with a circumferential forehead '
              'band and a rigid body jacket extending to the pelvis. Provides excellent '
              'extension and rotation control — superior to most non-halo devices.',
          keyPoints: [
            'Circumferential forehead band provides superior head control',
            'Custom-molded rigid body jacket from skull to pelvis',
            'Restricts flexion ~79%, extension ~91%, lateral bending ~51%, rotation ~88%',
            'BEST non-halo extension control (91%) and rotation control (88%)',
            'Poor lateral bending control (51%) is a relative weakness',
            'Indicated for unstable cervical injuries when halo is not tolerated',
            'Bulky and uncomfortable — limits patient compliance',
          ],
        ),
        PearlBlock(
          'Board Pearl — Minerva vs SOMI',
          'Minerva and SOMI are complementary: SOMI is best for FLEXION (93%), while '
          'Minerva is best for EXTENSION (91%) and ROTATION (88%) among non-halo devices. '
          'If a board question asks about the best non-halo orthosis for extension control, '
          'the answer is Minerva — NOT SOMI.',
        ),

        // --- Halo Vest ---
        HeaderBlock('Halo Vest'),
        ComparisonCardBlock(
          title: 'Halo Vest — Gold Standard',
          themeColor: Colors.red,
          backgroundColor: const Color(0xFFFFEBEE),
          icon: Icons.stars,
          description:
              'The halo vest is the gold standard for cervical immobilization, providing '
              'the best overall motion restriction of any cervical orthosis. It consists '
              'of a metal ring (halo) fixed to the outer table of the skull with four pins, '
              'connected by rigid uprights to a thoracic vest.',
          keyPoints: [
            'Metal ring fixed to skull via 4 pins into the OUTER table of the skull',
            'Pin torque: 6-8 inch-pounds (adult), 2-4 inch-pounds (pediatric)',
            'Anterior pins: 1 cm above lateral 1/3 of orbital ridge (avoids supraorbital nerve)',
            'Posterior pins: diagonally opposite anterior pins, posterior to ears',
            'Connected to rigid thoracic vest by 4 vertical uprights',
            'Best overall motion restriction: flexion 96%, extension 96%, lateral bending 96%, rotation 99%',
            'Gold standard for upper cervical (C1-C2) injuries and odontoid fractures',
            'Also used for unstable mid-lower cervical fractures post-operatively',
            'Worn for 8-12 weeks typically',
          ],
        ),
        BulletCardBlock(
          title: 'Halo Vest Complications',
          themeColor: Colors.red,
          backgroundColor: const Color(0xFFFFCDD2),
          points: [
            'Pin loosening — most common complication overall',
            'Pin site infection — most common infection; requires pin site care',
            'Supraorbital nerve injury — from anterior pin malposition (causes forehead numbness)',
            'Supratrochlear nerve injury — with medial pin placement',
            'Ring migration — pins loosen and ring shifts position',
            'Skull penetration — risk in elderly with thin calvarium, osteoporosis',
            'Dural puncture and brain abscess — rare but devastating',
            'Pressure sores — under vest, especially over bony prominences',
            'Dysphagia — difficulty swallowing due to chin-in-chest positioning',
            'Restricted pulmonary function — vest limits chest wall expansion',
            'Loss of reduction — "snaking" phenomenon (fixes upper C-spine but can increase motion at lower levels)',
          ],
        ),
        PearlBlock(
          'Board Pearl — Halo Complications',
          'Pin loosening is the MOST COMMON halo complication. Pin site infection is the '
          'most common infectious complication. Anterior pins should be placed 1 cm above '
          'the lateral 1/3 of the orbital ridge to avoid the supraorbital nerve. '
          '"Snaking" refers to paradoxical increased motion at subaxial levels while the '
          'upper C-spine is immobilized.',
        ),

        // --- CRITICAL TABLE ---
        HeaderBlock('Cervical Orthosis Motion Restriction Table'),
        TextBlock(
          'This table is one of the HIGHEST-YIELD tables in PM&R board review. '
          'Expect at least 1-2 questions directly testing this information. '
          'Focus on the extremes: SOMI best flexion, Minerva best extension/rotation '
          '(non-halo), and Halo best overall.',
        ),
        TableBlock(
          title: 'Cervical Orthosis Motion Restriction Comparison',
          columns: [
            'Orthosis',
            'Flexion %',
            'Extension %',
            'Lat Bending %',
            'Rotation %',
          ],
          rows: [
            ['Soft Collar', 'Minimal', 'Minimal', 'Minimal', 'Minimal'],
            ['Philadelphia', '71%', '70%', '66%', '74%'],
            ['SOMI', '93% ★', '42% ✗', '66%', '66%'],
            ['Four-Poster', '79%', '73%', '53%', '56%'],
            ['Yale / CTO', '87%', '75%', '61%', '56%'],
            ['Minerva', '79%', '91% ★', '51%', '88% ★'],
            ['Halo Vest', '96%', '96%', '96%', '99%'],
          ],
          headerColor: const Color(0xFFB71C1C),
        ),
        PearlBlock(
          'Board Pearl — Table Quick Hits',
          'Key takeaways: (1) SOMI = best non-halo FLEXION (93%), worst EXTENSION (42%). '
          '(2) Minerva = best non-halo EXTENSION (91%) and ROTATION (88%). '
          '(3) Halo = gold standard in ALL planes (96-99%). '
          '(4) Soft collar = essentially useless for immobilization. '
          '(5) All collars are weakest for rotation and lateral bending control.',
        ),

        // --- Custom Widget ---
        CustomWidgetBlock(CustomWidgetType.cervicalOrthosisComparison),
      ],
    ),

    // ─────────────────────────────────────────────
    // TAB 2: Thoracolumbar Orthoses
    // ─────────────────────────────────────────────
    TopicTab(
      title: 'Thoracolumbar Orthoses',
      blocks: [
        HeaderBlock('Thoracolumbar Orthoses (TLSO)'),
        TextBlock(
          'Thoracolumbosacral orthoses (TLSOs) are critical devices for managing thoracic '
          'and lumbar fractures, post-surgical stabilization, and deformity correction. '
          'Understanding the biomechanical principles and limitations of each TLSO design '
          'is essential for board success.',
          isIntro: true,
        ),
        PearlBlock(
          'Board Pearl — TLSO Coverage',
          'A standard TLSO effectively controls the spine from T6 to L3-L4. It CANNOT '
          'adequately control injuries ABOVE T6 because it does not extend high enough '
          'on the thorax. Compression fractures above T6 require a cervicothoracic '
          'orthosis (CTO) or custom TLSO with cervical extension. This is a commonly '
          'tested board fact.',
        ),

        // --- Jewett Orthosis ---
        ComparisonCardBlock(
          title: 'Jewett Hyperextension Orthosis',
          themeColor: Colors.orange,
          backgroundColor: const Color(0xFFFFF3E0),
          icon: Icons.straighten,
          description:
              'A three-point pressure system hyperextension orthosis that limits thoracolumbar '
              'FLEXION. Uses anterior sternal and suprapubic pads with a posterior lumbar pad '
              'to maintain the spine in extension. Does NOT control lateral bending or rotation.',
          keyPoints: [
            'Three-point pressure system (3-point bending principle)',
            'Anterior force: sternal pad (proximal) + suprapubic pad (distal)',
            'Posterior counterforce: lumbar pad at the fracture level',
            'Controls FLEXION only in the T6-L1 region',
            'Does NOT control lateral bending or rotation',
            'Indicated for STABLE compression fractures (anterior wedge fractures) at T6-L1',
            'Contraindicated for burst fractures, unstable fractures, or fractures with posterior element disruption',
            'Lightweight, prefabricated design — easy to apply',
            'Allows the patient to perform extension exercises',
          ],
        ),

        // --- CASH ---
        ComparisonCardBlock(
          title: 'CASH (Cruciform Anterior Spinal Hyperextension)',
          themeColor: Colors.amber,
          backgroundColor: const Color(0xFFFFF8E1),
          icon: Icons.add,
          description:
              'Similar to the Jewett orthosis in function (flexion control via 3-point '
              'pressure), but uses a cruciform (cross-shaped) anterior metal frame instead '
              'of a single sternal pad. Provides the same motion restriction as the Jewett.',
          keyPoints: [
            'Three-point pressure system — same biomechanical principle as Jewett',
            'Cruciform (cross-shaped) anterior frame distributes forces',
            'Sternal pad at top of cross, suprapubic pad at bottom',
            'Posterior lumbar pad provides the counterforce',
            'Controls FLEXION only — does NOT control lateral bending or rotation',
            'Same indications as Jewett: stable compression fractures at T6-L1',
            'Some patients find the cruciform frame more comfortable than Jewett pad',
            'Also known as "anterior hyperextension TLSO"',
          ],
        ),
        PearlBlock(
          'Board Pearl — Jewett vs CASH',
          'Jewett and CASH are functionally equivalent — both are 3-point hyperextension '
          'orthoses that control FLEXION ONLY. Neither controls lateral bending or rotation. '
          'They are appropriate for STABLE anterior compression fractures at T6-L1. '
          'If a question mentions "burst fracture" or "unstable fracture," Jewett and CASH '
          'are WRONG answers — you need a custom TLSO.',
        ),

        // --- Custom TLSO ---
        ComparisonCardBlock(
          title: 'Custom-Molded TLSO (Body Jacket)',
          themeColor: Colors.blueGrey,
          backgroundColor: const Color(0xFFECEFF1),
          icon: Icons.person,
          description:
              'A custom-fabricated total-contact TLSO that provides the most comprehensive '
              'thoracolumbar control. It restricts motion in ALL planes: flexion, extension, '
              'lateral bending, and rotation. This is the orthosis of choice for unstable '
              'thoracolumbar fractures.',
          keyPoints: [
            'Custom-molded from a cast or scan of the patient\'s torso',
            'Total contact design for maximum surface area loading',
            'Controls ALL planes: flexion, extension, lateral bending, AND rotation',
            'Bivalved (anterior + posterior shells) or clamshell design',
            'Indicated for UNSTABLE thoracolumbar fractures (burst fractures, fracture-dislocations)',
            'Also used post-operatively after spinal fusion',
            'Most restrictive TLSO — best immobilization',
            'Trimlines extend from just below axillae to pelvis',
            'Can include a thigh cuff for additional control at the lumbosacral junction',
            'More expensive and time-consuming to fabricate than prefabricated options',
          ],
        ),

        // --- Comparison Table ---
        HeaderBlock('TLSO Comparison'),
        TableBlock(
          title: 'Thoracolumbar Orthosis Comparison',
          columns: [
            'Feature',
            'Jewett',
            'CASH',
            'Custom TLSO',
          ],
          rows: [
            ['Mechanism', '3-point pressure', '3-point pressure', 'Total contact'],
            ['Flexion Control', 'Yes', 'Yes', 'Yes'],
            ['Extension Control', 'No', 'No', 'Yes'],
            ['Lateral Bending', 'No', 'No', 'Yes'],
            ['Rotation Control', 'No', 'No', 'Yes'],
            ['Effective Range', 'T6-L1', 'T6-L1', 'T6-L3/L4'],
            ['Fracture Type', 'Stable compression', 'Stable compression', 'Unstable / burst'],
            ['Fabrication', 'Prefabricated', 'Prefabricated', 'Custom-molded'],
            ['Cost', 'Low', 'Low', 'High'],
          ],
          headerColor: Colors.orange,
        ),

        // --- 3-Point Pressure ---
        HeaderBlock('Three-Point Pressure Biomechanics'),
        TextBlock(
          'The three-point pressure system is a fundamental biomechanical principle used '
          'in many orthoses. Two forces are applied in one direction, with a single '
          'counterforce applied in the opposite direction between them. This creates a '
          'bending moment that controls motion in one plane.',
        ),
        BulletCardBlock(
          title: '3-Point Pressure in Hyperextension Orthoses',
          themeColor: Colors.deepOrange,
          backgroundColor: const Color(0xFFFBE9E7),
          points: [
            'Anterior force #1: Sternal pad pushes posteriorly',
            'Anterior force #2: Suprapubic pad pushes posteriorly',
            'Posterior counterforce: Lumbar pad pushes anteriorly at fracture level',
            'Net effect: maintains spine in EXTENSION, prevents FLEXION',
            'Counterforce must be centered at the fracture level for maximum effect',
            'Forces must be balanced to avoid skin breakdown at pressure points',
            'Same 3-point principle used in AFOs (e.g., floor-reaction AFO)',
          ],
        ),

        // --- Scoliosis Orthoses ---
        HeaderBlock('Scoliosis Orthoses'),
        ComparisonCardBlock(
          title: 'Milwaukee Brace (CTLSO)',
          themeColor: Colors.cyan,
          backgroundColor: const Color(0xFFE0F7FA),
          icon: Icons.swap_vert,
          description:
              'A cervicothoracolumbosacral orthosis (CTLSO) used for scoliosis management. '
              'Extends from the pelvis to the neck with a throat mold and occipital pad. '
              'Used for curves with an apex above T8.',
          keyPoints: [
            'Full-torso orthosis with neck ring (throat mold + occipital pads)',
            'Pelvic girdle base with metal uprights to neck ring',
            'Lateral pressure pads apply corrective forces to curve apex',
            'Indicated for curves with apex ABOVE T8',
            'Can be used for both thoracic and thoracolumbar curves',
            'Poor cosmesis and patient compliance due to visible neck ring',
            'Largely replaced by underarm TLSO (Boston brace) for lower curves',
            'Wear schedule: typically 23 hours/day until skeletal maturity',
          ],
        ),
        ComparisonCardBlock(
          title: 'Boston Brace (Underarm TLSO)',
          themeColor: Colors.lightBlue,
          backgroundColor: const Color(0xFFE1F5FE),
          icon: Icons.crop_square,
          description:
              'An underarm TLSO used for scoliosis curves with an apex at or BELOW T8. '
              'Custom-molded symmetric module with corrective pads and relief areas. '
              'More cosmetically acceptable than the Milwaukee brace.',
          keyPoints: [
            'Underarm design — trims below axillae, no neck ring',
            'Custom-molded from a symmetric prefabricated module',
            'Corrective pads placed at the apex of the curve',
            'Relief areas (cutouts) on the concave side allow curve correction',
            'Indicated for curves with apex AT or BELOW T8',
            'Better cosmesis and compliance than Milwaukee brace',
            'Effective for Risser 0-2 (skeletally immature patients)',
            'Not effective once skeletal maturity is reached (Risser 4-5)',
          ],
        ),
        PearlBlock(
          'Board Pearl — Scoliosis Orthoses',
          'Milwaukee brace = apex ABOVE T8 (has neck ring). Boston brace = apex AT or '
          'BELOW T8 (underarm, no neck ring). Bracing is effective only in skeletally '
          'immature patients (Risser 0-2) with curves 25-40 degrees. Curves >45 degrees '
          'generally require surgical consideration.',
        ),
      ],
    ),

    // ─────────────────────────────────────────────
    // TAB 3: Lumbosacral Orthoses (LSO)
    // ─────────────────────────────────────────────
    TopicTab(
      title: 'Lumbosacral Orthoses',
      blocks: [
        HeaderBlock('Lumbosacral Orthoses (LSO)'),
        TextBlock(
          'Lumbosacral orthoses manage conditions of the lumbar and sacral spine. They '
          'range from flexible corsets to rigid braces and can control motion in various '
          'planes depending on their design. The Williams flexion orthosis is a unique '
          'board-favorite device that limits extension rather than flexion.',
          isIntro: true,
        ),

        // --- Corset ---
        ComparisonCardBlock(
          title: 'Lumbosacral Corset',
          themeColor: Colors.grey,
          backgroundColor: const Color(0xFFF5F5F5),
          icon: Icons.wrap_text,
          description:
              'A flexible fabric support with optional posterior stays that provides '
              'abdominal compression, proprioceptive feedback, and minimal motion '
              'restriction. The corset is the least restrictive LSO.',
          keyPoints: [
            'Made of fabric (canvas or elastic) with optional rigid posterior stays',
            'Provides abdominal compression — increases intra-abdominal pressure',
            'Increased intra-abdominal pressure unloads the lumbar spine by ~25%',
            'Minimal restriction of flexion, extension, lateral bending, rotation',
            'Primarily provides proprioceptive reminder to limit motion',
            'Indicated for chronic low back pain, muscle strain, degenerative disc disease',
            'Easy to don/doff, comfortable, good compliance',
            'Should not be relied upon for fracture immobilization',
          ],
        ),

        // --- Knight LSO ---
        ComparisonCardBlock(
          title: 'Knight LSO (Chair-Back Brace)',
          themeColor: Colors.blue,
          backgroundColor: const Color(0xFFE3F2FD),
          icon: Icons.weekend,
          description:
              'A rigid LSO with a posterior metal frame and two lateral uprights connected '
              'to a pelvic band and thoracic band. Also called the "chair-back brace" due to '
              'its resemblance to a chair back. Controls flexion and lateral bending.',
          keyPoints: [
            'Two paraspinal posterior uprights with connecting horizontal bars',
            'Two lateral uprights for lateral bending control',
            'Pelvic band inferiorly, thoracic band superiorly',
            'Anterior abdominal apron (corset front) provides compression',
            'Controls FLEXION and LATERAL BENDING',
            'Does NOT effectively control extension or rotation',
            'Indicated for lumbar disc disease, spondylosis, post-surgical support',
            'The posterior "chair-back" frame limits forward flexion',
          ],
        ),

        // --- Knight-Taylor TLSO ---
        ComparisonCardBlock(
          title: 'Knight-Taylor TLSO',
          themeColor: Colors.indigo,
          backgroundColor: const Color(0xFFE8EAF6),
          icon: Icons.expand,
          description:
              'An extension of the Knight LSO that adds full-length paraspinal uprights '
              'extending to the thoracic level with axillary (shoulder) straps. The axillary '
              'straps improve flexion control. Effectively a Knight brace plus thoracic extension.',
          keyPoints: [
            'Knight LSO frame extended superiorly to the thoracic level',
            'Full-length paraspinal uprights from pelvis to scapulae',
            'Lateral uprights for lateral bending control',
            'Axillary straps provide additional flexion restriction',
            'Controls FLEXION, EXTENSION (partial), and LATERAL BENDING',
            'Limited rotation control',
            'Indicated for thoracolumbar injuries, post-operative stabilization',
            'Axillary straps can cause brachial plexus compression if too tight',
            'Covers T1 to sacrum when properly fitted',
          ],
        ),
        PearlBlock(
          'Board Pearl — Knight vs Knight-Taylor',
          'Knight LSO controls FLEXION + LATERAL BENDING. Adding "Taylor" extends it to '
          'the thoracic level with axillary straps, adding better flexion and some extension '
          'control. Think: Knight = Lumbar, Knight-Taylor = Thoracolumbar.',
        ),

        // --- Williams Flexion LSO ---
        HeaderBlock('Williams Flexion Orthosis'),
        ComparisonCardBlock(
          title: 'Williams Flexion LSO — Board Favorite',
          themeColor: Colors.deepPurple,
          backgroundColor: const Color(0xFFEDE7F6),
          icon: Icons.compare_arrows,
          description:
              'A unique LSO that LIMITS EXTENSION and ALLOWS FLEXION. This is the OPPOSITE '
              'of most spinal orthoses, which limit flexion. The Williams orthosis holds the '
              'lumbar spine in a flexed position, opening the neural foramina and spinal canal. '
              'This is a VERY high-yield board topic.',
          keyPoints: [
            'Three-point pressure system that LIMITS EXTENSION',
            'Allows and encourages lumbar FLEXION',
            'Rigid posterior uprights with lateral uprights',
            'Anterior elastic strap allows flexion while resisting extension',
            'Holds the lumbar spine in FLEXION — reduces lumbar lordosis',
            'Opens neural foramina and spinal canal in flexion',
            'Indicated for: spondylolisthesis, lumbar spinal stenosis, facet arthropathy',
            'Opposite biomechanical goal of Jewett/CASH (which limit flexion)',
            'One of the FEW spinal orthoses that limits extension',
          ],
        ),
        PearlBlock(
          'Board Pearl — Williams LSO',
          'The Williams orthosis is the ONLY commonly tested LSO that limits EXTENSION '
          'and allows flexion. When a board question describes a patient with spondylolisthesis, '
          'lumbar stenosis, or neurogenic claudication (worse with extension, better with '
          'flexion), the answer is Williams flexion orthosis. Remember: most orthoses limit '
          'flexion; Williams is the OPPOSITE.',
        ),
        BulletCardBlock(
          title: 'Williams LSO — Clinical Rationale',
          themeColor: Colors.deepPurple,
          backgroundColor: const Color(0xFFD1C4E9),
          points: [
            'Spondylolisthesis: flexion reduces anterior vertebral slippage',
            'Spinal stenosis: flexion opens the spinal canal, relieves neurogenic claudication',
            'Facet arthropathy: flexion unloads posterior elements (facet joints)',
            'Patients with these conditions get WORSE with extension (standing, walking downhill)',
            'Patients get BETTER with flexion (sitting, leaning forward, shopping cart sign)',
            'Williams brace maintains the position of relief (flexion)',
          ],
        ),

        // --- Sacroiliac Orthoses ---
        HeaderBlock('Sacroiliac Orthoses'),
        BulletCardBlock(
          title: 'SI Belt / Trochanteric Belt',
          themeColor: Colors.teal,
          backgroundColor: const Color(0xFFE0F2F1),
          points: [
            'Circumferential elastic belt worn around the pelvis at the SI joint level',
            'Provides compression and stabilization of the sacroiliac joints',
            'Trochanteric belt sits lower, at the level of the greater trochanters',
            'Provides proprioceptive feedback and mild compression',
            'Indicated for SI joint dysfunction, sacroiliitis, postpartum SI instability',
            'Minimal motion restriction — primarily provides support and compression',
            'Easy to wear under clothing, good compliance',
            'Can be used in conjunction with physical therapy for SI joint problems',
          ],
        ),

        // --- LSO Comparison Table ---
        HeaderBlock('LSO Comparison'),
        TableBlock(
          title: 'Lumbosacral Orthosis Motion Control Comparison',
          columns: ['Orthosis', 'Flexion', 'Extension', 'Lateral Bending', 'Rotation'],
          rows: [
            ['Corset', 'Minimal', 'Minimal', 'Minimal', 'Minimal'],
            ['Knight LSO', 'Yes', 'No', 'Yes', 'No'],
            ['Knight-Taylor TLSO', 'Yes', 'Partial', 'Yes', 'No'],
            ['Williams LSO', 'NO (allows)', 'YES (limits)', 'No', 'No'],
            ['Custom TLSO', 'Yes', 'Yes', 'Yes', 'Yes'],
          ],
          headerColor: Colors.indigo,
        ),
        PearlBlock(
          'Board Pearl — LSO Motion Control',
          'The most important distinction in LSO selection is WHICH PLANE of motion to '
          'control. Knight = flexion + lateral bending. Williams = extension ONLY (allows '
          'flexion). Custom TLSO = everything. When a question says "limits extension," '
          'think Williams. When it says "limits flexion," think Knight, Jewett, or CASH.',
        ),
      ],
    ),

    // ─────────────────────────────────────────────
    // TAB 4: Clinical Applications & Prescribing
    // ─────────────────────────────────────────────
    TopicTab(
      title: 'Clinical Applications',
      blocks: [
        HeaderBlock('Orthosis Selection by Fracture Level'),
        TextBlock(
          'Matching the correct orthosis to the level and stability of the spinal injury '
          'is a core board competency. The following table provides a systematic guide '
          'to orthosis selection based on fracture location and stability.',
          isIntro: true,
        ),
        TableBlock(
          title: 'Spinal Orthosis Prescribing by Fracture Level',
          columns: ['Fracture Level', 'Stability', 'Recommended Orthosis'],
          rows: [
            ['C1 (Atlas / Jefferson)', 'Unstable', 'Halo vest'],
            ['C2 (Axis / Odontoid)', 'Unstable', 'Halo vest'],
            ['C1-C2 (Atlantoaxial)', 'Unstable', 'Halo vest'],
            ['C3-C7', 'Stable', 'Philadelphia collar or Miami J collar'],
            ['C3-C7', 'Unstable', 'Halo vest or CTO (Minerva/Yale)'],
            ['T1-T5', 'Stable/Unstable', 'CTO or custom TLSO with cervical extension'],
            ['T6-T12', 'Stable compression', 'Jewett or CASH hyperextension orthosis'],
            ['T6-T12', 'Unstable (burst)', 'Custom-molded TLSO (body jacket)'],
            ['L1-L3', 'Stable/Unstable', 'TLSO or LSO depending on stability'],
            ['L4-S1', 'Stable/Unstable', 'LSO (Knight or custom)'],
          ],
          headerColor: const Color(0xFF1565C0),
        ),
        PearlBlock(
          'Board Pearl — Fracture-Orthosis Matching',
          'Always match orthosis level to fracture level. Key rules: (1) Upper C-spine '
          '(C1-C2) = Halo vest. (2) Stable mid/lower C-spine = rigid collar. (3) Unstable '
          'C-spine = Halo or CTO. (4) Above T6 = need CTO, TLSO is NOT enough. '
          '(5) Stable T6-L1 compression = Jewett/CASH. (6) Unstable thoracolumbar = custom TLSO.',
        ),

        // --- Post-Surgical Guidelines ---
        HeaderBlock('Post-Surgical Spinal Orthosis Guidelines'),
        BulletCardBlock(
          title: 'Post-Operative Orthosis Use',
          themeColor: Colors.green,
          backgroundColor: const Color(0xFFE8F5E9),
          points: [
            'Post-cervical fusion: rigid collar (Miami J, Aspen) or halo depending on construct stability',
            'Post-thoracolumbar fusion: custom TLSO for 8-12 weeks typical',
            'Post-lumbar laminectomy: LSO for 4-6 weeks if used (practice varies)',
            'Post-lumbar fusion: TLSO or LSO for 6-12 weeks',
            'Duration depends on fusion level, patient bone quality, and surgical construct',
            'Osteoporotic patients may require longer orthosis use',
            'Orthosis protects the surgical construct while bony fusion matures',
            'Gradual weaning as radiographic evidence of fusion develops',
          ],
        ),

        // --- Osteoporotic Fractures ---
        HeaderBlock('Osteoporotic Compression Fractures'),
        BulletCardBlock(
          title: 'Orthosis Management of Osteoporotic Fractures',
          themeColor: Colors.amber,
          backgroundColor: const Color(0xFFFFF8E1),
          points: [
            'Most common indication for thoracolumbar orthoses in elderly patients',
            'Typically stable anterior compression (wedge) fractures',
            'Jewett or CASH for stable fractures at T6-L1',
            'Custom TLSO if multiple levels or questionable stability',
            'Shorter wearing duration in elderly (6-8 weeks) to avoid deconditioning',
            'Prolonged immobilization increases osteoporosis — balance is key',
            'Concurrent treatment: calcium, vitamin D, bisphosphonates or other osteoporosis therapy',
            'Consider vertebral augmentation (kyphoplasty/vertebroplasty) for refractory pain',
            'Watch for skin breakdown under orthosis in thin, elderly patients',
          ],
        ),
        PearlBlock(
          'Board Pearl — Osteoporotic Fractures',
          'Osteoporotic compression fractures are typically STABLE anterior wedge fractures, '
          'making Jewett or CASH appropriate. However, be cautious in very thin elderly patients '
          'who may not tolerate the sternal and suprapubic pressure pads. In these cases, a '
          'custom TLSO with total contact may distribute forces more safely.',
        ),

        // --- Wearing Schedule and Skin Care ---
        HeaderBlock('Orthosis Wearing Schedule & Skin Care'),
        NumberedListBlock([
          MapEntry('1', 'Initial fitting: ensure proper fit without excessive pressure or gaps'),
          MapEntry('2', 'Break-in schedule: 1-2 hours on, 1 hour off initially; gradually increase'),
          MapEntry('3', 'Goal: full-time wear during upright activities (standing, sitting, ambulating)'),
          MapEntry('4', 'May remove for sleeping if medically appropriate (depends on stability)'),
          MapEntry('5', 'Skin checks: inspect under orthosis at least twice daily'),
          MapEntry('6', 'Look for: redness lasting >20 minutes after removal, blisters, abrasions, maceration'),
          MapEntry('7', 'Keep skin clean and dry; avoid lotions under orthosis (increases friction)'),
          MapEntry('8', 'Wear a thin cotton T-shirt under TLSO to wick moisture'),
          MapEntry('9', 'Halo pin site care: clean with saline or chlorhexidine, inspect for infection daily'),
          MapEntry('10', 'Weaning: gradual reduction over 1-2 weeks when radiographically stable'),
        ]),

        // --- Biomechanical Principles Summary ---
        HeaderBlock('Spinal Orthosis Biomechanical Principles'),
        BulletCardBlock(
          title: 'Mechanisms of Spinal Orthosis Action',
          themeColor: Colors.blueGrey,
          backgroundColor: const Color(0xFFECEFF1),
          points: [
            'Three-point pressure: two forces in one direction, counterforce in opposite direction (Jewett, CASH, Williams)',
            'Total contact: distributes forces over maximum surface area (custom TLSO)',
            'Skeletal fixation: pins into bone for direct immobilization (Halo)',
            'Increased intra-abdominal pressure: corsets compress abdomen, unloading spine by ~25%',
            'Proprioceptive feedback: all orthoses provide movement awareness (even soft collars)',
            'Motion restriction: mechanical block to undesired planes of motion',
            'Postural correction: maintains desired spinal alignment (hyperextension, flexion)',
          ],
        ),

        // --- Common Board Questions ---
        HeaderBlock('High-Yield Board Question Patterns'),
        BulletCardBlock(
          title: 'Commonly Tested Scenarios',
          themeColor: Colors.red,
          backgroundColor: const Color(0xFFFFEBEE),
          points: [
            '"Best orthosis for flexion control of the cervical spine (non-halo)?" → SOMI',
            '"Best orthosis for extension control of the cervical spine (non-halo)?" → Minerva',
            '"Gold standard for cervical immobilization?" → Halo vest',
            '"Orthosis for C2 odontoid fracture?" → Halo vest',
            '"Orthosis for stable T8 compression fracture?" → Jewett or CASH',
            '"Orthosis for unstable T12 burst fracture?" → Custom TLSO (body jacket)',
            '"Orthosis that limits extension and allows flexion?" → Williams LSO',
            '"Orthosis for spondylolisthesis?" → Williams flexion LSO',
            '"Orthosis for lumbar spinal stenosis?" → Williams flexion LSO',
            '"Most common halo complication?" → Pin loosening',
            '"TLSO does not control above what level?" → T6',
            '"Nerve at risk with anterior halo pin placement?" → Supraorbital nerve',
            '"Scoliosis brace for curve apex above T8?" → Milwaukee brace',
            '"Scoliosis brace for curve apex at or below T8?" → Boston brace',
          ],
        ),

        // --- Mnemonics Summary ---
        HeaderBlock('Key Mnemonics'),
        MnemonicBlock(
          'SOMI Stops forward Motion (flexIon)',
          'SOMI provides the best non-halo flexion control (93%). '
          'The sternal plate blocks forward motion of the trunk.',
        ),
        MnemonicBlock(
          'Jewett and CASH = "Just Controls Anterior flexion, Skips the rest"',
          'Jewett and CASH only control flexion (anterior motion). They do NOT '
          'control extension, lateral bending, or rotation. Only use for STABLE '
          'compression fractures.',
        ),
        MnemonicBlock(
          'Williams = "Wants Lordosis Less, Increases Flexion, Limits Extension"',
          'Williams is the opposite of most braces — it limits EXTENSION and allows '
          'FLEXION to open the spinal canal and neural foramina. For stenosis and '
          'spondylolisthesis.',
        ),
        MnemonicBlock(
          'Halo = "Has ALL Limitations (in every plane)"',
          'The Halo vest restricts motion in ALL planes (96-99%). It is the gold '
          'standard and is required for upper cervical (C1-C2) instability.',
        ),

        // --- Final Summary Pearl ---
        PearlBlock(
          'Board Pearl — The Five Rules of Spinal Orthoses',
          '(1) TLSO cannot control above T6. '
          '(2) Halo is gold standard for C1-C2 injuries. '
          '(3) SOMI = best non-halo FLEXION control; Minerva = best non-halo EXTENSION. '
          '(4) Jewett/CASH = flexion only, for STABLE fractures only. '
          '(5) Williams = the only commonly tested orthosis that limits EXTENSION (for stenosis/spondylolisthesis).',
        ),
      ],
    ),
  ],
);

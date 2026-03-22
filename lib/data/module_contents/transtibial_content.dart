import 'package:flutter/material.dart';
import '../models/topic_content_model.dart';

final transtibialContent = TopicData(
  id: 'transtibial',
  title: 'Transtibial Prosthetics',
  tabs: [
    // ─────────────────────────────────────────────
    // TAB 1: Socket Design
    // ─────────────────────────────────────────────
    TopicTab(
      title: 'Socket Design',
      blocks: [
        HeaderBlock('Transtibial Socket Design'),
        TextBlock(
          'The socket is the most critical component of any prosthesis. It is the '
          'interface between the residual limb and the prosthetic device. Proper '
          'socket design distributes forces through pressure-tolerant areas while '
          'relieving pressure-sensitive structures.',
          isIntro: true,
        ),
        ComparisonCardBlock(
          title: 'PTB (Patellar Tendon Bearing) Socket',
          themeColor: Colors.blue,
          backgroundColor: const Color(0xFFE3F2FD),
          icon: Icons.precision_manufacturing,
          description: 'The traditional transtibial socket design. Custom-molded with '
              'specific buildups (concavities) over pressure-sensitive areas and '
              'reliefs (convexities) over pressure-tolerant areas for selective '
              'weight distribution.',
          keyPoints: [
            'Primary weight-bearing on the patellar tendon (bar)',
            'Custom-molded from a plaster cast of the residual limb',
            'Rectified cast: plaster added over pressure-sensitive areas, removed over pressure-tolerant areas',
            'Anterior wall height: mid-patellar level',
            'Posterior wall height: varies with suspension type',
            'Aligned in ~5 degrees of flexion and slight lateral tilt',
          ],
        ),
        ComparisonCardBlock(
          title: 'TSB (Total Surface Bearing) Socket',
          themeColor: Colors.teal,
          backgroundColor: const Color(0xFFE0F2F1),
          icon: Icons.lens_blur,
          description: 'A modern socket design that distributes pressure more uniformly '
              'across the entire surface of the residual limb using a gel liner. '
              'No single area bears the majority of weight.',
          keyPoints: [
            'Even pressure distribution across total residual limb surface',
            'Uses a gel liner (silicone, urethane, or gel) as interface',
            'Less rectification needed than PTB',
            'Reduced pistoning with proper fit',
            'Better for limbs with scarring or sensitive areas',
            'Increasingly preferred over traditional PTB design',
          ],
        ),
        PearlBlock(
          'Board Pearl',
          'The trend in modern transtibial prosthetics is toward TSB sockets '
          'with gel liners, which provide more uniform pressure distribution. '
          'However, PTB socket principles remain heavily tested on boards because '
          'understanding pressure-tolerant vs pressure-sensitive areas is fundamental.',
        ),
        HeaderBlock('Socket Variants for Short Residual Limbs'),
        BulletCardBlock(
          title: 'PTB-SC (Supracondylar)',
          themeColor: Colors.indigo,
          backgroundColor: const Color(0xFFE8EAF6),
          points: [
            'Socket extends above the femoral condyles medially and laterally',
            'Provides additional medial-lateral stability',
            'Self-suspending through condylar grip',
            'Indicated for short residual limbs requiring additional stabilization',
            'Limits some knee flexion range of motion',
          ],
        ),
        BulletCardBlock(
          title: 'PTB-SC/SP (Supracondylar/Suprapatellar)',
          themeColor: Colors.deepPurple,
          backgroundColor: const Color(0xFFEDE7F6),
          points: [
            'Socket extends above the condyles AND above the patella',
            'Maximum medial-lateral and anterior-posterior stability',
            'Used for very short residual limbs',
            'Provides greatest suspension and stability',
            'Most restrictive of knee motion',
            'Also indicated for ligamentous instability of the knee',
          ],
        ),
        BulletCardBlock(
          title: 'Socket Alignment Principles',
          themeColor: Colors.orange,
          backgroundColor: const Color(0xFFFFF3E0),
          points: [
            'Initial flexion: ~5 degrees to enhance quadriceps function and patellar tendon loading',
            'Slight lateral tilt: accommodates normal tibial anatomy',
            'Bench alignment: initial alignment on the workbench before fitting',
            'Static alignment: alignment checked with patient standing still in prosthesis',
            'Dynamic alignment: final adjustment based on observational gait analysis',
            'Foot placed slightly lateral and externally rotated to mimic normal foot progression angle',
          ],
        ),
      ],
    ),

    // ─────────────────────────────────────────────
    // TAB 2: Pressure Areas
    // ─────────────────────────────────────────────
    TopicTab(
      title: 'Pressure Areas',
      blocks: [
        HeaderBlock('Pressure-Tolerant vs Pressure-Sensitive Areas'),
        TextBlock(
          'Understanding which structures can tolerate weight-bearing forces '
          'and which must be relieved is fundamental to socket design and a '
          'very high-yield board topic.',
          isIntro: true,
        ),
        BulletCardBlock(
          title: 'Pressure-TOLERANT Areas (Load Here)',
          themeColor: Colors.green,
          backgroundColor: const Color(0xFFE8F5E9),
          points: [
            'Patellar tendon: primary weight-bearing surface in PTB socket',
            'Medial tibial flare (medial tibial condyle): broad, flat bony surface',
            'Lateral shaft of fibula: muscular covering tolerates loading',
            'Pretibial muscles (anterior compartment): soft tissue bulk tolerates loading',
            'Popliteal fossa: soft tissue area tolerant of pressure',
            'Anteromedial tibial surface: moderate tolerance',
            'Gastrocnemius/soleus bulk: posterior soft tissue padding',
          ],
        ),
        BulletCardBlock(
          title: 'Pressure-SENSITIVE Areas (Relieve Here)',
          themeColor: Colors.red,
          backgroundColor: const Color(0xFFFFEBEE),
          points: [
            'Tibial crest (shin): subcutaneous bone, no soft tissue coverage',
            'Tibial tubercle: prominent bony landmark, very sensitive',
            'Distal tibial end (cut end): tender bone end',
            'Tibial condyles (anterior surfaces): subcutaneous bony prominences',
            'Fibular head: peroneal nerve at risk for compression',
            'Distal fibula: tender bone end',
            'Hamstring tendons: posteriorly, sensitive to compression',
            'Patella: must not impinge on the patella',
          ],
        ),
        PearlBlock(
          'Board Pearl - Fibular Head',
          'The fibular head is a critical pressure-SENSITIVE area because the '
          'common peroneal nerve wraps around it. Compression here causes foot '
          'drop (peroneal nerve palsy). Always ensure adequate relief over the '
          'fibular head in any TT socket design.',
        ),
        TableBlock(
          title: 'PTB Socket Rectification Summary',
          columns: ['Area', 'Tolerance', 'Socket Modification', 'Reason'],
          rows: [
            ['Patellar tendon', 'Tolerant', 'Buildup (bar/convexity)', 'Primary weight-bearing'],
            ['Medial tibial flare', 'Tolerant', 'Buildup', 'Broad flat surface for loading'],
            ['Pretibial muscles', 'Tolerant', 'Buildup', 'Soft tissue padding present'],
            ['Popliteal fossa', 'Tolerant', 'Buildup', 'Soft tissue tolerates load'],
            ['Tibial crest', 'Sensitive', 'Relief (concavity)', 'Subcutaneous bone'],
            ['Tibial tubercle', 'Sensitive', 'Relief', 'Prominent bony landmark'],
            ['Fibular head', 'Sensitive', 'Relief', 'Peroneal nerve at risk'],
            ['Distal tibia/fibula', 'Sensitive', 'Relief', 'Tender bone ends'],
            ['Hamstring tendons', 'Sensitive', 'Relief', 'Painful with compression'],
          ],
          headerColor: Colors.blueGrey,
        ),
        HeaderBlock('Liner Types'),
        TableBlock(
          title: 'Prosthetic Liner Comparison',
          columns: ['Liner Type', 'Material', 'Advantages', 'Disadvantages'],
          rows: [
            ['Pelite', 'Closed-cell polyethylene foam', 'Inexpensive; easy to modify; lightweight', 'Compresses over time; less durable; absorbs moisture'],
            ['Silicone gel', 'Medical-grade silicone', 'Cushioning; shear reduction; good suspension with pin', 'Heat retention; difficult to don for some patients; cost'],
            ['Urethane', 'Polyurethane gel', 'Softer than silicone; better cushioning for bony limbs', 'Less durable than silicone; can stretch over time'],
            ['Thermoplastic elastomer (TPE)', 'Mineral oil-based gel', 'Soft; conforming; good for sensitive limbs', 'Mineral oil can damage some sockets; less durable'],
          ],
          headerColor: Colors.purple,
        ),
        PearlBlock(
          'Board Pearl',
          'Gel liners (silicone, urethane) have largely replaced pelite liners in '
          'modern practice because they reduce shear forces on the skin, provide '
          'better cushioning, and enable suspension via pin-lock or suction. '
          'However, they retain more heat.',
        ),
      ],
    ),

    // ─────────────────────────────────────────────
    // TAB 3: Suspension
    // ─────────────────────────────────────────────
    TopicTab(
      title: 'Suspension',
      blocks: [
        HeaderBlock('Transtibial Suspension Systems'),
        TextBlock(
          'Suspension keeps the prosthesis attached to the residual limb during '
          'the swing phase of gait. Multiple suspension options exist, each with '
          'advantages and limitations based on the patient\'s anatomy, activity '
          'level, and functional goals.',
          isIntro: true,
        ),
        TableBlock(
          title: 'Suspension Systems Comparison',
          columns: ['System', 'Mechanism', 'Advantages', 'Disadvantages'],
          rows: [
            ['Supracondylar cuff', 'Strap above femoral condyles', 'Simple; inexpensive; easy to don/doff', 'Less secure; pistoning; cosmetically visible'],
            ['PTB-SC brim', 'Socket extends above condyles', 'Adds ML stability; self-suspending', 'Restricts knee flexion; bulkier'],
            ['PTB-SC/SP brim', 'Socket extends above condyles and patella', 'Maximum stability/suspension', 'Most restrictive of knee ROM; bulky'],
            ['Rubber/neoprene sleeve', 'Elastic sleeve over socket and thigh', 'Good suspension; simple; covers joint', 'Heat; rolls; tears; difficult for obese patients'],
            ['Pin/shuttle lock', 'Pin on distal liner locks into socket base', 'Secure; easy don/doff; reliable', 'Distal traction (milking); pistoning if liner loose; maintenance'],
            ['Suction', 'Air-tight seal between liner and socket', 'Very secure; minimal pistoning; proprioception', 'Difficult donning; volume changes problematic; requires good hand dexterity'],
            ['Elevated vacuum (VASS)', 'Active vacuum pump maintains negative pressure', 'Best volume management; least pistoning; best proprioception', 'Expensive; mechanical parts can fail; heavier; requires maintenance'],
            ['Thigh corset', 'Leather cuff with side joints attached to socket', 'Reduces weight-bearing on limb; ML stability', 'Heavy; bulky; less cosmetic; delays knee joint axis; outdated'],
          ],
          headerColor: Colors.deepOrange,
        ),
        PearlBlock(
          'Board Pearl',
          'Elevated vacuum (VASS) provides the best volume management and '
          'proprioception of all suspension systems. It actively maintains '
          'negative pressure between the liner and socket, reducing pistoning '
          'to near zero and helping maintain limb volume throughout the day.',
        ),
        BulletCardBlock(
          title: 'Pin Suspension Details',
          themeColor: Colors.blue,
          backgroundColor: const Color(0xFFE3F2FD),
          points: [
            'A metal pin extends from the distal end of the gel liner',
            'Pin engages a shuttle lock mechanism at the bottom of the socket',
            'Release button on the side or posterior of socket for doffing',
            'Commonly used with silicone or urethane gel liners',
            'Disadvantage: can cause distal traction (milking effect) on residual limb',
            'Milking effect can lead to distal edema, skin breakdown, and verrucous hyperplasia',
          ],
        ),
        BulletCardBlock(
          title: 'Suction Suspension Details',
          themeColor: Colors.teal,
          backgroundColor: const Color(0xFFE0F2F1),
          points: [
            'One-way expulsion valve at the distal socket',
            'Air is expelled as the limb is donned; valve prevents air re-entry',
            'Creates negative pressure seal between liner and socket wall',
            'Requires consistent limb volume for effective seal',
            'Provides enhanced proprioception through intimate socket fit',
            'Volume fluctuations (edema, weight changes) can break the seal',
          ],
        ),
        BulletCardBlock(
          title: 'Suspension Selection by Situation',
          themeColor: Colors.purple,
          backgroundColor: const Color(0xFFF3E5F5),
          points: [
            'Short residual limb: PTB-SC or PTB-SC/SP for added stability',
            'Active patient (K3-K4): suction or elevated vacuum',
            'Elderly or limited dexterity: pin lock (easiest donning)',
            'Volume fluctuation (vascular patients): VASS or adjustable systems',
            'Very short or bony limb: thigh corset (reduces direct weight-bearing)',
            'Ligamentous knee instability: PTB-SC/SP or thigh corset with side joints',
          ],
        ),
      ],
    ),

    // ─────────────────────────────────────────────
    // TAB 4: Alignment & Gait
    // ─────────────────────────────────────────────
    TopicTab(
      title: 'Alignment & Gait',
      blocks: [
        HeaderBlock('Alignment and Prosthetic Feet'),
        TextBlock(
          'Proper alignment and foot selection are critical for efficient and '
          'comfortable ambulation. Alignment progresses from bench to static '
          'to dynamic. Foot selection depends on the patient\'s functional level '
          '(K-level) and activity demands.',
          isIntro: true,
        ),
        BulletCardBlock(
          title: 'Alignment Stages',
          themeColor: Colors.indigo,
          backgroundColor: const Color(0xFFE8EAF6),
          points: [
            'Bench alignment: initial setup on the workbench using anatomic landmarks and measurements',
            'Static alignment: patient stands in prosthesis; check height, alignment, plumb line',
            'Dynamic alignment: patient walks; observe gait, make adjustments based on gait deviations',
            'Socket in ~5 degrees flexion to enhance quadriceps loading and reduce recurvatum',
            'Foot positioned in ~5-7 degrees external rotation (normal foot progression angle)',
            'Foot placed slightly lateral to maintain normal base of support',
          ],
        ),
        HeaderBlock('Prosthetic Feet for Transtibial Amputees'),
        TableBlock(
          title: 'Prosthetic Foot Options',
          columns: ['Foot Type', 'Description', 'K-Level', 'Key Features'],
          rows: [
            ['SACH (Solid Ankle Cushion Heel)', 'Rigid keel with compressible heel wedge; no articulating parts', 'K1', 'Simple; durable; low maintenance; no ankle motion; good for low activity'],
            ['Single-axis', 'Hinge at ankle allows plantarflexion/dorsiflexion; bumpers control ROM', 'K1-K2', 'Quick foot flat (stable for BKA); heavier; more knee stability at IC'],
            ['Multiaxis', 'Allows PF/DF plus inversion/eversion and rotation', 'K2', 'Good for uneven terrain; heavier; more moving parts'],
            ['Flexible keel / SAFE', 'Flexible forefoot section; split keel allows some torsion', 'K2', 'Better push-off than SACH; lighter than multiaxis; smooth rollover'],
            ['Energy-storing (dynamic response)', 'Carbon fiber or composite spring keel stores and returns energy', 'K3-K4', 'Most efficient; best for active patients; improved push-off; running capable'],
          ],
          headerColor: Colors.teal,
        ),
        PearlBlock(
          'Board Pearl',
          'SACH foot provides the simplest, most durable option for low-activity '
          '(K1) patients. Single-axis foot allows quick foot flat, which provides '
          'more knee stability at initial contact -- useful for patients with weak '
          'quads or knee instability. Energy-storing feet return up to 90% of '
          'stored energy and are indicated for K3-K4.',
        ),
        HeaderBlock('Transtibial Residual Limb Considerations'),
        BulletCardBlock(
          title: 'Ideal Residual Limb Characteristics',
          themeColor: Colors.green,
          backgroundColor: const Color(0xFFE8F5E9),
          points: [
            'Cylindrical or slightly conical shape',
            'Nontender, well-healed surgical scar (ideally posterior)',
            'Residual limb length: proximal 50% of tibial length is ideal',
            'Fibula cut 2-3 cm shorter than tibia to avoid distal fibular pressure',
            'Myodesis (muscle sutured to bone) preferred over myoplasty (muscle sutured to muscle)',
            'Full knee range of motion (avoid flexion contracture)',
            'Adequate soft tissue coverage over bone ends',
            'Longer residual limb = better lever arm = more efficient gait',
          ],
        ),
        PearlBlock(
          'Board Pearl',
          'Ideal BKA: transect tibia in the PROXIMAL 50% (middle third is most '
          'common). Fibula is cut 2-3 cm SHORTER than tibia. The anterior tibial '
          'crest is beveled to reduce skin pressure. Myodesis provides better '
          'muscle stabilization and proprioception than myoplasty.',
        ),
        BulletCardBlock(
          title: 'Common TT Gait Deviations - Quick Reference',
          themeColor: Colors.red,
          backgroundColor: const Color(0xFFFFEBEE),
          points: [
            'Foot slap: heel cushion too hard OR weak dorsiflexors',
            'Excessive knee flexion: socket too flexed, too much dorsiflexion, or hip flexion contracture',
            'Genu recurvatum: socket too extended, too much plantarflexion, or weak quads',
            'Lateral thrust: foot inset too far or valgus alignment',
            'Medial thrust: foot outset too far or varus alignment',
            'Short prosthetic step: socket uncomfortable, poor suspension, or hip flexion contracture',
            'Circumduction: prosthesis too long or inadequate knee/hip flexion',
            'Vaulting: prosthesis too long or poor suspension',
            'Pistoning: inadequate suspension (observe during swing phase)',
          ],
        ),
        TableBlock(
          title: 'Prosthetic Componentry by K-Level',
          columns: ['Component', 'K1', 'K2', 'K3', 'K4'],
          rows: [
            ['Foot', 'SACH', 'Flex foot / Multiaxis', 'Energy-storing', 'High-activity / Sport'],
            ['Suspension', 'Pin lock / Cuff', 'Pin / Sleeve', 'Suction / VASS', 'Suction / VASS'],
            ['Socket', 'PTB', 'PTB or TSB', 'TSB', 'TSB / Custom sport'],
            ['Liner', 'Pelite / Basic gel', 'Gel', 'Gel (silicone)', 'Custom gel'],
          ],
          headerColor: Colors.indigo,
        ),
        PearlBlock(
          'Board Pearl',
          'Component selection must match the patient\'s documented K-level. '
          'Over-prescribing (e.g., energy-storing foot for K1) is not medically '
          'justified and will not be covered. Under-prescribing limits the '
          'patient\'s functional potential. The physician must clearly document '
          'the patient\'s functional level.',
        ),
      ],
    ),
  ],
);

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
          backgroundColor: const Color(0xFF1A2332),
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
          backgroundColor: const Color(0xFF152A27),
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
        TableBlock(
          title: 'PTB vs TSB: Comparative Evidence',
          columns: ['Parameter', 'PTB Socket', 'TSB Socket'],
          rows: [
            ['Pressure distribution', 'Concentrated on tolerant areas', 'More uniform across entire surface'],
            ['Rectification', 'Extensive cast modification required', 'Minimal rectification needed'],
            ['Liner', 'Pelite foam or thin sock', 'Gel liner required (silicone, urethane, TPE)'],
            ['Stair/incline function', 'Slower ascent/descent times', 'Significantly shorter times'],
            ['Best candidates', 'Traditional approach; irregular limb shapes', 'Active patients; traumatic amputees; younger users'],
            ['Cost', 'No significant difference in RCT', 'No significant difference in RCT'],
          ],
          headerColor: Colors.blueGrey,
        ),
        PearlBlock(
          'Board Pearl — PTB-SC/SP Indications',
          'The PTB-SC/SP socket is indicated when both ML and AP stability are required '
          '— for example, a very short residual limb combined with collateral ligament '
          'insufficiency. The high anterior wall above the patella prevents genu '
          'recurvatum and provides an anterior containment force.',
        ),
        HeaderBlock('Socket Variants for Short Residual Limbs'),
        BulletCardBlock(
          title: 'PTB-SC (Supracondylar)',
          themeColor: Colors.indigo,
          backgroundColor: const Color(0xFF1A1D2E),
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
          backgroundColor: const Color(0xFF1F1A2E),
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
          backgroundColor: const Color(0xFF2A2215),
          points: [
            'Initial flexion: ~5 degrees to enhance quadriceps function and patellar tendon loading',
            'Slight lateral tilt: accommodates normal tibial anatomy',
            'Bench alignment: initial alignment on the workbench before fitting',
            'Static alignment: alignment checked with patient standing still in prosthesis',
            'Dynamic alignment: final adjustment based on observational gait analysis',
            'Foot placed slightly lateral and externally rotated to mimic normal foot progression angle',
          ],
        ),
        CheckpointBlock(
          question: 'Which area is the PRIMARY weight-bearing surface in a PTB (patellar tendon bearing) socket?',
          options: ['Tibial crest', 'Patellar tendon', 'Fibular head', 'Popliteal fossa'],
          correctIndex: 1,
          explanation: 'The patellar tendon is the primary weight-bearing surface in a PTB socket. A patellar bar is built into the socket to apply pressure to this area. The tibial crest and fibular head are pressure-SENSITIVE areas that must be relieved.',
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
          backgroundColor: const Color(0xFF152A1A),
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
          backgroundColor: const Color(0xFF2A1519),
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
        MnemonicBlock(
          'Rectification Principle',
          'On the positive plaster model: "ADD where you want to RELIEVE, '
          'REMOVE where you want to LOAD." Adding plaster to the model creates a '
          'gap (relief) in the socket; removing plaster from the model creates a '
          'bump (buildup) in the socket.',
        ),
        AnnotatedImageBlock(
          title: 'PTB Socket Pressure Areas',
          diagramType: 'socket-ptb',
          hotspots: [
            HotspotData(id: 'pt', xPercent: 0.5, yPercent: 0.25, label: 'Patellar Tendon', description: 'Primary weight-bearing area in PTB socket. The patellar bar applies pressure here.', clinicalSignificance: 'Most tested pressure-tolerant area on boards.', pinColor: Color(0xFF16A34A)),
            HotspotData(id: 'mtf', xPercent: 0.35, yPercent: 0.35, label: 'Medial Tibial Flare', description: 'Broad, flat bony surface tolerates pressure well.', pinColor: Color(0xFF16A34A)),
            HotspotData(id: 'lf', xPercent: 0.65, yPercent: 0.45, label: 'Lateral Fibular Shaft', description: 'Muscular area along the lateral fibular shaft can bear load.', pinColor: Color(0xFF16A34A)),
            HotspotData(id: 'pop', xPercent: 0.5, yPercent: 0.55, label: 'Popliteal Fossa', description: 'Soft tissue area posterior to knee. Tolerates moderate pressure for counter-force.', pinColor: Color(0xFF16A34A)),
            HotspotData(id: 'fh', xPercent: 0.7, yPercent: 0.3, label: 'Fibular Head', description: 'Prominent bony landmark. Common peroneal nerve runs directly over it.', clinicalSignificance: 'MUST be relieved — pressure here causes peroneal nerve palsy (foot drop).', pinColor: Color(0xFFDC2626)),
            HotspotData(id: 'tc', xPercent: 0.5, yPercent: 0.2, label: 'Tibial Crest', description: 'Sharp anterior border of tibia with minimal soft tissue coverage.', clinicalSignificance: 'Subcutaneous bone — direct pressure causes pain and skin breakdown.', pinColor: Color(0xFFDC2626)),
            HotspotData(id: 'dt', xPercent: 0.5, yPercent: 0.75, label: 'Distal Tibia', description: 'Cut end of the tibia. Sensitive to end-bearing pressure in most TT amputees.', pinColor: Color(0xFFDC2626)),
            HotspotData(id: 'tcond', xPercent: 0.4, yPercent: 0.18, label: 'Tibial Condyles', description: 'Medial and lateral tibial condyles. Bony prominences that need relief.', pinColor: Color(0xFFDC2626)),
          ],
          aspectRatio: 1.2,
        ),
        TableBlock(
          title: 'Liner Material Properties Comparison',
          columns: ['Property', 'Pelite', 'Silicone Elastomer', 'Silicone Gel', 'Urethane', 'TPE'],
          rows: [
            ['Stiffness', 'Low (compresses)', 'Highest', 'Softest', 'High (best impact)', 'Soft'],
            ['Durability', 'Poor', 'Best', 'Good', 'Good', 'Fair'],
            ['Skin adherence', 'Low', 'Moderate', 'Moderate', 'Highest', 'Low-Moderate'],
            ['Cushioning', 'Moderate initially', 'Moderate', 'Best', 'Good (impact)', 'Good'],
            ['Cost', 'Lowest', 'Moderate-High', 'Moderate-High', 'Moderate-High', 'Low-Moderate'],
            ['Best for', 'Low-demand; budget', 'Excessive soft tissue', 'Bony prominences', 'Fragile skin', 'Sensitive limbs'],
            ['Pin/suction compatible', 'No', 'Yes', 'Yes', 'Yes', 'Yes'],
          ],
          headerColor: Colors.purple,
        ),
        PearlBlock(
          'Board Pearl — Urethane Liners',
          'Urethane liners have the highest coefficient of friction (best skin '
          'adherence), lowest residual displacement (returns to shape most completely), '
          'and best impact/shock absorption. They are the preferred liner for fragile '
          'or compromised skin where reducing shear is critical.',
        ),
        CustomWidgetBlock(CustomWidgetType.socketPressureDemo),
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
        TableBlock(
          title: 'Suspension Systems Quick Comparison',
          columns: ['System', 'Pistoning', 'Ease of Donning', 'Volume Tolerance', 'ML Stability'],
          rows: [
            ['Supracondylar cuff', 'Moderate', 'Easy', 'Good', 'None'],
            ['PTB-SC brim', 'Low-Moderate', 'Moderate', 'Moderate', 'Good'],
            ['PTB-SC/SP brim', 'Low', 'Difficult', 'Poor', 'Excellent'],
            ['Rubber/neoprene sleeve', 'Low-Moderate', 'Moderate', 'Moderate', 'Minimal'],
            ['Pin/shuttle lock', 'Low-Moderate', 'Easy', 'Moderate', 'None'],
            ['Passive suction', 'Low', 'Difficult', 'Poor', 'None'],
            ['Elevated vacuum (VASS)', 'Near zero', 'Moderate', 'Best', 'None'],
            ['Thigh corset', 'Low', 'Moderate', 'Good', 'Excellent'],
          ],
          headerColor: Colors.deepOrange,
        ),
        PearlBlock(
          'Board Pearl — Milking Effect',
          'The "milking effect" from pin suspension occurs because the pin pulls '
          'distally on the liner and underlying tissue during swing phase. This can '
          'lead to chronic distal edema, verrucous hyperplasia (warty skin overgrowth), '
          'and tissue breakdown. If a patient using pin suspension develops distal skin '
          'changes, consider switching to suction or elevated vacuum.',
        ),
        TableBlock(
          title: 'Suspension Selection by Patient Profile',
          columns: ['Patient Scenario', 'Recommended Suspension', 'Rationale'],
          rows: [
            ['Active, stable volume (K3-K4)', 'Suction or elevated vacuum', 'Best proprioception, minimal pistoning'],
            ['Elderly, limited dexterity (K1-K2)', 'Pin/shuttle lock', 'Easiest donning; secure; audible verification'],
            ['Short residual limb', 'PTB-SC or PTB-SC/SP', 'Added stability; self-suspending'],
            ['Volume fluctuation (vascular)', 'Elevated vacuum or adjustable socket', 'Best volume management'],
            ['Ligamentous knee instability', 'PTB-SC/SP or thigh corset', 'Maximum AP and ML control'],
            ['Painful or ulcerated limb', 'Thigh corset', 'Offloads the residual limb'],
            ['Budget-conscious, basic needs', 'Supracondylar cuff', 'Simplest and least expensive'],
          ],
          headerColor: Colors.purple,
        ),
        BulletCardBlock(
          title: 'Pin Suspension Details',
          themeColor: Colors.blue,
          backgroundColor: const Color(0xFF1A2332),
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
          backgroundColor: const Color(0xFF152A27),
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
          backgroundColor: const Color(0xFF2A1A2E),
          points: [
            'Short residual limb: PTB-SC or PTB-SC/SP for added stability',
            'Active patient (K3-K4): suction or elevated vacuum',
            'Elderly or limited dexterity: pin lock (easiest donning)',
            'Volume fluctuation (vascular patients): VASS or adjustable systems',
            'Very short or bony limb: thigh corset (reduces direct weight-bearing)',
            'Ligamentous knee instability: PTB-SC/SP or thigh corset with side joints',
          ],
        ),
        CheckpointBlock(
          question: 'Which TT suspension system is MOST appropriate for a geriatric K1 amputee with limited hand dexterity?',
          options: ['Elevated vacuum', 'Pin/shuttle lock', 'Supracondylar cuff', 'Suction with expulsion valve'],
          correctIndex: 2,
          explanation: 'Supracondylar cuff suspension is easiest to don/doff and requires minimal hand dexterity, making it ideal for geriatric patients. Pin lock requires aligning the pin with the shuttle. Elevated vacuum and suction require more upper body strength and dexterity.',
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
          backgroundColor: const Color(0xFF1A1D2E),
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
        TableBlock(
          title: 'Prosthetic Foot Selection Summary',
          columns: ['Foot Type', 'K-Level', 'Energy Return', 'Terrain Adaptation', 'Weight', 'Cost'],
          rows: [
            ['SACH', 'K1', 'None', 'None', 'Lightest', 'Lowest'],
            ['Single-axis', 'K1-K2', 'None', 'None', 'Moderate', 'Low'],
            ['Multi-axis', 'K2', 'Minimal', 'Good', 'Heavy', 'Moderate'],
            ['Flexible keel/SAFE', 'K2', 'Moderate', 'Minimal-Moderate', 'Light-Moderate', 'Moderate'],
            ['ESAR/Dynamic response', 'K3-K4', 'High', 'Variable by model', 'Light', 'High'],
            ['Powered ankle', 'K3-K4', 'Active power generation', 'Good', 'Heaviest', 'Highest'],
            ['Microprocessor ankle', 'K3-K4', 'Minimal', 'Good (adaptive)', 'Heavy', 'High'],
          ],
          headerColor: Colors.teal,
        ),
        PearlBlock(
          'Board Pearl — Single-Axis Foot for Knee Stability',
          'The single-axis foot\'s rapid foot-flat creates a GRF vector that passes '
          'anterior to the knee axis at initial contact, producing a stabilizing '
          'extension moment. This is why it is preferred for patients with weak '
          'quadriceps or knee extension instability — a commonly tested concept.',
        ),
        PearlBlock(
          'Board Pearl — ESAR Upgrade Significance',
          'The most significant functional improvement occurs when upgrading from a '
          'SACH foot to an ESAR foot. Differences between various ESAR foot models '
          'are less clinically significant than the jump from non-energy-storing to '
          'energy-storing technology. ESAR feet retain 94% of initial flexibility '
          'after 7 years and require 76% fewer component replacements.',
        ),
        HeaderBlock('Transtibial Residual Limb Considerations'),
        BulletCardBlock(
          title: 'Ideal Residual Limb Characteristics',
          themeColor: Colors.green,
          backgroundColor: const Color(0xFF152A1A),
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
          backgroundColor: const Color(0xFF2A1519),
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
        HeaderBlock('TT Gait Deviations Master Table'),
        TableBlock(
          title: 'TT Gait Deviations Summary',
          columns: ['Deviation', 'Prosthetic Cause', 'Patient Cause', 'Key Correction'],
          rows: [
            ['Foot slap', 'Heel cushion too hard', 'Weak dorsiflexors', 'Soften heel'],
            ['Excessive knee flexion', 'Socket too flexed', 'Hip flexion contracture', 'Reduce socket flexion'],
            ['Genu recurvatum', 'Socket too extended', 'Weak quads', 'Increase socket flexion'],
            ['Lateral thrust', 'Foot inset too far', 'Genu valgum / lateral laxity', 'Outset foot'],
            ['Medial thrust', 'Foot outset too far', 'Genu varum / medial laxity', 'Inset foot'],
            ['Short prosthetic step', 'Uncomfortable socket', 'Hip flexion contracture / fear', 'Improve fit; stretch'],
            ['Circumduction', 'Prosthesis too long', 'Abduction contracture', 'Shorten prosthesis'],
            ['Vaulting', 'Too long / poor suspension', 'Habit', 'Shorten; improve suspension'],
            ['Pistoning', 'Inadequate suspension', 'Volume loss', 'Improve suspension'],
          ],
          headerColor: Colors.deepOrange,
        ),
        PearlBlock(
          'Board Pearl — Socket Flexion and Knee Flexion',
          'Excessive knee flexion and genu recurvatum are opposites on the same '
          'continuum. If the socket has too much flexion, the knee flexes excessively; '
          'if the socket has too little flexion, the knee hyperextends. Mnemonic: '
          '"too much socket flexion causes too much knee flexion."',
        ),
        PearlBlock(
          'Board Pearl — Knee Flexion Contracture',
          'A knee flexion contracture is the most common and most preventable '
          'complication following transtibial amputation. Post-operative positioning '
          'should avoid prolonged knee flexion (no pillow under the knee, encourage '
          'prone lying). A contracture greater than 15 degrees is very difficult to '
          'accommodate prosthetically.',
        ),
        HeaderBlock('Energy Expenditure'),
        TableBlock(
          title: 'Metabolic Cost by Amputation Level',
          columns: ['Level', 'Traumatic', 'Vascular'],
          rows: [
            ['Transtibial (unilateral)', '~10-25% above normal', '~40% above normal'],
            ['Transfemoral (unilateral)', '~60-70% above normal', '~100% above normal'],
            ['Bilateral transtibial', '~40% above normal', '~60-80% above normal'],
          ],
          headerColor: Colors.indigo,
        ),
        PearlBlock(
          'Board Pearl — Socket is Most Important',
          'The socket is the most important component of any prosthesis. An '
          'energy-storing carbon fiber foot mounted on a poorly fitting socket will '
          'produce a worse functional outcome than a basic SACH foot on a well-fitting '
          'socket. Socket comfort and fit determine whether a patient wears the '
          'prosthesis or abandons it.',
        ),
        VideoBlock(
          url: 'https://www.youtube.com/watch?v=S07Kig8h_a8',
          title: 'BKA Prosthetic Gait Training',
          description: 'Watch the progression from parallel bars to independent ambulation. Note weight shifting, knee stability, and equal step length. Training begins with static standing balance.',
        ),
        CaseScenarioBlock(
          title: 'New TT Prosthetic Prescription',
          vignette: 'A 62-year-old male with diabetes presents 8 weeks post-left BKA (vascular etiology). His residual limb is well-healed, cylindrical, 15 cm in length. He ambulates with a walker at home and wants to walk to his mailbox (50 meters). He has mild diabetic neuropathy in his remaining foot.',
          decisionPoints: [
            CaseDecisionPoint(
              prompt: 'Based on his functional goals and current status, what K-level would you assign?',
              options: ['K0 — Non-ambulatory', 'K1 — Limited household ambulator', 'K2 — Limited community ambulator', 'K3 — Community ambulator'],
              optimalIndex: 2,
              explanation: 'K-level is based on functional POTENTIAL, not just current ability. His goal of walking to the mailbox (50m) represents limited community ambulation. K2 is appropriate — he has the potential for low-level outdoor ambulation with a prosthesis.',
            ),
            CaseDecisionPoint(
              prompt: 'What prosthetic foot would you prescribe for this K2 patient?',
              options: ['SACH foot', 'Single-axis foot', 'Energy-storing (ESAR) foot', 'Microprocessor ankle'],
              optimalIndex: 1,
              explanation: 'A single-axis foot is ideal for K2 patients because it enhances knee stability at loading response by allowing rapid plantarflexion to foot flat. This is particularly important for this patient who may have balance concerns. SACH is more appropriate for K1; ESAR for K3+.',
            ),
            CaseDecisionPoint(
              prompt: 'Given his diabetic neuropathy in the contralateral foot, what additional intervention is critical?',
              options: ['Prescribe a running blade for exercise', 'Order custom diabetic footwear for the sound limb', 'Recommend bilateral amputation', 'No additional intervention needed'],
              optimalIndex: 1,
              explanation: 'Protecting the remaining foot is critical — 55% of dysvascular amputees lose the contralateral limb within 5 years. Custom diabetic footwear with total-contact insoles reduces plantar pressure and ulceration risk. Medicare covers therapeutic shoes for diabetic patients.',
            ),
          ],
          summaryPearl: 'K-level assignment is based on functional POTENTIAL. Single-axis feet provide knee stability for K2 patients. Always protect the contralateral limb — 55% of vascular amputees lose the other leg within 5 years.',
        ),
      ],
    ),
  ],
);

import 'package:flutter/material.dart';
import '../models/topic_content_model.dart';

final transfemoralContent = TopicData(
  id: 'transfemoral',
  title: 'Transfemoral Prosthetics',
  tabs: [
    // ─────────────────────────────────────────────
    // TAB 1: Socket Design
    // ─────────────────────────────────────────────
    TopicTab(
      title: 'Socket Design',
      blocks: [
        HeaderBlock('Transfemoral Socket Design'),
        TextBlock(
          'Socket design for the transfemoral amputee is more complex than '
          'transtibial because the socket must control the femur, provide '
          'weight-bearing surfaces, and manage rotational forces. Two major '
          'designs dominate: quadrilateral and ischial containment (IRC).',
          isIntro: true,
        ),
        ComparisonCardBlock(
          title: 'Quadrilateral Socket',
          themeColor: Colors.blue,
          backgroundColor: const Color(0xFFE3F2FD),
          icon: Icons.crop_square,
          description: 'The traditional TF socket design with a quadrilateral cross-section. '
              'The ML dimension is WIDER than the AP dimension. The ischial tuberosity '
              'sits ON the posterior brim (ischial seat), not inside the socket.',
          keyPoints: [
            'Narrow AP dimension, wide ML dimension',
            'Ischial tuberosity sits ON the posterior brim (ischial seat)',
            'Anterior wall height: at the level of the inguinal ligament (Scarpa\'s triangle)',
            'Scarpa\'s triangle has a bulge to contain the femoral triangle (neurovascular bundle)',
            'Reliefs for: adductor longus tendon, hamstring tendons, greater trochanter, rectus femoris',
            'Relief channel for gluteus maximus posterolaterally',
            'Posterior shelf (ischial seat) is flat for IT weight-bearing',
          ],
        ),
        ComparisonCardBlock(
          title: 'Ischial Containment (IRC/CAT-CAM/NSNA) Socket',
          themeColor: Colors.teal,
          backgroundColor: const Color(0xFFE0F2F1),
          icon: Icons.radio_button_unchecked,
          description: 'Modern socket design where the ischial tuberosity is contained '
              'INSIDE the socket. ML dimension is NARROWER than AP. Also known as '
              'CAT-CAM (Contoured Adducted Trochanteric-Controlled Alignment Method) '
              'or NSNA (Normal Shape Normal Alignment).',
          keyPoints: [
            'ML dimension narrower than AP dimension (opposite of quad socket)',
            'Ischial tuberosity and ramus contained INSIDE the socket',
            'Creates a bony lock between ischium and greater trochanter',
            'Femur held in adduction (more anatomic position)',
            'Socket preflexed 5-7 degrees to accommodate hip flexion contracture',
            'Lateral wall contoured to capture the greater trochanter',
            'Medial wall captures the ischium and ramus',
          ],
        ),
        PearlBlock(
          'Board Pearl',
          'Key difference: In the QUAD socket, the ischium sits ON the posterior '
          'brim. In the IRC socket, the ischium is CONTAINED inside the socket. '
          'IRC keeps the femur in adduction (anatomic), while quad allows abduction '
          '(non-anatomic). This is a classic board question.',
        ),
        TableBlock(
          title: 'Quadrilateral vs Ischial Containment Socket',
          columns: ['Feature', 'Quadrilateral', 'Ischial Containment (IRC)'],
          rows: [
            ['Shape', 'Narrow AP, wide ML', 'Narrow ML, wider AP'],
            ['Ischium position', 'ON posterior brim', 'INSIDE socket'],
            ['Femur position', 'Tends toward abduction', 'Maintained in adduction'],
            ['ML stability', 'Less stable', 'More stable (bony lock)'],
            ['Energy efficiency', 'Less efficient', 'More efficient'],
            ['Lateral trunk bend', 'More common', 'Less common'],
            ['Seated comfort', 'Less comfortable', 'More comfortable'],
            ['Short residual limb', 'Poor control', 'Better control'],
            ['Skin irritation', 'Common at ischium/pubis', 'Less common'],
            ['Groin comfort', 'Can be uncomfortable', 'Generally more comfortable'],
          ],
          headerColor: Colors.deepPurple,
        ),
        BulletCardBlock(
          title: 'IRC Socket Advantages',
          themeColor: Colors.green,
          backgroundColor: const Color(0xFFE8F5E9),
          points: [
            'Better medial-lateral stability through bony lock mechanism',
            'Femur maintained in adduction: more anatomic, efficient abductor function',
            'Improved gluteus medius leverage (better frontal plane stability)',
            'Reduced lateral trunk bending during gait',
            'More comfortable in the groin area',
            'Better rotational control of the femur',
            'Preferred for short residual limbs (better femoral control)',
            'More energy-efficient gait pattern',
          ],
        ),
        HeaderBlock('Flexible Socket Design'),
        ComparisonCardBlock(
          title: 'Flexible Thermoplastic Socket with Rigid Frame',
          themeColor: Colors.orange,
          backgroundColor: const Color(0xFFFFF3E0),
          icon: Icons.layers,
          description: 'A two-part socket system with a flexible inner socket made of '
              'thermoplastic material contained within a rigid laminated outer frame '
              'that provides structural support.',
          keyPoints: [
            'Inner socket: thin, flexible thermoplastic (allows some deformation)',
            'Outer frame: rigid laminated carbon fiber or fiberglass',
            'Windows/cutouts in the frame allow flexible sections to move',
            'Advantages: comfort, heat dissipation, sensory feedback (proprioception)',
            'Patient can feel through the flexible material',
            'Translucency allows inspection of skin contact without removing',
            'More comfortable for sitting (flexible posterior brim)',
          ],
        ),
        PearlBlock(
          'Board Pearl',
          'Approximately 85% of all amputations are secondary to peripheral '
          'vascular disease (PVD). The ideal TF residual limb shape is conical. '
          'A hip flexion contracture up to 20 degrees can be accommodated in '
          'the socket by building in initial flexion.',
        ),
      ],
    ),

    // ─────────────────────────────────────────────
    // TAB 2: Knee Units
    // ─────────────────────────────────────────────
    TopicTab(
      title: 'Knee Units',
      blocks: [
        HeaderBlock('Prosthetic Knee Units'),
        TextBlock(
          'The prosthetic knee is the most complex component in a transfemoral '
          'prosthesis. Selection depends on the patient\'s functional level, '
          'strength, balance, and activity demands. Understanding the biomechanical '
          'principles of each knee type is critical for board review.',
          isIntro: true,
        ),
        TableBlock(
          title: 'Prosthetic Knee Units (Table 6-11)',
          columns: ['Knee Type', 'Mechanism', 'Stance Control', 'Swing Control', 'K-Level'],
          rows: [
            ['Single-axis, constant friction', 'Simple hinge with friction-adjusted bolt', 'None (alignment-dependent only)', 'Constant friction at all speeds', 'K1-K2'],
            ['Stance-control (weight-activated)', 'Friction brake engages with weight-bearing', 'Good (brake locks with loading)', 'Constant friction when unloaded', 'K1-K2'],
            ['Polycentric (four-bar/multiaxis)', 'Multiple pivot points create moving center of rotation', 'Inherent stability (ICR posterior to load line)', 'Shortens shank for clearance', 'K2-K3'],
            ['Hydraulic (fluid-controlled)', 'Hydraulic cylinder resists knee motion', 'Variable (speed-responsive)', 'Variable cadence response', 'K3-K4'],
            ['Pneumatic (air-controlled)', 'Air cylinder provides resistance', 'Limited', 'Variable cadence (lighter than hydraulic)', 'K3'],
            ['Microprocessor (C-Leg, Genium)', 'Sensors + computer adjust resistance in real-time', 'Excellent (stumble recovery)', 'Optimal cadence matching', 'K3-K4'],
            ['Manual locking', 'Locked in full extension; unlocked for sitting', 'Maximum (fully locked)', 'None (knee does not flex in swing)', 'K1 / special'],
          ],
          headerColor: Colors.indigo,
        ),
        HeaderBlock('Knee Unit Details'),
        BulletCardBlock(
          title: 'Single-Axis Constant Friction Knee',
          themeColor: Colors.grey,
          backgroundColor: const Color(0xFFEEEEEE),
          points: [
            'Simplest mechanical knee design',
            'Stability depends entirely on alignment (GRF anterior to knee axis)',
            'No inherent stance-phase stability mechanism',
            'Friction set to one speed; not adjustable during gait',
            'Requires strong hip extensors to control stance stability',
            'Inexpensive and lightweight',
            'Not appropriate for patients who need stance-phase security',
          ],
        ),
        BulletCardBlock(
          title: 'Stance-Control (Weight-Activated Safety) Knee',
          themeColor: Colors.blue,
          backgroundColor: const Color(0xFFE3F2FD),
          points: [
            'Friction brake engages when weight is applied (axial loading)',
            'Provides stance-phase stability independent of alignment',
            'Brake releases when weight is removed at preswing',
            'Good for patients needing extra security (elderly, weak hip extensors)',
            'Does not assist swing-phase control',
            'Patient must fully weight the prosthesis to engage brake',
            'Disadvantage: difficulty on slopes and stairs (weight-activated lock)',
          ],
        ),
        BulletCardBlock(
          title: 'Polycentric (Four-Bar/Multiaxis) Knee',
          themeColor: Colors.teal,
          backgroundColor: const Color(0xFFE0F2F1),
          points: [
            'Multiple pivot points create an instantaneous center of rotation (ICR)',
            'ICR located POSTERIOR and PROXIMAL to the knee during stance = inherent stability',
            'As knee flexes, the shank shortens, providing better toe clearance in swing',
            'Excellent for knee disarticulation (shortens to match normal knee center height)',
            'Cosmetically superior at knee level for KD and long TF amputees',
            'More complex mechanism; heavier than single-axis',
            'Good stance-phase stability without requiring a locking mechanism',
          ],
        ),
        ComparisonCardBlock(
          title: 'Hydraulic/Pneumatic Knee Units',
          themeColor: Colors.deepOrange,
          backgroundColor: const Color(0xFFFBE9E7),
          icon: Icons.speed,
          description: 'Fluid-controlled knees provide variable resistance that changes '
              'with walking speed, allowing for a more natural gait pattern at '
              'different cadences.',
          keyPoints: [
            'Hydraulic: oil/fluid resistance; heavier but smoother',
            'Pneumatic: air resistance; lighter but less smooth',
            'Variable cadence control: resistance increases with speed',
            'Allow different walking speeds without manual adjustment',
            'Stance-phase hydraulic resistance available in some models',
            'Indicated for active patients (K3-K4)',
            'More expensive and require more maintenance',
          ],
        ),
        ComparisonCardBlock(
          title: 'Microprocessor Knees (C-Leg, Genium, X3, Rheo)',
          themeColor: Colors.purple,
          backgroundColor: const Color(0xFFF3E5F5),
          icon: Icons.memory,
          description: 'Computer-controlled knee units use sensors to detect gait phase '
              'and adjust resistance in real-time. They provide the most natural '
              'gait pattern and the best stumble recovery.',
          keyPoints: [
            'Multiple sensors (angle, moment, acceleration) feed data to microprocessor',
            'Adjusts resistance 50-1000+ times per second',
            'Excellent stumble recovery (detects unexpected loading)',
            'Allows controlled descent on stairs and slopes',
            'Reduces falls and fall-related injuries significantly',
            'Battery-powered; requires regular charging',
            'Most expensive knee unit option',
            'Covered by Medicare for documented K3-K4 patients',
          ],
        ),
        HeaderBlock('Manual Locking Knee'),
        BulletCardBlock(
          title: 'Manual Locking Knee',
          themeColor: Colors.red,
          backgroundColor: const Color(0xFFFFEBEE),
          points: [
            'Knee is LOCKED in full extension during ambulation',
            'Patient must manually unlock to sit (pull-cable or push-button release)',
            'Provides maximum stance-phase stability but no knee flexion in swing',
            'Results in stiff-legged gait with circumduction or vaulting',
            'Last resort for patients who cannot safely use other knee units',
            'Indications: bilateral TF amputees, blind patients, stroke patients with poor cognition',
            'Also used as temporary training knee for new amputees',
            'Significantly increases energy expenditure due to lack of knee motion',
          ],
        ),
        PearlBlock(
          'Board Pearl',
          'Manual locking knee is the LAST RESORT option. It is specifically '
          'indicated for blind patients and stroke patients who cannot safely '
          'control a swing-phase knee. A polycentric knee is preferred for knee '
          'disarticulation because it shortens in swing and provides inherent '
          'stance-phase stability.',
        ),
      ],
    ),

    // ─────────────────────────────────────────────
    // TAB 3: Suspension
    // ─────────────────────────────────────────────
    TopicTab(
      title: 'Suspension',
      blocks: [
        HeaderBlock('Transfemoral Suspension Systems'),
        TextBlock(
          'Suspension in transfemoral prosthetics is critical because the socket '
          'must control a shorter lever arm and greater forces. Multiple options '
          'exist ranging from simple belts to advanced suction systems.',
          isIntro: true,
        ),
        TableBlock(
          title: 'TF Suspension Systems',
          columns: ['System', 'Mechanism', 'Advantages', 'Disadvantages'],
          rows: [
            ['Suction socket', 'Air-tight seal; one-way valve; pull-in sock method', 'Best suspension; proprioception; minimal pistoning; no belts/straps', 'Difficult donning; volume fluctuations break seal; requires good UE function'],
            ['Partial suction with auxiliary', 'Suction with supplemental belt for security', 'Good suspension with backup; easier donning than full suction', 'Belt can be uncomfortable; adds bulk'],
            ['Silesian belt', 'Flexible strap from lateral socket around contralateral iliac crest', 'Controls rotation; lightweight; flexible', 'Does not control vertical displacement well; cosmetically visible'],
            ['TES belt (total elastic suspension)', 'Wide neoprene belt wrapping around pelvis', 'Good suspension; controls rotation and vertical displacement', 'Hot; bulky; difficult for obese patients; can irritate skin'],
            ['Pelvic band with hip joint', 'Metal hip joint and pelvic band', 'Maximum suspension; controls rotation; ML stability', 'Heavy; bulky; uncomfortable; limits hip motion; outdated'],
            ['Gel liner with pin/strap', 'Gel liner with distal pin or lanyard attaching to socket', 'Good suspension; cushioning; easier donning for some', 'Distal traction; may require auxiliary suspension'],
          ],
          headerColor: Colors.deepPurple,
        ),
        ComparisonCardBlock(
          title: 'Suction Suspension (Gold Standard)',
          themeColor: Colors.amber,
          backgroundColor: const Color(0xFFFFF8E1),
          icon: Icons.air,
          description: 'Suction suspension is considered the gold standard for transfemoral '
              'prosthetics when the patient has adequate dexterity and stable '
              'limb volume. The socket creates an airtight seal with the residual limb.',
          keyPoints: [
            'Donning: pull-in sock method (elastic bandage pulls limb into socket, removed through valve)',
            'One-way expulsion valve at distal socket allows air out but not in',
            'Total contact between socket wall and entire residual limb surface',
            'Provides excellent proprioception through intimate contact',
            'No need for belts, straps, or external suspension aids',
            'Requires stable residual limb volume (problematic with weight/volume fluctuations)',
            'Requires adequate upper extremity strength and dexterity for donning',
          ],
        ),
        BulletCardBlock(
          title: 'Silesian Belt Details',
          themeColor: Colors.green,
          backgroundColor: const Color(0xFFE8F5E9),
          points: [
            'Flexible webbing strap originating from the lateral wall of the socket',
            'Wraps around the pelvis to the contralateral iliac crest',
            'Fastens anteriorly (buckle or Velcro)',
            'Primary function: controls ROTATION of the prosthesis',
            'Secondary function: provides some vertical suspension',
            'Does NOT provide significant medial-lateral stability',
            'Often used as auxiliary suspension with partial suction sockets',
            'Lighter and less restrictive than pelvic band',
          ],
        ),
        BulletCardBlock(
          title: 'Pelvic Band with Hip Joint',
          themeColor: Colors.red,
          backgroundColor: const Color(0xFFFFEBEE),
          points: [
            'Metal hip joint attached to the lateral wall of the socket',
            'Connected to a rigid or semi-rigid pelvic band encircling the pelvis',
            'Provides MAXIMUM suspension, rotation control, and ML stability',
            'Indicated for: very short residual limbs, hip disarticulation, weak muscles',
            'Also indicated for hip instability or significant hip flexion contracture',
            'Largely replaced by suction and modern suspension systems',
            'Disadvantages: heavy, bulky, uncomfortable, limits hip ROM, cosmetically poor',
            'Historical significance but still occasionally prescribed',
          ],
        ),
        PearlBlock(
          'Board Pearl',
          'Suction socket is the PREFERRED (gold standard) suspension for TF '
          'amputees with stable limb volume and adequate dexterity. Silesian belt '
          'primarily controls ROTATION. Pelvic band with hip joint provides '
          'MAXIMUM control but is the bulkiest and most uncomfortable option. '
          'Know the hierarchy: suction > partial suction > belts > pelvic band.',
        ),
        BulletCardBlock(
          title: 'Suspension Selection by Patient Profile',
          themeColor: Colors.orange,
          backgroundColor: const Color(0xFFFFF3E0),
          points: [
            'Active, stable volume: suction socket (gold standard)',
            'Active, minor volume fluctuation: partial suction + auxiliary',
            'Short residual limb: suction or pelvic band; IRC socket preferred',
            'Vascular patient with volume changes: partial suction with TES or Silesian',
            'Limited UE dexterity: gel liner with pin (easier donning)',
            'Maximum control needed: pelvic band with hip joint (last resort)',
            'Rotational control needed: Silesian belt or TES belt',
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
        HeaderBlock('TF Alignment Principles'),
        TextBlock(
          'Alignment in transfemoral prosthetics is more complex than transtibial '
          'because it must address both knee and ankle biomechanics. The '
          'relationship between the GRF and the prosthetic knee axis determines '
          'stance-phase stability.',
          isIntro: true,
        ),
        BulletCardBlock(
          title: 'TF Alignment Fundamentals',
          themeColor: Colors.indigo,
          backgroundColor: const Color(0xFFE8EAF6),
          points: [
            'TKA line: trochanter-knee-ankle reference line for alignment',
            'Stance stability: GRF must pass ANTERIOR to the knee axis',
            'GRF posterior to knee axis causes knee buckling',
            'More alignment stability = harder to initiate swing-phase knee flexion',
            'Less alignment stability = easier swing but risk of knee buckling',
            'Socket flexion: 5-7 degrees (accommodates hip flexion contracture, enhances hip extensor function)',
            'Socket adduction: 5-7 degrees (matches normal femoral adduction angle)',
            'Foot placed in 5-7 degrees of external rotation',
          ],
        ),
        TableBlock(
          title: 'GRF Position Relative to Knee Axis',
          columns: ['GRF Position', 'Effect', 'Clinical Result'],
          rows: [
            ['Far anterior to knee', 'Strong extension moment', 'Very stable but difficult to initiate swing'],
            ['Slightly anterior to knee', 'Moderate extension moment', 'Ideal: stable stance, can initiate swing'],
            ['Through knee center', 'No moment', 'Unstable; depends on hip extensors only'],
            ['Posterior to knee', 'Flexion moment', 'Knee buckles; patient falls'],
          ],
          headerColor: Colors.blue,
        ),
        PearlBlock(
          'Board Pearl',
          'To increase knee stability: move the knee posterior relative to the '
          'socket, stiffen the heel, or increase socket flexion. To decrease '
          'stability (make swing easier): move the knee anterior, soften the heel, '
          'or decrease socket flexion. Balance between stability and mobility is key.',
        ),
        HeaderBlock('TF Prosthetic Gait Deviations'),
        TableBlock(
          title: 'Transfemoral Gait Deviations and Causes',
          columns: ['Deviation', 'Prosthetic Cause', 'Patient Cause', 'Correction'],
          rows: [
            ['Lateral trunk bend', 'Prosthesis too short; foot inset; medial wall discomfort', 'Weak abductors; short residual limb; hip pain; habit', 'Lengthen prosthesis; outset foot; relieve medial wall; strengthen abductors'],
            ['Circumduction', 'Too long; excess friction; locked knee; poor suspension', 'Abduction contracture; weak hip flexors; habit', 'Shorten; reduce friction; improve suspension; address contracture'],
            ['Vaulting', 'Too long; insufficient knee flexion; poor suspension', 'Habit; fear', 'Shorten prosthesis; adjust friction; improve suspension'],
            ['Medial whip', 'Knee rotated internally; tight medial socket', 'Internal rotation of limb', 'Externally rotate knee bolt; relieve socket'],
            ['Lateral whip', 'Knee rotated externally', 'External rotation of limb', 'Internally rotate knee bolt'],
            ['Terminal impact', 'Insufficient extension resistance in knee', 'Forceful hip flexion habit', 'Increase extension damping; patient education'],
            ['Uneven heel rise', 'Insufficient knee friction', 'Forceful hip flexion', 'Increase friction; patient education'],
            ['Foot rotation at heel strike', 'Heel too stiff; poor rotational control', 'Habitual', 'Soften heel; add rotator'],
            ['Uneven step length', 'Insufficient socket flexion; insufficient friction', 'Hip flexion contracture; fear; distrust of knee', 'Increase socket flexion; increase friction; training'],
            ['Knee buckling', 'GRF posterior to knee; insufficient alignment stability', 'Weak hip extensors; hip flexion contracture', 'Move knee posterior; increase stability; strengthen hip extensors'],
          ],
          headerColor: Colors.deepOrange,
        ),
        PearlBlock(
          'Board Pearl',
          'LATERAL TRUNK BEND in TF gait: most common prosthetic cause is '
          'prosthesis too short or foot inset. Most common patient cause is weak '
          'hip abductors. WHIPS are best seen from behind: medial whip = heel '
          'goes medially (internal rotation), lateral whip = heel goes laterally '
          '(external rotation).',
        ),
        HeaderBlock('Transfemoral Residual Limb Considerations'),
        BulletCardBlock(
          title: 'Ideal TF Residual Limb',
          themeColor: Colors.green,
          backgroundColor: const Color(0xFFE8F5E9),
          points: [
            'Conical shape (not bulbous or cylindrical)',
            'Longer residual limb = better lever arm = better function',
            'Minimum length: 5-7 cm below lesser trochanter for adequate lever arm',
            'Ideal: at least 50-70% of original femoral length preserved',
            'Myodesis (suturing muscle to periosteum) preferred',
            'Adductor myodesis critical to prevent abduction contracture',
            'Distal femur should be padded with muscle for end-bearing',
            'Full hip ROM (no flexion or abduction contracture)',
          ],
        ),
        BulletCardBlock(
          title: 'Hip Flexion Contracture Management',
          themeColor: Colors.orange,
          backgroundColor: const Color(0xFFFFF3E0),
          points: [
            'Thomas test used to assess hip flexion contracture',
            'Hip flexion contracture up to 20 degrees can be accommodated in the socket',
            'Socket built with initial flexion matching the contracture angle',
            'Contractures >20 degrees significantly impair prosthetic function',
            'Stretching program should be initiated pre-prosthetically',
            'Prone lying and hip extension exercises are key',
            'Avoid prolonged sitting and pillow under the knee post-operatively',
            'Abduction contracture managed by IRC socket with adduction alignment',
          ],
        ),
        TableBlock(
          title: 'Amputation Level Comparison',
          columns: ['Feature', 'Transtibial (BKA)', 'Transfemoral (AKA)', 'Knee Disarticulation'],
          rows: [
            ['Ideal shape', 'Cylindrical', 'Conical', 'Bulbous'],
            ['Bone cut', 'Fibula 2-3 cm shorter', 'Smooth femoral condyles', 'Condyles preserved intact'],
            ['Key muscle', 'Quads/hams for knee control', 'Hip extensors/abductors', 'Quads over patella for padding'],
            ['Energy cost', '25% (traumatic)', '60-70% (traumatic)', '~40% (similar to long TT)'],
            ['Prosthetic knee', 'Not needed', 'Required (most complex component)', 'Polycentric preferred (shortens shank)'],
            ['End-bearing', 'Partial', 'None', 'Full end-bearing possible'],
            ['Socket type', 'PTB or TSB', 'Quad or IRC', 'Bulbous socket; specialized design'],
          ],
          headerColor: Colors.teal,
        ),
        PearlBlock(
          'Board Pearl',
          '85% of lower extremity amputations are due to vascular disease (PVD/diabetes). '
          'The most common amputation level is transtibial. Knee disarticulation '
          'preserves the femoral condyles for excellent end-bearing and uses a '
          'polycentric knee to compensate for the longer thigh segment. Always '
          'attempt to preserve the knee joint when surgically possible.',
        ),
        BulletCardBlock(
          title: 'Prosthetic Foot Selection for TF',
          themeColor: Colors.deepPurple,
          backgroundColor: const Color(0xFFEDE7F6),
          points: [
            'Same foot types available as for TT (SACH, single-axis, multiaxis, energy-storing)',
            'Single-axis foot: quick foot-flat improves knee stability at initial contact',
            'SACH: simple, durable, appropriate for low-activity TF amputees (K1)',
            'Energy-storing: returns energy at push-off; for K3-K4 active TF amputees',
            'Microprocessor-controlled ankle/foot available for K3-K4',
            'Foot selection must complement knee unit for optimal function',
            'Single-axis foot with stance-control knee: good combination for K2 patients',
          ],
        ),
      ],
    ),
  ],
);

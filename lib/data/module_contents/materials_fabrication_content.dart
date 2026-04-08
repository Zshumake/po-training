import 'package:flutter/material.dart';
import '../models/topic_content_model.dart';

final materialsFabricationContent = TopicData(
  id: 'materials_fabrication',
  title: 'Materials & Fabrication',
  tabs: [
    // ─────────────────────────────────────────────
    // TAB 1: Plastics & Polymers
    // ─────────────────────────────────────────────
    TopicTab(
      title: 'Plastics & Polymers',
      blocks: [
        HeaderBlock('Plastics & Polymers in P&O'),
        TextBlock(
          'Plastics are the most widely used materials in modern prosthetics and '
          'orthotics. Understanding the fundamental differences between thermoplastics '
          'and thermosets is essential for material selection, fabrication, and board '
          'examinations. The key distinction lies in their response to heat.',
          isIntro: true,
        ),

        // --- Thermoplastics ---
        HeaderBlock('Thermoplastics'),
        TextBlock(
          'Thermoplastics SOFTEN when heated and HARDEN when cooled. They can be '
          'reheated and remolded multiple times without permanent chemical change. '
          'This is because thermoplastics have linear or branched polymer chains '
          'held together by weak intermolecular forces that break with heat.',
        ),
        ComparisonCardBlock(
          title: 'Low-Temperature Thermoplastics (150-170\u00B0F)',
          themeColor: Colors.blue,
          backgroundColor: const Color(0xFF1A2332),
          icon: Icons.thermostat,
          description: 'Soften at low temperatures (150-170\u00B0F / 65-77\u00B0C) and can '
              'be molded DIRECTLY ON THE PATIENT. Used primarily for splints and '
              'custom orthoses in occupational and physical therapy settings.',
          keyPoints: [
            'Can be molded directly on the patient (safe skin temperature)',
            'Soften in warm water bath or heat gun',
            'Can be reheated and readjusted multiple times',
            'Examples: Aquaplast, Orfit, Polyform, Omega, Ezeform',
            'Used for hand splints, custom orthotic inserts, temporary devices',
            'Memory property: some materials return toward original shape when reheated',
            'Conformability: how easily material drapes and conforms to contours',
            'Self-bonding: some materials stick to themselves when warm',
          ],
        ),
        ComparisonCardBlock(
          title: 'High-Temperature Thermoplastics (300-500\u00B0F)',
          themeColor: Colors.orange,
          backgroundColor: const Color(0xFF2A2215),
          icon: Icons.local_fire_department,
          description: 'Require high temperatures (300-500\u00B0F / 150-260\u00B0C) to soften. '
              'CANNOT be molded directly on the patient. Must be molded over a '
              'plaster or foam model. Used for structural orthotic and prosthetic '
              'components.',
          keyPoints: [
            'MUST be molded over a model (too hot for direct patient contact)',
            'Heated in an oven, then draped or vacuum-formed over the model',
            'Stronger and more durable than low-temperature materials',
            'Examples: polypropylene, polyethylene (PE), copolymer',
            'Polypropylene: most commonly used for definitive AFOs, KAFOs',
            'Polyethylene: more flexible, used for flexible socket walls',
            'Copolymer: blend of PP and PE, balance of rigidity and flexibility',
            'Can still be reheated and remolded (but requires oven temperatures)',
          ],
        ),
        BulletCardBlock(
          title: 'Common High-Temp Thermoplastic Applications',
          themeColor: Colors.indigo,
          backgroundColor: const Color(0xFF1A1D2E),
          points: [
            'Polypropylene (PP): solid AFOs, rigid KAFOs, socket inner walls, spinal orthoses',
            'Polyethylene (PE): flexible AFOs, flexible inner sockets, liners',
            'Copolymer (PP/PE blend): semi-flexible AFOs, hybrid designs',
            'PETG (polyethylene terephthalate glycol): check sockets, diagnostic sockets',
            'Acrylic/PMMA: transparent diagnostic sockets',
            'Surlyn: impact-resistant covers and shells',
          ],
        ),

        // --- Thermosets ---
        HeaderBlock('Thermoset Plastics'),
        ComparisonCardBlock(
          title: 'Thermoset (Thermosetting) Plastics',
          themeColor: Colors.red,
          backgroundColor: const Color(0xFF2A1519),
          icon: Icons.lock,
          description: 'Thermosets undergo an irreversible chemical reaction (curing) '
              'that creates permanent cross-linked polymer bonds. Once cured, they '
              'CANNOT be reheated or remolded. They are stronger and more rigid '
              'than thermoplastics but cannot be adjusted after fabrication.',
          keyPoints: [
            'Irreversible chemical curing reaction (cross-linking)',
            'CANNOT be reheated or remolded after curing',
            'Stronger and more rigid than thermoplastics',
            'Examples: polyester resin, acrylic resin, epoxy resin',
            'Used for laminated prosthetic sockets and structural frames',
            'Lamination process: resin saturates layers of reinforcement fabric',
            'Carbon fiber or fiberglass reinforcement adds strength',
            'Exothermic reaction during curing generates heat',
          ],
        ),

        // --- Comparison Table ---
        TableBlock(
          title: 'Thermoplastic vs Thermoset Comparison',
          columns: ['Property', 'Thermoplastic', 'Thermoset'],
          rows: [
            ['Response to heat', 'Softens (reversible)', 'Does NOT soften (irreversible cure)'],
            ['Remoldable', 'Yes (can reheat and reshape)', 'No (permanently set)'],
            ['Polymer structure', 'Linear/branched chains', 'Cross-linked network'],
            ['Strength', 'Moderate', 'Higher (rigid)'],
            ['Adjustability', 'Can modify after fabrication', 'Cannot adjust after curing'],
            ['Fabrication method', 'Draping / vacuum forming', 'Lamination with resin'],
            ['Common examples', 'Polypropylene, polyethylene', 'Polyester resin, acrylic resin, epoxy'],
            ['Primary use', 'AFOs, KAFOs, flexible sockets', 'Definitive prosthetic sockets, frames'],
            ['Recycling', 'Can be recycled (remelt)', 'Cannot be recycled'],
          ],
          headerColor: Colors.deepPurple,
        ),
        PearlBlock(
          'Board Pearl',
          'The critical distinction: Thermoplastics can be reheated and remolded '
          '(reversible). Thermosets undergo permanent cross-linking and CANNOT be '
          'remolded (irreversible). Low-temp thermoplastics can be molded on the '
          'patient; high-temp thermoplastics require a model.',
        ),

        // --- Checkpoint: Plastics ---
        CheckpointBlock(
          question: 'What is the key difference between thermoplastics and thermosets in P&O fabrication?',
          options: ['Thermoplastics are stronger', 'Thermosets can be remolded when reheated; thermoplastics cannot', 'Thermoplastics can be remolded when reheated; thermosets cannot', 'There is no practical difference'],
          correctIndex: 2,
          explanation: 'Thermoplastics soften when heated and can be remolded multiple times (e.g., polypropylene for AFOs, Kydex for splints). Thermosets undergo irreversible chemical cross-linking — once cured, they CANNOT be reshaped (reheating causes charring). Thermosets are used for laminated sockets.',
        ),

        // --- Thermoset Resins Comparison ---
        HeaderBlock('Thermoset Resin Comparison'),
        TableBlock(
          title: 'Common Thermoset Resins in Prosthetics',
          columns: ['Resin', 'Properties', 'Applications'],
          rows: [
            ['Acrylic resin', 'Clear, rigid, good impact resistance', 'Standard prosthetic socket lamination'],
            ['Polyester resin', 'Strong, moderate cost, amber color', 'Socket lamination, structural components'],
            ['Epoxy resin', 'Highest strength, excellent adhesion', 'High-performance structural applications'],
          ],
          headerColor: Colors.red,
        ),
        PearlBlock(
          'Board Pearl — Thermoset Reheat',
          'If a board question asks what happens when you try to reheat a laminated '
          'prosthetic socket, the answer is that it will char or burn — it will NOT '
          'become pliable. Thermosets have permanent covalent cross-links that are '
          'destroyed (not reversibly broken) by heat.',
        ),

        // --- Silicone & Foam ---
        HeaderBlock('Silicone, Gel & Foam Materials'),
        BulletCardBlock(
          title: 'Silicone & Gel Materials',
          themeColor: Colors.teal,
          backgroundColor: const Color(0xFF152A27),
          points: [
            'Silicone elastomers: used for prosthetic liners, cosmetic covers, and finger prostheses',
            'Medical-grade silicone: biocompatible, durable, skin-safe',
            'Gel liners (silicone, urethane, TPE): cushioning interface between limb and socket',
            'Urethane gel: softer than silicone, better for bony/sensitive limbs',
            'Thermoplastic elastomer (TPE): mineral oil-based, very soft and conforming',
            'Cosmetic silicone covers: custom-matched skin tone for prosthetic hands',
          ],
        ),
        BulletCardBlock(
          title: 'Foam Materials',
          themeColor: Colors.green,
          backgroundColor: const Color(0xFF152A1A),
          points: [
            'Closed-cell foam (Pelite): for prosthetic liners, shoe inserts, padding',
            'Pelite: closed-cell polyethylene foam, compresses over time',
            'Plastazote: similar to Pelite, heat-moldable, used in diabetic shoe inserts',
            'Open-cell foam: soft padding, cosmetic covers over prosthetic frames',
            'EVA (ethylene vinyl acetate): shoe modifications, wedges, lifts',
            'Poron: shock-absorbing foam for orthotic insoles',
            'Closed-cell = does NOT absorb moisture; open-cell = absorbs moisture',
          ],
        ),
      ],
    ),

    // ─────────────────────────────────────────────
    // TAB 2: Metals & Composites
    // ─────────────────────────────────────────────
    TopicTab(
      title: 'Metals & Composites',
      blocks: [
        HeaderBlock('Metals & Composite Materials'),
        TextBlock(
          'Metals and composite materials provide the structural strength needed '
          'for load-bearing orthotic and prosthetic components. Material selection '
          'involves balancing strength, weight, cost, and durability for the '
          'specific clinical application.',
          isIntro: true,
        ),

        // --- Steel ---
        ComparisonCardBlock(
          title: 'Steel',
          themeColor: Colors.blueGrey,
          backgroundColor: const Color(0xFF1E2530),
          icon: Icons.shield,
          description: 'The strongest and heaviest metal used in O&P. Stainless steel '
              'provides excellent corrosion resistance. Historically the primary '
              'material for orthotic uprights and joints.',
          keyPoints: [
            'Strongest metal used in P&O (highest ultimate tensile strength)',
            'Heaviest metal option (density ~7.8 g/cm\u00B3)',
            'Stainless steel: corrosion resistant, durable',
            'Used for metal uprights (KAFO, AFO side bars)',
            'Used for orthotic joints (ankle, knee, hip)',
            'Carbon steel: stronger but rusts without coating',
            'Can withstand very high loads and repeated stress cycles',
            'Standard for heavy-duty/bariatric orthotic applications',
          ],
        ),

        // --- Aluminum ---
        ComparisonCardBlock(
          title: 'Aluminum',
          themeColor: Colors.blue,
          backgroundColor: const Color(0xFF1A2332),
          icon: Icons.fitness_center,
          description: 'Approximately one-third the weight of steel with adequate '
              'strength for many orthotic and prosthetic applications. The most '
              'common metal for lightweight orthotic uprights.',
          keyPoints: [
            'One-third the weight of steel (density ~2.7 g/cm\u00B3)',
            'Adequate strength for most orthotic applications',
            'Most common metal for lightweight orthotic uprights',
            'Used for prosthetic pylon tubes and structural frames',
            'Aluminum alloy (7075-T6): high-strength aerospace grade',
            'Less durable than steel under repeated high loads',
            'Not recommended for heavy/bariatric patients',
            'Good corrosion resistance (naturally forms oxide layer)',
          ],
        ),

        // --- Titanium ---
        ComparisonCardBlock(
          title: 'Titanium',
          themeColor: Colors.teal,
          backgroundColor: const Color(0xFF152A27),
          icon: Icons.diamond,
          description: 'The best strength-to-weight ratio of any metal used in P&O. '
              'Lightweight, extremely corrosion resistant, and biocompatible. '
              'The premium metal choice for prosthetic components.',
          keyPoints: [
            'Best strength-to-weight ratio of all metals in P&O',
            'About 45% lighter than steel with comparable strength',
            'Excellent corrosion resistance (superior to stainless steel)',
            'Biocompatible: used in osseointegration implants',
            'Used for prosthetic components (adapters, pylons, connectors)',
            'Osseointegrated prosthetic implants (OPRA, OGAP systems)',
            'Very expensive (highest cost metal in P&O)',
            'Difficult to machine and fabricate',
          ],
        ),

        // --- Carbon Fiber ---
        ComparisonCardBlock(
          title: 'Carbon Fiber',
          themeColor: Colors.grey,
          backgroundColor: const Color(0xFF232A3B),
          icon: Icons.layers,
          description: 'A composite material with the highest strength-to-weight ratio '
              'in P&O. Carbon fiber reinforced polymer (CFRP) consists of carbon '
              'filaments embedded in a resin matrix, creating an extremely stiff, '
              'strong, lightweight material.',
          keyPoints: [
            'Highest strength-to-weight ratio of all P&O materials',
            'Very stiff and lightweight',
            'Used for energy-storing prosthetic feet (critical application)',
            'Socket reinforcement in laminated prosthetic sockets',
            'Posterior leaf spring AFOs and ground reaction AFOs',
            'Composite: carbon fiber + resin matrix (thermoset)',
            'Can shatter on impact (brittle failure mode vs metal bending)',
            'Very expensive material and fabrication process',
            'Cannot be reshaped or adjusted after curing',
          ],
        ),

        // --- Fiberglass ---
        ComparisonCardBlock(
          title: 'Fiberglass',
          themeColor: Colors.green,
          backgroundColor: const Color(0xFF152A1A),
          icon: Icons.view_in_ar,
          description: 'Glass fiber reinforcement in a resin matrix. Less expensive '
              'than carbon fiber with moderate strength. The standard '
              'reinforcement material for laminated prosthetic sockets.',
          keyPoints: [
            'Glass fibers in resin matrix (typically polyester or acrylic)',
            'Moderate strength-to-weight ratio',
            'Less expensive than carbon fiber',
            'Standard reinforcement for laminated prosthetic sockets',
            'Nyglass (nylon + fiberglass): flexible, used for cosmetic covers',
            'Carbon/glass hybrid layups balance strength, weight, and cost',
            'More impact resistant than pure carbon fiber',
            'Available in various weaves: stockinette, bias, woven',
          ],
        ),

        // --- Comparison Table ---
        TableBlock(
          title: 'Metals & Composites Comparison',
          columns: ['Material', 'Weight', 'Strength', 'Cost', 'Common Uses'],
          rows: [
            ['Steel', 'Heaviest', 'Highest', 'Low-moderate',
                'Orthotic uprights, joints, bariatric devices'],
            ['Aluminum', 'Light (1/3 steel)', 'Moderate', 'Low-moderate',
                'Lightweight uprights, prosthetic pylons'],
            ['Titanium', 'Light (55% steel)', 'High', 'High',
                'Prosthetic components, osseointegration'],
            ['Carbon fiber', 'Lightest', 'Very high', 'Very high',
                'Prosthetic feet, AFOs, socket reinforcement'],
            ['Fiberglass', 'Moderate', 'Moderate', 'Moderate',
                'Laminated sockets, cosmetic covers'],
          ],
          headerColor: Colors.indigo,
        ),
        PearlBlock(
          'Board Pearl',
          'Titanium has the best strength-to-weight ratio of any metal. Carbon '
          'fiber has the best strength-to-weight ratio of ALL P&O materials. '
          'Steel is strongest but heaviest. Aluminum is one-third the weight '
          'of steel. Carbon fiber can shatter (brittle failure) while metals bend '
          '(ductile failure).',
        ),

        // --- Additional Concepts ---
        HeaderBlock('Material Properties Terminology'),
        BulletCardBlock(
          title: 'Key Material Science Terms',
          themeColor: Colors.deepPurple,
          backgroundColor: const Color(0xFF1F1A2E),
          points: [
            'Stress: force per unit area (internal resistance to deformation)',
            'Strain: deformation relative to original dimensions',
            'Elastic deformation: material returns to original shape when load removed',
            'Plastic deformation: permanent shape change after load removed',
            'Yield point: stress level where elastic becomes plastic deformation',
            'Ultimate tensile strength: maximum stress before failure',
            'Modulus of elasticity (Young\'s modulus): slope of elastic region, quantifies stiffness',
            'Fatigue: failure from repeated cyclic loading below ultimate strength',
            'Creep: slow deformation under sustained constant load over time',
            'Stress relaxation: decrease in stress when held at constant deformation over time',
            'Ductile failure: bending/stretching before breaking (metals)',
            'Brittle failure: sudden fracture without warning (carbon fiber, ceramics)',
            'Viscoelastic: exhibits both viscous and elastic behavior (foams, gels)',
          ],
        ),

        // --- Creep Clinical Relevance ---
        HeaderBlock('Creep — Clinical Relevance'),
        BulletCardBlock(
          title: 'Creep in P&O Applications',
          themeColor: const Color(0xFF4527A0),
          backgroundColor: const Color(0xFF1F1A2E),
          points: [
            'Polypropylene AFOs gradually deform (lose corrective angle) under daily loads — this is creep',
            'Foam padding compresses and loses cushioning over time — this is creep',
            'Pelite liners thin and flatten with use — this is creep',
            'Turnbuckle splint exploits creep in biological tissue to increase joint ROM',
            'Static-progressive splints hold joints at end-range to induce creep in shortened tissues',
            'Creep occurs even at stress levels below the yield point',
          ],
        ),

        // --- Stress Relaxation ---
        HeaderBlock('Stress Relaxation'),
        BulletCardBlock(
          title: 'Stress Relaxation in Clinical Context',
          themeColor: const Color(0xFF00695C),
          backgroundColor: const Color(0xFF152A27),
          points: [
            'Decrease in internal stress when material is held at constant deformation over time',
            'Tissue "relaxes" and accommodates to imposed stretch',
            'Used in splinting for joint contractures: tissue stress diminishes at maintained length',
            'Creep AND stress relaxation together produce tissue remodeling that increases ROM',
            'Both are manifestations of viscoelastic behavior',
            'Static-progressive splints leverage both phenomena simultaneously',
          ],
        ),

        // --- Viscoelasticity ---
        HeaderBlock('Viscoelasticity'),
        BulletCardBlock(
          title: 'Viscoelastic Material Behavior',
          themeColor: const Color(0xFF1565C0),
          backgroundColor: const Color(0xFF1A2332),
          points: [
            'Combines viscous (fluid-like, time-dependent) and elastic (solid-like, instantaneous) behavior',
            'Biological tissues (skin, ligaments, tendons, muscle) are viscoelastic',
            'P&O materials: foams, gels, silicone liners are viscoelastic',
            'Rate-dependent: stiffer under rapid loading, more compliant under slow loading',
            'Hysteresis: energy absorbed as heat during each loading-unloading cycle',
            'Clinically beneficial: sudden impact = more resistance (protective), sustained load = gradual compression',
            'Creep and stress relaxation are manifestations of viscoelastic behavior',
          ],
        ),

        // --- Fatigue Expanded ---
        HeaderBlock('Fatigue Failure'),
        BulletCardBlock(
          title: 'Fatigue in P&O Devices',
          themeColor: const Color(0xFFC62828),
          backgroundColor: const Color(0xFF2A1519),
          points: [
            'Most common mode of structural failure in prosthetic and orthotic devices',
            'Progressive damage from repeated cyclic loading below ultimate tensile strength',
            'Prosthetic pylons may develop fatigue cracks after months/years of gait cycles',
            'Metal orthotic joints can fracture at stress concentrators (corners, holes, welds)',
            'Carbon fiber can develop internal delamination from fatigue without visible signs',
            'Fatigue life depends on: stress amplitude, cycle count, material, surface finish',
          ],
        ),

        // --- Ductile vs Brittle ---
        HeaderBlock('Ductile vs Brittle Failure'),
        BulletCardBlock(
          title: 'Failure Mode Comparison',
          themeColor: Colors.blueGrey,
          backgroundColor: const Color(0xFF1E2530),
          points: [
            'Ductile: visible bending/stretching before breaking — provides WARNING of failure',
            'All metals in P&O (steel, aluminum, titanium) exhibit ductile failure',
            'Brittle: sudden fracture without significant deformation — NO warning',
            'Carbon fiber composites and ceramics exhibit brittle failure',
            'Safety implication: metal components can be visually inspected for deformation',
            'Carbon fiber may show NO visible damage before sudden catastrophic fracture',
            'Carbon fiber devices must be regularly inspected for hairline cracks, delamination, or whitening',
          ],
        ),
        PearlBlock(
          'Board Pearl — Failure Modes & Viscoelasticity',
          'Metals fail in a ductile manner (bending before breaking = warning). '
          'Carbon fiber fails in a brittle manner (shattering without warning). '
          'Fatigue is the most common structural failure mode in P&O devices. '
          'Creep and stress relaxation are viscoelastic phenomena exploited in '
          'splinting for contractures: "hold at end-range to induce tissue remodeling."',
        ),

        // --- Checkpoint: Metals ---
        CheckpointBlock(
          question: 'Fatigue failure is the MOST COMMON structural failure mode in prosthetic and orthotic devices. Which material is MOST susceptible?',
          options: ['Titanium', 'Carbon fiber composite', 'Stainless steel', 'Polypropylene'],
          correctIndex: 1,
          explanation: 'Carbon fiber composite fails catastrophically (brittle failure) with no warning deformation. Metals (steel, titanium) undergo ductile failure with visible bending before breaking, giving warning. This is why carbon fiber components require regular inspection for delamination or stress whitening.',
        ),
      ],
    ),

    // ─────────────────────────────────────────────
    // TAB 3: Fabrication Techniques
    // ─────────────────────────────────────────────
    TopicTab(
      title: 'Fabrication Techniques',
      blocks: [
        HeaderBlock('Fabrication Techniques'),
        TextBlock(
          'Fabrication of prosthetic and orthotic devices follows a systematic '
          'process from patient assessment through casting, modification, and '
          'final fabrication. Understanding each step is important for boards '
          'and clinical practice.',
          isIntro: true,
        ),

        // --- Casting ---
        HeaderBlock('Casting & Model Creation'),
        NumberedListBlock([
          MapEntry('1', 'Patient assessment: evaluate anatomy, measure limb, identify pressure-tolerant and pressure-sensitive areas'),
          MapEntry('2', 'Wrapping: apply plaster of Paris bandage wrap to limb to create the NEGATIVE mold (captures limb shape)'),
          MapEntry('3', 'Marking: outline bony landmarks and key areas before wrapping'),
          MapEntry('4', 'Removal: carefully cut and remove the hardened plaster wrap'),
          MapEntry('5', 'Filling: pour liquid plaster into the negative mold to create the POSITIVE model (replica of limb)'),
          MapEntry('6', 'Positive model = exact replica of the patient\'s limb anatomy'),
        ]),
        BulletCardBlock(
          title: 'Casting Key Concepts',
          themeColor: Colors.blue,
          backgroundColor: const Color(0xFF1A2332),
          points: [
            'Negative mold: hollow cast taken from the patient (impression of limb)',
            'Positive model: solid plaster replica made from the negative mold',
            'Plaster of Paris: calcium sulfate hemihydrate, sets via exothermic reaction',
            'Setting time accelerated by: warm water, salt, mixing',
            'Setting time slowed by: cold water, sugar',
            'Wrap should be snug but not constrictive',
            'Elastic bandage wrap used for residual limb shaping (figure-8 pattern)',
          ],
        ),

        // --- Modification ---
        HeaderBlock('Model Modification (Rectification)'),
        ComparisonCardBlock(
          title: 'Positive Model Rectification',
          themeColor: Colors.orange,
          backgroundColor: const Color(0xFF2A2215),
          icon: Icons.build,
          description: 'The positive model is modified to create a socket that loads '
              'pressure-tolerant areas and relieves pressure-sensitive areas. '
              'Plaster is ADDED over pressure-tolerant areas (to push into tissue) '
              'and REMOVED over pressure-sensitive areas (to create relief).',
          keyPoints: [
            'ADD plaster over PRESSURE-TOLERANT areas (creates buildup/convexity in socket)',
            'REMOVE plaster over PRESSURE-SENSITIVE areas (creates relief/concavity in socket)',
            'Adding plaster to model = socket pushes INTO that area (loads it)',
            'Removing plaster from model = socket has MORE ROOM at that area (relieves it)',
            'This is counter-intuitive: add to load, remove to relieve',
            'Total contact maintained for even pressure distribution',
            'Smooth transitions between modified areas to prevent pressure points',
          ],
        ),
        PearlBlock(
          'Board Pearl',
          'Remember: modifications are made to the POSITIVE model. ADD plaster '
          'over pressure-TOLERANT areas so the socket will push into those areas. '
          'REMOVE plaster over pressure-SENSITIVE areas so the socket provides '
          'relief. Think: "Add to load, remove to relieve."',
        ),

        // --- Draping/Vacuum Forming ---
        HeaderBlock('Draping & Vacuum Forming'),
        BulletCardBlock(
          title: 'Thermoplastic Draping / Vacuum Forming',
          themeColor: Colors.teal,
          backgroundColor: const Color(0xFF152A27),
          points: [
            'Heat thermoplastic sheet in oven to softening temperature',
            'Drape heated sheet over the modified positive model',
            'Apply vacuum through model to pull plastic intimately against model surface',
            'Vacuum pump connected to holes drilled in base of plaster model',
            'Plastic conforms to all contours of the rectified model',
            'Allow to cool completely before removing from model',
            'Trim excess material and smooth edges',
            'Used for: AFOs, KAFOs, prosthetic sockets (thermoplastic)',
            'Blister forming: variation using positive pressure rather than vacuum',
          ],
        ),

        // --- Lamination ---
        HeaderBlock('Lamination'),
        BulletCardBlock(
          title: 'Resin Lamination Process',
          themeColor: Colors.deepPurple,
          backgroundColor: const Color(0xFF1F1A2E),
          points: [
            'Used to create thermoset (permanent) prosthetic sockets and frames',
            'Wrap layers of reinforcement fabric over the positive model',
            'Reinforcement layers: fiberglass stockinette, carbon fiber, nyglass',
            'Layup schedule: specific sequence and number of fabric layers',
            'More layers = stronger but heavier and thicker',
            'Enclose in PVA (polyvinyl alcohol) bag to create sealed envelope',
            'Pour catalyzed resin (acrylic or polyester) into the bag',
            'Apply vacuum to pull resin through all fabric layers evenly',
            'Exothermic reaction: resin cures and hardens (irreversible)',
            'Remove from model, trim, smooth, and finish',
            'Final product is rigid, strong, and cannot be remolded',
          ],
        ),
        TableBlock(
          title: 'Lamination Reinforcement Materials',
          columns: ['Material', 'Properties', 'Use'],
          rows: [
            ['Fiberglass stockinette', 'Moderate strength, good resin absorption',
                'Standard socket reinforcement'],
            ['Carbon fiber', 'High strength, lightweight, stiff',
                'High-performance sockets, specific reinforcement'],
            ['Nyglass (nylon)', 'Flexible, cosmetic, smooth finish',
                'Inner and outer cosmetic layers'],
            ['Perlon', 'Fine weave, smooth inner surface',
                'First layer against skin (comfort)'],
            ['Spectra/Dyneema', 'Very high tensile strength, impact resistant',
                'Impact-critical areas, pediatric sockets'],
          ],
          headerColor: Colors.deepPurple,
        ),

        // --- CAD/CAM ---
        HeaderBlock('CAD/CAM & Digital Fabrication'),
        ComparisonCardBlock(
          title: 'CAD/CAM Fabrication',
          themeColor: Colors.indigo,
          backgroundColor: const Color(0xFF1A1D2E),
          icon: Icons.computer,
          description: 'Computer-Aided Design / Computer-Aided Manufacturing. Digital '
              'technology replaces manual casting and modification with scanning, '
              'software modification, and CNC carving of the positive model.',
          keyPoints: [
            'Digital scanning: optical or laser scanner captures limb shape',
            'Replaces plaster casting with digital negative',
            'CAD software: rectification done digitally on screen',
            'CNC carving: automated router carves positive model from foam block',
            'Advantages: reproducibility, remote fabrication, digital records',
            'Can email digital file to central fabrication facility',
            'Faster turnaround for replacement devices',
            'Eliminates need to store physical plaster models',
            'Limitations: learning curve, scanner accuracy on irregular surfaces',
          ],
        ),

        // --- 3D Printing ---
        ComparisonCardBlock(
          title: '3D Printing (Additive Manufacturing)',
          themeColor: Colors.green,
          backgroundColor: const Color(0xFF152A1A),
          icon: Icons.view_in_ar,
          description: 'Emerging technology that builds devices layer-by-layer from '
              'digital files. Shows promise for rapid prototyping, custom designs, '
              'and remote/underserved populations but is not yet standard of care.',
          keyPoints: [
            'FDM (Fused Deposition Modeling): most common, melted plastic filament',
            'SLS (Selective Laser Sintering): laser fuses powder layers, stronger parts',
            'Materials: PLA, ABS, nylon, PETG, TPU (flexible)',
            'Advantages: rapid prototyping, complex geometries, customization',
            'Advantages: potentially lower cost, good for remote areas',
            'Limitations: material strength may be inferior to traditional fabrication',
            'Limitations: layer adhesion creates anisotropic weakness',
            'Limitations: not yet FDA-cleared for all definitive devices',
            'Current use: cosmetic covers, trial sockets, pediatric devices, adaptive equipment',
            'Active research area: prosthetic sockets, AFOs, hands',
          ],
        ),

        // --- Check Socket ---
        HeaderBlock('Check (Diagnostic) Socket'),
        BulletCardBlock(
          title: 'Check Socket Fabrication & Purpose',
          themeColor: Colors.red,
          backgroundColor: const Color(0xFF2A1519),
          points: [
            'Transparent or translucent test socket for fitting evaluation',
            'Made from clear thermoplastic (PETG or acrylic)',
            'Allows visual inspection of tissue contact and pressure areas',
            'Can see blanching (white areas = excessive pressure)',
            'Can see redness (irritation or excessive friction)',
            'Can see gaps (areas of poor contact)',
            'Modifications marked directly on the check socket',
            'Definitive socket fabricated only after satisfactory check socket fit',
            'Essential step before laminating final thermoset socket',
          ],
        ),
        PearlBlock(
          'Board Pearl',
          'CAD/CAM enables remote fabrication and reproducibility of prosthetic '
          'and orthotic devices. 3D printing is an emerging technology with '
          'promise for rapid prototyping and custom designs but is not yet the '
          'standard of care for definitive prosthetic and orthotic devices.',
        ),
      ],
    ),
  ],
);

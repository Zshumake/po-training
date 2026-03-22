import 'package:flutter/material.dart';
import '../models/topic_content_model.dart';

final ueProstheticsContent = TopicData(
  id: 'ue_prosthetics',
  title: 'Upper Extremity Prosthetics',
  tabs: [
    // ─────────────────────────────────────────────
    // TAB 1: Terminal Devices
    // ─────────────────────────────────────────────
    TopicTab(
      title: 'Terminal Devices',
      blocks: [
        HeaderBlock('Terminal Devices (TDs)'),
        TextBlock(
          'The terminal device is the most distal component of the upper extremity '
          'prosthesis. It is the primary tool for grasping and manipulating objects. '
          'Terminal devices range from simple passive cosmetic hands to sophisticated '
          'multi-articulating myoelectric hands with multiple grip patterns.',
          isIntro: true,
        ),

        // --- Passive TDs ---
        HeaderBlock('Passive Terminal Devices'),
        BulletCardBlock(
          title: 'Passive (Non-Functional) Terminal Devices',
          themeColor: Colors.blueGrey,
          backgroundColor: const Color(0xFFECEFF1),
          points: [
            'Cosmetic hand: realistic appearance, silicone glove cover, NO prehensile function',
            'Passive mitt: flexible, padded, used for sports and recreational activities',
            'Specialty passive devices: adapters for tools (gym, cycling, fishing, guitar)',
            'Primarily for cosmetic restoration and passive object stabilization',
            'Lightest weight of all terminal device categories',
            'Often chosen by patients who decline functional prostheses',
          ],
        ),

        // --- Body-Powered TDs ---
        HeaderBlock('Body-Powered Terminal Devices'),
        ComparisonCardBlock(
          title: 'Voluntary Opening (VO)',
          themeColor: Colors.blue,
          backgroundColor: const Color(0xFFE3F2FD),
          icon: Icons.open_in_full,
          description: 'The MOST COMMON body-powered terminal device. Rubber bands '
              'or springs hold the TD in a closed (grasping) position at rest. '
              'Cable activation (pull) opens the TD against spring/band resistance. '
              'Releasing cable tension allows bands to close the TD.',
          keyPoints: [
            'Closed at rest by rubber bands or springs',
            'Cable pull OPENS the device',
            'Pinch force determined by number of rubber bands (~1 lb per band)',
            'MOST COMMON body-powered TD on boards',
            'Patient must generate CONTINUOUS force to control prehension amount',
            'Adding more bands = more pinch force BUT harder to open',
            'Constant grip maintained without effort (bands hold it closed)',
            'Examples: Hosmer Model 5, 5XA, 555 hook',
          ],
        ),
        ComparisonCardBlock(
          title: 'Voluntary Closing (VC)',
          themeColor: Colors.teal,
          backgroundColor: const Color(0xFFE0F2F1),
          icon: Icons.close_fullscreen,
          description: 'Open at rest; cable pull CLOSES the device. Provides a more '
              'physiological grasp pattern because prehensile force equals the '
              'patient\'s pull force, giving proportional sensory feedback.',
          keyPoints: [
            'Open at rest (no springs/bands holding it closed)',
            'Cable pull CLOSES the device',
            'More physiological grasp: force = patient\'s pull force',
            'Better sensory feedback (proportional to grip effort)',
            'Disadvantage: must MAINTAIN pull force for sustained grasp',
            'Fatiguing for prolonged holding tasks',
            'Examples: TRS Grip, APRL VC hook',
          ],
        ),
        PearlBlock(
          'Board Pearl',
          'VO is the most commonly prescribed body-powered TD. VC provides a more '
          'physiological grasp with better proprioceptive feedback, but the patient '
          'must maintain cable tension to sustain grip. VO maintains grip without '
          'effort because rubber bands hold it closed.',
        ),

        // --- Hooks vs Hands ---
        HeaderBlock('Hooks vs Prosthetic Hands'),
        TableBlock(
          title: 'Hook vs Hand Terminal Devices',
          columns: ['Feature', 'Hook', 'Hand'],
          rows: [
            ['Weight', 'Lighter', 'Heavier'],
            ['Visibility of grasp', 'Excellent (open design)', 'Limited (fingers obscure)'],
            ['Precision', 'Better for fine tasks', 'Less precise'],
            ['Cosmesis', 'Poor', 'Better (cosmetic glove)'],
            ['Durability', 'Very durable', 'Glove tears easily'],
            ['Pinch type', 'Lateral/tip pinch', 'Three-jaw chuck pinch'],
            ['Patient acceptance', 'Some resistance to appearance', 'Preferred for cosmesis'],
            ['Cost', 'Lower', 'Higher (glove replacement)'],
          ],
          headerColor: Colors.indigo,
        ),
        BulletCardBlock(
          title: 'Prosthetic Hand Prehension',
          themeColor: Colors.deepPurple,
          backgroundColor: const Color(0xFFEDE7F6),
          points: [
            'Three-jaw chuck pinch: thumb opposes index and middle fingers',
            'Ring and small fingers are passive (do not actively participate)',
            'Cosmetic glove (PVC or silicone) covers the hand mechanism',
            'Glove susceptible to staining and tearing',
            'Available in body-powered and externally powered versions',
          ],
        ),

        // --- Externally Powered TDs ---
        HeaderBlock('Externally Powered Terminal Devices'),
        BulletCardBlock(
          title: 'Myoelectric Hands & Electric Hooks',
          themeColor: Colors.orange,
          backgroundColor: const Color(0xFFFFF3E0),
          points: [
            'Powered by rechargeable battery housed in the prosthesis',
            'Controlled by surface EMG electrodes on residual limb muscles',
            'Myoelectric hands: Ottobock System Electric, i-Limb (Ossur), bebionic (Ottobock)',
            'Electric hooks: available but less commonly prescribed than hands',
            'Stronger grip force than body-powered devices (up to 25-30 lbs)',
            'No harness required for operation (though suspension may still be needed)',
          ],
        ),
        BulletCardBlock(
          title: 'Multi-Articulating ("Smart") Hands',
          themeColor: Colors.purple,
          backgroundColor: const Color(0xFFF3E5F5),
          points: [
            'Individually powered digits allow multiple grip patterns',
            'Power grip: all fingers wrap around object',
            'Key (lateral) grip: thumb presses against side of index finger',
            'Tip pinch: thumb opposes index fingertip',
            'Point/index point: index finger extends for typing, pressing buttons',
            'Tripod pinch: thumb, index, and middle finger opposition',
            'Grip mode selected by co-contraction or pattern recognition',
            'Examples: i-Limb Quantum, bebionic hand, TASKA hand',
          ],
        ),
        PearlBlock(
          'Board Pearl',
          'Multi-articulating hands represent the current state of the art in UE '
          'prosthetics. They offer multiple grip patterns selected through '
          'co-contraction switching or pattern recognition. However, they remain '
          'expensive, heavier than body-powered options, and require battery charging.',
        ),
      ],
    ),

    // ─────────────────────────────────────────────
    // TAB 2: Cable & Control Systems
    // ─────────────────────────────────────────────
    TopicTab(
      title: 'Cable & Control Systems',
      blocks: [
        HeaderBlock('Cable & Control Systems'),
        TextBlock(
          'Body-powered prostheses use cable systems to transmit body motion to '
          'operate the terminal device and/or elbow unit. The type of cable system '
          'depends on the amputation level. Understanding these systems is essential '
          'for board preparation.',
          isIntro: true,
        ),

        // --- Single-Control ---
        ComparisonCardBlock(
          title: 'Single-Control Cable System (Bowden Cable)',
          themeColor: Colors.blue,
          backgroundColor: const Color(0xFFE3F2FD),
          icon: Icons.cable,
          description: 'Used for TRANSRADIAL prostheses. One cable controls one '
              'function: terminal device operation. The cable runs through a '
              'flexible housing (Bowden cable) from the harness to the TD.',
          keyPoints: [
            'One cable, one function: operates the terminal device only',
            'Used for transradial (below-elbow) prostheses',
            'No elbow control needed (anatomic elbow intact)',
            'Body motions to activate: glenohumeral flexion + biscapular abduction',
            'Cable excursion ~2 inches needed for full TD opening',
            'Cable housing provides the reaction point (anchor)',
            'Bowden cable: inner cable slides through outer housing',
          ],
        ),

        // --- Dual-Control ---
        ComparisonCardBlock(
          title: 'Dual-Control Cable System (Fair-Lead)',
          themeColor: Colors.teal,
          backgroundColor: const Color(0xFFE0F2F1),
          icon: Icons.settings_input_component,
          description: 'Used for TRANSHUMERAL prostheses. A single cable serves '
              'two functions depending on the state of the elbow lock: when the '
              'elbow is UNLOCKED, cable pull flexes the elbow; when the elbow is '
              'LOCKED, cable pull operates the TD.',
          keyPoints: [
            'One cable, TWO functions (elbow flexion OR TD operation)',
            'Used for transhumeral (above-elbow) prostheses',
            'Elbow UNLOCKED: cable pull = elbow flexion',
            'Elbow LOCKED: cable pull = TD operation',
            'Fair-lead cable: no housing over elbow, cable runs freely',
            'Separate cable/strap for elbow lock/unlock mechanism',
            'Body motions: glenohumeral flexion + biscapular abduction',
          ],
        ),

        // --- Elbow Lock ---
        BulletCardBlock(
          title: 'Elbow Lock/Unlock Mechanism',
          themeColor: Colors.orange,
          backgroundColor: const Color(0xFFFFF3E0),
          points: [
            'Alternating locking mechanism: toggles between locked and unlocked',
            'Activation motion: shoulder depression + extension + abduction',
            'Mnemonic: "Down, Back, Out" = depression, extension, abduction',
            'Each activation toggles the state (lock → unlock → lock)',
            'Must lock elbow at desired position before operating TD',
            'Elbow positions can be locked at multiple preset angles',
          ],
        ),
        MnemonicBlock(
          'Elbow Lock: "Down, Back, Out"',
          'Depression, Extension, Abduction of the shoulder activates the '
          'alternating elbow lock mechanism in transhumeral prostheses. This '
          'toggles between locked (for TD operation) and unlocked (for elbow flexion).',
        ),

        // --- Dual-Control Table ---
        TableBlock(
          title: 'Dual-Control Cable System Functions (Transhumeral)',
          columns: ['Function', 'Elbow State', 'Body Motion', 'Cable Mechanism'],
          rows: [
            ['Elbow flexion', 'UNLOCKED', 'GH flexion + biscapular abduction',
                'Cable pull flexes elbow via fair-lead'],
            ['Lock/unlock elbow', 'Any', 'Shoulder depression + extension + abduction',
                'Separate strap activates alternator lock'],
            ['TD operation', 'LOCKED', 'GH flexion + biscapular abduction',
                'Same cable now pulls TD (elbow is fixed)'],
            ['Elbow extension', 'UNLOCKED', 'Gravity or manual positioning',
                'No cable-powered extension (gravity-assisted)'],
          ],
          headerColor: Colors.deepOrange,
        ),

        // --- Harness Systems ---
        HeaderBlock('Harness Systems'),
        ComparisonCardBlock(
          title: 'Figure-8 (O-Ring) Harness',
          themeColor: Colors.indigo,
          backgroundColor: const Color(0xFFE8EAF6),
          icon: Icons.all_inclusive,
          description: 'The MOST COMMONLY used harness for body-powered UE prostheses. '
              'Named for its figure-8 configuration across the upper back. The '
              'axilla loop on the sound side serves as the primary reaction point.',
          keyPoints: [
            'Most common harness for body-powered UE prostheses',
            'Axilla loop encircles the contralateral (sound) axilla',
            'Axilla loop = reaction point (anchor) for cable pull',
            'Control attachment strap connects to cable system',
            'Anterior support strap suspends the prosthesis',
            'Inverted-Y strap configuration on prosthetic side',
            'Used for both transradial and transhumeral levels',
          ],
        ),
        ComparisonCardBlock(
          title: 'Figure-9 Harness',
          themeColor: Colors.green,
          backgroundColor: const Color(0xFFE8F5E9),
          icon: Icons.looks_3,
          description: 'A lighter, simpler harness used when the socket is self-suspending '
              '(e.g., Muenster socket for transradial). Eliminates the anterior '
              'suspension strap because the socket provides its own suspension.',
          keyPoints: [
            'Lighter and simpler than figure-8',
            'Used with self-suspending sockets (Muenster, Northwestern)',
            'No anterior suspension strap needed (socket self-suspends)',
            'Still has axilla loop as reaction point',
            'Only provides cable operation function',
            'Better cosmesis due to fewer straps',
          ],
        ),
        BulletCardBlock(
          title: 'Chest Strap with Shoulder Saddle',
          themeColor: Colors.red,
          backgroundColor: const Color(0xFFFFEBEE),
          points: [
            'Used when patient cannot tolerate axillary pressure',
            'For heavy-duty lifting requiring greater stability',
            'For bilateral UE amputees',
            'Shoulder saddle distributes force over larger area',
            'Chest strap wraps around thorax for anchor point',
            'Less commonly used than figure-8 or figure-9',
          ],
        ),
        PearlBlock(
          'Board Pearl',
          'The figure-8 harness is the most commonly used harness for body-powered '
          'UE prostheses. The dual-control cable system is used for transhumeral '
          'prostheses, where one cable serves two functions based on elbow lock state.',
        ),
      ],
    ),

    // ─────────────────────────────────────────────
    // TAB 3: Myoelectric Control
    // ─────────────────────────────────────────────
    TopicTab(
      title: 'Myoelectric Control',
      blocks: [
        HeaderBlock('Myoelectric Control Systems'),
        TextBlock(
          'Myoelectric prostheses use surface electrodes placed on the residual '
          'limb to detect electromyographic (EMG) signals from voluntary muscle '
          'contractions. These signals are amplified and processed to control '
          'motorized prosthetic components.',
          isIntro: true,
        ),

        // --- Control Strategies ---
        HeaderBlock('Control Strategies'),
        ComparisonCardBlock(
          title: 'Digital (On/Off) Control',
          themeColor: Colors.blue,
          backgroundColor: const Color(0xFFE3F2FD),
          icon: Icons.toggle_on,
          description: 'Threshold-based control: when the EMG signal exceeds a preset '
              'threshold, the motor activates at full speed. Below threshold = no '
              'movement. Simplest form of myoelectric control.',
          keyPoints: [
            'Signal must exceed preset threshold to activate motor',
            'Motor runs at constant speed (full on or full off)',
            'No speed or force modulation',
            'Simplest control strategy to learn',
            'Adequate for basic grip tasks',
            'Less refined object manipulation',
          ],
        ),
        ComparisonCardBlock(
          title: 'Proportional Control',
          themeColor: Colors.teal,
          backgroundColor: const Color(0xFFE0F2F1),
          icon: Icons.speed,
          description: 'Signal strength proportionally controls motor speed and force. '
              'Stronger muscle contraction = faster movement and stronger grip. '
              'Provides more natural and refined control.',
          keyPoints: [
            'Motor speed proportional to EMG signal strength',
            'Gentle contraction = slow, gentle grip',
            'Strong contraction = fast, powerful grip',
            'More intuitive and natural feeling control',
            'Better for delicate object manipulation',
            'Requires more muscle training and coordination',
          ],
        ),

        // --- Two-Site Control ---
        BulletCardBlock(
          title: 'Two-Site Electrode Control',
          themeColor: Colors.deepPurple,
          backgroundColor: const Color(0xFFEDE7F6),
          points: [
            'Two independent electrode sites on residual limb',
            'Each electrode controls one direction of movement',
            'Transradial example: wrist extensors = OPEN TD, wrist flexors = CLOSE TD',
            'Transhumeral: biceps = close/flex, triceps = open/extend',
            'Most common myoelectric control configuration',
            'Requires independent muscle control of two sites',
            'Antagonistic muscle pairs provide intuitive control',
          ],
        ),

        // --- Advanced Control ---
        HeaderBlock('Advanced Control Strategies'),
        BulletCardBlock(
          title: 'Co-Contraction Switching',
          themeColor: Colors.orange,
          backgroundColor: const Color(0xFFFFF3E0),
          points: [
            'Simultaneous contraction of both muscle sites triggers mode switch',
            'Used to toggle between grip patterns in multi-articulating hands',
            'Example: co-contract to switch from power grip to key grip',
            'Quick burst of simultaneous contraction = switch signal',
            'Sequential switching through available grip modes',
            'Requires practice to execute reliably without accidental triggers',
          ],
        ),
        BulletCardBlock(
          title: 'Pattern Recognition',
          themeColor: Colors.purple,
          backgroundColor: const Color(0xFFF3E5F5),
          points: [
            'Multiple EMG electrodes (6-8+) capture complex muscle activation patterns',
            'Algorithms classify intended movement from combined signal patterns',
            'More intuitive: patient thinks of desired movement, system recognizes it',
            'Multiple simultaneous degrees of freedom possible',
            'Calibration session required: patient performs target movements',
            'Machine learning adapts to individual muscle patterns',
            'Eliminates need for co-contraction switching',
            'Examples: Coapt COMPLETE CONTROL system',
          ],
        ),

        // --- TMR ---
        ComparisonCardBlock(
          title: 'Targeted Muscle Reinnervation (TMR)',
          themeColor: Colors.red,
          backgroundColor: const Color(0xFFFFEBEE),
          icon: Icons.psychology,
          description: 'Surgical procedure in which residual nerves from the amputated '
              'limb are transferred to new muscle targets (typically pectoralis '
              'or other chest/arm muscles). When the patient thinks about moving '
              'the missing hand, the reinnervated muscles contract, creating '
              'additional independent EMG control sites.',
          keyPoints: [
            'Nerves surgically transferred to new (denervated) muscle targets',
            'Creates additional myoelectric control sites',
            'More intuitive control: thinking about hand movement activates correct muscles',
            'Developed by Dr. Todd Kuiken at RIC (now SRALAB)',
            'Most beneficial for high-level amputations (transhumeral, shoulder)',
            'Can also reduce neuroma and phantom limb pain',
            'Enables simultaneous multi-joint control with pattern recognition',
            'May be combined with RPNI (Regenerative Peripheral Nerve Interface)',
          ],
        ),

        // --- Comparison Table ---
        HeaderBlock('Body-Powered vs Myoelectric Comparison'),
        TableBlock(
          title: 'Body-Powered vs Myoelectric Prostheses (Table 6-8 Cuccurullo)',
          columns: ['Feature', 'Body-Powered', 'Myoelectric'],
          rows: [
            ['Weight', 'Lighter', 'Heavier (motor + battery)'],
            ['Grip strength', 'Limited (~5-8 lbs with VO)', 'Stronger (up to 25-30 lbs)'],
            ['Cosmesis', 'Poor (harness, hook visible)', 'Better (no harness, hand-like)'],
            ['Proprioceptive feedback', 'Better (cable tension = force feedback)', 'Less (no direct force feedback)'],
            ['Harness required', 'Yes (figure-8 or figure-9)', 'No (for TD operation)'],
            ['Durability', 'More durable, fewer repairs', 'Less durable, more maintenance'],
            ['Cost', 'Lower', 'Significantly higher'],
            ['Battery', 'Not required', 'Required (must charge regularly)'],
            ['Moisture tolerance', 'Good (can get wet)', 'Poor (electronics sensitive to moisture)'],
            ['Repair cost', 'Low', 'High (electronic components)'],
            ['Fine motor control', 'Good with hook', 'Good with proportional control'],
            ['Donning/doffing', 'Harness can be difficult', 'Simpler (no harness for most)'],
            ['Bilateral use', 'Possible but complex', 'Better for bilateral fittings'],
          ],
          headerColor: Colors.blueGrey,
        ),
        PearlBlock(
          'Board Pearl',
          'Body-powered prostheses offer BETTER proprioceptive feedback because '
          'cable tension provides direct force sensation. Myoelectric prostheses '
          'offer better cosmesis and stronger grip force but lack direct sensory '
          'feedback, are heavier, more expensive, and less durable.',
        ),

        // --- Advantages/Disadvantages ---
        BulletCardBlock(
          title: 'Myoelectric Advantages',
          themeColor: Colors.green,
          backgroundColor: const Color(0xFFE8F5E9),
          points: [
            'Better cosmesis (no harness, hand-like appearance)',
            'No harness needed for TD operation',
            'Stronger grip force (motorized)',
            'Less compensatory body motion required',
            'Better for bilateral amputees',
            'Multiple grip patterns available (multi-articulating hands)',
          ],
        ),
        BulletCardBlock(
          title: 'Myoelectric Disadvantages',
          themeColor: Colors.red,
          backgroundColor: const Color(0xFFFFEBEE),
          points: [
            'Heavier (motors, battery, electronics)',
            'Significantly more expensive',
            'Less durable, higher repair costs',
            'Battery dependent (must recharge)',
            'Less sensory/proprioceptive feedback',
            'Moisture sensitive (cannot submerge in water)',
            'Slower response time compared to body-powered',
            'Requires sufficient muscle signal strength for control',
          ],
        ),
      ],
    ),

    // ─────────────────────────────────────────────
    // TAB 4: Amputation Level Components
    // ─────────────────────────────────────────────
    TopicTab(
      title: 'Amputation Level Components',
      blocks: [
        HeaderBlock('Components by Amputation Level'),
        TextBlock(
          'Each upper extremity amputation level requires specific prosthetic '
          'components. The more proximal the amputation, the more components and '
          'control systems are needed, and the more complex the prosthesis becomes. '
          'Higher-level amputations have greater functional loss and lower prosthetic '
          'utilization rates.',
          isIntro: true,
        ),

        // --- Transradial ---
        HeaderBlock('Transradial (Below-Elbow)'),
        BulletCardBlock(
          title: 'Transradial Components',
          themeColor: Colors.blue,
          backgroundColor: const Color(0xFFE3F2FD),
          points: [
            'Socket: interfaces with forearm residual limb',
            'Elbow hinge: flexible (Dacron) or rigid (metal) connects socket to upper arm cuff',
            'Upper arm cuff (triceps pad): provides proximal anchor and reaction point',
            'Harness: figure-8 or figure-9 (if self-suspending socket)',
            'Single-control (Bowden) cable: operates TD',
            'Wrist unit: connects TD to forearm section, may allow pronation/supination',
            'Terminal device: hook or hand',
          ],
        ),
        ComparisonCardBlock(
          title: 'Transradial Socket Types',
          themeColor: Colors.indigo,
          backgroundColor: const Color(0xFFE8EAF6),
          icon: Icons.back_hand,
          description: 'Socket design depends on residual limb length. The socket extends '
              'to the olecranon posteriorly and the elbow crease anteriorly. Longer '
              'residual limbs are preferred for body-powered prostheses due to better '
              'lever arm and cable excursion.',
          keyPoints: [
            'Split socket (conventional): two-piece design, flexible inner / rigid outer',
            'Muenster socket: self-suspending, intimate fit above epicondyles, limits flexion/extension',
            'Northwestern University socket: similar to Muenster, slightly less restrictive',
            'Socket extends posteriorly to olecranon, anteriorly to elbow crease',
            'Long transradial: preferred for body-powered (better lever arm)',
            'Short transradial: may need supracondylar suspension, consider myoelectric',
            'Very short transradial: may need step-up hinges to increase excursion',
          ],
        ),

        // --- Transhumeral ---
        HeaderBlock('Transhumeral (Above-Elbow)'),
        BulletCardBlock(
          title: 'Transhumeral Components',
          themeColor: Colors.teal,
          backgroundColor: const Color(0xFFE0F2F1),
          points: [
            'Socket: interfaces with upper arm residual limb',
            'Elbow unit: internal or external mechanical elbow joint',
            'Forearm section: houses components distal to elbow',
            'Turntable: allows passive internal/external humeral rotation',
            'Harness: figure-8 most common',
            'Dual-control cable system: operates elbow (unlocked) or TD (locked)',
            'Elbow lock cable/strap: separate control for alternating lock',
            'Wrist unit: connects TD to forearm',
            'Terminal device: hook or hand',
          ],
        ),
        TableBlock(
          title: 'Elbow Unit Selection',
          columns: ['Type', 'Indication', 'Advantages', 'Disadvantages'],
          rows: [
            ['Internal elbow', 'Residual limb >4 cm proximal to epicondyles',
                'Better cosmesis; simulated anatomic joint center',
                'Requires adequate residual limb length'],
            ['External elbow (hinges)', 'Short transhumeral or elbow disarticulation',
                'Accommodates short limbs; external mechanism accessible',
                'Bulkier; less cosmetic; wider elbow profile'],
          ],
          headerColor: Colors.teal,
        ),
        BulletCardBlock(
          title: 'Transhumeral Key Concepts',
          themeColor: Colors.orange,
          backgroundColor: const Color(0xFFFFF3E0),
          points: [
            'Internal elbow joint: preferred when residual limb length permits',
            'External elbow joint: for short residual limbs where internal housing not feasible',
            'Turntable: positioned between socket and elbow, allows passive humeral rotation',
            'Elbow flexion: cable-powered (body-powered) or motor-powered (myoelectric)',
            'Elbow extension: passive (gravity-assisted) in body-powered systems',
            'Forearm lift assist: spring mechanism reduces cable force needed for elbow flexion',
            'Longer residual limb = better lever arm and rotational control',
          ],
        ),

        // --- Elbow Disarticulation ---
        HeaderBlock('Elbow Disarticulation'),
        BulletCardBlock(
          title: 'Elbow Disarticulation Features',
          themeColor: Colors.deepPurple,
          backgroundColor: const Color(0xFFEDE7F6),
          points: [
            'Amputation through the elbow joint (preserves full humeral length)',
            'Variation of transhumeral prosthetic design',
            'Flat distal end of socket conforms to humeral epicondyles',
            'Self-suspending: epicondyles provide natural suspension',
            'No internal elbow room: must use external (outside-locking) hinges',
            'Excellent rotational control due to full humeral length',
            'Cosmetic concern: external hinges add width at elbow',
            'Better proprioception than shorter transhumeral levels',
          ],
        ),

        // --- Shoulder Disarticulation & Forequarter ---
        HeaderBlock('Shoulder Disarticulation & Forequarter'),
        BulletCardBlock(
          title: 'Shoulder Disarticulation & Forequarter Amputation',
          themeColor: Colors.red,
          backgroundColor: const Color(0xFFFFEBEE),
          points: [
            'Shoulder disarticulation: removal of entire upper extremity at glenohumeral joint',
            'Forequarter (interscapulothoracic): removal including scapula and clavicle',
            'Socket extends onto thorax for suspension and stability',
            'Most common: passive cosmetic prosthesis (restoration only)',
            'Functional body-powered prosthesis extremely difficult to operate',
            'Cable excursion achieved by chest expansion, scapular motion, or chin nudge',
            'Myoelectric with TMR may improve functional outcomes',
            'Highest rejection rate of all UE amputation levels',
            'Prosthetic weight and effort often exceed functional benefit',
          ],
        ),

        // --- Summary Table ---
        TableBlock(
          title: 'UE Prosthetic Components by Amputation Level',
          columns: ['Component', 'Transradial', 'Transhumeral', 'Shoulder Disart.'],
          rows: [
            ['Cable system', 'Single-control (Bowden)', 'Dual-control (fair-lead)', 'Dual-control + excursion amplifier'],
            ['Harness', 'Figure-8 or Figure-9', 'Figure-8', 'Chest strap / modified figure-8'],
            ['Elbow', 'Anatomic (hinge assist)', 'Mechanical (internal/external)', 'Mechanical + passive shoulder'],
            ['Control motions', 'GH flexion + biscapular abd.', 'Same + shoulder dep/ext/abd for lock', 'Chest expansion, chin nudge'],
            ['Prosthetic joints', '1 (wrist)', '2 (elbow + wrist)', '3 (shoulder + elbow + wrist)'],
            ['Complexity', 'Low', 'Moderate', 'High'],
            ['Functional outcome', 'Best', 'Good', 'Limited'],
          ],
          headerColor: Colors.blueGrey,
        ),
        PearlBlock(
          'Board Pearl',
          'Transradial is the most common UE amputation level. A longer forearm '
          'residual limb is preferred for body-powered prostheses because it '
          'provides a better lever arm and more cable excursion. The more '
          'proximal the amputation, the more components needed and the lower '
          'the functional outcome and acceptance rate.',
        ),
      ],
    ),
  ],
);

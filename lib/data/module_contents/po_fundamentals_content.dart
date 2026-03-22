import 'package:flutter/material.dart';
import '../models/topic_content_model.dart';

final poFundamentalsContent = TopicData(
  id: 'po_fundamentals',
  title: 'P&O Fundamentals',
  tabs: [
    // ─────────────────────────────────────────────
    // TAB 1: Terminology
    // ─────────────────────────────────────────────
    TopicTab(
      title: 'Terminology',
      blocks: [
        HeaderBlock('Gait Cycle Terminology'),
        TextBlock(
          'The gait cycle is the fundamental unit of walking, defined as the '
          'interval between two successive initial contacts of the same foot. '
          'Understanding these definitions is essential for board review.',
          isIntro: true,
        ),
        BulletCardBlock(
          title: 'Key Definitions',
          themeColor: Colors.blue,
          backgroundColor: const Color(0xFFE3F2FD),
          points: [
            'Gait cycle (stride): interval from initial contact of one foot to next initial contact of the SAME foot',
            'Step: interval from initial contact of one foot to initial contact of the OPPOSITE foot',
            'Stride length: distance covered in one full gait cycle (average ~1.4 m)',
            'Step length: distance from heel of one foot to heel of opposite foot at initial contact',
            'Cadence: number of steps per unit time (average ~113 steps/min)',
            'Walking velocity = cadence x step length',
            'Base of support (BOS): lateral distance between two feet during gait (~5-10 cm)',
          ],
        ),
        PearlBlock(
          'Board Pearl',
          'Stride = 2 steps. Stride length is measured from heel to heel of the '
          'SAME foot. Step length is measured from heel to heel of OPPOSITE feet.',
        ),
        BulletCardBlock(
          title: 'Center of Gravity (COG)',
          themeColor: Colors.teal,
          backgroundColor: const Color(0xFFE0F2F1),
          points: [
            'Located 5 cm anterior to S2 vertebral body',
            'Vertical displacement: <5 cm (approximately 5 cm total excursion)',
            'Horizontal (lateral) displacement: <5 cm (approximately 5 cm total excursion)',
            'Lowest point: during double-limb support (loading response)',
            'Highest point: during single-limb support (midstance)',
            'COG follows a sinusoidal path in both vertical and horizontal planes',
          ],
        ),
        PearlBlock(
          'Board Pearl',
          'COG is LOWEST during loading response (double-limb support) and '
          'HIGHEST during midstance (single-limb support). This is a commonly '
          'tested concept.',
        ),
        BulletCardBlock(
          title: 'Normal Gait Parameters',
          themeColor: Colors.indigo,
          backgroundColor: const Color(0xFFE8EAF6),
          points: [
            'Comfortable walking speed: 80 m/min (approximately 3 mph)',
            'Normal cadence: ~113 steps/min',
            'Stance phase: 60% of gait cycle',
            'Swing phase: 40% of gait cycle',
            'Double-limb support: ~20% of gait cycle (two periods of ~10% each)',
            'Single-limb support: ~40% of gait cycle',
            'As speed increases, stance phase shortens and swing phase increases',
            'Running: no double-limb support; instead has a "float" phase',
          ],
        ),
        PearlBlock(
          'Board Pearl',
          'Double-limb support DECREASES with increasing gait speed and '
          'DISAPPEARS entirely in running. In pathologic gait, double-limb '
          'support time INCREASES to improve stability.',
        ),
      ],
    ),

    // ─────────────────────────────────────────────
    // TAB 2: Gait Cycle
    // ─────────────────────────────────────────────
    TopicTab(
      title: 'Gait Cycle',
      blocks: [
        HeaderBlock('Phases of the Gait Cycle'),
        TextBlock(
          'The gait cycle is divided into stance phase (60%) and swing phase (40%). '
          'Rancho Los Amigos terminology is the standard nomenclature used in '
          'rehabilitation medicine and is essential for board review.',
          isIntro: true,
        ),
        HeaderBlock('Stance Phase (60% of Gait Cycle)'),
        MnemonicBlock(
          'I Like My Tea Presweetened',
          'Initial contact, Loading response, Midstance, Terminal stance, Preswing '
          '-- the 5 subdivisions of stance phase.',
        ),
        NumberedListBlock([
          MapEntry(
            'Initial Contact (0-2%)',
            'Heel strikes the ground. Hip is flexed ~30 degrees, knee is extended, '
            'ankle is in neutral dorsiflexion. The pretibial muscles (tibialis anterior) '
            'eccentrically control plantarflexion. Heel rocker (first rocker) begins.',
          ),
          MapEntry(
            'Loading Response (2-12%)',
            'Period of initial double-limb support. Body weight transfers onto the '
            'stance limb. Knee flexes ~15 degrees (shock absorption). Ankle plantarflexes '
            'to foot flat. Quadriceps eccentrically control knee flexion. '
            'COG is at its LOWEST point.',
          ),
          MapEntry(
            'Midstance (12-31%)',
            'Begins when opposite foot lifts off (single-limb support begins). '
            'Body advances over the stationary foot. Ankle rocker (second rocker). '
            'Hip extends from flexion toward neutral. Gluteus medius stabilizes '
            'the pelvis. COG is at its HIGHEST point.',
          ),
          MapEntry(
            'Terminal Stance (31-50%)',
            'Heel rises off ground. Forefoot rocker (third rocker). Body advances '
            'anterior to the forefoot. Hip reaches maximum extension (~10 degrees). '
            'Ankle dorsiflexion peaks at ~10 degrees. Opposite leg contacts ground, '
            'ending single-limb support.',
          ),
          MapEntry(
            'Preswing (50-62%)',
            'Second period of double-limb support. Weight transfers to opposite limb. '
            'Rapid ankle plantarflexion (push-off via gastrocnemius/soleus). '
            'Knee flexes to ~35-40 degrees. Hip begins to flex. Sometimes called '
            '"toe off" in older terminology.',
          ),
        ]),
        HeaderBlock('Swing Phase (40% of Gait Cycle)'),
        MnemonicBlock(
          'In My Teapot',
          'Initial swing, Midswing, Terminal swing '
          '-- the 3 subdivisions of swing phase.',
        ),
        NumberedListBlock([
          MapEntry(
            'Initial Swing (62-75%)',
            'Foot lifts off ground. Hip flexors (iliopsoas) advance the limb. '
            'Knee flexes to maximum (~60 degrees) for ground clearance. '
            'Ankle dorsiflexes toward neutral.',
          ),
          MapEntry(
            'Midswing (75-87%)',
            'Limb passes directly beneath the body. Hip continues to flex. '
            'Knee begins to extend. Ankle dorsiflexes to neutral. Tibialis anterior '
            'maintains dorsiflexion for clearance.',
          ),
          MapEntry(
            'Terminal Swing (87-100%)',
            'Limb decelerates in preparation for next initial contact. Hamstrings '
            'eccentrically decelerate the swinging leg. Knee reaches full extension. '
            'Hip is flexed ~30 degrees. Ankle is in neutral dorsiflexion.',
          ),
        ]),
        TableBlock(
          title: 'Rocker Mechanisms of the Foot',
          columns: ['Rocker', 'Pivot Point', 'Phase', 'Motion'],
          rows: [
            ['First (Heel)', 'Heel', 'Initial contact', 'Ankle plantarflexion'],
            ['Second (Ankle)', 'Ankle', 'Midstance', 'Tibial advancement'],
            ['Third (Forefoot)', 'MTP joints', 'Terminal stance', 'Heel rise'],
          ],
          headerColor: Colors.blueGrey,
        ),
        PearlBlock(
          'Board Pearl',
          'Three rockers: Heel rocker (1st) at initial contact, Ankle rocker '
          '(2nd) at midstance, Forefoot rocker (3rd) at terminal stance. '
          'Loss of any rocker significantly impairs gait efficiency.',
        ),
      ],
    ),

    // ─────────────────────────────────────────────
    // TAB 3: Biomechanics
    // ─────────────────────────────────────────────
    TopicTab(
      title: 'Biomechanics',
      blocks: [
        HeaderBlock('Muscle Activity During the Gait Cycle'),
        TextBlock(
          'Understanding which muscles are active during each phase of gait is '
          'critical for analyzing gait deviations and prescribing appropriate '
          'orthotic and prosthetic interventions.',
          isIntro: true,
        ),
        TableBlock(
          title: 'Major Muscle Activity During Gait',
          columns: ['Muscle', 'Active Phase(s)', 'Action', 'Contraction Type'],
          rows: [
            ['Tibialis anterior', 'Initial contact, Loading response, Swing', 'Controls plantarflexion at IC; maintains dorsiflexion in swing', 'Eccentric (stance), Concentric (swing)'],
            ['Gastrocnemius/Soleus', 'Midstance, Terminal stance, Preswing', 'Controls tibial advancement; generates push-off power', 'Eccentric (mid), Concentric (pre)'],
            ['Quadriceps', 'Loading response, Terminal swing', 'Controls knee flexion at LR; extends knee at terminal swing', 'Eccentric (LR), Concentric (TS)'],
            ['Hamstrings', 'Terminal swing, Initial contact', 'Decelerates swinging leg; controls hip flexion', 'Eccentric'],
            ['Gluteus maximus', 'Initial contact, Loading response', 'Controls hip flexion; extends hip', 'Eccentric then concentric'],
            ['Gluteus medius', 'Midstance (single-limb support)', 'Stabilizes pelvis; prevents contralateral pelvic drop', 'Isometric/concentric'],
            ['Iliopsoas', 'Preswing, Initial swing', 'Initiates hip flexion for swing advancement', 'Concentric'],
            ['Hip adductors', 'Initial swing, Midswing', 'Stabilize swinging limb', 'Concentric'],
          ],
          headerColor: Colors.deepPurple,
        ),
        PearlBlock(
          'Board Pearl',
          'Tibialis anterior is active at BOTH ends of the gait cycle: eccentrically '
          'at initial contact/loading response to control foot slap, and concentrically '
          'during swing to maintain dorsiflexion for ground clearance.',
        ),
        BulletCardBlock(
          title: 'Joint Moments and Powers',
          themeColor: Colors.deepOrange,
          backgroundColor: const Color(0xFFFBE9E7),
          points: [
            'Ankle generates the largest power burst during gait (A2 power burst at push-off)',
            'Push-off generates ~80% of the energy for forward propulsion',
            'Hip extension moment in early stance prevents trunk from falling forward',
            'Knee flexion moment in loading response absorbs shock (K1 absorption)',
            'Hip flexion moment in preswing advances the limb into swing',
            'The ankle plantar flexors are the most important muscle group for normal gait',
          ],
        ),
        BulletCardBlock(
          title: 'Ground Reaction Force (GRF)',
          themeColor: Colors.green,
          backgroundColor: const Color(0xFFE8F5E9),
          points: [
            'GRF has three components: vertical, anterior-posterior, medial-lateral',
            'Vertical GRF shows M-shaped pattern with peaks at loading response and terminal stance',
            'First peak (F1): body weight acceptance at loading response (~110% body weight)',
            'Trough: occurs at midstance as COG is at highest point',
            'Second peak (F2): push-off at terminal stance (~110% body weight)',
            'GRF vector relationship to joint center determines internal joint moment',
          ],
        ),
        PearlBlock(
          'Board Pearl',
          'The M-shaped vertical GRF pattern with two peaks exceeding body weight '
          'and a trough at midstance is a classic board question. The trough occurs '
          'because COG is at its highest (potential energy peak) at midstance.',
        ),
      ],
    ),

    // ─────────────────────────────────────────────
    // TAB 4: Determinants of Gait
    // ─────────────────────────────────────────────
    TopicTab(
      title: 'Determinants of Gait',
      blocks: [
        HeaderBlock('Six Determinants of Gait'),
        TextBlock(
          'The six determinants of gait were described by Saunders, Inman, and '
          'Eberhart (1953). They minimize vertical and lateral excursion of the '
          'center of gravity, thereby reducing energy expenditure during walking. '
          'Without these determinants, the COG would follow an arc of much greater '
          'displacement.',
          isIntro: true,
        ),
        TableBlock(
          title: 'The 6 Determinants of Gait',
          columns: ['#', 'Determinant', 'Mechanism', 'Effect on COG'],
          rows: [
            ['1', 'Pelvic rotation', 'Pelvis rotates ~4 degrees forward on swing side', 'Raises lowest point of COG arc; reduces vertical displacement'],
            ['2', 'Pelvic tilt (list)', 'Swing-side pelvis drops ~5 degrees', 'Lowers highest point of COG arc; reduces vertical displacement'],
            ['3', 'Knee flexion in stance', 'Knee flexes ~15 degrees in loading response', 'Lowers highest point of COG arc; absorbs shock'],
            ['4', 'Foot mechanisms', 'Heel strike with ankle plantarflexion; ankle rocker', 'Smooths transition at initial contact; reduces abrupt COG descent'],
            ['5', 'Knee mechanisms', 'Knee and ankle coordinated flexion/extension', 'Smooths COG pathway at midstance transition'],
            ['6', 'Lateral displacement of pelvis', 'Relative adduction of femur narrows BOS', 'Reduces lateral COG excursion to ~5 cm total'],
          ],
          headerColor: Colors.teal,
        ),
        PearlBlock(
          'Board Pearl',
          'The 6 determinants function to minimize the excursion of the COG. '
          'Determinants 1-3 minimize VERTICAL displacement. Determinant 6 minimizes '
          'LATERAL displacement. This keeps the COG path as a smooth, low-amplitude '
          'sinusoidal wave.',
        ),
        BulletCardBlock(
          title: 'Clinical Significance',
          themeColor: Colors.orange,
          backgroundColor: const Color(0xFFFFF3E0),
          points: [
            'Loss of any determinant increases energy expenditure of gait',
            'Knee fusion eliminates determinant #3 (knee flexion in stance) and increases vertical COG excursion',
            'Ankle fusion eliminates determinant #4 (foot mechanisms) and disrupts heel and ankle rockers',
            'Hip abductor weakness eliminates effective pelvic tilt control',
            'Trendelenburg gait results from loss of pelvic stability (determinant #2)',
            'Prosthetic and orthotic design aims to restore as many determinants as possible',
          ],
        ),
        ComparisonCardBlock(
          title: 'Compass Gait (Without Determinants)',
          themeColor: Colors.red,
          backgroundColor: const Color(0xFFFFEBEE),
          icon: Icons.warning_amber_rounded,
          description: 'Without the 6 determinants, walking would resemble the arc of '
              'a compass with stiff legs, resulting in much greater COG displacement '
              'and dramatically increased energy expenditure.',
          keyPoints: [
            'Vertical COG displacement would be ~9.5 cm (vs ~5 cm with determinants)',
            'Abrupt directional changes at each step',
            'Each step would require lifting the entire body weight over a rigid lever',
            'Energy cost would be dramatically higher',
          ],
        ),
        BulletCardBlock(
          title: 'Pathologic Gait Compensations',
          themeColor: Colors.purple,
          backgroundColor: const Color(0xFFF3E5F5),
          points: [
            'Vaulting: rising on toes of stance limb to clear swing limb (compensates for limb length discrepancy or inadequate knee flexion)',
            'Circumduction: semicircular swing of leg (compensates for inability to shorten limb in swing)',
            'Hip hiking: elevation of pelvis on swing side (compensates for weak dorsiflexors or limb length discrepancy)',
            'Lateral trunk lean: leaning trunk over stance limb (compensates for hip abductor weakness)',
            'Steppage gait: exaggerated hip and knee flexion (compensates for foot drop)',
          ],
        ),
        PearlBlock(
          'Board Pearl',
          'Energy expenditure of gait increases whenever the smooth sinusoidal '
          'path of the COG is disrupted. Pathologic compensations themselves '
          'also increase energy cost. This is why prosthetic and orthotic design '
          'focuses on restoring normal gait determinants.',
        ),
      ],
    ),
  ],
);

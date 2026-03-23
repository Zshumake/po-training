import 'package:flutter/material.dart';
import '../models/topic_content_model.dart';

final specialPopulationsContent = TopicData(
  id: 'special_populations',
  title: 'Special Populations in Amputee Care',
  tabs: [
    // ─────────────────────────────────────────────
    // TAB 1: Dysvascular & Diabetic
    // ─────────────────────────────────────────────
    TopicTab(
      title: 'Dysvascular & Diabetic',
      blocks: [
        HeaderBlock('Dysvascular Amputation'),
        TextBlock(
          'Dysvascular disease (peripheral arterial disease and diabetes) is the '
          'leading cause of lower extremity amputation, accounting for 82% of all '
          'LE amputations. Diabetes contributes to approximately two-thirds of these '
          'cases. Understanding vascular assessment, diabetic foot management, and '
          'prosthetic modifications for this population is essential.',
          isIntro: true,
        ),
        BulletCardBlock(
          title: 'Dysvascular Amputation Epidemiology',
          themeColor: const Color(0xFFC62828),
          backgroundColor: const Color(0xFFFFEBEE),
          points: [
            'Dysvascular disease: #1 cause of LE amputation (82% of all LE amputations)',
            'Diabetes contributes to 2/3 of all LE amputations',
            '55% of diabetic amputees require contralateral amputation within 2-3 years',
            'Nearly 50% of dysvascular amputees die within 5 years of amputation',
            'Risk factors: smoking, diabetes, hypertension, hyperlipidemia, renal disease',
            'Annual foot examination essential for all diabetic patients',
          ],
        ),
        HeaderBlock('Ankle-Brachial Index (ABI)'),
        TextBlock(
          'The ABI is the primary non-invasive screening test for peripheral arterial '
          'disease (PAD). It compares systolic blood pressure at the ankle to systolic '
          'blood pressure at the brachial artery.',
        ),
        ScaleBlock(
          scaleName: 'Ankle-Brachial Index (ABI)',
          description: 'Ratio of ankle systolic BP to brachial systolic BP. Primary '
              'screening tool for peripheral arterial disease severity.',
          columns: ['ABI Value', 'Interpretation'],
          rows: [
            ['0.91 – 1.30', 'Normal'],
            ['0.71 – 0.90', 'Mild PAD'],
            ['0.41 – 0.70', 'Moderate PAD'],
            ['0.00 – 0.40', 'Severe PAD (critical limb ischemia)'],
            ['> 1.30', 'Falsely elevated — calcified, non-compressible vessels'],
          ],
          boardPearl: 'ABI > 1.30 in diabetic patients is FALSELY ELEVATED due to '
              'medial arterial calcification (Monckeberg sclerosis). The calcified '
              'vessels are non-compressible, producing an artificially high reading. '
              'Use toe pressures or TBI (Toe-Brachial Index) instead.',
        ),
        BulletCardBlock(
          title: 'Toe-Brachial Index (TBI)',
          themeColor: const Color(0xFF1565C0),
          backgroundColor: const Color(0xFFE3F2FD),
          points: [
            'Used when ABI is falsely elevated (>1.30-1.40) in diabetic/renal patients',
            'Small digital arteries of toes rarely undergo medial calcification',
            'Normal TBI: greater than 0.70',
            'Abnormal TBI: less than 0.70, suggesting PAD',
            'Always use TBI instead of ABI in patients with non-compressible vessels',
          ],
        ),

        HeaderBlock('Diabetic Foot Complications'),
        ComparisonCardBlock(
          title: 'Charcot Foot (Neuropathic Arthropathy)',
          themeColor: const Color(0xFFBF360C),
          backgroundColor: const Color(0xFFFBE9E7),
          icon: Icons.warning_amber,
          description: 'Progressive, destructive joint condition caused by loss of '
              'protective sensation from peripheral neuropathy. The midfoot is the '
              'most commonly affected location, leading to collapse and rocker-bottom '
              'deformity.',
          keyPoints: [
            'Caused by peripheral neuropathy → loss of protective sensation',
            'Midfoot most commonly affected (tarsometatarsal joints)',
            'Progressive joint destruction, fragmentation, and collapse',
            'Classic presentation: warm, swollen, erythematous foot with intact pulses',
            'Rocker-bottom deformity in chronic phase from midfoot collapse',
            'Acute phase treatment: Total Contact Cast (TCC) for offloading',
            'Chronic phase: custom-molded shoes with accommodative insoles, rocker soles',
            'Must differentiate from infection (Charcot is NOT an infection)',
          ],
        ),
        ComparisonCardBlock(
          title: 'Total Contact Cast (TCC)',
          themeColor: const Color(0xFF2E7D32),
          backgroundColor: const Color(0xFFE8F5E9),
          icon: Icons.healing,
          description: 'A well-molded, minimally padded cast that distributes plantar '
              'pressure across the entire sole, considered the gold standard for '
              'healing neuropathic plantar ulcers.',
          keyPoints: [
            'GOLD STANDARD for neuropathic (diabetic) plantar ulcer healing',
            'Redistributes plantar pressure across entire foot surface',
            'Reduces pressure at ulcer site by 60-80%',
            'Forces patient compliance with offloading (non-removable)',
            'Changed every 1-2 weeks to accommodate edema changes',
            'Healing rates: 73-100% of neuropathic ulcers within 6-8 weeks',
            'Contraindicated in active infection, untreated osteomyelitis, or ischemic ulcers',
          ],
        ),
        // --- TCC Evidence Table ---
        TableBlock(
          title: 'TCC vs Other Offloading Methods',
          columns: ['Method', 'Wound Closure Rate', 'Median Time to Healing'],
          rows: [
            ['Total Contact Cast', '88.9%', '5.4 weeks'],
            ['Healing sandal', '50%', '8.9 weeks'],
            ['Shear-reducing walking boot', '40%', '6.7 weeks'],
          ],
          headerColor: const Color(0xFF2E7D32),
        ),
        PearlBlock(
          'Board Pearl - TCC Underutilization',
          'Despite being the gold standard, TCC is significantly underutilized: '
          'only 16% of diabetic foot ulcer patients receive TCC (US Wound Registry). '
          'Barriers include time-consuming application, need for trained staff, '
          'and concerns about complications. Its non-removable design ensures '
          '100% compliance with offloading.',
        ),

        // --- Eichenholtz Classification ---
        HeaderBlock('Charcot Foot: Eichenholtz Classification'),
        TableBlock(
          title: 'Eichenholtz Staging System',
          columns: ['Stage', 'Name', 'Radiographic Findings', 'Management'],
          rows: [
            ['0 (Shibata)', 'Prodromal', 'Normal radiographs; MRI shows bone marrow edema', 'TCC or non-removable offloading'],
            ['I', 'Fragmentation', 'Osteopenia, joint fragmentation, subluxation', 'TCC; most acute/destructive phase'],
            ['II', 'Coalescence', 'Bony debris absorption, sclerosis, consolidation', 'Removable boot or custom orthotic'],
            ['III', 'Reconstruction', 'Reduced sclerosis, attempted joint reformation', 'Custom-molded shoes with accommodative insoles'],
          ],
          headerColor: const Color(0xFFBF360C),
        ),
        PearlBlock(
          'Board Pearl - Eichenholtz Staging',
          'Eichenholtz Stage 0 (prodromal, added by Shibata 1990) shows NORMAL '
          'radiographs but ABNORMAL MRI findings. Stage I (fragmentation) is the '
          'most destructive. TCC is used in Stages 0-I. Stage III management: '
          'custom-molded shoes with total contact insoles and rigid rocker soles.',
        ),

        HeaderBlock('Diabetic Footwear & Orthotic Management'),
        BulletCardBlock(
          title: 'Diabetic Footwear Prescription',
          themeColor: const Color(0xFF1565C0),
          backgroundColor: const Color(0xFFE3F2FD),
          points: [
            'Extra-depth shoes: accommodate deformities and custom insoles',
            'Custom-molded shoes: for severe deformity (Charcot, prior amputation)',
            'Total contact insoles: redistribute plantar pressure evenly',
            'Rocker sole: reduces forefoot plantar pressure during push-off',
            'Rigid rocker: reduces midfoot and forefoot bending stress',
            'Medicare Therapeutic Shoe Bill: covers 1 pair of shoes + 3 insoles/year for qualifying diabetics',
            'Patient education: daily foot inspection, proper shoe fit, moisture management',
          ],
        ),
        // --- Medicare Therapeutic Shoe Program ---
        HeaderBlock('Medicare Therapeutic Shoe Program'),
        BulletCardBlock(
          title: 'Eligibility Requirements',
          themeColor: const Color(0xFF00695C),
          backgroundColor: const Color(0xFFE0F2F1),
          points: [
            'Part B benefit (separate from DME and orthotics)',
            'Must have documented diagnosis of diabetes mellitus',
            'Must have comprehensive diabetes care plan managed by treating physician',
            'Must have at least ONE qualifying condition:',
            '  - Peripheral neuropathy with callus formation',
            '  - History of pre-ulcerative calluses or previous foot ulceration',
            '  - Foot deformity or previous partial foot amputation',
            '  - Poor circulation',
          ],
        ),
        TableBlock(
          title: 'Medicare Therapeutic Shoe Coverage Options',
          columns: ['Option', 'Coverage Per Year'],
          rows: [
            ['Option A', '1 pair extra-depth shoes + 3 pairs molded inserts'],
            ['Option B', '1 pair custom-molded shoes + 2 additional pairs of inserts'],
          ],
          headerColor: const Color(0xFF00695C),
        ),
        BulletCardBlock(
          title: 'Prescribers & Suppliers',
          themeColor: const Color(0xFF00695C),
          backgroundColor: const Color(0xFFE0F2F1),
          points: [
            'Prescribers: podiatrist, MD/DO, PA, NP, or clinical nurse specialist',
            'Suppliers: podiatrist, pedorthist, orthotist, prosthetist, or other qualified individual',
            'Shoe modifications (rocker soles, metatarsal bars) may substitute for inserts',
          ],
        ),

        HeaderBlock('Prosthetic Considerations for Dysvascular Patients'),
        BulletCardBlock(
          title: 'Special Prosthetic Modifications',
          themeColor: const Color(0xFF6A1B9A),
          backgroundColor: const Color(0xFFF3E5F5),
          points: [
            'Lighter components to reduce energy demands (already elevated)',
            'Easier don/doff mechanisms (impaired hand function from neuropathy, arthritis)',
            'Wide socket margins for skin protection (fragile, poorly healing skin)',
            'Gel liners for pressure distribution and skin protection',
            'Frequent follow-up for skin checks (insensate skin at risk)',
            'Accommodate visual impairment (diabetic retinopathy) in suspension design',
            'Conservative gait training goals appropriate to medical status',
            'Monitor contralateral limb — high risk for future amputation',
          ],
        ),
        PearlBlock(
          'Board Pearl — Dysvascular & Diabetic',
          'ABI > 1.30 in diabetics is FALSELY ELEVATED due to calcified vessels; '
          'use toe pressures instead. Total Contact Casting (TCC) is the GOLD STANDARD '
          'for neuropathic ulcer healing. 55% of diabetic amputees require contralateral '
          'amputation within 2-3 years.',
        ),
      ],
    ),

    // ─────────────────────────────────────────────
    // TAB 2: Sports & Activity
    // ─────────────────────────────────────────────
    TopicTab(
      title: 'Sports & Activity',
      blocks: [
        HeaderBlock('Sports Prosthetics'),
        TextBlock(
          'Sport-specific prosthetic design is a distinct discipline requiring '
          'understanding of biomechanical demands unique to each activity. Running '
          'prostheses, in particular, function fundamentally differently from walking '
          'prostheses and are not interchangeable.',
          isIntro: true,
        ),
        ComparisonCardBlock(
          title: 'Running Prostheses (Energy-Return Blades)',
          themeColor: const Color(0xFF2E7D32),
          backgroundColor: const Color(0xFFE8F5E9),
          icon: Icons.directions_run,
          description: 'J-shaped carbon fiber blades designed specifically for running, '
              'storing energy during loading and returning it during push-off. '
              'Examples include the Flex-Run (Ossur) and Cheetah (Ossur).',
          keyPoints: [
            'J-shaped carbon fiber construction for maximum energy storage and return',
            'No heel — designed for forefoot/toe running gait pattern only',
            'Stores elastic energy during stance phase loading',
            'Returns stored energy during push-off for propulsion',
            'Not designed for walking — fundamentally different mechanics',
            'Dedicated running prosthesis needed (cannot walk and run on same device)',
            'Category and stiffness selected based on user weight and activity level',
            'Carbon fiber blades return ~90% of stored energy vs ~50-60% for biological tendons',
            'Models: Cheetah Xcel (sprinting), Cheetah Xplore (distance), Cheetah Xpanse (long jump)',
          ],
        ),
        BulletCardBlock(
          title: 'Running Blade vs Walking Prosthesis',
          themeColor: const Color(0xFFE65100),
          backgroundColor: const Color(0xFFFFF3E0),
          points: [
            'Walking foot: heel strike → midstance → push-off (full gait cycle)',
            'Running blade: forefoot only contact, no heel, energy return mechanism',
            'Biomechanics are fundamentally different — not interchangeable',
            'Running blades provide NO stability for standing or walking',
            'Alignment differs significantly between walking and running prostheses',
            'Athletes require BOTH a walking prosthesis AND a running prosthesis',
          ],
        ),
        HeaderBlock('Sport-Specific Prostheses'),
        BulletCardBlock(
          title: 'Activity-Specific Lower Extremity Options',
          themeColor: const Color(0xFF1565C0),
          backgroundColor: const Color(0xFFE3F2FD),
          points: [
            'Swimming prostheses: waterproof components, streamlined design, corrosion-resistant',
            'Cycling prostheses: rigid ankle, specific cleat interface, crank arm modifications',
            'Rock climbing prostheses: aggressive toe design, high friction, rigid connection',
            'Ski prostheses: specialized binding interface, high-performance shock absorption',
            'Golf: swing modifications, stance adaptations, rotational components',
            'Each sport may require dedicated prosthesis or adaptations to existing device',
          ],
        ),
        BulletCardBlock(
          title: 'Upper Extremity Activity-Specific Terminal Devices',
          themeColor: const Color(0xFF4527A0),
          backgroundColor: const Color(0xFFEDE7F6),
          points: [
            'Fishing adapter: rod-holding terminal device',
            'Bowling adapter: ball-release mechanism interface',
            'Gym/weight training adapter: barbell grip, cable attachment interface',
            'Cycling adapter: handlebar grip terminal device',
            'Photography adapter: camera mount terminal device',
            'Interchangeable quick-disconnect wrist units allow rapid device changes',
            'Most effective TDs are those obligatory for participation (weight lifting, violin bows)',
            'Research: 9 of 15 recreational TDs studied improved performance',
          ],
        ),
        HeaderBlock('Paralympic Classification'),
        BulletCardBlock(
          title: 'Paralympic Classification Principles',
          themeColor: const Color(0xFF00838F),
          backgroundColor: const Color(0xFFE0F7FA),
          points: [
            'Classification is sport-specific (not universal across all sports)',
            'Based on functional ability, NOT solely on amputation level',
            'Ensures fair competition by grouping athletes with similar functional capacity',
            'Each sport has its own classification codes and criteria',
            'Classification panels include medical and technical experts',
            'Athletes may be reclassified as functional abilities change',
          ],
        ),
        PearlBlock(
          'Board Pearl — Sports Prosthetics',
          'Running blades (J-shaped carbon fiber) store and return energy during '
          'the running gait cycle using completely different mechanics from walking '
          'prostheses. They have no heel and cannot be used for walking. Athletes '
          'need a SEPARATE dedicated running prosthesis.',
        ),
      ],
    ),

    // ─────────────────────────────────────────────
    // TAB 3: Bilateral Amputations
    // ─────────────────────────────────────────────
    TopicTab(
      title: 'Bilateral Amputations',
      blocks: [
        HeaderBlock('Bilateral Lower Extremity Amputations'),
        TextBlock(
          'Bilateral lower extremity amputation presents unique challenges for '
          'prosthetic fitting and functional rehabilitation. Energy expenditure '
          'increases dramatically with higher amputation levels and bilaterality. '
          'The level of amputation, age, and comorbidities significantly influence '
          'prosthetic candidacy and expected functional outcomes.',
          isIntro: true,
        ),
        TableBlock(
          title: 'Energy Expenditure by Amputation Level',
          columns: ['Level', 'Energy Increase Above Normal', 'Speed Decrease'],
          rows: [
            ['Unilateral TT', '10-20% increase', '10-15% decrease'],
            ['Unilateral TF', '50-65% increase', '30-40% decrease'],
            ['Bilateral TT', '40-60% increase', '20-30% decrease'],
            ['Bilateral TF', '>200% increase', '>50% decrease'],
            ['Hip Disarticulation', '>80% increase', '>40% decrease'],
          ],
          headerColor: const Color(0xFFC62828),
        ),
        ComparisonCardBlock(
          title: 'Bilateral Transtibial Amputees',
          themeColor: const Color(0xFF2E7D32),
          backgroundColor: const Color(0xFFE8F5E9),
          icon: Icons.accessibility_new,
          description: 'Most bilateral TT amputees can achieve functional prosthetic '
              'ambulation with appropriate rehabilitation and componentry. Energy '
              'expenditure is elevated but manageable for most patients.',
          keyPoints: [
            'Energy expenditure: ~40-60% above normal',
            'MOST bilateral TT amputees CAN ambulate with prostheses',
            'Both knees preserved — critical for transfers, balance, and proprioception',
            'Prosthetic fitting: fit one side first, then add the other',
            'May require assistive device (cane or walker) for community ambulation',
            'Prognosis significantly better than bilateral TF',
            'Most can achieve K2-K3 functional level with appropriate training',
          ],
        ),
        ComparisonCardBlock(
          title: 'Bilateral Transfemoral Amputees',
          themeColor: const Color(0xFFC62828),
          backgroundColor: const Color(0xFFFFEBEE),
          icon: Icons.wheelchair_pickup,
          description: 'Bilateral TF amputation presents extreme energy demands (>200% '
              'above normal). Many patients cannot achieve functional prosthetic '
              'ambulation, and a wheelchair may be the primary mobility device.',
          keyPoints: [
            'Energy expenditure: >200% above normal — extreme cardiovascular demand',
            'Many bilateral TF amputees CANNOT functionally ambulate with prostheses',
            'Wheelchair often becomes the PRIMARY mobility device',
            'Younger, fit patients with traumatic etiology have best prognosis',
            'Dysvascular bilateral TF patients: very poor prosthetic prognosis',
            'May use stubbies as transitional training devices',
            'Full-length prostheses with knees: requires exceptional fitness and motivation',
          ],
        ),
        PearlBlock(
          'Board Pearl — Bilateral TF Age Threshold',
          'Bilateral TF amputees over age 45 are UNLIKELY candidates for full-length '
          'prosthetic ambulation due to extreme energy demands (>200% above normal). '
          'Wheelchair may be the primary mobility device for this population.',
        ),
        HeaderBlock('Stubbies (Short Prostheses)'),
        ComparisonCardBlock(
          title: 'Stubbies for Bilateral TF',
          themeColor: const Color(0xFFE65100),
          backgroundColor: const Color(0xFFFFF3E0),
          icon: Icons.height,
          description: 'Short prostheses without articulating knee joints or prosthetic '
              'feet, used as a transitional training tool for bilateral TF amputees '
              'before progressing to full-length prostheses.',
          keyPoints: [
            'Short prostheses WITHOUT knee joints or prosthetic feet',
            'Rocker bottoms or flat platforms for standing surface',
            'Lower center of gravity (COG) — improved stability',
            'Wider base of support (BOS) — reduced fall risk',
            'Used as transitional device to build balance and confidence',
            'Stepping stone before fitting full-length prostheses with knees',
            'Some patients may use stubbies as their definitive ambulation device',
            'Height can be progressively increased as balance improves',
            'Reduced energy cost: heart rate and O2 consumption decrease 7-23% vs full-length',
            'Increased walking speed: up to 25% faster than full-length prostheses in early training',
          ],
        ),
        BulletCardBlock(
          title: 'Stubby Progressive Training Protocol',
          themeColor: const Color(0xFF4527A0),
          backgroundColor: const Color(0xFFEDE7F6),
          points: [
            '1. Begin with stubbies for initial gait training (~1 month intensive rehab)',
            '2. Progress to full-time stubby use (10-16 hours/day)',
            '3. Master community ambulation on stubbies: stairs, curbs, uneven surfaces',
            '4. Gradually increase pylon height as strength and balance improve',
            '5. Transition to articulating knees when FUNCTION (not time) indicates readiness',
            '6. Some patients may use stubbies as permanent ambulation device',
          ],
        ),
        HeaderBlock('Sequential Fitting Strategy'),
        BulletCardBlock(
          title: 'Sequential Fitting Principles',
          themeColor: const Color(0xFF1565C0),
          backgroundColor: const Color(0xFFE3F2FD),
          points: [
            'Fit one side first — usually the MORE RECENT amputation',
            'Allow patient to master one prosthesis before adding the second',
            'The more recent limb typically has better wound healing and volume stability',
            'Balance training with one prosthesis prepares for bilateral fitting',
            'Second prosthesis added once first is well-tolerated and functional',
            'Complete bilateral fitting may take several months longer than unilateral',
          ],
        ),
        HeaderBlock('Wheelchair Considerations for Bilateral LE Amputees'),
        BulletCardBlock(
          title: 'Wheelchair Modifications',
          themeColor: const Color(0xFF6A1B9A),
          backgroundColor: const Color(0xFFF3E5F5),
          points: [
            'Posterior shift in center of gravity (COG) due to lost limb weight',
            'ANTI-TIPPERS ESSENTIAL — high risk of backward tipping without LE weight',
            'Lower seat height for bilateral amputees (especially TF)',
            'Extended wheelbase (rear axle moved posteriorly) for stability',
            'Amputee-specific wheelchair frame designs available',
            'Lighter frame recommended to compensate for reduced propulsion efficiency',
            'Seat depth may need adjustment for shorter residual limbs',
            'Cushion selection: consider pressure distribution for residual limbs in socket',
          ],
        ),
        PearlBlock(
          'Board Pearl — Bilateral Wheelchair Safety',
          'Anti-tippers are ESSENTIAL for bilateral LE amputees using wheelchairs. '
          'Loss of lower extremity weight shifts the center of gravity posteriorly, '
          'creating significant risk of backward tipping. The wheelbase must be '
          'extended and the rear axle moved posteriorly for stability.',
        ),
      ],
    ),

    // ─────────────────────────────────────────────
    // TAB 4: Geriatric Considerations
    // ─────────────────────────────────────────────
    TopicTab(
      title: 'Geriatric Considerations',
      blocks: [
        HeaderBlock('Geriatric Amputee Rehabilitation'),
        TextBlock(
          'The geriatric amputee population is growing as vascular disease and diabetes '
          'prevalence increase with age. A key principle is that age alone is NOT a '
          'contraindication to prosthetic fitting. Functional outcomes depend more on '
          'cognitive status, motivation, comorbidities, and support systems than on '
          'chronological age.',
          isIntro: true,
        ),
        PearlBlock(
          'Board Pearl — Age Is Not a Contraindication',
          'Age ALONE is NOT a contraindication to prosthetic fitting. Cognitive '
          'status, motivation, medical comorbidities, and social support system '
          'are MORE IMPORTANT predictors of prosthetic success than chronological '
          'age. This is a high-yield board concept.',
        ),
        HeaderBlock('Factors More Important Than Age'),
        BulletCardBlock(
          title: 'Predictors of Prosthetic Success in Elderly',
          themeColor: const Color(0xFF2E7D32),
          backgroundColor: const Color(0xFFE8F5E9),
          points: [
            'Cognitive function: MOST SIGNIFICANT barrier if impaired',
            'Motivation and willingness to participate in rehabilitation',
            'Medical comorbidities: cardiovascular, renal, pulmonary status',
            'Pre-amputation functional level and mobility',
            'Social support system: family, caregivers, home environment',
            'Contralateral limb status (especially in dysvascular patients)',
            'Upper extremity strength and function (for transfers, assistive devices)',
            'Vision status (affects balance, prosthetic management)',
          ],
        ),
        HeaderBlock('Cognitive Impairment'),
        ComparisonCardBlock(
          title: 'Impact of Cognitive Impairment',
          themeColor: const Color(0xFFC62828),
          backgroundColor: const Color(0xFFFFEBEE),
          icon: Icons.psychology_alt,
          description: 'Cognitive impairment is the most significant barrier to prosthetic '
              'rehabilitation in the elderly. It affects ability to learn new skills, '
              'follow safety precautions, and manage prosthetic care independently.',
          keyPoints: [
            'MOST SIGNIFICANT barrier to prosthetic training success',
            'Affects ability to learn new motor skills for prosthetic use',
            'Impairs judgment and safety awareness during ambulation',
            'Inability to independently don/doff and manage prosthetic care',
            'Difficulty following multi-step instructions during gait training',
            'Increased fall risk due to impaired judgment and reaction time',
            'May still benefit from prosthesis for transfers with caregiver assistance',
            'Mini-Mental State Exam (MMSE) or MoCA can screen cognitive function',
            'Clock drawing test: rapid screen for visuospatial and executive function deficits',
            'Mild impairment may still benefit from prosthesis for supported transfers',
          ],
        ),
        HeaderBlock('Poor Prosthetic Prognosis Indicators'),
        BulletCardBlock(
          title: 'Red Flags for Poor Outcomes',
          themeColor: const Color(0xFFBF360C),
          backgroundColor: const Color(0xFFFBE9E7),
          points: [
            'Age >80 with bilateral TF amputation: very poor prosthetic prognosis',
            'Severe cognitive impairment or advanced dementia',
            'Severe cardiac disease limiting exercise tolerance',
            'Non-ambulatory status prior to amputation',
            'Severe bilateral upper extremity impairment (cannot use assistive device)',
            'Lack of motivation or severe untreated depression',
            'Inadequate social support or unsafe home environment',
            'Multiple failed prosthetic fitting attempts',
          ],
        ),
        HeaderBlock('Prosthetic Modifications for Elderly'),
        BulletCardBlock(
          title: 'Component Selection',
          themeColor: const Color(0xFF1565C0),
          backgroundColor: const Color(0xFFE3F2FD),
          points: [
            'Lighter components preferred — reduces energy demands and fatigue',
            'Simpler suspension systems — easier don/doff for arthritic hands',
            'Pin/lock suspension: straightforward alignment for donning',
            'Suction suspension may be difficult for patients with reduced dexterity',
            'Lower heel height for stability (flats preferred)',
            'SACH or single-axis feet for K1 ambulators (simple, lightweight)',
            'Multiaxial feet for K2 ambulators (accommodate uneven terrain)',
            'Microprocessor knees: evidence supports fall reduction even in K2 elderly',
          ],
        ),
        ComparisonCardBlock(
          title: 'Fall Risk in Elderly Amputees',
          themeColor: const Color(0xFF4527A0),
          backgroundColor: const Color(0xFFEDE7F6),
          icon: Icons.personal_injury,
          description: 'Falls are the leading cause of injury in elderly amputees. '
              'Microprocessor knees have been shown to reduce fall frequency in '
              'this population, and fall prevention strategies are essential.',
          keyPoints: [
            'Elderly amputees have significantly elevated fall risk',
            'Falls are the leading cause of injury in this population',
            'Microprocessor knees reduce falls even in lower-activity patients',
            'Balance training and fall prevention programs are essential',
            'Home safety assessment should be part of discharge planning',
            'Activities-specific Balance Confidence (ABC) Scale screens fall risk',
            'Assistive devices (cane, walker) should be considered for community ambulation',
          ],
        ),
        BulletCardBlock(
          title: 'Fall Risk Factors in Elderly Amputees',
          themeColor: const Color(0xFFC62828),
          backgroundColor: const Color(0xFFFFEBEE),
          points: [
            'Age 71-80 years',
            'History of previous falls',
            'Cognitive impairment or confusion',
            'Vestibular dysfunction, vertigo, or stroke history',
            'Medications: anticonvulsants, sedatives, antihypertensives',
            'Carpet flooring',
            'Need for transfer assistance',
            'TUG amputee-specific cutoffs: 8.17 sec = predicts 1+ falls/year',
            'TUG amputee-specific cutoffs: 9.25 sec = predicts 2+ falls/year',
          ],
        ),
        HeaderBlock('Rehabilitation Goals in the Elderly'),
        BulletCardBlock(
          title: 'Realistic Goal Setting',
          themeColor: const Color(0xFF00695C),
          backgroundColor: const Color(0xFFE0F2F1),
          points: [
            'Goals may appropriately differ from younger amputees',
            'Household ambulation (K1) may be a realistic and meaningful goal',
            'Limited community ambulation (K2) for more functional elderly patients',
            'Transfer independence may be the primary goal for some patients',
            'Wheelchair mobility training equally important as prosthetic training',
            'Fall prevention and safety education are critical components',
            'Energy conservation strategies to maximize functional endurance',
            'Caregiver education on prosthetic management and skin monitoring',
          ],
        ),
        HeaderBlock('K-Level Distribution in Elderly'),
        BulletCardBlock(
          title: 'Functional Level Patterns',
          themeColor: const Color(0xFFE65100),
          backgroundColor: const Color(0xFFFFF3E0),
          points: [
            'K-level distribution skews toward K1-K2 in elderly amputees',
            'K1 (household ambulator): most common classification in elderly dysvascular',
            'K2 (limited community): achievable for many active elderly patients',
            'K3 (community ambulator): less common but possible in fit elderly',
            'K4 (high activity): rare in elderly population',
            'K-level should be reassessed periodically as function may change',
            'Initial K-level may improve with successful rehabilitation',
          ],
        ),
        PearlBlock(
          'Board Pearl — Geriatric Amputee Summary',
          'Age alone is NOT a contraindication to prosthetic fitting — cognitive '
          'status, motivation, and medical comorbidities are MORE IMPORTANT predictors. '
          'However, age >80 with bilateral TF amputation carries very poor prosthetic '
          'prognosis. Lighter, simpler components are preferred. Microprocessor knees '
          'reduce falls even in lower-activity elderly patients (K2 MPK coverage '
          'expanded by CMS in September 2024).',
        ),
      ],
    ),

    // ─────────────────────────────────────────────
    // TAB 5: Military & Trauma
    // ─────────────────────────────────────────────
    TopicTab(
      title: 'Military & Trauma',
      blocks: [
        HeaderBlock('Military and Trauma Amputees'),
        TextBlock(
          'Military blast injuries and high-energy trauma present unique '
          'challenges for prosthetic and orthotic management. The Intrepid '
          'Dynamic Exoskeletal Orthosis (IDEO), return-to-duty rates, and '
          'blast injury patterns are important board topics.',
          isIntro: true,
        ),

        // --- IDEO ---
        ComparisonCardBlock(
          title: 'IDEO (Intrepid Dynamic Exoskeletal Orthosis)',
          themeColor: const Color(0xFF1565C0),
          backgroundColor: const Color(0xFFE3F2FD),
          icon: Icons.shield,
          description: 'A custom passive-dynamic carbon fiber AFO designed by CPO '
              'Ryan Blanck (2009) at the Center for the Intrepid as a limb '
              'salvage alternative for severe LE injuries.',
          keyPoints: [
            'Custom-molded dynamic-response carbon fiber AFO',
            'Stabilizes injured ankle while providing energy storage and return',
            'Enables return to high-level activities including running and agility',
            'Common indications: ankle injuries (25%), tibia injuries (17.5%), nerve injuries below knee (16.4%)',
            '>80% of patients fitted with IDEO avoided amputation at 1-year follow-up',
            'Improved agility, power, and speed vs no brace or conventional bracing',
            'Used with Return to Run (RTR) clinical pathway',
            'Paradigm shift: functional limb salvage approaching prosthetic performance levels',
          ],
        ),

        // --- Return to Duty Rates ---
        HeaderBlock('Military Return-to-Duty (RTD) Rates'),
        TableBlock(
          title: 'OEF/OIF RTD Rates by Factor',
          columns: ['Factor', 'Return-to-Duty Rate'],
          rows: [
            ['Overall (OEF/OIF era)', '16.5% (vs 2.3% historically)'],
            ['Transtibial amputees', '22% (highest LE rate)'],
            ['Single extremity amputees', '20%'],
            ['Multiple extremity amputees', '3% (lowest rate)'],
            ['Officers', '35.3%'],
            ['Senior enlisted', '25.5%'],
            ['Junior enlisted', '7.0%'],
            ['Special Forces', 'Significantly higher than all other MOS'],
          ],
          headerColor: const Color(0xFF1565C0),
        ),

        // --- Blast Injury Patterns ---
        HeaderBlock('Blast Injury Patterns'),
        BulletCardBlock(
          title: 'IED Blast Injury Characteristics',
          themeColor: const Color(0xFFC62828),
          backgroundColor: const Color(0xFFFFEBEE),
          points: [
            'IEDs: predominant cause of combat injuries in OEF/OIF',
            'Most common cause of military deaths 2008-2011',
            'Most common amputation level: transtibial (41.8%)',
            'Second most common: transfemoral (34.5%)',
            'Bilateral LE amputation: most common bilateral pattern from blast',
            'Among bilateral amputees: bilateral TF is the most common subgroup',
            'Heterotopic ossification (HO): very common in blast amputations',
            'HO can significantly impair prosthetic fitting and may require surgical excision',
          ],
        ),

        // --- DCBI ---
        ComparisonCardBlock(
          title: 'Dismounted Complex Blast Injury (DCBI)',
          themeColor: const Color(0xFF4A148C),
          backgroundColor: const Color(0xFFEDE7F6),
          icon: Icons.warning,
          description: 'The most severe injury pattern in modern military conflict, '
              'involving multiple extremity amputations with associated pelvic '
              'and soft tissue injuries.',
          keyPoints: [
            'Bilateral lower extremity amputations at various levels',
            'Complex soft tissue blast wounds extending to perineal and gluteal regions',
            'Associated pelvic and acetabular fractures',
            'Frequent traumatic amputation of the non-dominant upper extremity',
            'Represents the most challenging rehabilitation scenario',
            'Polytrauma: often includes TBI, PTSD, burns, vision/hearing loss',
          ],
        ),

        // --- Polytrauma ---
        BulletCardBlock(
          title: 'Polytrauma Considerations',
          themeColor: const Color(0xFFE65100),
          backgroundColor: const Color(0xFFFFF3E0),
          points: [
            'TBI frequently co-occurs with blast amputations — affects cognitive rehab capacity',
            'PTSD: high prevalence; affects motivation, sleep, pain perception, rehab engagement',
            'Heterotopic ossification: very common; impairs prosthetic fitting',
            'Complex wound management: irregular tissue damage, contamination',
            'Burns: affect skin integrity for prosthetic socket interface',
            'Vision and hearing loss from blast overpressure',
          ],
        ),
        PearlBlock(
          'Board Pearl — Military/Trauma',
          'IDEO is a custom carbon fiber AFO for limb salvage: >80% avoid amputation. '
          'Military RTD improved from 2.3% historically to 16.5% in OEF/OIF. TT amputees '
          'have highest LE RTD rate (22%). Blast patterns: TT most common (41.8%). '
          'Heterotopic ossification is very common and significantly affects prosthetic fitting.',
        ),
      ],
    ),
  ],
);

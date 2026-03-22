import 'models/module_model.dart';

class ModuleData {
  static final List<ModuleModel> standardModules = [
    ModuleModel(
      id: 'po-fundamentals',
      title: 'P&O Fundamentals',
      description:
          'Terminology, biomechanical principles, gait cycle, and prescription principles.',
      highlights: ['Gait Cycle', 'Biomechanics', 'Terminology'],
    ),
    ModuleModel(
      id: 'le-orthoses',
      title: 'Lower Extremity Orthoses',
      description:
          'AFO types, KAFO, shoe modifications, foot orthoses, and biomechanics.',
      highlights: ['AFO Types', 'KAFO', 'Shoe Mods'],
    ),
    ModuleModel(
      id: 'ue-orthoses',
      title: 'Upper Extremity Orthoses',
      description:
          'Wrist-hand orthoses, nerve injury splints, elbow and shoulder orthoses.',
      highlights: ['WHO', 'Nerve Injury', 'Splinting'],
    ),
    ModuleModel(
      id: 'spinal-orthoses',
      title: 'Spinal Orthoses',
      description:
          'Cervical orthoses, TLSO, LSO, motion restriction comparison, and indications.',
      highlights: ['C-Spine', 'TLSO', 'Halo'],
    ),
    ModuleModel(
      id: 'prosthetic-components',
      title: 'Prosthetic Components',
      description:
          'Prosthetic feet, knees, sockets, suspension systems, and partial foot prosthetics.',
      highlights: ['Feet', 'Knees', 'Sockets'],
    ),
    ModuleModel(
      id: 'transtibial',
      title: 'Transtibial Prosthetics',
      description:
          'PTB/TSB sockets, pressure areas, alignment, liners, and gait deviations.',
      highlights: ['PTB Socket', 'Pressure Areas', 'Alignment'],
    ),
    ModuleModel(
      id: 'transfemoral',
      title: 'Transfemoral Prosthetics',
      description:
          'Quad vs IRC sockets, knee unit selection, alignment, and gait deviations.',
      highlights: ['IRC Socket', 'Knee Units', 'Gait'],
    ),
    ModuleModel(
      id: 'ue-prosthetics',
      title: 'Upper Extremity Prosthetics',
      description:
          'Body-powered vs myoelectric, terminal devices, cable systems, and hybrid prosthetics.',
      highlights: ['VO vs VC', 'Myoelectric', 'Cable Systems'],
    ),
    ModuleModel(
      id: 'gait-analysis',
      title: 'Gait Analysis & Deviations',
      description:
          'Normal gait, prosthetic gait deviations, energy expenditure by amputation level.',
      highlights: ['Gait Deviations', 'Energy Cost', 'Trendelenburg'],
    ),
    ModuleModel(
      id: 'materials-fabrication',
      title: 'Materials & Fabrication',
      description:
          'Thermoplastics, carbon fiber, metals, casting techniques, and CAD/CAM.',
      highlights: ['Thermoplastics', 'Carbon Fiber', 'CAD/CAM'],
    ),
    ModuleModel(
      id: 'pediatric-po',
      title: 'Pediatric P&O',
      description:
          'Congenital limb deficiencies, prosthetic milestones, scoliosis bracing.',
      highlights: ['Congenital', 'Milestones', 'Scoliosis'],
    ),
    ModuleModel(
      id: 'advanced-tech',
      title: 'Advanced/Microprocessor Technology',
      description:
          'Microprocessor knees, powered prosthetics, TMR, osseointegration.',
      highlights: ['C-Leg', 'TMR', 'Osseointegration'],
    ),
    ModuleModel(
      id: 'amputation-rehab',
      title: 'Amputation Surgery & Rehabilitation',
      description:
          'Amputation levels, myodesis/myoplasty, K-levels, phantom pain, outcome measures.',
      highlights: ['K-Levels', 'Phantom Pain', 'Rehab'],
    ),
    ModuleModel(
      id: 'special-populations',
      title: 'P&O in Special Populations',
      description:
          'Dysvascular/diabetic, Charcot foot, sports prosthetics, bilateral amputations.',
      highlights: ['Diabetic', 'Sports', 'Bilateral'],
    ),
  ];
}

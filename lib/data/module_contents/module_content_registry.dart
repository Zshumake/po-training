import '../models/topic_content_model.dart';
import 'po_fundamentals_content.dart';
import 'le_orthoses_content.dart';
import 'ue_orthoses_content.dart';
import 'spinal_orthoses_content.dart';
import 'prosthetic_components_content.dart';
import 'transtibial_content.dart';
import 'transfemoral_content.dart';
import 'ue_prosthetics_content.dart';
import 'gait_analysis_content.dart';
import 'materials_fabrication_content.dart';
import 'pediatric_po_content.dart';
import 'advanced_tech_content.dart';
import 'amputation_rehab_content.dart';
import 'special_populations_content.dart';

/// Central registry mapping module IDs to their content.
/// To add a new module: import its content file, add an entry here.
final Map<String, TopicData> moduleContentRegistry = {
  'po-fundamentals': poFundamentalsContent,
  'le-orthoses': leOrthosesContent,
  'ue-orthoses': ueOrthosesContent,
  'spinal-orthoses': spinalOrthosesContent,
  'prosthetic-components': prostheticComponentsContent,
  'transtibial': transtibialContent,
  'transfemoral': transfemoralContent,
  'ue-prosthetics': ueProstheticsContent,
  'gait-analysis': gaitAnalysisContent,
  'materials-fabrication': materialsFabricationContent,
  'pediatric-po': pediatricPOContent,
  'advanced-tech': advancedTechContent,
  'amputation-rehab': amputationRehabContent,
  'special-populations': specialPopulationsContent,
};

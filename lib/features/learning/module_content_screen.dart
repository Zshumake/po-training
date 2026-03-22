import 'package:flutter/material.dart';
import '../../data/models/module_model.dart';
import '../../data/module_contents/po_fundamentals_content.dart';
import '../../data/module_contents/le_orthoses_content.dart';
import '../../data/module_contents/ue_orthoses_content.dart';
import '../../data/module_contents/spinal_orthoses_content.dart';
import '../../data/module_contents/prosthetic_components_content.dart';
import '../../data/module_contents/transtibial_content.dart';
import '../../data/module_contents/transfemoral_content.dart';
import '../../data/module_contents/ue_prosthetics_content.dart';
import '../../data/module_contents/gait_analysis_content.dart';
import '../../data/module_contents/materials_fabrication_content.dart';
import '../../data/module_contents/pediatric_po_content.dart';
import '../../data/module_contents/advanced_tech_content.dart';
import '../../data/module_contents/amputation_rehab_content.dart';
import '../../data/module_contents/special_populations_content.dart';
import 'topic_content_view.dart';
import '../../data/models/topic_content_model.dart';

class ModuleContentScreen extends StatelessWidget {
  final ModuleModel module;

  const ModuleContentScreen({super.key, required this.module});

  TopicData? _getTopicData() {
    switch (module.id) {
      case 'po-fundamentals':
        return poFundamentalsContent;
      case 'le-orthoses':
        return leOrthosesContent;
      case 'ue-orthoses':
        return ueOrthosesContent;
      case 'spinal-orthoses':
        return spinalOrthosesContent;
      case 'prosthetic-components':
        return prostheticComponentsContent;
      case 'transtibial':
        return transtibialContent;
      case 'transfemoral':
        return transfemoralContent;
      case 'ue-prosthetics':
        return ueProstheticsContent;
      case 'gait-analysis':
        return gaitAnalysisContent;
      case 'materials-fabrication':
        return materialsFabricationContent;
      case 'pediatric-po':
        return pediatricPOContent;
      case 'advanced-tech':
        return advancedTechContent;
      case 'amputation-rehab':
        return amputationRehabContent;
      case 'special-populations':
        return specialPopulationsContent;
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final topicData = _getTopicData();

    return Scaffold(
      appBar: AppBar(
        title: Text(module.title),
      ),
      body: topicData != null
          ? TopicContentView(topicData: topicData)
          : _buildComingSoon(),
    );
  }

  Widget _buildComingSoon() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.construction_rounded,
              size: 64,
              color: Colors.grey.shade400,
            ),
            const SizedBox(height: 16),
            Text(
              module.title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              'Content coming soon!',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade600,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              module.description,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade500,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

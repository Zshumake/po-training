import 'package:flutter/material.dart';

// --- Generic Block Types ---

abstract class ContentBlock {}

class HeaderBlock extends ContentBlock {
  final String title;
  HeaderBlock(this.title);
}

class TextBlock extends ContentBlock {
  final String text;
  final bool isIntro;
  TextBlock(this.text, {this.isIntro = false});
}

class PearlBlock extends ContentBlock {
  final String title;
  final String text;
  PearlBlock(this.title, this.text);
}

class BulletCardBlock extends ContentBlock {
  final String title;
  final Color themeColor;
  final Color backgroundColor;
  final List<String> points;
  BulletCardBlock({
    required this.title,
    required this.themeColor,
    required this.backgroundColor,
    required this.points,
  });
}

class NumberedListBlock extends ContentBlock {
  final List<MapEntry<String, String>> items;
  NumberedListBlock(this.items);
}

class TableBlock extends ContentBlock {
  final String title;
  final List<String> columns;
  final List<List<String>> rows;
  final Color? headerColor;
  TableBlock({
    required this.title,
    required this.columns,
    required this.rows,
    this.headerColor,
  });
}

class ComparisonCardBlock extends ContentBlock {
  final String title;
  final Color themeColor;
  final Color backgroundColor;
  final IconData icon;
  final String description;
  final List<String> keyPoints;

  ComparisonCardBlock({
    required this.title,
    required this.themeColor,
    required this.backgroundColor,
    required this.icon,
    required this.description,
    required this.keyPoints,
  });
}

class MnemonicBlock extends ContentBlock {
  final String mnemonic;
  final String explanation;
  MnemonicBlock(this.mnemonic, this.explanation);
}

class ScaleBlock extends ContentBlock {
  final String scaleName;
  final String description;
  final List<String> columns;
  final List<List<String>> rows;
  final String? boardPearl;
  ScaleBlock({
    required this.scaleName,
    required this.description,
    required this.columns,
    required this.rows,
    this.boardPearl,
  });
}

class MedicationCardBlock extends ContentBlock {
  final String name;
  final String drugClass;
  final String mechanism;
  final String indication;
  final String dosing;
  final String sideEffects;
  final String boardPearl;
  final bool isAvoid;

  MedicationCardBlock({
    required this.name,
    required this.drugClass,
    required this.mechanism,
    required this.indication,
    this.dosing = '',
    this.sideEffects = '',
    this.boardPearl = '',
    this.isAvoid = false,
  });
}

// --- Media Block Types ---

class ImageBlock extends ContentBlock {
  final String assetPath;
  final String caption;
  final String? credit;
  final double? maxHeight;
  ImageBlock({
    required this.assetPath,
    required this.caption,
    this.credit,
    this.maxHeight,
  });
}

class NetworkImageBlock extends ContentBlock {
  final String url;
  final String caption;
  final String? credit;
  final double? maxHeight;
  NetworkImageBlock({
    required this.url,
    required this.caption,
    this.credit,
    this.maxHeight,
  });
}

class VideoBlock extends ContentBlock {
  final String url;
  final String title;
  final String description;
  final String? thumbnailAsset;
  VideoBlock({
    required this.url,
    required this.title,
    required this.description,
    this.thumbnailAsset,
  });
}

class DiagramBlock extends ContentBlock {
  final String title;
  final String svgAsset;
  final String? description;
  final List<DiagramAnnotation> annotations;
  DiagramBlock({
    required this.title,
    required this.svgAsset,
    this.description,
    this.annotations = const [],
  });
}

class DiagramAnnotation {
  final String label;
  final double x;
  final double y;
  final String tooltip;
  const DiagramAnnotation({
    required this.label,
    required this.x,
    required this.y,
    required this.tooltip,
  });
}

// Enum for P&O-specific custom widgets
enum CustomWidgetType {
  kLevelClassifier,
  socketSelectionGuide,
  gaitDeviationAnalyzer,
  cervicalOrthosisComparison,
  afoSelectionTool,
  energyExpenditureChart,
  amputationLevelDiagram,
  prostheticFeetComparison,
  prescriptionBuilder,
  prostheticFootDemo,
  socketPressureDemo,
  cervicalRestrictionDemo,
  terminalDeviceDemo,
  froBiomechanicsDemo,
}

class CustomWidgetBlock extends ContentBlock {
  final CustomWidgetType type;
  CustomWidgetBlock(this.type);
}

class GaitCycleBlock extends ContentBlock {
  GaitCycleBlock();
}

class PrescriptionBuilderBlock extends ContentBlock {
  PrescriptionBuilderBlock();
}

// --- Interactive Learning Block Types ---

class HotspotData {
  final String id;
  final double xPercent; // 0.0-1.0 relative to image
  final double yPercent;
  final String label;
  final String description;
  final String? clinicalSignificance;
  final Color pinColor;

  const HotspotData({
    required this.id,
    required this.xPercent,
    required this.yPercent,
    required this.label,
    required this.description,
    this.clinicalSignificance,
    this.pinColor = const Color(0xFF0D9488), // teal default
  });
}

class AnnotatedImageBlock extends ContentBlock {
  final String title;
  final String diagramType; // e.g. 'socket-ptb', 'gait-trendelenburg', 'afo-types'
  final List<HotspotData> hotspots;
  final double aspectRatio;

  AnnotatedImageBlock({
    required this.title,
    required this.diagramType,
    required this.hotspots,
    this.aspectRatio = 1.2,
  });
}

class CheckpointBlock extends ContentBlock {
  final String question;
  final List<String> options;
  final int correctIndex;
  final String explanation;

  CheckpointBlock({
    required this.question,
    required this.options,
    required this.correctIndex,
    required this.explanation,
  });
}

class CaseDecisionPoint {
  final String prompt;
  final List<String> options;
  final int optimalIndex;
  final String explanation;

  const CaseDecisionPoint({
    required this.prompt,
    required this.options,
    required this.optimalIndex,
    required this.explanation,
  });
}

class CaseScenarioBlock extends ContentBlock {
  final String title;
  final String vignette;
  final List<CaseDecisionPoint> decisionPoints;
  final String summaryPearl;

  CaseScenarioBlock({
    required this.title,
    required this.vignette,
    required this.decisionPoints,
    required this.summaryPearl,
  });
}

// --- Flowchart Decision Tree Block ---

class FlowchartNode {
  final String id;
  final String text;
  final List<FlowchartOption> options; // empty = leaf node
  final String? recommendation; // only for leaf nodes
  final String? rationale;
  final String? boardPearl;

  const FlowchartNode({
    required this.id,
    required this.text,
    this.options = const [],
    this.recommendation,
    this.rationale,
    this.boardPearl,
  });

  bool get isLeaf => options.isEmpty;
}

class FlowchartOption {
  final String label;
  final String targetNodeId;

  const FlowchartOption({
    required this.label,
    required this.targetNodeId,
  });
}

class FlowchartBlock extends ContentBlock {
  final String title;
  final String rootNodeId;
  final Map<String, FlowchartNode> nodes;

  FlowchartBlock({
    required this.title,
    required this.rootNodeId,
    required this.nodes,
  });
}

// --- Tab and Topic Containers ---

class TopicTab {
  final String title;
  final List<ContentBlock> blocks;

  TopicTab({required this.title, required this.blocks});
}

class TopicData {
  final String id;
  final String title;
  final List<TopicTab> tabs;

  TopicData({required this.id, required this.title, required this.tabs});
}

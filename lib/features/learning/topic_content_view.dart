import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import '../../core/theme/app_theme.dart';
import '../../data/models/module_model.dart';
import '../../data/models/topic_content_model.dart';
import '../../data/module_contents/module_content_registry.dart';
import '../../data/module_data.dart';
import '../../data/quiz_banks/po_quiz_bank.dart';
import '../../core/services/progress_service.dart';
import '../../core/widgets/quiz_session_view.dart';
import 'widgets/gait_cycle_widget.dart';
import 'widgets/prescription_builder_widget.dart';
import 'widgets/annotated_image_explorer.dart';
import 'widgets/checkpoint_widget.dart';
import 'widgets/case_scenario_widget.dart';
import 'widgets/flowchart_widget.dart';
import 'widgets/prosthetic_foot_demo_widget.dart';
import 'widgets/socket_pressure_demo_widget.dart';
import 'widgets/cervical_restriction_demo_widget.dart';
import 'widgets/terminal_device_demo_widget.dart';
import 'widgets/fro_biomechanics_demo_widget.dart';

class TopicContentView extends StatefulWidget {
  final ModuleModel module;

  const TopicContentView({super.key, required this.module});

  @override
  State<TopicContentView> createState() => _TopicContentViewState();
}

class _TopicContentViewState extends State<TopicContentView> {
  bool _boardOnlyMode = false;

  TopicData get topicData => moduleContentRegistry[widget.module.id]!;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: topicData.tabs.length,
      child: Column(
        children: [
          // Tab bar + Board-Only toggle
          Row(
            children: [
              Expanded(
                child: TabBar(
                  isScrollable: topicData.tabs.length > 3,
                  labelColor: AppTheme.accentTeal,
                  unselectedLabelColor: AppTheme.textTertiary,
                  indicatorColor: AppTheme.accentTeal,
                  indicatorWeight: 3,
                  tabs: topicData.tabs.map((t) => Tab(text: t.title)).toList(),
                ),
              ),
              _buildBoardToggle(),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: topicData.tabs.asMap().entries.map((entry) {
                return _CollapsibleTabContent(
                  blocks: entry.value.blocks,
                  boardOnlyMode: _boardOnlyMode,
                  moduleId: widget.module.id,
                  tabIndex: entry.key,
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBoardToggle() {
    return GestureDetector(
      onTap: () => setState(() => _boardOnlyMode = !_boardOnlyMode),
      child: Container(
        margin: const EdgeInsets.only(right: 12),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: _boardOnlyMode
              ? AppTheme.pearlBorder.withValues(alpha: 0.15)
              : AppTheme.surfaceDark,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: _boardOnlyMode
                ? AppTheme.pearlBorder.withValues(alpha: 0.5)
                : AppTheme.surfaceBorder,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              _boardOnlyMode ? Icons.star_rounded : Icons.star_outline_rounded,
              color: _boardOnlyMode ? AppTheme.pearlBorder : AppTheme.textTertiary,
              size: 16,
            ),
            const SizedBox(width: 4),
            Text(
              'Board',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: _boardOnlyMode ? AppTheme.pearlBorder : AppTheme.textTertiary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Groups blocks under collapsible HeaderBlock sections
class _CollapsibleTabContent extends StatefulWidget {
  final List<ContentBlock> blocks;
  final bool boardOnlyMode;
  final String moduleId;
  final int tabIndex;

  const _CollapsibleTabContent({
    required this.blocks,
    required this.boardOnlyMode,
    required this.moduleId,
    required this.tabIndex,
  });

  @override
  State<_CollapsibleTabContent> createState() => _CollapsibleTabContentState();
}

class _CollapsibleTabContentState extends State<_CollapsibleTabContent> {
  final Set<int> _collapsedSections = {};
  bool _isReviewed = false;
  double _scrollProgress = 0.0;

  @override
  void initState() {
    super.initState();
    _loadReviewStatus();
  }

  @override
  void didUpdateWidget(_CollapsibleTabContent oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.moduleId != widget.moduleId || oldWidget.tabIndex != widget.tabIndex) {
      _loadReviewStatus();
    }
  }

  Future<void> _loadReviewStatus() async {
    final reviewed = await ProgressService.isTabComplete(widget.moduleId, widget.tabIndex);
    if (mounted) {
      setState(() => _isReviewed = reviewed);
    }
  }

  Future<void> _toggleReviewed() async {
    await ProgressService.toggleTabComplete(widget.moduleId, widget.tabIndex);
    if (mounted) {
      setState(() => _isReviewed = !_isReviewed);
    }
  }

  List<_Section> _buildSections() {
    final sections = <_Section>[];
    var currentBlocks = <ContentBlock>[];
    String? currentHeader;
    int sectionIndex = 0;

    for (final block in widget.blocks) {
      if (block is HeaderBlock) {
        // Save previous section
        if (currentHeader != null || currentBlocks.isNotEmpty) {
          sections.add(_Section(
            index: sectionIndex,
            header: currentHeader,
            blocks: currentBlocks,
          ));
          sectionIndex++;
        }
        currentHeader = block.title;
        currentBlocks = [];
      } else {
        currentBlocks.add(block);
      }
    }
    // Save last section
    if (currentHeader != null || currentBlocks.isNotEmpty) {
      sections.add(_Section(
        index: sectionIndex,
        header: currentHeader,
        blocks: currentBlocks,
      ));
    }

    return sections;
  }

  bool _isBoardBlock(ContentBlock block) {
    return block is PearlBlock ||
        block is MnemonicBlock ||
        block is TableBlock ||
        block is ScaleBlock ||
        block is MedicationCardBlock ||
        block is CheckpointBlock ||
        block is CaseScenarioBlock;
  }

  @override
  Widget build(BuildContext context) {
    final sections = _buildSections();

    return Column(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          height: 3,
          child: LinearProgressIndicator(
            value: _scrollProgress,
            backgroundColor: Colors.transparent,
            valueColor: AlwaysStoppedAnimation<Color>(
              AppTheme.accentTeal.withValues(alpha: 0.5),
            ),
          ),
        ),
        Expanded(
          child: NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              if (notification is ScrollUpdateNotification) {
                final maxScroll = notification.metrics.maxScrollExtent;
                final currentScroll = notification.metrics.pixels;
                setState(() {
                  _scrollProgress = maxScroll > 0
                      ? (currentScroll / maxScroll).clamp(0.0, 1.0)
                      : 0.0;
                });
              }
              return false;
            },
            child: ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      itemCount: sections.length + 1,
      itemBuilder: (context, index) {
        // Last item: "Mark as Reviewed" button
        if (index == sections.length) {
          return Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 800),
              child: Padding(
                padding: const EdgeInsets.only(top: 24, bottom: 32),
                child: SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: OutlinedButton.icon(
                    onPressed: _toggleReviewed,
                    icon: Icon(
                      _isReviewed ? Icons.check_circle_rounded : Icons.check_circle_outline_rounded,
                      size: 20,
                    ),
                    label: Text(
                      _isReviewed ? 'Reviewed' : 'Mark as Reviewed',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.3,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: _isReviewed ? Colors.white : AppTheme.accentTeal,
                      backgroundColor: _isReviewed ? AppTheme.accentTeal : Colors.transparent,
                      side: BorderSide(
                        color: AppTheme.accentTeal,
                        width: _isReviewed ? 0 : 1.5,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        }

        final section = sections[index];

        // Filter blocks in board-only mode
        final visibleBlocks = widget.boardOnlyMode
            ? section.blocks.where(_isBoardBlock).toList()
            : section.blocks;

        // In board-only mode, hide sections with no board content
        if (widget.boardOnlyMode && visibleBlocks.isEmpty && section.header != null) {
          return const SizedBox.shrink();
        }

        // Wrap each section in Center + max-width constraint for wide screens
        Widget wrapCentered(Widget child) {
          return Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 800),
              child: child,
            ),
          );
        }

        // Sections without a header are always expanded (preamble blocks)
        if (section.header == null) {
          return wrapCentered(
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: visibleBlocks.map(_buildBlock).toList(),
            ),
          );
        }

        final isCollapsed = _collapsedSections.contains(section.index);
        final pearlCount = section.blocks.whereType<PearlBlock>().length;
        final tableCount = section.blocks.where((b) => b is TableBlock || b is ScaleBlock).length;

        return wrapCentered(Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Collapsible header
            GestureDetector(
              onTap: () {
                setState(() {
                  if (isCollapsed) {
                    _collapsedSections.remove(section.index);
                  } else {
                    _collapsedSections.add(section.index);
                  }
                });
              },
              child: Container(
                margin: const EdgeInsets.only(top: 20, bottom: 8),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  color: AppTheme.surfaceElevated,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: AppTheme.accentTeal.withValues(alpha: 0.2),
                  ),
                ),
                child: Row(
                  children: [
                    AnimatedRotation(
                      turns: isCollapsed ? -0.25 : 0,
                      duration: const Duration(milliseconds: 200),
                      child: const Icon(
                        Icons.expand_more_rounded,
                        color: AppTheme.accentTeal,
                        size: 22,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        section.header!,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: AppTheme.accentTeal,
                          letterSpacing: -0.3,
                        ),
                      ),
                    ),
                    // Content badges
                    if (pearlCount > 0) _buildBadge(
                      Icons.lightbulb_rounded,
                      pearlCount.toString(),
                      AppTheme.pearlBorder,
                    ),
                    if (tableCount > 0) ...[
                      const SizedBox(width: 6),
                      _buildBadge(
                        Icons.table_chart_rounded,
                        tableCount.toString(),
                        AppTheme.accentTealDim,
                      ),
                    ],
                  ],
                ),
              ),
            ),
            // Content blocks (animated collapse)
            AnimatedCrossFade(
              firstChild: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: visibleBlocks.map(_buildBlock).toList(),
              ),
              secondChild: const SizedBox.shrink(),
              crossFadeState: isCollapsed
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: const Duration(milliseconds: 250),
              sizeCurve: Curves.easeInOut,
            ),
          ],
        ));
      },
    ),
          ),
        ),
      ],
    );
  }

  Widget _buildBadge(IconData icon, String count, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: color.withValues(alpha: 0.7)),
          const SizedBox(width: 3),
          Text(
            count,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              color: color.withValues(alpha: 0.8),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBlock(ContentBlock block) {
    if (block is HeaderBlock) return const SizedBox.shrink(); // handled as section
    if (block is TextBlock) return _buildText(block);
    if (block is PearlBlock) return _buildPearl(block);
    if (block is BulletCardBlock) return _buildBulletCard(block);
    if (block is TableBlock) return _buildTable(block);
    if (block is MnemonicBlock) return _buildMnemonic(block);
    if (block is NumberedListBlock) return _buildNumberedList(block);
    if (block is MedicationCardBlock) return _buildMedicationCard(block);
    if (block is ComparisonCardBlock) return _buildComparisonCard(block);
    if (block is ScaleBlock) return _buildScaleBlock(block);
    if (block is ImageBlock) return _buildImageBlock(block);
    if (block is NetworkImageBlock) return _buildNetworkImageBlock(block);
    if (block is VideoBlock) return _buildVideoBlock(block);
    if (block is GaitCycleBlock) {
      return const Padding(
        padding: EdgeInsets.only(bottom: 16),
        child: GaitCycleWidget(),
      );
    }
    if (block is PrescriptionBuilderBlock) {
      return const Padding(
        padding: EdgeInsets.only(bottom: 16),
        child: PrescriptionBuilderWidget(),
      );
    }
    if (block is AnnotatedImageBlock) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: AnnotatedImageExplorerWidget(block: block),
      );
    }
    if (block is CheckpointBlock) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: CheckpointWidget(block: block),
      );
    }
    if (block is CaseScenarioBlock) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: CaseScenarioWidget(block: block),
      );
    }
    if (block is FlowchartBlock) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: FlowchartWidget(block: block),
      );
    }
    if (block is CustomWidgetBlock) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: _buildCustomWidget(block.type),
      );
    }
    return const SizedBox.shrink();
  }

  Widget _buildCustomWidget(CustomWidgetType type) {
    switch (type) {
      case CustomWidgetType.prostheticFootDemo:
        return const ProstheticFootDemoWidget();
      case CustomWidgetType.socketPressureDemo:
        return const SocketPressureDemoWidget();
      case CustomWidgetType.cervicalRestrictionDemo:
        return const CervicalRestrictionDemoWidget();
      case CustomWidgetType.terminalDeviceDemo:
        return const TerminalDeviceDemoWidget();
      case CustomWidgetType.froBiomechanicsDemo:
        return const FROBiomechanicsDemoWidget();
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildText(TextBlock block) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        block.text,
        style: TextStyle(
          fontSize: block.isIntro ? 16 : 14,
          height: 1.6,
          color: block.isIntro ? AppTheme.textPrimary : AppTheme.textSecondary,
          fontStyle: block.isIntro ? FontStyle.italic : FontStyle.normal,
        ),
      ),
    );
  }

  Widget _buildPearl(PearlBlock block) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.pearlBackground,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.pearlBorder, width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.lightbulb_rounded, color: AppTheme.pearlBorder, size: 20),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  block.title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFFFFB020),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            block.text,
            style: const TextStyle(
              fontSize: 13,
              height: 1.5,
              color: Color(0xFFD4A017),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBulletCard(BulletCardBlock block) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: block.backgroundColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: block.themeColor.withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            block.title,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: block.themeColor,
            ),
          ),
          const SizedBox(height: 10),
          ...block.points.map((point) => Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 7),
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                        color: block.themeColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        point,
                        style: const TextStyle(fontSize: 13, height: 1.5, color: AppTheme.textPrimary),
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildTable(TableBlock block) {
    final isWide = block.columns.length > 3;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.surfaceBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (block.title.isNotEmpty)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: block.headerColor ?? AppTheme.backgroundDark,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(11),
                  topRight: Radius.circular(11),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      block.title,
                      style: const TextStyle(
                        color: AppTheme.textPrimary,
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  if (isWide)
                    const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.swipe_rounded, size: 14, color: AppTheme.textSecondary),
                        SizedBox(width: 4),
                        Text(
                          'Swipe',
                          style: TextStyle(fontSize: 11, color: AppTheme.textSecondary),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: const Radius.circular(11),
              bottomRight: const Radius.circular(11),
              topLeft: block.title.isEmpty ? const Radius.circular(11) : Radius.zero,
              topRight: block.title.isEmpty ? const Radius.circular(11) : Radius.zero,
            ),
            child: isWide
                ? _buildScrollableTable(block)
                : _buildFittedTable(block),
          ),
        ],
      ),
    );
  }

  Widget _buildFittedTable(TableBlock block) {
    // For narrow tables (<=3 cols), fill available width
    return Table(
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      columnWidths: {
        for (int i = 0; i < block.columns.length; i++)
          i: i == 0
              ? const FlexColumnWidth(1.2)
              : const FlexColumnWidth(1.0),
      },
      border: TableBorder(
        horizontalInside: BorderSide(
          color: AppTheme.surfaceBorder.withValues(alpha: 0.5),
          width: 0.5,
        ),
      ),
      children: [
        // Header row
        TableRow(
          decoration: const BoxDecoration(color: Color(0xFF232A3B)),
          children: block.columns.map((c) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Text(
              c,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 12,
                color: AppTheme.accentTeal,
              ),
            ),
          )).toList(),
        ),
        // Data rows
        ...block.rows.asMap().entries.map((entry) {
          return TableRow(
            decoration: BoxDecoration(
              color: entry.key.isEven
                  ? AppTheme.surfaceDark
                  : AppTheme.surfaceElevated.withValues(alpha: 0.5),
            ),
            children: entry.value.map((cell) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: Text(
                cell,
                style: const TextStyle(
                  fontSize: 12,
                  color: AppTheme.textPrimary,
                  height: 1.4,
                ),
              ),
            )).toList(),
          );
        }),
      ],
    );
  }

  Widget _buildScrollableTable(TableBlock block) {
    // For wide tables (>3 cols), freeze first column and scroll the rest
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Frozen first column
        Expanded(
          flex: 3,
          child: Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            border: TableBorder(
              horizontalInside: BorderSide(
                color: AppTheme.surfaceBorder.withValues(alpha: 0.5),
                width: 0.5,
              ),
            ),
            children: [
              TableRow(
                decoration: const BoxDecoration(color: Color(0xFF232A3B)),
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Text(
                      block.columns.first,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                        color: AppTheme.accentTeal,
                      ),
                    ),
                  ),
                ],
              ),
              ...block.rows.asMap().entries.map((entry) {
                return TableRow(
                  decoration: BoxDecoration(
                    color: entry.key.isEven
                        ? AppTheme.surfaceDark
                        : AppTheme.surfaceElevated.withValues(alpha: 0.5),
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                      child: Text(
                        entry.value.isNotEmpty ? entry.value.first : '',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.textPrimary,
                          height: 1.4,
                        ),
                      ),
                    ),
                  ],
                );
              }),
            ],
          ),
        ),
        // Vertical divider
        Container(width: 1, color: AppTheme.accentTeal.withValues(alpha: 0.3)),
        // Scrollable remaining columns
        Expanded(
          flex: 7,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Table(
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              defaultColumnWidth: const IntrinsicColumnWidth(),
              border: TableBorder(
                horizontalInside: BorderSide(
                  color: AppTheme.surfaceBorder.withValues(alpha: 0.5),
                  width: 0.5,
                ),
              ),
              children: [
                TableRow(
                  decoration: const BoxDecoration(color: Color(0xFF232A3B)),
                  children: block.columns.skip(1).map((c) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                    child: Text(
                      c,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                        color: AppTheme.accentTeal,
                      ),
                    ),
                  )).toList(),
                ),
                ...block.rows.asMap().entries.map((entry) {
                  return TableRow(
                    decoration: BoxDecoration(
                      color: entry.key.isEven
                          ? AppTheme.surfaceDark
                          : AppTheme.surfaceElevated.withValues(alpha: 0.5),
                    ),
                    children: entry.value.skip(1).map((cell) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                      child: Text(
                        cell,
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppTheme.textPrimary,
                          height: 1.4,
                        ),
                      ),
                    )).toList(),
                  );
                }),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMnemonic(MnemonicBlock block) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.mnemonicBackground,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.mnemonicBorder, width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.psychology_alt_rounded, color: AppTheme.mnemonicBorder, size: 20),
              SizedBox(width: 8),
              Text(
                'Memory Aid',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF9B7BF7),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            block.mnemonic,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w800,
              color: Color(0xFF9B7BF7),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            block.explanation,
            style: const TextStyle(
              fontSize: 13,
              height: 1.4,
              color: Color(0xFF7C6BC4),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNumberedList(NumberedListBlock block) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: block.items.map((item) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: AppTheme.accentTeal.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    item.key,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.accentTeal,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    item.value,
                    style: const TextStyle(fontSize: 13, height: 1.5, color: AppTheme.textPrimary),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildMedicationCard(MedicationCardBlock block) {
    final borderColor = block.isAvoid ? AppTheme.avoidBorder : AppTheme.accentTeal;
    final bgColor = block.isAvoid ? AppTheme.avoidBackground : AppTheme.surfaceDark;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor.withValues(alpha: 0.4)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                block.isAvoid ? Icons.do_not_disturb_rounded : Icons.check_circle_rounded,
                color: borderColor,
                size: 18,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  '${block.name} (${block.drugClass})',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: borderColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text('Mechanism: ${block.mechanism}', style: const TextStyle(fontSize: 12, height: 1.4, color: AppTheme.textSecondary)),
          Text('Indication: ${block.indication}', style: const TextStyle(fontSize: 12, height: 1.4, color: AppTheme.textSecondary)),
          if (block.dosing.isNotEmpty)
            Text('Dosing: ${block.dosing}', style: const TextStyle(fontSize: 12, height: 1.4, color: AppTheme.textSecondary)),
          if (block.sideEffects.isNotEmpty)
            Text('Side Effects: ${block.sideEffects}', style: const TextStyle(fontSize: 12, height: 1.4, color: AppTheme.textSecondary)),
          if (block.boardPearl.isNotEmpty) ...[
            const SizedBox(height: 6),
            Text(
              'Board Pearl: ${block.boardPearl}',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.italic,
                color: borderColor,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildComparisonCard(ComparisonCardBlock block) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: block.backgroundColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: block.themeColor.withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(block.icon, color: block.themeColor, size: 22),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  block.title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: block.themeColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(block.description, style: const TextStyle(fontSize: 13, height: 1.4, color: AppTheme.textSecondary)),
          const SizedBox(height: 8),
          ...block.keyPoints.map((p) => Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('• ', style: TextStyle(color: block.themeColor, fontWeight: FontWeight.bold)),
                    Expanded(child: Text(p, style: const TextStyle(fontSize: 12, height: 1.4, color: AppTheme.textPrimary))),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildScaleBlock(ScaleBlock block) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.accentTeal.withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppTheme.surfaceDark,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(11),
                topRight: Radius.circular(11),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  block.scaleName,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: AppTheme.accentTeal,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  block.description,
                  style: const TextStyle(fontSize: 12, color: AppTheme.textSecondary),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columnSpacing: 16,
              horizontalMargin: 12,
              headingTextStyle: const TextStyle(fontWeight: FontWeight.w700, fontSize: 11, color: AppTheme.textPrimary),
              dataTextStyle: const TextStyle(fontSize: 11, height: 1.3, color: AppTheme.textPrimary),
              columns: block.columns.map((c) => DataColumn(label: Text(c))).toList(),
              rows: block.rows.map((row) {
                return DataRow(
                  cells: row.map((cell) => DataCell(
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 160),
                      child: Text(cell),
                    ),
                  )).toList(),
                );
              }).toList(),
            ),
          ),
          if (block.boardPearl != null)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: AppTheme.pearlBackground,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(11),
                  bottomRight: Radius.circular(11),
                ),
              ),
              child: Text(
                'Board Pearl: ${block.boardPearl}',
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.italic,
                  color: Color(0xFFFFB020),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildImageBlock(ImageBlock block) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.surfaceBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(11),
              topRight: Radius.circular(11),
            ),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: block.maxHeight ?? 300,
              ),
              child: Image.asset(
                block.assetPath,
                width: double.infinity,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 120,
                    color: AppTheme.surfaceElevated,
                    child: const Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.image_not_supported_rounded, color: AppTheme.textTertiary, size: 32),
                          SizedBox(height: 8),
                          Text('Image not available', style: TextStyle(color: AppTheme.textTertiary, fontSize: 12)),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: AppTheme.surfaceElevated,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(11),
                bottomRight: Radius.circular(11),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  block.caption,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.textPrimary,
                    height: 1.4,
                  ),
                ),
                if (block.credit != null) ...[
                  const SizedBox(height: 2),
                  Text(
                    block.credit!,
                    style: const TextStyle(
                      fontSize: 10,
                      fontStyle: FontStyle.italic,
                      color: AppTheme.textTertiary,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNetworkImageBlock(NetworkImageBlock block) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.surfaceBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(11),
              topRight: Radius.circular(11),
            ),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: block.maxHeight ?? 300,
              ),
              child: Image.network(
                block.url,
                width: double.infinity,
                fit: BoxFit.contain,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Container(
                    height: 150,
                    color: AppTheme.surfaceElevated,
                    child: Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                        color: AppTheme.accentTeal,
                        strokeWidth: 2,
                      ),
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 120,
                    color: AppTheme.surfaceElevated,
                    child: const Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.broken_image_rounded, color: AppTheme.textTertiary, size: 32),
                          SizedBox(height: 8),
                          Text('Failed to load image', style: TextStyle(color: AppTheme.textTertiary, fontSize: 12)),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: AppTheme.surfaceElevated,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(11),
                bottomRight: Radius.circular(11),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  block.caption,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.textPrimary,
                    height: 1.4,
                  ),
                ),
                if (block.credit != null) ...[
                  const SizedBox(height: 2),
                  Text(
                    block.credit!,
                    style: const TextStyle(
                      fontSize: 10,
                      fontStyle: FontStyle.italic,
                      color: AppTheme.textTertiary,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVideoBlock(VideoBlock block) {
    return _YoutubeVideoPlayer(block: block, onLaunchUrl: _launchUrl);
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    final canOpen = await canLaunchUrl(uri);
    if (!mounted) return;
    if (canOpen) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Could not open: $url'),
          backgroundColor: AppTheme.surfaceElevated,
        ),
      );
    }
  }
}

// ---------------------------------------------------------------------------
// Stateful YouTube player — creates controller once, disposes properly
// ---------------------------------------------------------------------------

class _YoutubeVideoPlayer extends StatefulWidget {
  final VideoBlock block;
  final Future<void> Function(String) onLaunchUrl;

  const _YoutubeVideoPlayer({required this.block, required this.onLaunchUrl});

  @override
  State<_YoutubeVideoPlayer> createState() => _YoutubeVideoPlayerState();
}

class _YoutubeVideoPlayerState extends State<_YoutubeVideoPlayer> {
  YoutubePlayerController? _controller;
  String? _videoId;

  @override
  void initState() {
    super.initState();
    _videoId = _extractYouTubeId(widget.block.url);
    if (_videoId != null) {
      _controller = YoutubePlayerController.fromVideoId(
        videoId: _videoId!,
        autoPlay: false,
        params: const YoutubePlayerParams(
          showControls: true,
          showFullscreenButton: true,
          mute: false,
          playsInline: true,
        ),
      );
    }
  }

  @override
  void dispose() {
    _controller?.close();
    super.dispose();
  }

  static String? _extractYouTubeId(String url) {
    final uri = Uri.tryParse(url);
    if (uri == null) return null;
    if (uri.host.contains('youtube.com') &&
        uri.queryParameters.containsKey('v')) {
      return uri.queryParameters['v'];
    }
    if (uri.host.contains('youtu.be') && uri.pathSegments.isNotEmpty) {
      return uri.pathSegments.first;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final block = widget.block;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: AppTheme.surfaceElevated,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.accentTeal.withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(11),
              topRight: Radius.circular(11),
            ),
            child: _controller != null
                ? AspectRatio(
                    aspectRatio: 16 / 9,
                    child: YoutubePlayer(controller: _controller!),
                  )
                : GestureDetector(
                    onTap: () => widget.onLaunchUrl(block.url),
                    child: Container(
                      height: 180,
                      width: double.infinity,
                      color: AppTheme.backgroundDark,
                      child: const Center(
                        child: Icon(
                          Icons.play_arrow_rounded,
                          color: AppTheme.accentTeal,
                          size: 48,
                        ),
                      ),
                    ),
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.videocam_rounded,
                        color: AppTheme.accentTeal, size: 18),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        block.title,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: AppTheme.textPrimary,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  block.description,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppTheme.textSecondary,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------

class _Section {
  final int index;
  final String? header;
  final List<ContentBlock> blocks;

  const _Section({
    required this.index,
    this.header,
    required this.blocks,
  });
}

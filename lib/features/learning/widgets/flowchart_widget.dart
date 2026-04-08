import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';
import '../../../data/models/topic_content_model.dart';

class FlowchartWidget extends StatefulWidget {
  const FlowchartWidget({super.key, required this.block});

  final FlowchartBlock block;

  @override
  State<FlowchartWidget> createState() => _FlowchartWidgetState();
}

class _FlowchartWidgetState extends State<FlowchartWidget>
    with SingleTickerProviderStateMixin {
  late String _currentNodeId;
  late List<String> _path;
  late AnimationController _animController;
  late Animation<double> _fadeAnim;

  @override
  void initState() {
    super.initState();
    _currentNodeId = widget.block.rootNodeId;
    _path = [_currentNodeId];
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _fadeAnim = CurvedAnimation(
      parent: _animController,
      curve: Curves.easeInOut,
    );
    _animController.forward();
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  FlowchartNode? get _currentNode => widget.block.nodes[_currentNodeId];

  void _selectOption(FlowchartOption option) {
    _animController.reverse().then((_) {
      setState(() {
        _currentNodeId = option.targetNodeId;
        _path.add(_currentNodeId);
      });
      _animController.forward();
    });
  }

  void _startOver() {
    _animController.reverse().then((_) {
      setState(() {
        _currentNodeId = widget.block.rootNodeId;
        _path = [_currentNodeId];
      });
      _animController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    final node = _currentNode;
    if (node == null) {
      return const SizedBox.shrink();
    }

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF0F1923),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppTheme.accentTeal.withValues(alpha: 0.3),
        ),
        boxShadow: [
          BoxShadow(
            color: AppTheme.accentTeal.withValues(alpha: 0.05),
            blurRadius: 20,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          FadeTransition(
            opacity: _fadeAnim,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildNodeCard(node),
                  if (!node.isLeaf) _buildOptions(node),
                  if (node.isLeaf) ...[
                    _buildRecommendation(node),
                    if (node.rationale != null)
                      _buildRationale(node.rationale!),
                    if (node.boardPearl != null)
                      _buildBoardPearl(node.boardPearl!),
                    _buildPathSummary(),
                  ],
                  const SizedBox(height: 12),
                  _buildStartOverButton(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppTheme.accentTeal.withValues(alpha: 0.15),
            AppTheme.accentTeal.withValues(alpha: 0.05),
          ],
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppTheme.accentTeal.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.account_tree_rounded,
              color: AppTheme.accentTeal,
              size: 24,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.block.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: AppTheme.textPrimary,
                    letterSpacing: 0.3,
                  ),
                ),
                const SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: AppTheme.accentTeal.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                      color: AppTheme.accentTeal.withValues(alpha: 0.3),
                    ),
                  ),
                  child: const Text(
                    'Interactive Algorithm',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.accentTeal,
                      letterSpacing: 0.8,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNodeCard(FlowchartNode node) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF152233),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF2A3545)),
      ),
      child: Text(
        node.text,
        style: const TextStyle(
          fontSize: 15,
          color: AppTheme.textPrimary,
          height: 1.5,
        ),
      ),
    );
  }

  Widget _buildOptions(FlowchartNode node) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: node.options.map((option) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: _FlowchartOptionTile(
              option: option,
              onTap: () => _selectOption(option),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildRecommendation(FlowchartNode node) {
    if (node.recommendation == null) return const SizedBox.shrink();

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF152233),
        borderRadius: BorderRadius.circular(10),
        border: const Border(
          left: BorderSide(
            color: AppTheme.accentTeal,
            width: 4,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.check_circle_rounded,
                color: AppTheme.accentTeal.withValues(alpha: 0.9),
                size: 18,
              ),
              const SizedBox(width: 8),
              const Text(
                'Recommendation',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.accentTeal,
                  letterSpacing: 0.3,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            node.recommendation!,
            style: const TextStyle(
              fontSize: 14,
              color: AppTheme.textPrimary,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRationale(String rationale) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Text(
        rationale,
        style: const TextStyle(
          fontSize: 13,
          color: AppTheme.textSecondary,
          height: 1.5,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }

  Widget _buildBoardPearl(String pearl) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF2A2415),
        borderRadius: BorderRadius.circular(10),
        border: const Border(
          left: BorderSide(
            color: Color(0xFFFFB020),
            width: 4,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(
                Icons.star_rounded,
                color: Color(0xFFFFB020),
                size: 16,
              ),
              SizedBox(width: 6),
              Text(
                'Board Pearl',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFFFFB020),
                  letterSpacing: 0.3,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            pearl,
            style: const TextStyle(
              fontSize: 13,
              color: AppTheme.textPrimary,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPathSummary() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF152233),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFF2A3545)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'PATH SUMMARY',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: AppTheme.accentTeal.withValues(alpha: 0.8),
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 4,
            runSpacing: 6,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: _buildBreadcrumbs(),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildBreadcrumbs() {
    final widgets = <Widget>[];
    for (var i = 0; i < _path.length; i++) {
      final nodeId = _path[i];
      final node = widget.block.nodes[nodeId];
      if (node == null) continue;

      // Determine the label: for non-root nodes, use the option label that
      // led to this node. For the root, use a truncated version of the text.
      String label;
      if (i == 0) {
        label = _truncate(node.text, 30);
      } else {
        // Find which option from the previous node led here.
        final prevNode = widget.block.nodes[_path[i - 1]];
        final matchingOption = prevNode?.options
            .where((o) => o.targetNodeId == nodeId)
            .firstOrNull;
        label = matchingOption?.label ?? _truncate(node.text, 30);
      }

      widgets.add(
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: i == _path.length - 1
                ? AppTheme.accentTeal.withValues(alpha: 0.15)
                : const Color(0xFF1A2332),
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              color: i == _path.length - 1
                  ? AppTheme.accentTeal.withValues(alpha: 0.4)
                  : const Color(0xFF2A3545),
            ),
          ),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: i == _path.length - 1
                  ? AppTheme.accentTeal
                  : AppTheme.textSecondary,
            ),
          ),
        ),
      );

      if (i < _path.length - 1) {
        widgets.add(
          const Text(
            '\u2192',
            style: TextStyle(
              fontSize: 13,
              color: AppTheme.textTertiary,
              fontWeight: FontWeight.w600,
            ),
          ),
        );
      }
    }
    return widgets;
  }

  String _truncate(String text, int maxLength) {
    if (text.length <= maxLength) return text;
    return '${text.substring(0, maxLength - 1)}\u2026';
  }

  Widget _buildStartOverButton() {
    // Only show when not at root.
    if (_path.length <= 1) return const SizedBox.shrink();

    return Center(
      child: OutlinedButton.icon(
        onPressed: _startOver,
        icon: const Icon(Icons.refresh_rounded, size: 18),
        label: const Text('Start Over'),
        style: OutlinedButton.styleFrom(
          foregroundColor: AppTheme.accentTeal,
          side: BorderSide(
            color: AppTheme.accentTeal.withValues(alpha: 0.5),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Option tile with hover/press feedback
// ---------------------------------------------------------------------------

class _FlowchartOptionTile extends StatefulWidget {
  const _FlowchartOptionTile({
    required this.option,
    required this.onTap,
  });

  final FlowchartOption option;
  final VoidCallback onTap;

  @override
  State<_FlowchartOptionTile> createState() => _FlowchartOptionTileState();
}

class _FlowchartOptionTileState extends State<_FlowchartOptionTile> {
  bool _isHovered = false;
  bool _isPressed = false;

  double get _tealAlpha {
    if (_isPressed) return 0.2;
    if (_isHovered) return 0.2;
    return 0.1;
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTapDown: (_) => setState(() => _isPressed = true),
        onTapUp: (_) {
          setState(() => _isPressed = false);
          widget.onTap();
        },
        onTapCancel: () => setState(() => _isPressed = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: AppTheme.accentTeal.withValues(alpha: _tealAlpha),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: AppTheme.accentTeal.withValues(
                alpha: _isHovered || _isPressed ? 0.4 : 0.2,
              ),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  widget.option.label,
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppTheme.textPrimary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Icon(
                Icons.arrow_forward_rounded,
                size: 18,
                color: AppTheme.accentTeal.withValues(alpha: 0.7),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

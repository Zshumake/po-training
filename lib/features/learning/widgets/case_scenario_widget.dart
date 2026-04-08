import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';
import '../../../data/models/topic_content_model.dart';

// ---------------------------------------------------------------------------
// CaseScenarioWidget
//
// A step-through clinical case scenario interaction. Presents a patient
// vignette and sequential decision points, then displays a summary table
// showing the user's choices against the optimal answers.
// ---------------------------------------------------------------------------

class CaseScenarioWidget extends StatefulWidget {
  const CaseScenarioWidget({super.key, required this.block});

  final CaseScenarioBlock block;

  @override
  State<CaseScenarioWidget> createState() => _CaseScenarioWidgetState();
}

class _CaseScenarioWidgetState extends State<CaseScenarioWidget>
    with SingleTickerProviderStateMixin {
  // Current decision index. When >= decisionPoints.length we show the summary.
  int _currentStep = 0;

  // Index of the option the user tapped for the current decision, or -1.
  int _selectedIndex = -1;

  // Whether the explanation is visible (after tapping an option).
  bool _answered = false;

  // Tracks user selections across all decision points.
  final List<int> _userSelections = [];

  // Animation for transitioning between decision steps.
  late final AnimationController _fadeController;
  late final Animation<double> _fadeAnimation;

  int get _totalSteps => widget.block.decisionPoints.length;
  bool get _isComplete => _currentStep >= _totalSteps;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOut,
    );
    _fadeController.value = 1.0;
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  // -----------------------------------------------------------------------
  // Interaction handlers
  // -----------------------------------------------------------------------

  void _onOptionTapped(int index) {
    if (_answered) return;
    setState(() {
      _selectedIndex = index;
      _answered = true;
    });
  }

  void _advanceStep() {
    _userSelections.add(_selectedIndex);

    // Fade out, swap content, fade in.
    _fadeController.reverse().then((_) {
      setState(() {
        _currentStep++;
        _selectedIndex = -1;
        _answered = false;
      });
      _fadeController.forward();
    });
  }

  void _resetCase() {
    _fadeController.reverse().then((_) {
      setState(() {
        _currentStep = 0;
        _selectedIndex = -1;
        _answered = false;
        _userSelections.clear();
      });
      _fadeController.forward();
    });
  }

  // -----------------------------------------------------------------------
  // Build
  // -----------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF0F1923),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: AppTheme.surfaceBorder,
          width: 1,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildHeader(),
          _buildVignetteCard(),
          _buildProgressIndicator(),
          FadeTransition(
            opacity: _fadeAnimation,
            child: _isComplete ? _buildSummary() : _buildDecisionArea(),
          ),
        ],
      ),
    );
  }

  // -----------------------------------------------------------------------
  // Header
  // -----------------------------------------------------------------------

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0x260D9488), // 15% teal
            Color(0x0D0D9488), // 5% teal
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.medical_services_outlined,
            color: AppTheme.accentTealDim,
            size: 22,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              widget.block.title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppTheme.textPrimary,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: AppTheme.accentTealDim.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                color: AppTheme.accentTealDim.withValues(alpha: 0.3),
              ),
            ),
            child: const Text(
              'Clinical Case',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: AppTheme.accentTealDim,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // -----------------------------------------------------------------------
  // Patient vignette (always visible)
  // -----------------------------------------------------------------------

  Widget _buildVignetteCard() {
    return Container(
      margin: const EdgeInsets.fromLTRB(14, 10, 14, 0),
      decoration: BoxDecoration(
        color: const Color(0xFF152233),
        borderRadius: BorderRadius.circular(10),
        border: const Border(
          left: BorderSide(color: Color(0xFF3B82F6), width: 3),
        ),
      ),
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.person_outline,
                size: 16,
                color: const Color(0xFF3B82F6).withValues(alpha: 0.8),
              ),
              const SizedBox(width: 6),
              Text(
                'Patient Presentation',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF3B82F6).withValues(alpha: 0.8),
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            widget.block.vignette,
            style: const TextStyle(
              fontSize: 13.5,
              height: 1.55,
              color: AppTheme.textPrimary,
            ),
          ),
        ],
      ),
    );
  }

  // -----------------------------------------------------------------------
  // Progress indicator (dots)
  // -----------------------------------------------------------------------

  Widget _buildProgressIndicator() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(14, 14, 14, 4),
      child: Row(
        children: [
          Text(
            _isComplete
                ? 'Case Complete'
                : 'Decision ${_currentStep + 1} of $_totalSteps',
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppTheme.textSecondary,
            ),
          ),
          const Spacer(),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(_totalSteps, (i) {
              final bool completed = i < _currentStep ||
                  (i == _currentStep && _isComplete);
              return Container(
                width: 8,
                height: 8,
                margin: const EdgeInsets.symmetric(horizontal: 3),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: completed
                      ? AppTheme.accentTealDim
                      : Colors.transparent,
                  border: Border.all(
                    color: completed
                        ? AppTheme.accentTealDim
                        : AppTheme.textTertiary,
                    width: 1.5,
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  // -----------------------------------------------------------------------
  // Decision area (one decision at a time)
  // -----------------------------------------------------------------------

  Widget _buildDecisionArea() {
    final decision = widget.block.decisionPoints[_currentStep];

    return Padding(
      padding: const EdgeInsets.fromLTRB(14, 8, 14, 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Prompt
          Text(
            decision.prompt,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.white,
              height: 1.45,
            ),
          ),
          const SizedBox(height: 12),

          // Option tiles
          ...List.generate(decision.options.length, (i) {
            return _buildOptionTile(decision, i);
          }),

          // Explanation + Next button (visible after answering)
          if (_answered) ...[
            const SizedBox(height: 12),
            _buildExplanation(decision),
            const SizedBox(height: 12),
            _buildNextButton(),
          ],
        ],
      ),
    );
  }

  Widget _buildOptionTile(CaseDecisionPoint decision, int index) {
    final bool isSelected = _selectedIndex == index;
    final bool isOptimal = index == decision.optimalIndex;

    // Determine tile color based on state.
    Color tileColor = const Color(0xFF1A2332);
    Color borderColor = Colors.transparent;

    if (_answered) {
      if (isOptimal) {
        tileColor = const Color(0xFF16A34A).withValues(alpha: 0.15);
        borderColor = const Color(0xFF16A34A).withValues(alpha: 0.5);
      } else if (isSelected && !isOptimal) {
        tileColor = const Color(0xFFFF9800).withValues(alpha: 0.12);
        borderColor = const Color(0xFFFF9800).withValues(alpha: 0.4);
      }
    } else if (isSelected) {
      tileColor = AppTheme.accentTealDim.withValues(alpha: 0.2);
      borderColor = AppTheme.accentTealDim.withValues(alpha: 0.4);
    }

    // Leading icon for answered state.
    Widget? trailing;
    if (_answered) {
      if (isOptimal) {
        trailing = const Icon(Icons.check_circle, color: Color(0xFF16A34A), size: 20);
      } else if (isSelected && !isOptimal) {
        trailing = const Icon(Icons.cancel, color: Color(0xFFFF9800), size: 20);
      }
    }

    final String label = String.fromCharCode(65 + index); // A, B, C, D...

    return GestureDetector(
      onTap: () => _onOptionTapped(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: tileColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: borderColor == Colors.transparent
                ? AppTheme.surfaceBorder
                : borderColor,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 26,
              height: 26,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected && !_answered
                    ? AppTheme.accentTealDim.withValues(alpha: 0.3)
                    : AppTheme.surfaceBorder.withValues(alpha: 0.5),
              ),
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: isSelected && !_answered
                      ? AppTheme.accentTeal
                      : AppTheme.textSecondary,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                decision.options[index],
                style: const TextStyle(
                  fontSize: 13.5,
                  color: AppTheme.textPrimary,
                  height: 1.4,
                ),
              ),
            ),
            if (trailing != null) ...[
              const SizedBox(width: 8),
              trailing,
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildExplanation(CaseDecisionPoint decision) {
    final bool correct = _selectedIndex == decision.optimalIndex;
    final Color accentColor =
        correct ? const Color(0xFF16A34A) : const Color(0xFFFF9800);

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: accentColor.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: accentColor.withValues(alpha: 0.25)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                correct ? Icons.check_circle_outline : Icons.info_outline,
                color: accentColor,
                size: 16,
              ),
              const SizedBox(width: 6),
              Text(
                correct ? 'Correct' : 'Not Optimal',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: accentColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            decision.explanation,
            style: const TextStyle(
              fontSize: 13,
              height: 1.5,
              color: AppTheme.textPrimary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNextButton() {
    final bool isLast = _currentStep == _totalSteps - 1;

    return Align(
      alignment: Alignment.centerRight,
      child: TextButton.icon(
        onPressed: _advanceStep,
        icon: Text(
          isLast ? 'View Summary' : 'Next Decision',
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: AppTheme.accentTeal,
          ),
        ),
        label: const Icon(
          Icons.arrow_forward_rounded,
          size: 18,
          color: AppTheme.accentTeal,
        ),
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(
              color: AppTheme.accentTeal.withValues(alpha: 0.3),
            ),
          ),
        ),
      ),
    );
  }

  // -----------------------------------------------------------------------
  // Summary screen (after all decisions)
  // -----------------------------------------------------------------------

  Widget _buildSummary() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(14, 8, 14, 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // "Case Complete" header
          Row(
            children: [
              const Icon(
                Icons.assignment_turned_in_outlined,
                color: AppTheme.accentTeal,
                size: 20,
              ),
              const SizedBox(width: 8),
              const Text(
                'Case Complete',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.accentTeal,
                ),
              ),
              const Spacer(),
              _buildScoreBadge(),
            ],
          ),
          const SizedBox(height: 14),

          // Results table with staggered rows
          _buildResultsTable(),
          const SizedBox(height: 16),

          // Summary pearl
          _buildSummaryPearl(),
          const SizedBox(height: 14),

          // Reset button
          Center(
            child: TextButton.icon(
              onPressed: _resetCase,
              icon: const Icon(Icons.refresh_rounded, size: 18),
              label: const Text(
                'Reset Case',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
              ),
              style: TextButton.styleFrom(
                foregroundColor: AppTheme.textSecondary,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: const BorderSide(color: AppTheme.surfaceBorder),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScoreBadge() {
    int correct = 0;
    for (int i = 0; i < _totalSteps; i++) {
      if (_userSelections[i] == widget.block.decisionPoints[i].optimalIndex) {
        correct++;
      }
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: correct == _totalSteps
            ? const Color(0xFF16A34A).withValues(alpha: 0.15)
            : AppTheme.warningAmber.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: correct == _totalSteps
              ? const Color(0xFF16A34A).withValues(alpha: 0.3)
              : AppTheme.warningAmber.withValues(alpha: 0.3),
        ),
      ),
      child: Text(
        '$correct / $_totalSteps',
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          color: correct == _totalSteps
              ? const Color(0xFF16A34A)
              : AppTheme.warningAmber,
        ),
      ),
    );
  }

  Widget _buildResultsTable() {
    return _StaggeredResultsTable(
      decisionPoints: widget.block.decisionPoints,
      userSelections: _userSelections,
    );
  }

  Widget _buildSummaryPearl() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF2A2415),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppTheme.pearlBorder.withValues(alpha: 0.4),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.lightbulb_outline,
                size: 16,
                color: AppTheme.warningAmber.withValues(alpha: 0.9),
              ),
              const SizedBox(width: 6),
              Text(
                'Clinical Pearl',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.warningAmber.withValues(alpha: 0.9),
                  letterSpacing: 0.3,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            widget.block.summaryPearl,
            style: const TextStyle(
              fontSize: 13.5,
              height: 1.55,
              color: AppTheme.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Staggered results table
//
// Animates each row in with a short delay after the previous one, producing
// a top-down reveal effect.
// ---------------------------------------------------------------------------

class _StaggeredResultsTable extends StatefulWidget {
  const _StaggeredResultsTable({
    required this.decisionPoints,
    required this.userSelections,
  });

  final List<CaseDecisionPoint> decisionPoints;
  final List<int> userSelections;

  @override
  State<_StaggeredResultsTable> createState() => _StaggeredResultsTableState();
}

class _StaggeredResultsTableState extends State<_StaggeredResultsTable>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final List<Animation<double>> _rowAnimations;

  @override
  void initState() {
    super.initState();
    final int count = widget.decisionPoints.length;
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250 + count * 150),
    );

    _rowAnimations = List.generate(count, (i) {
      final double start = i / (count + 1);
      final double end = (i + 1.5) / (count + 1);
      return CurvedAnimation(
        parent: _controller,
        curve: Interval(start, end.clamp(0.0, 1.0), curve: Curves.easeOut),
      );
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Table header
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: AppTheme.surfaceBorder.withValues(alpha: 0.3),
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(8),
            ),
          ),
          child: const Row(
            children: [
              SizedBox(
                width: 28,
                child: Text('#',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.textTertiary,
                    )),
              ),
              Expanded(
                flex: 3,
                child: Text('Your Choice',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.textTertiary,
                    )),
              ),
              Expanded(
                flex: 3,
                child: Text('Optimal',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.textTertiary,
                    )),
              ),
              SizedBox(
                width: 32,
                child: Center(
                  child: Icon(Icons.verified_outlined,
                      size: 14, color: AppTheme.textTertiary),
                ),
              ),
            ],
          ),
        ),

        // Data rows
        ...List.generate(widget.decisionPoints.length, (i) {
          final dp = widget.decisionPoints[i];
          final userIdx = widget.userSelections[i];
          final bool matched = userIdx == dp.optimalIndex;
          final Color rowAccent = matched
              ? const Color(0xFF16A34A)
              : const Color(0xFFFF9800);

          return FadeTransition(
            opacity: _rowAnimations[i],
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 0.15),
                end: Offset.zero,
              ).animate(_rowAnimations[i]),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  color: rowAccent.withValues(alpha: 0.06),
                  border: Border(
                    bottom: BorderSide(
                      color: AppTheme.surfaceBorder.withValues(alpha: 0.4),
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 28,
                      child: Text(
                        '${i + 1}',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: AppTheme.textSecondary,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(
                        dp.options[userIdx],
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppTheme.textPrimary,
                          height: 1.3,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      flex: 3,
                      child: Text(
                        dp.options[dp.optimalIndex],
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppTheme.textPrimary,
                          height: 1.3,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(
                      width: 32,
                      child: Center(
                        child: Icon(
                          matched
                              ? Icons.check_circle
                              : Icons.remove_circle_outline,
                          size: 18,
                          color: rowAccent,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ],
    );
  }
}

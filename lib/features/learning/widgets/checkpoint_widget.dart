import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';
import '../../../data/models/topic_content_model.dart';

// ---------------------------------------------------------------------------
// Colors specific to the checkpoint card
// ---------------------------------------------------------------------------

const Color _cardBackground = Color(0xFF152233);
const Color _cardBorder = Color(0xFF2A3545);
const Color _headerIcon = Color(0xFF64748B);
const Color _optionBackground = Color(0xFF1A2332);
const Color _correctGreen = Color(0xFF16A34A);
const Color _incorrectRed = Color(0xFFDC2626);
const Color _explanationBackground = Color(0xFF1A2A15);

// ---------------------------------------------------------------------------
// CheckpointWidget — inline self-test question card
// ---------------------------------------------------------------------------

class CheckpointWidget extends StatefulWidget {
  const CheckpointWidget({super.key, required this.block});

  final CheckpointBlock block;

  @override
  State<CheckpointWidget> createState() => _CheckpointWidgetState();
}

class _CheckpointWidgetState extends State<CheckpointWidget>
    with SingleTickerProviderStateMixin {
  int? _selectedIndex;
  bool _answered = false;

  late final AnimationController _explanationController;
  late final Animation<double> _explanationAnimation;

  static const _labels = ['A', 'B', 'C', 'D'];

  @override
  void initState() {
    super.initState();
    _explanationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _explanationAnimation = CurvedAnimation(
      parent: _explanationController,
      curve: Curves.easeOutCubic,
    );
  }

  @override
  void dispose() {
    _explanationController.dispose();
    super.dispose();
  }

  void _onOptionTapped(int index) {
    if (_answered) return;
    setState(() {
      _selectedIndex = index;
      _answered = true;
    });
    _explanationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final block = widget.block;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: _cardBackground,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: _cardBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Row(
              children: [
                Icon(Icons.psychology_outlined, size: 20, color: _headerIcon),
                const SizedBox(width: 8),
                Text(
                  'Check Your Understanding',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: _headerIcon,
                    letterSpacing: 0.3,
                  ),
                ),
              ],
            ),
          ),

          // Question
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 4, 16, 14),
            child: Text(
              block.question,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppTheme.textPrimary,
                height: 1.4,
              ),
            ),
          ),

          // Options
          ...List.generate(block.options.length, (i) {
            return _OptionTile(
              label: _labels[i],
              text: block.options[i],
              state: _optionState(i),
              onTap: () => _onOptionTapped(i),
            );
          }),

          // Explanation (slides in after answering)
          SizeTransition(
            sizeFactor: _explanationAnimation,
            axisAlignment: -1,
            child: _ExplanationBox(explanation: block.explanation),
          ),

          const SizedBox(height: 4),
        ],
      ),
    );
  }

  _OptionState _optionState(int index) {
    if (!_answered) return _OptionState.idle;
    if (index == widget.block.correctIndex) return _OptionState.correct;
    if (index == _selectedIndex) return _OptionState.incorrect;
    return _OptionState.dimmed;
  }
}

// ---------------------------------------------------------------------------
// Option tile states
// ---------------------------------------------------------------------------

enum _OptionState { idle, correct, incorrect, dimmed }

// ---------------------------------------------------------------------------
// _OptionTile — a single tappable answer option
// ---------------------------------------------------------------------------

class _OptionTile extends StatelessWidget {
  const _OptionTile({
    required this.label,
    required this.text,
    required this.state,
    required this.onTap,
  });

  final String label;
  final String text;
  final _OptionState state;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final Color bgColor;
    final Color borderColor;
    final Color badgeColor;
    final Color textColor;
    final IconData? trailingIcon;

    switch (state) {
      case _OptionState.idle:
        bgColor = _optionBackground;
        borderColor = _cardBorder;
        badgeColor = AppTheme.textTertiary;
        textColor = AppTheme.textPrimary;
        trailingIcon = null;
      case _OptionState.correct:
        bgColor = _correctGreen.withValues(alpha: 0.15);
        borderColor = _correctGreen.withValues(alpha: 0.5);
        badgeColor = _correctGreen;
        textColor = AppTheme.textPrimary;
        trailingIcon = Icons.check_circle_rounded;
      case _OptionState.incorrect:
        bgColor = _incorrectRed.withValues(alpha: 0.15);
        borderColor = _incorrectRed.withValues(alpha: 0.5);
        badgeColor = _incorrectRed;
        textColor = AppTheme.textPrimary;
        trailingIcon = Icons.cancel_rounded;
      case _OptionState.dimmed:
        bgColor = _optionBackground.withValues(alpha: 0.5);
        borderColor = _cardBorder.withValues(alpha: 0.3);
        badgeColor = AppTheme.textTertiary.withValues(alpha: 0.4);
        textColor = AppTheme.textSecondary.withValues(alpha: 0.5);
        trailingIcon = null;
    }

    return GestureDetector(
      onTap: state == _OptionState.idle ? onTap : null,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: borderColor),
        ),
        child: Row(
          children: [
            // Letter badge
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: badgeColor.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(7),
                border: Border.all(color: badgeColor.withValues(alpha: 0.4)),
              ),
              alignment: Alignment.center,
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: badgeColor,
                ),
              ),
            ),
            const SizedBox(width: 12),

            // Option text
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: textColor,
                  height: 1.4,
                ),
              ),
            ),

            // Result icon
            if (trailingIcon != null) ...[
              const SizedBox(width: 8),
              Icon(
                trailingIcon,
                size: 22,
                color: state == _OptionState.correct
                    ? _correctGreen
                    : _incorrectRed,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// _ExplanationBox — shown after answering
// ---------------------------------------------------------------------------

class _ExplanationBox extends StatelessWidget {
  const _ExplanationBox({required this.explanation});

  final String explanation;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(12, 8, 12, 8),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: _explanationBackground,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: _correctGreen.withValues(alpha: 0.25),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.lightbulb_rounded,
            size: 18,
            color: _correctGreen.withValues(alpha: 0.8),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              explanation,
              style: TextStyle(
                fontSize: 14,
                height: 1.5,
                color: AppTheme.textPrimary.withValues(alpha: 0.9),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

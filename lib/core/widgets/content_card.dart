import 'package:flutter/material.dart';
import '../../data/models/module_model.dart';
import '../../data/module_contents/module_content_registry.dart';
import '../../core/services/progress_service.dart';
import '../../core/theme/app_theme.dart';

class ContentCard extends StatefulWidget {
  final ModuleModel module;
  final int index;
  final VoidCallback onTap;

  const ContentCard({
    super.key,
    required this.module,
    required this.index,
    required this.onTap,
  });

  @override
  State<ContentCard> createState() => _ContentCardState();
}

class _ContentCardState extends State<ContentCard> {
  double _progress = 0.0;

  ModuleModel get module => widget.module;
  int get index => widget.index;
  VoidCallback get onTap => widget.onTap;

  Color get _moduleColor => AppTheme.moduleColors[index % AppTheme.moduleColors.length];

  IconData get _moduleIcon {
    final icons = [
      Icons.menu_book_rounded,
      Icons.straighten_rounded,
      Icons.back_hand_rounded,
      Icons.airline_seat_legroom_extra,
      Icons.settings_rounded,
      Icons.directions_walk_rounded,
      Icons.accessibility_new_rounded,
      Icons.precision_manufacturing_rounded,
      Icons.trending_up_rounded,
      Icons.build_rounded,
      Icons.child_care_rounded,
      Icons.memory_rounded,
      Icons.local_hospital_rounded,
      Icons.groups_rounded,
    ];
    return icons[index % icons.length];
  }

  @override
  void initState() {
    super.initState();
    _loadProgress();
  }

  @override
  void didUpdateWidget(ContentCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.module.id != widget.module.id) {
      _loadProgress();
    }
  }

  Future<void> _loadProgress() async {
    final topicData = moduleContentRegistry[module.id];
    if (topicData == null) return;
    final percent = await ProgressService.getModuleCompletionPercent(
      module.id,
      topicData.tabs.length,
    );
    if (mounted) {
      setState(() => _progress = percent);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
        // Reload progress when returning from module screen
        Future.delayed(const Duration(milliseconds: 300), () {
          if (mounted) _loadProgress();
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
        decoration: BoxDecoration(
          color: AppTheme.surfaceDark,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: _moduleColor.withValues(alpha: 0.15),
            width: 1,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Row(
            children: [
              // Left accent bar
              Container(
                width: 3,
                height: 100,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      _moduleColor,
                      _moduleColor.withValues(alpha: 0.3),
                    ],
                  ),
                ),
              ),
              // Module number
              SizedBox(
                width: 52,
                height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      (index + 1).toString().padLeft(2, '0'),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: _moduleColor.withValues(alpha: 0.6),
                        fontFamily: 'Courier',
                        letterSpacing: -1,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        color: _moduleColor.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: _moduleColor.withValues(alpha: 0.2),
                          width: 1,
                        ),
                      ),
                      child: Icon(
                        _moduleIcon,
                        color: _moduleColor.withValues(alpha: 0.7),
                        size: 16,
                      ),
                    ),
                  ],
                ),
              ),
              // Vertical divider
              Container(
                width: 1,
                height: 60,
                color: AppTheme.surfaceBorder,
              ),
              // Content
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        module.title,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: AppTheme.textPrimary,
                          letterSpacing: -0.2,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        module.description,
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppTheme.textSecondary,
                          height: 1.3,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (module.highlights.isNotEmpty) ...[
                        const SizedBox(height: 8),
                        Wrap(
                          spacing: 6,
                          children: module.highlights.take(3).map((h) {
                            return Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 7,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: _moduleColor.withValues(alpha: 0.08),
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(
                                  color: _moduleColor.withValues(alpha: 0.15),
                                  width: 1,
                                ),
                              ),
                              child: Text(
                                h,
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                  color: _moduleColor.withValues(alpha: 0.8),
                                  letterSpacing: 0.3,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (_progress > 0) ...[
                      SizedBox(
                        width: 28,
                        height: 28,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            CircularProgressIndicator(
                              value: _progress,
                              strokeWidth: 2.5,
                              backgroundColor: AppTheme.surfaceBorder,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                _progress >= 1.0
                                    ? AppTheme.successGreen
                                    : _moduleColor,
                              ),
                            ),
                            if (_progress >= 1.0)
                              const Icon(
                                Icons.check_rounded,
                                color: AppTheme.successGreen,
                                size: 14,
                              )
                            else
                              Text(
                                '${(_progress * 100).round()}',
                                style: TextStyle(
                                  fontSize: 8,
                                  fontWeight: FontWeight.w800,
                                  color: _moduleColor,
                                ),
                              ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 4),
                    ],
                    Icon(
                      Icons.chevron_right_rounded,
                      color: AppTheme.textTertiary,
                      size: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

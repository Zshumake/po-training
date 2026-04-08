import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../data/models/topic_content_model.dart';

// ---------------------------------------------------------------------------
// Colors scoped to this widget, derived from AppTheme for consistency.
// ---------------------------------------------------------------------------
const Color _kBackground = Color(0xFF0F1923);
const Color _kSurface = Color(0xFF1A2332);
const Color _kBorder = Color(0xFF2A3545);
const Color _kTeal = Color(0xFF0D9488);
const Color _kTextPrimary = Color(0xFFE8ECF4);
const Color _kTextSecondary = Color(0xFF8892A4);
const Color _kAmber = Color(0xFFFFB020);

// ---------------------------------------------------------------------------
// AnnotatedImageExplorerWidget
// ---------------------------------------------------------------------------

class AnnotatedImageExplorerWidget extends StatefulWidget {
  const AnnotatedImageExplorerWidget({
    super.key,
    required this.block,
  });

  final AnnotatedImageBlock block;

  @override
  State<AnnotatedImageExplorerWidget> createState() =>
      _AnnotatedImageExplorerWidgetState();
}

class _AnnotatedImageExplorerWidgetState
    extends State<AnnotatedImageExplorerWidget>
    with SingleTickerProviderStateMixin {
  int? _selectedIndex;
  late final AnimationController _tooltipController;
  late final Animation<double> _tooltipOpacity;
  late final Animation<Offset> _tooltipSlide;

  @override
  void initState() {
    super.initState();
    _tooltipController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _tooltipOpacity = CurvedAnimation(
      parent: _tooltipController,
      curve: Curves.easeOut,
    );
    _tooltipSlide = Tween<Offset>(
      begin: const Offset(0, 0.15),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _tooltipController,
      curve: Curves.easeOutCubic,
    ));
  }

  @override
  void dispose() {
    _tooltipController.dispose();
    super.dispose();
  }

  void _selectHotspot(int index) {
    if (_selectedIndex == index) {
      _closeTooltip();
      return;
    }
    setState(() => _selectedIndex = index);
    _tooltipController.forward(from: 0);
  }

  void _closeTooltip() {
    _tooltipController.reverse().then((_) {
      if (mounted) setState(() => _selectedIndex = null);
    });
  }

  @override
  Widget build(BuildContext context) {
    final block = widget.block;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: _kSurface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: _kBorder),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Header(title: block.title),
          _DiagramArea(
            block: block,
            selectedIndex: _selectedIndex,
            tooltipOpacity: _tooltipOpacity,
            tooltipSlide: _tooltipSlide,
            onHotspotTap: _selectHotspot,
            onBackgroundTap: _closeTooltip,
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Header
// ---------------------------------------------------------------------------

class _Header extends StatelessWidget {
  const _Header({required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: _kBorder)),
      ),
      child: Row(
        children: [
          const Icon(Icons.touch_app_rounded, color: _kTeal, size: 20),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: _kTeal,
                fontSize: 16,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.3,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            decoration: BoxDecoration(
              color: _kTeal.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Text(
              'Interactive',
              style: TextStyle(
                color: _kTeal,
                fontSize: 11,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Diagram area (InteractiveViewer + Stack of pins + tooltip)
// ---------------------------------------------------------------------------

class _DiagramArea extends StatelessWidget {
  const _DiagramArea({
    required this.block,
    required this.selectedIndex,
    required this.tooltipOpacity,
    required this.tooltipSlide,
    required this.onHotspotTap,
    required this.onBackgroundTap,
  });

  final AnnotatedImageBlock block;
  final int? selectedIndex;
  final Animation<double> tooltipOpacity;
  final Animation<Offset> tooltipSlide;
  final ValueChanged<int> onHotspotTap;
  final VoidCallback onBackgroundTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onBackgroundTap,
      behavior: HitTestBehavior.translucent,
      child: InteractiveViewer(
        minScale: 1.0,
        maxScale: 3.0,
        child: AspectRatio(
          aspectRatio: block.aspectRatio,
          child: LayoutBuilder(
            builder: (context, constraints) {
              final width = constraints.maxWidth;
              final height = constraints.maxHeight;

              return Stack(
                clipBehavior: Clip.none,
                children: [
                  // Background diagram
                  Positioned.fill(
                    child: CustomPaint(
                      painter: _DiagramPainter(
                        diagramType: block.diagramType,
                      ),
                    ),
                  ),

                  // Hotspot pins
                  for (int i = 0; i < block.hotspots.length; i++)
                    _buildPin(i, width, height),

                  // Tooltip card
                  if (selectedIndex != null)
                    _buildTooltip(width, height),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildPin(int index, double width, double height) {
    final hotspot = block.hotspots[index];
    final isSelected = selectedIndex == index;
    const pinSize = 28.0;

    return Positioned(
      left: hotspot.xPercent * width - pinSize / 2,
      top: hotspot.yPercent * height - pinSize / 2,
      child: GestureDetector(
        onTap: () => onHotspotTap(index),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: pinSize,
          height: pinSize,
          decoration: BoxDecoration(
            color: isSelected
                ? hotspot.pinColor
                : hotspot.pinColor.withValues(alpha: 0.85),
            shape: BoxShape.circle,
            border: Border.all(
              color: isSelected ? Colors.white : Colors.white70,
              width: isSelected ? 2.5 : 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: hotspot.pinColor.withValues(alpha: isSelected ? 0.6 : 0.3),
                blurRadius: isSelected ? 12 : 6,
                spreadRadius: isSelected ? 2 : 0,
              ),
            ],
          ),
          child: Center(
            child: Text(
              '${index + 1}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w800,
                height: 1,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTooltip(double width, double height) {
    final hotspot = block.hotspots[selectedIndex!];

    return Positioned(
      left: 12,
      right: 12,
      bottom: 12,
      child: FadeTransition(
        opacity: tooltipOpacity,
        child: SlideTransition(
          position: tooltipSlide,
          child: _TooltipCard(
            index: selectedIndex! + 1,
            hotspot: hotspot,
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Tooltip card
// ---------------------------------------------------------------------------

class _TooltipCard extends StatelessWidget {
  const _TooltipCard({
    required this.index,
    required this.hotspot,
  });

  final int index;
  final HotspotData hotspot;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: _kSurface.withValues(alpha: 0.96),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: hotspot.pinColor.withValues(alpha: 0.5)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.4),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Label row
          Row(
            children: [
              Container(
                width: 22,
                height: 22,
                decoration: BoxDecoration(
                  color: hotspot.pinColor,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    '$index',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.w800,
                      height: 1,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  hotspot.label,
                  style: const TextStyle(
                    color: _kTextPrimary,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Description
          Text(
            hotspot.description,
            style: const TextStyle(
              color: _kTextSecondary,
              fontSize: 13,
              height: 1.5,
            ),
          ),

          // Clinical significance
          if (hotspot.clinicalSignificance != null) ...[
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: _kAmber.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: _kAmber.withValues(alpha: 0.3)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 1),
                    child: Icon(
                      Icons.lightbulb_outline_rounded,
                      color: _kAmber,
                      size: 16,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      hotspot.clinicalSignificance!,
                      style: const TextStyle(
                        color: _kAmber,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        height: 1.45,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// CustomPainter — draws a schematic diagram based on diagramType
// ---------------------------------------------------------------------------

class _DiagramPainter extends CustomPainter {
  _DiagramPainter({required this.diagramType});

  final String diagramType;

  @override
  void paint(Canvas canvas, Size size) {
    // Common background
    final bgPaint = Paint()..color = _kBackground;
    canvas.drawRect(Offset.zero & size, bgPaint);

    // Subtle grid
    _drawGrid(canvas, size);

    switch (diagramType) {
      case 'socket-ptb':
        _drawSocketPTB(canvas, size);
      case 'socket-irc':
        _drawSocketIRC(canvas, size);
      case 'gait-normal':
        _drawGaitNormal(canvas, size);
      case 'gait-trendelenburg':
        _drawGaitTrendelenburg(canvas, size);
      case 'afo-types':
        _drawAFOTypes(canvas, size);
      case 'prosthetic-feet':
        _drawProstheticFeet(canvas, size);
      default:
        _drawPlaceholder(canvas, size);
    }
  }

  @override
  bool shouldRepaint(covariant _DiagramPainter old) =>
      old.diagramType != diagramType;

  // ---- Grid background ----

  void _drawGrid(Canvas canvas, Size size) {
    final gridPaint = Paint()
      ..color = const Color(0xFF1E2A3A)
      ..strokeWidth = 0.5;

    const spacing = 30.0;
    for (double x = 0; x < size.width; x += spacing) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), gridPaint);
    }
    for (double y = 0; y < size.height; y += spacing) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), gridPaint);
    }
  }

  // ---- socket-ptb ----

  void _drawSocketPTB(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final cy = size.height / 2;
    final unit = math.min(size.width, size.height) * 0.35;

    // Residual limb outline — rounded trapezoid
    final limbPaint = Paint()
      ..color = const Color(0xFF3A4A5C)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5;

    final limbFill = Paint()
      ..color = const Color(0xFF1E2E3E)
      ..style = PaintingStyle.fill;

    final limbPath = Path()
      ..moveTo(cx - unit * 0.55, cy - unit * 0.9) // top-left
      ..lineTo(cx + unit * 0.55, cy - unit * 0.9) // top-right
      ..lineTo(cx + unit * 0.38, cy + unit * 0.7) // lower-right
      ..quadraticBezierTo(
          cx, cy + unit * 1.0, cx - unit * 0.38, cy + unit * 0.7)
      ..close();

    canvas.drawPath(limbPath, limbFill);
    canvas.drawPath(limbPath, limbPaint);

    // Patella region — oval at top-center
    final patellaPaint = Paint()
      ..color = const Color(0xFF4A6A7C)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.8
      ..strokeCap = StrokeCap.round;

    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(cx, cy - unit * 0.6),
        width: unit * 0.45,
        height: unit * 0.35,
      ),
      patellaPaint,
    );

    // Patellar tendon bar region
    final ptbPaint = Paint()
      ..color = _kTeal.withValues(alpha: 0.35)
      ..style = PaintingStyle.fill;

    canvas.drawRect(
      Rect.fromCenter(
        center: Offset(cx, cy - unit * 0.35),
        width: unit * 0.5,
        height: unit * 0.1,
      ),
      ptbPaint,
    );

    _drawLabel(canvas, 'PTB Socket — Anterior View', cx, cy + unit * 1.2,
        size.width);
  }

  // ---- socket-irc ----

  void _drawSocketIRC(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final cy = size.height / 2;
    final unit = math.min(size.width, size.height) * 0.35;

    final fillPaint = Paint()
      ..color = const Color(0xFF1E2E3E)
      ..style = PaintingStyle.fill;
    final strokePaint = Paint()
      ..color = const Color(0xFF3A4A5C)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5;

    // Narrower ML socket shape — ischial containment
    final socketPath = Path()
      ..moveTo(cx - unit * 0.35, cy - unit * 0.95)
      ..quadraticBezierTo(
          cx - unit * 0.5, cy - unit * 0.7, cx - unit * 0.3, cy - unit * 0.4)
      ..lineTo(cx - unit * 0.28, cy + unit * 0.65)
      ..quadraticBezierTo(
          cx, cy + unit * 0.9, cx + unit * 0.28, cy + unit * 0.65)
      ..lineTo(cx + unit * 0.3, cy - unit * 0.4)
      ..quadraticBezierTo(
          cx + unit * 0.5, cy - unit * 0.7, cx + unit * 0.35, cy - unit * 0.95)
      ..close();

    canvas.drawPath(socketPath, fillPaint);
    canvas.drawPath(socketPath, strokePaint);

    // Ischial containment shelf
    final shelfPaint = Paint()
      ..color = _kTeal.withValues(alpha: 0.30)
      ..style = PaintingStyle.fill;

    final shelfPath = Path()
      ..moveTo(cx - unit * 0.35, cy - unit * 0.95)
      ..quadraticBezierTo(
          cx - unit * 0.5, cy - unit * 0.7, cx - unit * 0.3, cy - unit * 0.55)
      ..lineTo(cx + unit * 0.3, cy - unit * 0.55)
      ..quadraticBezierTo(
          cx + unit * 0.5, cy - unit * 0.7, cx + unit * 0.35, cy - unit * 0.95)
      ..close();

    canvas.drawPath(shelfPath, shelfPaint);

    _drawLabel(canvas, 'IRC Socket — ML Narrow Profile', cx, cy + unit * 1.15,
        size.width);
  }

  // ---- gait-normal ----

  void _drawGaitNormal(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final baseY = size.height * 0.85;
    final unit = math.min(size.width, size.height) * 0.08;

    _drawStickFigure(
      canvas,
      cx: cx,
      baseY: baseY,
      unit: unit,
      hipDropLeft: 0,
      hipDropRight: 0,
      stanceSide: 0, // right stance
    );

    // Ground line
    final groundPaint = Paint()
      ..color = const Color(0xFF3A4A5C)
      ..strokeWidth = 1.5;
    canvas.drawLine(
      Offset(cx - unit * 5, baseY),
      Offset(cx + unit * 5, baseY),
      groundPaint,
    );

    _drawLabel(canvas, 'Normal Gait — Midstance', cx, baseY + unit * 1.5,
        size.width);
  }

  // ---- gait-trendelenburg ----

  void _drawGaitTrendelenburg(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final baseY = size.height * 0.85;
    final unit = math.min(size.width, size.height) * 0.08;

    _drawStickFigure(
      canvas,
      cx: cx,
      baseY: baseY,
      unit: unit,
      hipDropLeft: unit * 1.2, // contralateral hip drop
      hipDropRight: 0,
      stanceSide: 1, // left stance
    );

    // Ground line
    final groundPaint = Paint()
      ..color = const Color(0xFF3A4A5C)
      ..strokeWidth = 1.5;
    canvas.drawLine(
      Offset(cx - unit * 5, baseY),
      Offset(cx + unit * 5, baseY),
      groundPaint,
    );

    // Arrow showing hip drop
    final arrowPaint = Paint()
      ..color = _kAmber
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final hipY = baseY - unit * 5.5;
    final dropEnd = hipY + unit * 1.2;
    canvas.drawLine(
      Offset(cx + unit * 1.8, hipY),
      Offset(cx + unit * 1.8, dropEnd),
      arrowPaint,
    );
    // Arrowhead
    canvas.drawLine(
      Offset(cx + unit * 1.8, dropEnd),
      Offset(cx + unit * 1.4, dropEnd - unit * 0.4),
      arrowPaint,
    );
    canvas.drawLine(
      Offset(cx + unit * 1.8, dropEnd),
      Offset(cx + unit * 2.2, dropEnd - unit * 0.4),
      arrowPaint,
    );

    _drawLabel(canvas, 'Trendelenburg Gait — Hip Drop', cx, baseY + unit * 1.5,
        size.width);
  }

  // ---- afo-types ----

  void _drawAFOTypes(Canvas canvas, Size size) {
    final labels = ['Solid', 'PLS', 'Articulated', 'FRO'];
    final count = labels.length;
    final slotWidth = size.width / count;
    final unit = math.min(slotWidth * 0.35, size.height * 0.25);

    for (int i = 0; i < count; i++) {
      final cx = slotWidth * (i + 0.5);
      final cy = size.height * 0.45;

      _drawAFOOutline(canvas, cx, cy, unit, i);

      // Label
      final tp = TextPainter(
        text: TextSpan(
          text: labels[i],
          style: const TextStyle(
            color: _kTextSecondary,
            fontSize: 11,
            fontWeight: FontWeight.w600,
          ),
        ),
        textDirection: TextDirection.ltr,
      )..layout();
      tp.paint(canvas, Offset(cx - tp.width / 2, cy + unit * 1.5));
    }

    _drawLabel(
        canvas, 'AFO Types Comparison', size.width / 2,
        size.height * 0.92, size.width);
  }

  void _drawAFOOutline(Canvas canvas, double cx, double cy, double unit,
      int typeIndex) {
    final paint = Paint()
      ..color = const Color(0xFF3A4A5C)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final fill = Paint()
      ..color = const Color(0xFF1E2E3E)
      ..style = PaintingStyle.fill;

    final path = Path();

    switch (typeIndex) {
      case 0: // Solid AFO
        path
          ..moveTo(cx - unit * 0.3, cy - unit * 1.0)
          ..lineTo(cx - unit * 0.3, cy + unit * 0.8)
          ..lineTo(cx + unit * 0.5, cy + unit * 0.8)
          ..lineTo(cx + unit * 0.5, cy + unit * 0.6)
          ..lineTo(cx + unit * 0.15, cy + unit * 0.6)
          ..lineTo(cx + unit * 0.15, cy - unit * 1.0)
          ..close();
      case 1: // PLS — posterior leaf spring
        path
          ..moveTo(cx - unit * 0.1, cy - unit * 1.0)
          ..lineTo(cx - unit * 0.1, cy + unit * 0.6)
          ..lineTo(cx + unit * 0.5, cy + unit * 0.8)
          ..lineTo(cx + unit * 0.5, cy + unit * 0.6)
          ..lineTo(cx + unit * 0.1, cy + unit * 0.5)
          ..lineTo(cx + unit * 0.1, cy - unit * 1.0)
          ..close();
      case 2: // Articulated
        path
          ..moveTo(cx - unit * 0.3, cy - unit * 1.0)
          ..lineTo(cx - unit * 0.3, cy - unit * 0.1)
          ..moveTo(cx - unit * 0.3, cy + unit * 0.1)
          ..lineTo(cx - unit * 0.3, cy + unit * 0.8)
          ..lineTo(cx + unit * 0.5, cy + unit * 0.8)
          ..lineTo(cx + unit * 0.5, cy + unit * 0.6)
          ..lineTo(cx + unit * 0.15, cy + unit * 0.6)
          ..lineTo(cx + unit * 0.15, cy + unit * 0.1)
          ..moveTo(cx + unit * 0.15, cy - unit * 0.1)
          ..lineTo(cx + unit * 0.15, cy - unit * 1.0);
        // Joint circle
        canvas.drawCircle(
          Offset(cx - unit * 0.08, cy),
          unit * 0.12,
          Paint()
            ..color = _kTeal.withValues(alpha: 0.5)
            ..style = PaintingStyle.fill,
        );
      case 3: // Floor reaction (FRO)
        path
          ..moveTo(cx - unit * 0.3, cy - unit * 1.0)
          ..lineTo(cx - unit * 0.3, cy + unit * 0.6)
          ..lineTo(cx + unit * 0.5, cy + unit * 0.8)
          ..lineTo(cx + unit * 0.5, cy + unit * 0.6)
          ..lineTo(cx + unit * 0.15, cy + unit * 0.5)
          ..lineTo(cx + unit * 0.15, cy - unit * 0.3)
          ..lineTo(cx + unit * 0.3, cy - unit * 0.3)
          ..lineTo(cx + unit * 0.3, cy - unit * 1.0)
          ..close();
    }

    canvas.drawPath(path, fill);
    canvas.drawPath(path, paint);
  }

  // ---- prosthetic-feet ----

  void _drawProstheticFeet(Canvas canvas, Size size) {
    final labels = ['SACH', 'Single\nAxis', 'Multi\nAxis', 'Flex\nKeel', 'ESAR'];
    final count = labels.length;
    final slotWidth = size.width / count;
    final unit = math.min(slotWidth * 0.3, size.height * 0.18);

    for (int i = 0; i < count; i++) {
      final cx = slotWidth * (i + 0.5);
      final cy = size.height * 0.42;

      _drawFootOutline(canvas, cx, cy, unit, i);

      final tp = TextPainter(
        text: TextSpan(
          text: labels[i],
          style: const TextStyle(
            color: _kTextSecondary,
            fontSize: 10,
            fontWeight: FontWeight.w600,
          ),
        ),
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      )..layout(maxWidth: slotWidth - 8);
      tp.paint(canvas, Offset(cx - tp.width / 2, cy + unit * 2.0));
    }

    _drawLabel(canvas, 'Prosthetic Foot Types', size.width / 2,
        size.height * 0.92, size.width);
  }

  void _drawFootOutline(Canvas canvas, double cx, double cy, double unit,
      int typeIndex) {
    final stroke = Paint()
      ..color = const Color(0xFF3A4A5C)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    final fill = Paint()
      ..color = const Color(0xFF1E2E3E)
      ..style = PaintingStyle.fill;

    final path = Path();

    // Pylon coming in from top
    canvas.drawLine(
      Offset(cx, cy - unit * 1.5),
      Offset(cx, cy - unit * 0.3),
      stroke,
    );

    switch (typeIndex) {
      case 0: // SACH — simple solid
        path
          ..moveTo(cx - unit * 0.6, cy)
          ..lineTo(cx - unit * 0.8, cy + unit * 0.9)
          ..quadraticBezierTo(
              cx, cy + unit * 1.1, cx + unit * 1.0, cy + unit * 0.9)
          ..lineTo(cx + unit * 0.4, cy)
          ..close();
      case 1: // Single axis
        path
          ..moveTo(cx - unit * 0.6, cy + unit * 0.15)
          ..lineTo(cx - unit * 0.8, cy + unit * 0.9)
          ..quadraticBezierTo(
              cx, cy + unit * 1.1, cx + unit * 1.0, cy + unit * 0.9)
          ..lineTo(cx + unit * 0.4, cy + unit * 0.15)
          ..close();
        // Axis circle
        canvas.drawCircle(
          Offset(cx, cy),
          unit * 0.15,
          Paint()
            ..color = _kTeal.withValues(alpha: 0.5)
            ..style = PaintingStyle.fill,
        );
      case 2: // Multi axis
        path
          ..moveTo(cx - unit * 0.5, cy + unit * 0.2)
          ..lineTo(cx - unit * 0.8, cy + unit * 0.9)
          ..quadraticBezierTo(
              cx, cy + unit * 1.1, cx + unit * 1.0, cy + unit * 0.9)
          ..lineTo(cx + unit * 0.4, cy + unit * 0.2)
          ..close();
        // Multiple axis dots
        for (final dx in [-0.15, 0.15]) {
          canvas.drawCircle(
            Offset(cx + unit * dx, cy + unit * 0.05),
            unit * 0.08,
            Paint()
              ..color = _kTeal.withValues(alpha: 0.5)
              ..style = PaintingStyle.fill,
          );
        }
      case 3: // Flex keel
        path
          ..moveTo(cx - unit * 0.5, cy)
          ..quadraticBezierTo(
              cx - unit * 0.6, cy + unit * 0.6, cx - unit * 0.7, cy + unit * 0.9)
          ..quadraticBezierTo(
              cx, cy + unit * 1.1, cx + unit * 0.9, cy + unit * 0.9)
          ..quadraticBezierTo(
              cx + unit * 0.4, cy + unit * 0.5, cx + unit * 0.3, cy)
          ..close();
      case 4: // ESAR — energy-storing
        path
          ..moveTo(cx - unit * 0.3, cy - unit * 0.2)
          ..quadraticBezierTo(
              cx - unit * 0.8, cy + unit * 0.3, cx - unit * 0.8, cy + unit * 0.9)
          ..quadraticBezierTo(
              cx, cy + unit * 1.2, cx + unit * 1.0, cy + unit * 0.8)
          ..quadraticBezierTo(
              cx + unit * 0.5, cy + unit * 0.2, cx + unit * 0.3, cy - unit * 0.2)
          ..close();
        // Inner spring curve
        final springPaint = Paint()
          ..color = _kTeal.withValues(alpha: 0.4)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.5;
        final springPath = Path()
          ..moveTo(cx - unit * 0.1, cy)
          ..quadraticBezierTo(
              cx - unit * 0.5, cy + unit * 0.4, cx - unit * 0.4, cy + unit * 0.7)
          ..quadraticBezierTo(
              cx, cy + unit * 0.9, cx + unit * 0.5, cy + unit * 0.6);
        canvas.drawPath(springPath, springPaint);
    }

    canvas.drawPath(path, fill);
    canvas.drawPath(path, stroke);
  }

  // ---- Stick figure helper ----

  void _drawStickFigure(
    Canvas canvas, {
    required double cx,
    required double baseY,
    required double unit,
    required double hipDropLeft,
    required double hipDropRight,
    required int stanceSide, // 0 = right, 1 = left
  }) {
    final paint = Paint()
      ..color = const Color(0xFF5A7A8C)
      ..strokeWidth = 2.5
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final headCenter = Offset(cx, baseY - unit * 8);
    final neckBase = Offset(cx, baseY - unit * 7);
    final hipCenter = Offset(cx, baseY - unit * 5.5);

    // Head
    canvas.drawCircle(headCenter, unit * 0.7, paint);

    // Spine
    canvas.drawLine(neckBase, hipCenter, paint);

    // Shoulders
    final shoulderL = Offset(cx - unit * 1.5, baseY - unit * 6.8);
    final shoulderR = Offset(cx + unit * 1.5, baseY - unit * 6.8);
    canvas.drawLine(shoulderL, shoulderR, paint);

    // Arms (hanging)
    canvas.drawLine(shoulderL, Offset(cx - unit * 1.6, baseY - unit * 4.5), paint);
    canvas.drawLine(shoulderR, Offset(cx + unit * 1.6, baseY - unit * 4.5), paint);

    // Hip line (with possible drop)
    final hipL = Offset(cx - unit * 1.0, hipCenter.dy + hipDropLeft);
    final hipR = Offset(cx + unit * 1.0, hipCenter.dy + hipDropRight);
    canvas.drawLine(hipL, hipR, paint);

    // Legs
    if (stanceSide == 0) {
      // Right leg — stance (straight)
      canvas.drawLine(hipR, Offset(cx + unit * 0.8, baseY - unit * 3), paint);
      canvas.drawLine(
          Offset(cx + unit * 0.8, baseY - unit * 3), Offset(cx + unit * 0.8, baseY), paint);
      // Left leg — swing
      canvas.drawLine(hipL, Offset(cx - unit * 1.5, baseY - unit * 3), paint);
      canvas.drawLine(
          Offset(cx - unit * 1.5, baseY - unit * 3), Offset(cx - unit * 1.0, baseY), paint);
    } else {
      // Left leg — stance (straight)
      canvas.drawLine(hipL, Offset(cx - unit * 0.8, baseY - unit * 3), paint);
      canvas.drawLine(
          Offset(cx - unit * 0.8, baseY - unit * 3), Offset(cx - unit * 0.8, baseY), paint);
      // Right leg — swing (with hip drop)
      final kneeR = Offset(cx + unit * 1.2, hipR.dy + unit * 2.0);
      canvas.drawLine(hipR, kneeR, paint);
      canvas.drawLine(kneeR, Offset(cx + unit * 0.8, baseY), paint);
    }
  }

  // ---- Placeholder ----

  void _drawPlaceholder(Canvas canvas, Size size) {
    final rectPaint = Paint()
      ..color = const Color(0xFF2A3A4A)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final inset = size.width * 0.15;
    final rect = Rect.fromLTRB(
      inset,
      size.height * 0.2,
      size.width - inset,
      size.height * 0.7,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(rect, const Radius.circular(12)),
      rectPaint,
    );

    // Cross lines
    canvas.drawLine(rect.topLeft, rect.bottomRight, rectPaint);
    canvas.drawLine(rect.topRight, rect.bottomLeft, rectPaint);

    _drawLabel(
        canvas, 'Diagram', size.width / 2, size.height * 0.78, size.width);
  }

  // ---- Label helper ----

  void _drawLabel(
      Canvas canvas, String text, double cx, double y, double maxWidth) {
    final tp = TextPainter(
      text: TextSpan(
        text: text,
        style: const TextStyle(
          color: _kTextSecondary,
          fontSize: 12,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        ),
      ),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: maxWidth - 32);
    tp.paint(canvas, Offset(cx - tp.width / 2, y));
  }
}

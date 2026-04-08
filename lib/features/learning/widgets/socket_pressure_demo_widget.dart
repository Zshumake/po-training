import 'dart:math' as math;
import 'package:flutter/material.dart';

/// Socket type for transtibial prosthetic sockets.
enum SocketType { ptb, tsb }

/// Anatomical pressure zone on the residual limb.
class _PressureZone {
  final String label;
  final Offset center;
  final double radiusX;
  final double radiusY;
  final bool isTolerant;

  /// Gait phase weighting: [heelStrike, midstance, pushOff, swing].
  /// Values 0.0-1.0 control how bright this zone gets in each phase.
  final List<double> phaseWeights;

  /// Extra multiplier applied only in PTB mode (concentrated loading).
  final double ptbBoost;

  /// Extra multiplier applied only in TSB mode (uniform distribution).
  final double tsbBoost;

  const _PressureZone({
    required this.label,
    required this.center,
    required this.radiusX,
    required this.radiusY,
    required this.isTolerant,
    required this.phaseWeights,
    this.ptbBoost = 1.0,
    this.tsbBoost = 1.0,
  });
}

class SocketPressureDemoWidget extends StatefulWidget {
  final SocketType initialSocketType;

  const SocketPressureDemoWidget({
    super.key,
    this.initialSocketType = SocketType.ptb,
  });

  @override
  State<SocketPressureDemoWidget> createState() =>
      _SocketPressureDemoWidgetState();
}

class _SocketPressureDemoWidgetState extends State<SocketPressureDemoWidget>
    with SingleTickerProviderStateMixin {
  static const _bgColor = Color(0xFF0F1923);
  static const _surfaceColor = Color(0xFF1A2332);
  static const _tealColor = Color(0xFF0D9488);

  late AnimationController _controller;
  late SocketType _socketType;

  @override
  void initState() {
    super.initState();
    _socketType = widget.initialSocketType;
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: _bgColor,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildToggle(),
          const SizedBox(height: 12),
          _buildGaitPhaseIndicator(),
          const SizedBox(height: 12),
          Flexible(
            child: AspectRatio(
              aspectRatio: 0.55,
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, _) {
                  return CustomPaint(
                    painter: _SocketPressurePainter(
                      progress: _controller.value,
                      socketType: _socketType,
                    ),
                    size: Size.infinite,
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 12),
          _buildLegend(),
        ],
      ),
    );
  }

  Widget _buildToggle() {
    return Container(
      decoration: BoxDecoration(
        color: _surfaceColor,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildToggleButton('PTB', SocketType.ptb),
          const SizedBox(width: 4),
          _buildToggleButton('TSB', SocketType.tsb),
        ],
      ),
    );
  }

  Widget _buildToggleButton(String label, SocketType type) {
    final isSelected = _socketType == type;
    return GestureDetector(
      onTap: () => setState(() => _socketType = type),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? _tealColor : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.white54,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  Widget _buildGaitPhaseIndicator() {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        final phase = _currentPhaseName(_controller.value);
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            color: _surfaceColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            phase,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        );
      },
    );
  }

  String _currentPhaseName(double t) {
    if (t < 0.15) return 'Heel Strike';
    if (t < 0.45) return 'Midstance';
    if (t < 0.60) return 'Push-Off';
    return 'Swing Phase';
  }

  Widget _buildLegend() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: _surfaceColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _legendItem(const Color(0xFF22C55E), 'Pressure Tolerant'),
          const SizedBox(width: 16),
          _legendItem(const Color(0xFFEF4444), 'Pressure Sensitive'),
        ],
      ),
    );
  }

  Widget _legendItem(Color color, String label) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.7),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(color: color.withValues(alpha: 0.4), blurRadius: 4),
            ],
          ),
        ),
        const SizedBox(width: 6),
        Text(
          label,
          style: const TextStyle(color: Colors.white60, fontSize: 11),
        ),
      ],
    );
  }
}

class _SocketPressurePainter extends CustomPainter {
  final double progress;
  final SocketType socketType;

  _SocketPressurePainter({
    required this.progress,
    required this.socketType,
  });

  // Gait phase boundaries (fraction of cycle).
  // 0.00-0.15 heel strike, 0.15-0.45 midstance, 0.45-0.60 push-off, 0.60-1.0 swing.

  /// Returns a 0-1 blend for each gait sub-phase.
  List<double> _phaseBlends(double t) {
    // Smooth triangular blending so transitions are gradual.
    double heelStrike = _triangle(t, 0.0, 0.15);
    double midstance = _triangle(t, 0.15, 0.45);
    double pushOff = _triangle(t, 0.45, 0.60);
    double swing = _triangle(t, 0.60, 1.0);
    return [heelStrike, midstance, pushOff, swing];
  }

  double _triangle(double t, double start, double end) {
    final mid = (start + end) / 2;
    if (t < start || t > end) return 0.0;
    if (t <= mid) return (t - start) / (mid - start);
    return (end - t) / (end - mid);
  }

  // All zones defined in normalized coordinates (0-1 range within the canvas).
  static const List<_PressureZone> _zones = [
    // --- Pressure-tolerant (green) ---
    _PressureZone(
      label: 'Patellar Tendon',
      center: Offset(0.50, 0.14),
      radiusX: 0.14,
      radiusY: 0.04,
      isTolerant: true,
      phaseWeights: [1.0, 0.7, 0.4, 0.1],
      ptbBoost: 1.5,
      tsbBoost: 1.0,
    ),
    _PressureZone(
      label: 'Medial Tibial Flare',
      center: Offset(0.34, 0.28),
      radiusX: 0.07,
      radiusY: 0.09,
      isTolerant: true,
      phaseWeights: [0.6, 0.8, 0.5, 0.1],
      ptbBoost: 1.0,
      tsbBoost: 1.2,
    ),
    _PressureZone(
      label: 'Lateral Fibular Shaft',
      center: Offset(0.66, 0.38),
      radiusX: 0.06,
      radiusY: 0.12,
      isTolerant: true,
      phaseWeights: [0.5, 0.8, 0.6, 0.1],
      ptbBoost: 0.9,
      tsbBoost: 1.2,
    ),
    _PressureZone(
      label: 'Popliteal Fossa',
      center: Offset(0.50, 0.06),
      radiusX: 0.12,
      radiusY: 0.03,
      isTolerant: true,
      phaseWeights: [0.7, 0.6, 0.3, 0.1],
      ptbBoost: 1.1,
      tsbBoost: 1.0,
    ),

    // --- Pressure-sensitive (red) ---
    _PressureZone(
      label: 'Fibular Head',
      center: Offset(0.70, 0.18),
      radiusX: 0.06,
      radiusY: 0.05,
      isTolerant: false,
      phaseWeights: [0.5, 0.4, 0.3, 0.05],
      ptbBoost: 0.4,
      tsbBoost: 0.7,
    ),
    _PressureZone(
      label: 'Tibial Crest',
      center: Offset(0.50, 0.40),
      radiusX: 0.05,
      radiusY: 0.18,
      isTolerant: false,
      phaseWeights: [0.4, 0.35, 0.3, 0.05],
      ptbBoost: 0.3,
      tsbBoost: 0.6,
    ),
    _PressureZone(
      label: 'Medial Tibial Condyle',
      center: Offset(0.35, 0.15),
      radiusX: 0.06,
      radiusY: 0.05,
      isTolerant: false,
      phaseWeights: [0.5, 0.4, 0.3, 0.05],
      ptbBoost: 0.35,
      tsbBoost: 0.65,
    ),
    _PressureZone(
      label: 'Lateral Tibial Condyle',
      center: Offset(0.63, 0.15),
      radiusX: 0.06,
      radiusY: 0.05,
      isTolerant: false,
      phaseWeights: [0.5, 0.4, 0.3, 0.05],
      ptbBoost: 0.35,
      tsbBoost: 0.65,
    ),
    _PressureZone(
      label: 'Distal Tibia',
      center: Offset(0.50, 0.72),
      radiusX: 0.10,
      radiusY: 0.06,
      isTolerant: false,
      phaseWeights: [0.3, 0.35, 0.5, 0.05],
      ptbBoost: 0.3,
      tsbBoost: 0.55,
    ),
    _PressureZone(
      label: 'Hamstring Tendons',
      center: Offset(0.50, 0.02),
      radiusX: 0.18,
      radiusY: 0.02,
      isTolerant: false,
      phaseWeights: [0.4, 0.3, 0.25, 0.05],
      ptbBoost: 0.35,
      tsbBoost: 0.6,
    ),
  ];

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    _drawSocketOutline(canvas, w, h);
    _drawResidualLimb(canvas, w, h);
    _drawPressureZones(canvas, w, h);
    _drawLabels(canvas, w, h);
  }

  void _drawSocketOutline(Canvas canvas, double w, double h) {
    final paint = Paint()
      ..color = const Color(0xFF0D9488).withValues(alpha: 0.5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5;

    final path = Path();
    // Proximal brim (wider, wraps around knee).
    path.moveTo(w * 0.18, h * 0.02);
    path.quadraticBezierTo(w * 0.50, h * -0.02, w * 0.82, h * 0.02);
    // Lateral wall.
    path.cubicTo(
      w * 0.85, h * 0.20,
      w * 0.78, h * 0.55,
      w * 0.70, h * 0.82,
    );
    // Distal end.
    path.quadraticBezierTo(w * 0.50, h * 0.88, w * 0.30, h * 0.82);
    // Medial wall.
    path.cubicTo(
      w * 0.22, h * 0.55,
      w * 0.15, h * 0.20,
      w * 0.18, h * 0.02,
    );
    path.close();

    canvas.drawPath(path, paint);

    // Subtle fill for socket body.
    final fillPaint = Paint()
      ..color = const Color(0xFF0D9488).withValues(alpha: 0.06)
      ..style = PaintingStyle.fill;
    canvas.drawPath(path, fillPaint);
  }

  void _drawResidualLimb(Canvas canvas, double w, double h) {
    final paint = Paint()
      ..color = const Color(0xFF3B4A5C).withValues(alpha: 0.35)
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(w * 0.28, h * 0.05);
    path.quadraticBezierTo(w * 0.50, h * 0.01, w * 0.72, h * 0.05);
    path.cubicTo(
      w * 0.75, h * 0.22,
      w * 0.70, h * 0.52,
      w * 0.64, h * 0.76,
    );
    path.quadraticBezierTo(w * 0.50, h * 0.82, w * 0.36, h * 0.76);
    path.cubicTo(
      w * 0.30, h * 0.52,
      w * 0.25, h * 0.22,
      w * 0.28, h * 0.05,
    );
    path.close();

    canvas.drawPath(path, paint);

    // Limb outline.
    final outline = Paint()
      ..color = const Color(0xFF4B5E73).withValues(alpha: 0.5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2;
    canvas.drawPath(path, outline);
  }

  void _drawPressureZones(Canvas canvas, double w, double h) {
    final blends = _phaseBlends(progress);

    for (final zone in _zones) {
      // Compute intensity from gait phase blending.
      double intensity = 0.0;
      for (int i = 0; i < 4; i++) {
        intensity += zone.phaseWeights[i] * blends[i];
      }

      // Apply socket-type boost.
      final boost =
          socketType == SocketType.ptb ? zone.ptbBoost : zone.tsbBoost;
      intensity = (intensity * boost).clamp(0.0, 1.0);

      // Base color.
      final baseColor =
          zone.isTolerant ? const Color(0xFF22C55E) : const Color(0xFFEF4444);

      // Draw radial gradient ellipse.
      final center = Offset(zone.center.dx * w, zone.center.dy * h);
      final rx = zone.radiusX * w;
      final ry = zone.radiusY * h;

      final rect = Rect.fromCenter(
        center: center,
        width: rx * 2,
        height: ry * 2,
      );

      final gradient = RadialGradient(
        colors: [
          baseColor.withValues(alpha: intensity * 0.75),
          baseColor.withValues(alpha: intensity * 0.25),
          baseColor.withValues(alpha: 0.0),
        ],
        stops: const [0.0, 0.6, 1.0],
      );

      final paint = Paint()
        ..shader = gradient.createShader(rect)
        ..style = PaintingStyle.fill;

      canvas.save();
      canvas.translate(center.dx, center.dy);
      canvas.scale(1.0, ry / rx);
      canvas.drawCircle(Offset.zero, rx, paint);
      canvas.restore();

      // Glow effect for brighter zones.
      if (intensity > 0.4) {
        final glowPaint = Paint()
          ..color = baseColor.withValues(alpha: (intensity - 0.4) * 0.3)
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 12);
        canvas.save();
        canvas.translate(center.dx, center.dy);
        canvas.scale(1.0, ry / rx);
        canvas.drawCircle(Offset.zero, rx * 0.6, glowPaint);
        canvas.restore();
      }
    }
  }

  void _drawLabels(Canvas canvas, double w, double h) {
    // Draw a few key labels so the anatomy is identifiable.
    const labels = [
      ('Patellar Tendon', Offset(0.50, 0.14), true),
      ('Fibular Head', Offset(0.70, 0.18), false),
      ('Tibial Crest', Offset(0.50, 0.40), false),
      ('Distal End', Offset(0.50, 0.72), false),
    ];

    for (final (text, pos, isTolerant) in labels) {
      final color =
          isTolerant ? const Color(0xFF22C55E) : const Color(0xFFEF4444);
      final tp = TextPainter(
        text: TextSpan(
          text: text,
          style: TextStyle(
            color: color.withValues(alpha: 0.6),
            fontSize: math.min(w, h) * 0.035,
            fontWeight: FontWeight.w500,
          ),
        ),
        textDirection: TextDirection.ltr,
      )..layout();

      final offset = Offset(
        pos.dx * w - tp.width / 2,
        pos.dy * h + (math.min(w, h) * 0.04),
      );
      tp.paint(canvas, offset);
    }
  }

  @override
  bool shouldRepaint(_SocketPressurePainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.socketType != socketType;
  }
}

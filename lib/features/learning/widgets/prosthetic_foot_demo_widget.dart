import 'dart:math' as math;
import 'package:flutter/material.dart';

/// The five prosthetic foot types that can be demonstrated.
enum ProstheticFootType {
  sach('SACH'),
  singleAxis('Single-Axis'),
  multiAxis('Multi-Axis'),
  energyStoring('Energy-Storing'),
  microprocessor('Microprocessor');

  const ProstheticFootType(this.label);
  final String label;
}

/// Animates a side-view schematic of different prosthetic feet responding
/// during a single gait cycle. Each [ProstheticFootType] produces distinct
/// kinematic behaviour rendered via [CustomPaint].
class ProstheticFootDemoWidget extends StatefulWidget {
  const ProstheticFootDemoWidget({
    super.key,
    this.initialFootType = ProstheticFootType.sach,
  });

  final ProstheticFootType initialFootType;

  @override
  State<ProstheticFootDemoWidget> createState() =>
      _ProstheticFootDemoWidgetState();
}

class _ProstheticFootDemoWidgetState extends State<ProstheticFootDemoWidget>
    with SingleTickerProviderStateMixin {
  static const _bgColor = Color(0xFF0F1923);
  static const _surfaceColor = Color(0xFF1A2332);
  static const _tealAccent = Color(0xFF0D9488);

  late AnimationController _controller;
  late ProstheticFootType _footType;

  @override
  void initState() {
    super.initState();
    _footType = widget.initialFootType;
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _selectFootType(ProstheticFootType type) {
    if (type == _footType) return;
    setState(() {
      _footType = type;
      _controller
        ..reset()
        ..repeat();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: _bgColor,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Foot-type selector chips
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: ProstheticFootType.values.map((type) {
                final selected = type == _footType;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: ChoiceChip(
                    label: Text(
                      type.label,
                      style: TextStyle(
                        color: selected ? _bgColor : Colors.white70,
                        fontSize: 12,
                        fontWeight:
                            selected ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                    selected: selected,
                    selectedColor: _tealAccent,
                    backgroundColor: _surfaceColor,
                    side: BorderSide(
                      color: selected ? _tealAccent : Colors.white24,
                    ),
                    showCheckmark: false,
                    onSelected: (_) => _selectFootType(type),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 16),
          // Animated schematic
          AnimatedBuilder(
            animation: _controller,
            builder: (context, _) {
              return CustomPaint(
                size: const Size(280, 300),
                painter: _FootGaitPainter(
                  footType: _footType,
                  phase: _controller.value,
                ),
              );
            },
          ),
          const SizedBox(height: 12),
          // Current foot-type label
          Text(
            _footType.label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Custom painter that draws the pylon, foot, ground, and GRF arrow.
// ---------------------------------------------------------------------------

class _FootGaitPainter extends CustomPainter {
  _FootGaitPainter({required this.footType, required this.phase});

  final ProstheticFootType footType;

  /// Normalised gait-cycle progress 0..1.
  final double phase;

  // Layout constants
  static const double _pylonTop = 30.0;
  static const double _pylonLength = 110.0;
  static const double _pylonWidth = 8.0;
  static const double _ankleY = _pylonTop + _pylonLength;
  static const double _footLength = 90.0;
  static const double _footHeight = 18.0;
  static const double _groundY = _ankleY + _footHeight + 30;

  static const _tealAccent = Color(0xFF0D9488);
  static const _surfaceColor = Color(0xFF1A2332);

  // Stance phase occupies roughly 0..0.6 of the cycle.
  static const double _stanceEnd = 0.6;

  bool get _inStance => phase <= _stanceEnd;

  /// A smooth 0..1..0 within stance for loading/unloading.
  double get _stanceProgress =>
      _inStance ? math.sin((phase / _stanceEnd) * math.pi) : 0.0;

  /// Normalised stance sub-phase 0..1.
  double get _stanceLinear => _inStance ? phase / _stanceEnd : 1.0;

  /// Normalised swing sub-phase 0..1.
  double get _swingLinear =>
      _inStance ? 0.0 : (phase - _stanceEnd) / (1.0 - _stanceEnd);

  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;
    canvas.save();
    canvas.translate(centerX - 20, 0);

    _drawGround(canvas, size, centerX);
    _drawGRF(canvas);
    _drawPylonAndFoot(canvas);

    canvas.restore();
  }

  // -- Ground line ----------------------------------------------------------

  void _drawGround(Canvas canvas, Size size, double centerX) {
    final paint = Paint()
      ..color = Colors.white38
      ..strokeWidth = 2;
    canvas.drawLine(
      Offset(-centerX + 20, _groundY),
      Offset(size.width - centerX + 20, _groundY),
      paint,
    );
  }

  // -- GRF arrow (only during stance) ---------------------------------------

  void _drawGRF(Canvas canvas) {
    if (!_inStance) return;

    // GRF application point moves from heel to toe across stance.
    final xStart = 0.0;
    final xEnd = _footLength - 10;
    final grfX = xStart + (xEnd - xStart) * _stanceLinear;
    final grfBaseY = _groundY;

    final magnitude = 50.0 * _stanceProgress;

    final paint = Paint()
      ..color = Colors.redAccent.withValues(alpha: 0.85)
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    final arrowTipY = grfBaseY - magnitude;

    // Shaft
    canvas.drawLine(Offset(grfX, grfBaseY), Offset(grfX, arrowTipY), paint);

    // Arrowhead
    final headSize = 6.0;
    final path = Path()
      ..moveTo(grfX, arrowTipY)
      ..lineTo(grfX - headSize, arrowTipY + headSize * 1.5)
      ..lineTo(grfX + headSize, arrowTipY + headSize * 1.5)
      ..close();
    canvas.drawPath(
      path,
      paint
        ..style = PaintingStyle.fill
        ..color = Colors.redAccent.withValues(alpha: 0.85),
    );
  }

  // -- Pylon + Foot ---------------------------------------------------------

  void _drawPylonAndFoot(Canvas canvas) {
    switch (footType) {
      case ProstheticFootType.sach:
        _drawSach(canvas);
      case ProstheticFootType.singleAxis:
        _drawSingleAxis(canvas);
      case ProstheticFootType.multiAxis:
        _drawMultiAxis(canvas);
      case ProstheticFootType.energyStoring:
        _drawEnergyStoring(canvas);
      case ProstheticFootType.microprocessor:
        _drawMicroprocessor(canvas);
    }
  }

  // Helpers -------

  void _drawPylon(Canvas canvas, {double angle = 0.0, Offset? pivot}) {
    final p = pivot ?? const Offset(0, _ankleY);
    canvas.save();
    canvas.translate(p.dx, p.dy);
    canvas.rotate(angle);
    canvas.translate(-p.dx, -p.dy);

    final paint = Paint()
      ..color = Colors.blueGrey.shade300
      ..strokeWidth = _pylonWidth
      ..strokeCap = StrokeCap.round;
    canvas.drawLine(
      const Offset(0, _pylonTop),
      const Offset(0, _ankleY),
      paint,
    );
    // Socket attachment indicator
    canvas.drawCircle(
      const Offset(0, _pylonTop),
      6,
      Paint()..color = _surfaceColor,
    );
    canvas.drawCircle(
      const Offset(0, _pylonTop),
      6,
      Paint()
        ..color = Colors.blueGrey.shade400
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2,
    );
    canvas.restore();
  }

  void _drawAnkleJoint(Canvas canvas) {
    canvas.drawCircle(
      const Offset(0, _ankleY),
      5,
      Paint()..color = _tealAccent,
    );
    canvas.drawCircle(
      const Offset(0, _ankleY),
      5,
      Paint()
        ..color = Colors.white38
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.5,
    );
  }

  Paint get _footPaint => Paint()..color = Colors.blueGrey.shade600;

  RRect _basicFootRRect({double yOffset = 0}) {
    return RRect.fromRectAndCorners(
      Rect.fromLTWH(-15, _ankleY + yOffset, _footLength, _footHeight),
      topLeft: const Radius.circular(6),
      bottomLeft: const Radius.circular(6),
      topRight: const Radius.circular(12),
      bottomRight: const Radius.circular(4),
    );
  }

  // ---- SACH ----

  void _drawSach(Canvas canvas) {
    // No ankle motion — rigid forefoot. Heel cushion compresses at heel strike.
    // Heel strike occurs during early stance (stanceLinear 0..0.2).
    final heelCompression =
        _inStance && _stanceLinear < 0.3
            ? math.sin((_stanceLinear / 0.3) * math.pi) * 5.0
            : 0.0;

    _drawPylon(canvas);

    // Foot body
    final footRect = _basicFootRRect();
    canvas.drawRRect(footRect, _footPaint);

    // Heel cushion (compressible wedge)
    final cushionPaint = Paint()..color = _tealAccent.withValues(alpha: 0.7);
    final cushionPath = Path()
      ..moveTo(-15, _ankleY + _footHeight)
      ..lineTo(-15, _ankleY + 4)
      ..lineTo(5, _ankleY + 4)
      ..lineTo(5, _ankleY + _footHeight - heelCompression)
      ..close();
    canvas.drawPath(cushionPath, cushionPaint);

    // Compression indicator lines
    if (heelCompression > 1) {
      final linePaint = Paint()
        ..color = Colors.white30
        ..strokeWidth = 1;
      for (var i = 0; i < 3; i++) {
        final y = _ankleY + 6 + i * 4.0;
        canvas.drawLine(Offset(-12, y), Offset(2, y), linePaint);
      }
    }
  }

  // ---- Single-Axis ----

  void _drawSingleAxis(Canvas canvas) {
    // Ankle joint allows plantarflexion at heel strike & dorsiflexion midstance.
    double ankleAngle;
    if (_inStance) {
      if (_stanceLinear < 0.2) {
        // Heel strike: plantarflex
        ankleAngle = -_stanceLinear / 0.2 * 12.0;
      } else if (_stanceLinear < 0.7) {
        // Midstance: dorsiflex
        final t = (_stanceLinear - 0.2) / 0.5;
        ankleAngle = -12.0 + t * 22.0; // -12 to +10
      } else {
        // Late stance: return to neutral
        final t = (_stanceLinear - 0.7) / 0.3;
        ankleAngle = 10.0 * (1 - t);
      }
    } else {
      // Swing: slight plantarflex
      ankleAngle = -5.0 * math.sin(_swingLinear * math.pi);
    }
    final angleRad = ankleAngle * math.pi / 180.0;

    _drawPylon(canvas);

    // Rotate foot around ankle
    canvas.save();
    canvas.translate(0, _ankleY);
    canvas.rotate(angleRad);
    canvas.translate(0, -_ankleY);
    canvas.drawRRect(_basicFootRRect(), _footPaint);
    canvas.restore();

    _drawAnkleJoint(canvas);
  }

  // ---- Multi-Axis ----

  void _drawMultiAxis(Canvas canvas) {
    // Same sagittal motion as single-axis PLUS inversion/eversion (lateral tilt)
    double ankleAngle;
    if (_inStance) {
      if (_stanceLinear < 0.2) {
        ankleAngle = -_stanceLinear / 0.2 * 10.0;
      } else if (_stanceLinear < 0.7) {
        final t = (_stanceLinear - 0.2) / 0.5;
        ankleAngle = -10.0 + t * 18.0;
      } else {
        final t = (_stanceLinear - 0.7) / 0.3;
        ankleAngle = 8.0 * (1 - t);
      }
    } else {
      ankleAngle = -4.0 * math.sin(_swingLinear * math.pi);
    }
    final angleRad = ankleAngle * math.pi / 180.0;

    // Inversion/eversion as a simulated lateral tilt (scale X to suggest 3D)
    final lateralTilt =
        _inStance ? math.sin(_stanceLinear * math.pi * 2) * 0.08 : 0.0;

    _drawPylon(canvas);

    canvas.save();
    canvas.translate(0, _ankleY);
    canvas.rotate(angleRad);
    // Simulate inversion/eversion by horizontally skewing the foot
    final matrix = Matrix4.identity()..setEntry(0, 1, lateralTilt);
    canvas.transform(matrix.storage);
    canvas.translate(0, -_ankleY);
    canvas.drawRRect(_basicFootRRect(), _footPaint);

    // Lateral-tilt indicator lines
    if (lateralTilt.abs() > 0.02) {
      final indicatorPaint = Paint()
        ..color = _tealAccent.withValues(alpha: 0.5)
        ..strokeWidth = 1.5;
      final midX = _footLength / 2 - 15;
      final midY = _ankleY + _footHeight / 2;
      final arrowLen = lateralTilt * 120;
      canvas.drawLine(
        Offset(midX - arrowLen, midY),
        Offset(midX + arrowLen, midY),
        indicatorPaint,
      );
    }
    canvas.restore();

    _drawAnkleJoint(canvas);

    // Second ring to indicate multi-axis
    canvas.drawCircle(
      const Offset(0, _ankleY),
      8,
      Paint()
        ..color = _tealAccent.withValues(alpha: 0.4)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1,
    );
  }

  // ---- Energy-Storing ----

  void _drawEnergyStoring(Canvas canvas) {
    // C-shaped keel that deflects under load and springs back at push-off.
    // Keel deflection follows a loading curve: peaks at midstance, releases
    // rapidly in late stance (push-off).
    double deflection; // 0..1
    if (_inStance) {
      if (_stanceLinear < 0.5) {
        // Loading: keel deflects
        deflection = _stanceLinear / 0.5;
      } else if (_stanceLinear < 0.8) {
        // Sustained load
        deflection = 1.0;
      } else {
        // Push-off spring-back
        final t = (_stanceLinear - 0.8) / 0.2;
        deflection = 1.0 - t;
      }
    } else {
      deflection = 0.0;
    }

    _drawPylon(canvas);

    // Draw the C-shaped keel using a quadratic bezier
    final keelPaint = Paint()
      ..color = _tealAccent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round;

    final keelDeflect = deflection * 14.0;

    final keelPath = Path()
      ..moveTo(0, _ankleY)
      ..quadraticBezierTo(
        -10 - keelDeflect,
        _ankleY + 20 + keelDeflect,
        _footLength - 25,
        _ankleY + _footHeight + 8 - keelDeflect * 0.3,
      );
    canvas.drawPath(keelPath, keelPaint);

    // Foot shell (semi-transparent over the keel)
    final shellPaint = Paint()
      ..color = Colors.blueGrey.shade700.withValues(alpha: 0.5);
    canvas.drawRRect(_basicFootRRect(yOffset: 4), shellPaint);

    // Spring-back energy indicator during push-off
    if (_inStance && _stanceLinear >= 0.75) {
      final sparkAlpha =
          ((_stanceLinear - 0.75) / 0.25 * 0.8).clamp(0.0, 0.8);
      final sparkPaint = Paint()
        ..color = Colors.amberAccent.withValues(alpha: sparkAlpha)
        ..strokeWidth = 2
        ..style = PaintingStyle.stroke;
      // Small burst lines at the forefoot
      for (var i = 0; i < 4; i++) {
        final angle = -math.pi / 4 + i * math.pi / 6;
        final startR = 8.0;
        final endR = 16.0;
        final cx = _footLength - 25.0;
        final cy = _ankleY + _footHeight;
        canvas.drawLine(
          Offset(cx + math.cos(angle) * startR,
              cy + math.sin(angle) * startR),
          Offset(
              cx + math.cos(angle) * endR, cy + math.sin(angle) * endR),
          sparkPaint,
        );
      }
    }
  }

  // ---- Microprocessor ----

  void _drawMicroprocessor(Canvas canvas) {
    // Smooth controlled dorsiflexion; adapts to an incline rendered as a
    // slight slope at the ground.
    double ankleAngle;
    if (_inStance) {
      // Smooth, damped dorsiflexion peaking at midstance
      ankleAngle = 8.0 * math.sin(_stanceLinear * math.pi);
      // Incline adaptation: extra dorsiflexion in late stance
      if (_stanceLinear > 0.5) {
        ankleAngle += 4.0 * ((_stanceLinear - 0.5) / 0.5);
      }
    } else {
      // Controlled return during swing
      final t = math.sin(_swingLinear * math.pi);
      ankleAngle = -3.0 * t;
    }
    final angleRad = ankleAngle * math.pi / 180.0;

    _drawPylon(canvas);

    // Foot with rotation
    canvas.save();
    canvas.translate(0, _ankleY);
    canvas.rotate(angleRad);
    canvas.translate(0, -_ankleY);
    canvas.drawRRect(_basicFootRRect(), _footPaint);
    canvas.restore();

    // Ankle joint -- microprocessor housing
    _drawAnkleJoint(canvas);
    // Outer housing ring
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(
          center: const Offset(0, _ankleY),
          width: 18,
          height: 14,
        ),
        const Radius.circular(4),
      ),
      Paint()
        ..color = _tealAccent.withValues(alpha: 0.3)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.5,
    );

    // Small LED indicator that blinks
    final ledAlpha = (math.sin(phase * math.pi * 6) * 0.5 + 0.5);
    canvas.drawCircle(
      const Offset(10, _ankleY - 4),
      2.5,
      Paint()
        ..color = Colors.greenAccent.withValues(alpha: ledAlpha),
    );

    // Draw incline slope indicator near the ground
    final slopePaint = Paint()
      ..color = Colors.white24
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;
    final slopePath = Path()
      ..moveTo(-30, _groundY)
      ..lineTo(10, _groundY)
      ..lineTo(_footLength + 20, _groundY - 8);
    canvas.drawPath(slopePath, slopePaint);

    // Small "slope" label
    final textPainter = TextPainter(
      text: const TextSpan(
        text: 'slope',
        style: TextStyle(color: Colors.white24, fontSize: 9),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    textPainter.paint(canvas, Offset(_footLength + 24, _groundY - 14));
  }

  @override
  bool shouldRepaint(covariant _FootGaitPainter oldDelegate) {
    return oldDelegate.phase != phase || oldDelegate.footType != footType;
  }
}

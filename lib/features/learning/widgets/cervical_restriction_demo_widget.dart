import 'dart:math' as math;
import 'package:flutter/material.dart';

// ---------------------------------------------------------------------------
// Cervical orthosis types
// ---------------------------------------------------------------------------

enum CervicalOrthosisType {
  softCollar('Soft Collar'),
  philadelphiaCollar('Philadelphia'),
  somi('SOMI'),
  fourPoster('Four-Poster'),
  haloVest('Halo Vest');

  const CervicalOrthosisType(this.label);
  final String label;
}

// ---------------------------------------------------------------------------
// Motion planes
// ---------------------------------------------------------------------------

enum _MotionPlane {
  flexion('Flexion'),
  extension_('Extension'),
  lateralBending('Lateral Bending'),
  rotation('Rotation');

  const _MotionPlane(this.label);
  final String label;
}

// ---------------------------------------------------------------------------
// Restriction data per orthosis (percentage of NORMAL motion ALLOWED)
// Based on published cervical orthosis restriction data.
// ---------------------------------------------------------------------------

class _RestrictionProfile {
  final double flexion;
  final double extension;
  final double lateralBending;
  final double rotation;

  const _RestrictionProfile({
    required this.flexion,
    required this.extension,
    required this.lateralBending,
    required this.rotation,
  });

  double forPlane(_MotionPlane plane) {
    switch (plane) {
      case _MotionPlane.flexion:
        return flexion;
      case _MotionPlane.extension_:
        return extension;
      case _MotionPlane.lateralBending:
        return lateralBending;
      case _MotionPlane.rotation:
        return rotation;
    }
  }
}

const Map<CervicalOrthosisType, _RestrictionProfile> _restrictionData = {
  CervicalOrthosisType.softCollar: _RestrictionProfile(
    flexion: 0.75,
    extension: 0.75,
    lateralBending: 0.75,
    rotation: 0.83,
  ),
  CervicalOrthosisType.philadelphiaCollar: _RestrictionProfile(
    flexion: 0.29,
    extension: 0.39,
    lateralBending: 0.34,
    rotation: 0.44,
  ),
  CervicalOrthosisType.somi: _RestrictionProfile(
    flexion: 0.07,
    extension: 0.58,
    lateralBending: 0.34,
    rotation: 0.34,
  ),
  CervicalOrthosisType.fourPoster: _RestrictionProfile(
    flexion: 0.21,
    extension: 0.27,
    lateralBending: 0.27,
    rotation: 0.44,
  ),
  CervicalOrthosisType.haloVest: _RestrictionProfile(
    flexion: 0.04,
    extension: 0.04,
    lateralBending: 0.04,
    rotation: 0.01,
  ),
};

// ---------------------------------------------------------------------------
// Theme colors
// ---------------------------------------------------------------------------

const Color _bgColor = Color(0xFF0F1923);
const Color _teal = Color(0xFF0D9488);
const Color _surfaceColor = Color(0xFF1A2332);
const Color _textPrimary = Color(0xFFE2E8F0);
const Color _textSecondary = Color(0xFF94A3B8);
const Color _skinColor = Color(0xFFD4A574);
const Color _orthosisColor = Color(0xFF3B82F6);
const Color _ghostArc = Color(0xFF2A3545);

// ---------------------------------------------------------------------------
// Maximum angles (degrees) for full normal ROM visualization
// ---------------------------------------------------------------------------

const double _maxFlexionDeg = 40.0;
const double _maxExtensionDeg = 40.0;
const double _maxLateralDeg = 30.0;
const double _maxRotationDeg = 25.0;

double _maxAngleForPlane(_MotionPlane plane) {
  switch (plane) {
    case _MotionPlane.flexion:
      return _maxFlexionDeg;
    case _MotionPlane.extension_:
      return _maxExtensionDeg;
    case _MotionPlane.lateralBending:
      return _maxLateralDeg;
    case _MotionPlane.rotation:
      return _maxRotationDeg;
  }
}

// ---------------------------------------------------------------------------
// CervicalRestrictionDemoWidget
// ---------------------------------------------------------------------------

class CervicalRestrictionDemoWidget extends StatefulWidget {
  final CervicalOrthosisType initialType;

  const CervicalRestrictionDemoWidget({
    super.key,
    this.initialType = CervicalOrthosisType.softCollar,
  });

  @override
  State<CervicalRestrictionDemoWidget> createState() =>
      _CervicalRestrictionDemoWidgetState();
}

class _CervicalRestrictionDemoWidgetState
    extends State<CervicalRestrictionDemoWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late CervicalOrthosisType _selectedType;

  static const _cycleDuration = Duration(milliseconds: 6000);

  @override
  void initState() {
    super.initState();
    _selectedType = widget.initialType;
    _controller = AnimationController(
      vsync: this,
      duration: _cycleDuration,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // Map animation progress [0,1] to the four motion planes sequentially.
  // Each plane gets 0.25 of the cycle. Within each quarter the head sweeps
  // from neutral -> max -> neutral using a sine curve.
  (_MotionPlane, double) _currentMotion(double t) {
    const planes = _MotionPlane.values;
    final index = (t * planes.length).floor().clamp(0, planes.length - 1);
    final plane = planes[index];
    final local = (t * planes.length) - index; // 0..1 within this quarter
    final sweep = math.sin(local * math.pi); // 0 -> 1 -> 0
    return (plane, sweep);
  }

  @override
  Widget build(BuildContext context) {
    final profile = _restrictionData[_selectedType]!;

    return Container(
      decoration: BoxDecoration(
        color: _bgColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: _surfaceColor, width: 1),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Title
          const Text(
            'Cervical Orthosis Motion Restriction',
            style: TextStyle(
              color: _textPrimary,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),

          // Type selector chips
          Wrap(
            spacing: 8,
            runSpacing: 8,
            alignment: WrapAlignment.center,
            children: CervicalOrthosisType.values.map((type) {
              final selected = type == _selectedType;
              return ChoiceChip(
                label: Text(
                  type.label,
                  style: TextStyle(
                    color: selected ? Colors.white : _textSecondary,
                    fontSize: 12,
                    fontWeight:
                        selected ? FontWeight.w600 : FontWeight.normal,
                  ),
                ),
                selected: selected,
                selectedColor: _teal,
                backgroundColor: _surfaceColor,
                side: BorderSide(
                  color: selected ? _teal : _ghostArc,
                ),
                onSelected: (_) {
                  setState(() => _selectedType = type);
                },
              );
            }).toList(),
          ),
          const SizedBox(height: 16),

          // Animated figure + info
          AnimatedBuilder(
            animation: _controller,
            builder: (context, _) {
              final (plane, sweep) = _currentMotion(_controller.value);
              final allowed = profile.forPlane(plane);
              final maxAngle = _maxAngleForPlane(plane);
              final currentAngle = sweep * allowed * maxAngle;
              final restrictionPct = ((1.0 - allowed) * 100).round();

              return Column(
                children: [
                  // Info bar
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(
                      color: _surfaceColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              plane.label,
                              style: const TextStyle(
                                color: _teal,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              '${(allowed * 100).round()}% motion allowed',
                              style: const TextStyle(
                                color: _textSecondary,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: _teal.withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            '$restrictionPct% restricted',
                            style: const TextStyle(
                              color: _teal,
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Canvas
                  SizedBox(
                    width: double.infinity,
                    height: 300,
                    child: CustomPaint(
                      painter: _CervicalPainter(
                        orthosisType: _selectedType,
                        plane: plane,
                        angleDeg: currentAngle,
                        allowed: allowed,
                        maxAngleDeg: maxAngle,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// CustomPainter — lateral (side) view of head+neck+torso with orthosis
// ---------------------------------------------------------------------------

class _CervicalPainter extends CustomPainter {
  final CervicalOrthosisType orthosisType;
  final _MotionPlane plane;
  final double angleDeg;
  final double allowed;
  final double maxAngleDeg;

  _CervicalPainter({
    required this.orthosisType,
    required this.plane,
    required this.angleDeg,
    required this.allowed,
    required this.maxAngleDeg,
  });

  double _rad(double deg) => deg * math.pi / 180.0;

  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width / 2;
    // Pivot point: base of neck / top of torso
    final pivotY = size.height * 0.55;
    final pivot = Offset(cx, pivotY);

    // Draw torso (below pivot)
    _drawTorso(canvas, size, cx, pivotY);

    // Draw ghost arc showing full normal ROM
    _drawRomArc(canvas, pivot);

    // Rotate canvas around pivot for head/neck
    canvas.save();
    canvas.translate(pivot.dx, pivot.dy);

    final angle = _angleForPlane();
    canvas.rotate(angle);

    // Draw neck
    _drawNeck(canvas);

    // Draw head
    _drawHead(canvas);

    // Draw orthosis schematic (rotates with head/neck)
    _drawOrthosis(canvas);

    canvas.restore();

    // Draw orthosis parts that stay fixed to torso
    _drawOrthosisFixed(canvas, size, cx, pivotY);
  }

  double _angleForPlane() {
    switch (plane) {
      case _MotionPlane.flexion:
        return _rad(angleDeg); // positive = forward tilt (clockwise in our lateral view)
      case _MotionPlane.extension_:
        return _rad(-angleDeg);
      case _MotionPlane.lateralBending:
        return _rad(angleDeg); // same visual rotation
      case _MotionPlane.rotation:
        // Rotation is shown as a subtle scaling/perspective shift; use small tilt
        return _rad(angleDeg * 0.3);
    }
  }

  void _drawTorso(Canvas canvas, Size size, double cx, double pivotY) {
    final paint = Paint()..color = _skinColor.withValues(alpha: 0.35);

    // Shoulders
    final shoulderRect = RRect.fromRectAndRadius(
      Rect.fromCenter(
        center: Offset(cx, pivotY + 40),
        width: 120,
        height: 60,
      ),
      const Radius.circular(20),
    );
    canvas.drawRRect(shoulderRect, paint);

    // Upper chest
    final chestRect = RRect.fromRectAndRadius(
      Rect.fromCenter(
        center: Offset(cx, pivotY + 80),
        width: 100,
        height: 60,
      ),
      const Radius.circular(16),
    );
    canvas.drawRRect(chestRect, paint);
  }

  void _drawNeck(Canvas canvas) {
    final paint = Paint()..color = _skinColor.withValues(alpha: 0.55);
    // Neck extends upward from pivot (0,0)
    final neckRect = RRect.fromRectAndRadius(
      Rect.fromCenter(center: const Offset(0, -35), width: 28, height: 60),
      const Radius.circular(10),
    );
    canvas.drawRRect(neckRect, paint);
  }

  void _drawHead(Canvas canvas) {
    final paint = Paint()..color = _skinColor.withValues(alpha: 0.7);

    // Head (ellipse, lateral view)
    canvas.drawOval(
      Rect.fromCenter(center: const Offset(0, -90), width: 56, height: 64),
      paint,
    );

    // Jaw line
    final jawPaint = Paint()
      ..color = _skinColor.withValues(alpha: 0.5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    final jawPath = Path()
      ..moveTo(20, -78)
      ..quadraticBezierTo(24, -62, 12, -56);
    canvas.drawPath(jawPath, jawPaint);

    // Ear
    canvas.drawOval(
      Rect.fromCenter(center: const Offset(-26, -88), width: 10, height: 16),
      Paint()..color = _skinColor.withValues(alpha: 0.5),
    );

    // Rotation visual: when rotating, draw a faint duplicate offset to indicate depth
    if (plane == _MotionPlane.rotation) {
      final rotPaint = Paint()..color = _skinColor.withValues(alpha: 0.15);
      final shift = angleDeg * 0.4;
      canvas.drawOval(
        Rect.fromCenter(
          center: Offset(shift, -90),
          width: 56 - shift.abs() * 0.4,
          height: 64,
        ),
        rotPaint,
      );
    }
  }

  void _drawRomArc(Canvas canvas, Offset pivot) {
    // Ghost arc showing full normal range
    final ghostPaint = Paint()
      ..color = _ghostArc
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final arcRadius = 80.0;
    double startAngle;
    double sweepAngle;

    switch (plane) {
      case _MotionPlane.flexion:
        startAngle = -math.pi / 2;
        sweepAngle = _rad(maxAngleDeg);
      case _MotionPlane.extension_:
        startAngle = -math.pi / 2 - _rad(maxAngleDeg);
        sweepAngle = _rad(maxAngleDeg);
      case _MotionPlane.lateralBending:
        startAngle = -math.pi / 2;
        sweepAngle = _rad(maxAngleDeg);
      case _MotionPlane.rotation:
        startAngle = -math.pi / 2 - _rad(maxAngleDeg * 0.3);
        sweepAngle = _rad(maxAngleDeg * 0.6);
    }

    canvas.drawArc(
      Rect.fromCircle(center: pivot, radius: arcRadius),
      startAngle,
      sweepAngle,
      false,
      ghostPaint,
    );

    // Allowed range arc (teal)
    final allowedPaint = Paint()
      ..color = _teal.withValues(alpha: 0.5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: pivot, radius: arcRadius),
      startAngle,
      sweepAngle * allowed,
      false,
      allowedPaint,
    );
  }

  void _drawOrthosis(Canvas canvas) {
    switch (orthosisType) {
      case CervicalOrthosisType.softCollar:
        _drawSoftCollar(canvas);
      case CervicalOrthosisType.philadelphiaCollar:
        _drawPhiladelphia(canvas);
      case CervicalOrthosisType.somi:
        _drawSomiMoving(canvas);
      case CervicalOrthosisType.fourPoster:
        _drawFourPosterMoving(canvas);
      case CervicalOrthosisType.haloVest:
        _drawHaloMoving(canvas);
    }
  }

  void _drawOrthosisFixed(
      Canvas canvas, Size size, double cx, double pivotY) {
    switch (orthosisType) {
      case CervicalOrthosisType.somi:
        _drawSomiFixed(canvas, cx, pivotY);
      case CervicalOrthosisType.fourPoster:
        _drawFourPosterFixed(canvas, cx, pivotY);
      case CervicalOrthosisType.haloVest:
        _drawHaloFixed(canvas, cx, pivotY);
      default:
        break;
    }
  }

  // --- Soft Collar: thin band around neck ---
  void _drawSoftCollar(Canvas canvas) {
    final paint = Paint()
      ..color = _orthosisColor.withValues(alpha: 0.45)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8;
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(center: const Offset(0, -20), width: 34, height: 22),
        const Radius.circular(8),
      ),
      paint,
    );
  }

  // --- Philadelphia: extends chin to chest ---
  void _drawPhiladelphia(Canvas canvas) {
    final paint = Paint()..color = _orthosisColor.withValues(alpha: 0.40);
    // Chin piece
    final path = Path()
      ..moveTo(-20, -58)
      ..quadraticBezierTo(-24, -30, -22, -5)
      ..lineTo(22, -5)
      ..quadraticBezierTo(24, -30, 20, -58)
      ..close();
    canvas.drawPath(path, paint);

    // Outline
    final stroke = Paint()
      ..color = _orthosisColor.withValues(alpha: 0.7)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    canvas.drawPath(path, stroke);

    // Chin support line
    canvas.drawLine(
      const Offset(-16, -56),
      const Offset(16, -56),
      stroke,
    );
  }

  // --- SOMI: mandibular piece + occipital strap (moving parts) ---
  void _drawSomiMoving(Canvas canvas) {
    final paint = Paint()..color = _orthosisColor.withValues(alpha: 0.5);
    final stroke = Paint()
      ..color = _orthosisColor.withValues(alpha: 0.8)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    // Mandibular (chin) piece
    final chinPath = Path()
      ..moveTo(-14, -60)
      ..quadraticBezierTo(0, -52, 14, -60)
      ..lineTo(16, -54)
      ..quadraticBezierTo(0, -44, -16, -54)
      ..close();
    canvas.drawPath(chinPath, paint);
    canvas.drawPath(chinPath, stroke);

    // Occipital strap (back of head)
    final occPath = Path()
      ..moveTo(-22, -95)
      ..quadraticBezierTo(-30, -85, -24, -70)
      ..lineTo(-20, -72)
      ..quadraticBezierTo(-26, -85, -18, -95)
      ..close();
    canvas.drawPath(occPath, paint);
    canvas.drawPath(occPath, stroke);
  }

  // SOMI fixed: sternal plate
  void _drawSomiFixed(Canvas canvas, double cx, double pivotY) {
    final paint = Paint()..color = _orthosisColor.withValues(alpha: 0.35);
    final stroke = Paint()
      ..color = _orthosisColor.withValues(alpha: 0.7)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    // Sternal plate
    final platePath = Path()
      ..moveTo(cx - 25, pivotY + 10)
      ..lineTo(cx + 25, pivotY + 10)
      ..lineTo(cx + 20, pivotY + 55)
      ..lineTo(cx - 20, pivotY + 55)
      ..close();
    canvas.drawPath(platePath, paint);
    canvas.drawPath(platePath, stroke);

    // Uprights connecting to head
    final upPaint = Paint()
      ..color = _orthosisColor.withValues(alpha: 0.6)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    // Front upright
    canvas.drawLine(
      Offset(cx + 12, pivotY + 10),
      Offset(cx + 10, pivotY - 5),
      upPaint,
    );
    // Rear upright
    canvas.drawLine(
      Offset(cx - 12, pivotY + 10),
      Offset(cx - 14, pivotY - 5),
      upPaint,
    );
  }

  // --- Four-Poster: chin+occipital cups (moving) ---
  void _drawFourPosterMoving(Canvas canvas) {
    final paint = Paint()..color = _orthosisColor.withValues(alpha: 0.5);
    final stroke = Paint()
      ..color = _orthosisColor.withValues(alpha: 0.8)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    // Chin cup
    final chinPath = Path()
      ..moveTo(-12, -58)
      ..quadraticBezierTo(0, -50, 12, -58)
      ..lineTo(14, -52)
      ..quadraticBezierTo(0, -42, -14, -52)
      ..close();
    canvas.drawPath(chinPath, paint);
    canvas.drawPath(chinPath, stroke);

    // Occipital cup
    final occPath = Path()
      ..moveTo(-20, -100)
      ..quadraticBezierTo(-28, -88, -22, -76)
      ..lineTo(-18, -78)
      ..quadraticBezierTo(-24, -88, -16, -98)
      ..close();
    canvas.drawPath(occPath, paint);
    canvas.drawPath(occPath, stroke);
  }

  // Four-poster fixed: 4 uprights + chest plate
  void _drawFourPosterFixed(Canvas canvas, double cx, double pivotY) {
    final upPaint = Paint()
      ..color = _orthosisColor.withValues(alpha: 0.6)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    // 4 uprights (shown as 2 pairs in lateral view)
    // Front pair
    canvas.drawLine(
      Offset(cx + 14, pivotY - 5),
      Offset(cx + 16, pivotY + 45),
      upPaint,
    );
    canvas.drawLine(
      Offset(cx + 10, pivotY - 5),
      Offset(cx + 12, pivotY + 45),
      upPaint,
    );
    // Rear pair
    canvas.drawLine(
      Offset(cx - 14, pivotY - 5),
      Offset(cx - 16, pivotY + 45),
      upPaint,
    );
    canvas.drawLine(
      Offset(cx - 10, pivotY - 5),
      Offset(cx - 12, pivotY + 45),
      upPaint,
    );

    // Chest plate
    final platePaint = Paint()..color = _orthosisColor.withValues(alpha: 0.3);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(
          center: Offset(cx, pivotY + 45),
          width: 40,
          height: 14,
        ),
        const Radius.circular(4),
      ),
      platePaint,
    );
  }

  // --- Halo Vest: ring + pins (moving with head) ---
  void _drawHaloMoving(Canvas canvas) {
    final ringPaint = Paint()
      ..color = _orthosisColor.withValues(alpha: 0.8)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    // Halo ring around head
    canvas.drawOval(
      Rect.fromCenter(center: const Offset(0, -100), width: 72, height: 20),
      ringPaint,
    );

    // 4 pins (small circles at ring perimeter)
    final pinPaint = Paint()..color = _orthosisColor;
    const pinPositions = [
      Offset(-30, -100),
      Offset(30, -100),
      Offset(-15, -106),
      Offset(15, -106),
    ];
    for (final pos in pinPositions) {
      canvas.drawCircle(pos, 3, pinPaint);
      // Pin line into skull
      final dir = Offset(-pos.dx * 0.15, 6);
      canvas.drawLine(
        pos,
        pos + dir,
        Paint()
          ..color = _orthosisColor.withValues(alpha: 0.9)
          ..strokeWidth = 2,
      );
    }
  }

  // Halo fixed: vest + uprights
  void _drawHaloFixed(Canvas canvas, double cx, double pivotY) {
    final vestPaint = Paint()..color = _orthosisColor.withValues(alpha: 0.30);
    final vestStroke = Paint()
      ..color = _orthosisColor.withValues(alpha: 0.6)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    // Vest (torso shell)
    final vestPath = Path()
      ..moveTo(cx - 50, pivotY + 15)
      ..lineTo(cx + 50, pivotY + 15)
      ..lineTo(cx + 45, pivotY + 90)
      ..quadraticBezierTo(cx, pivotY + 100, cx - 45, pivotY + 90)
      ..close();
    canvas.drawPath(vestPath, vestPaint);
    canvas.drawPath(vestPath, vestStroke);

    // Uprights connecting vest to halo ring area
    final upPaint = Paint()
      ..color = _orthosisColor.withValues(alpha: 0.7)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    // Front upright
    canvas.drawLine(
      Offset(cx + 18, pivotY + 15),
      Offset(cx + 16, pivotY - 10),
      upPaint,
    );
    // Rear upright
    canvas.drawLine(
      Offset(cx - 18, pivotY + 15),
      Offset(cx - 16, pivotY - 10),
      upPaint,
    );
  }

  @override
  bool shouldRepaint(_CervicalPainter oldDelegate) {
    return oldDelegate.angleDeg != angleDeg ||
        oldDelegate.plane != plane ||
        oldDelegate.orthosisType != orthosisType;
  }
}

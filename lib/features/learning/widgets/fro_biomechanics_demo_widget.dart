import 'dart:math' as math;
import 'package:flutter/material.dart';

/// The four AFO types this widget can demonstrate.
enum AfoType {
  solidAfo,
  posteriorLeafSpring,
  articulatedAfo,
  floorReactionOrthosis,
}

extension AfoTypeLabel on AfoType {
  String get label {
    switch (this) {
      case AfoType.solidAfo:
        return 'Solid AFO';
      case AfoType.posteriorLeafSpring:
        return 'PLS';
      case AfoType.articulatedAfo:
        return 'Articulated';
      case AfoType.floorReactionOrthosis:
        return 'FRO / GRAFO';
    }
  }

  String get description {
    switch (this) {
      case AfoType.solidAfo:
        return 'Blocks all ankle motion \u2014 max stability';
      case AfoType.posteriorLeafSpring:
        return 'Allows DF, assists push-off via spring';
      case AfoType.articulatedAfo:
        return 'Free DF, PF stop \u2014 most functional for mild weakness';
      case AfoType.floorReactionOrthosis:
        return 'Creates knee extension moment \u2014 treats crouch gait';
    }
  }

  String? get pearl {
    if (this == AfoType.floorReactionOrthosis) {
      return 'Requires intact quads. Contraindicated in recurvatum.';
    }
    return null;
  }
}

// ---------------------------------------------------------------------------
// Colour constants
// ---------------------------------------------------------------------------

const Color _kBackground = Color(0xFF0F1923);
const Color _kTeal = Color(0xFF0D9488);
const Color _kSurface = Color(0xFF1A2332);
const Color _kGrf = Color(0xFF22C55E);
const Color _kForceRed = Color(0xFFEF4444);
const Color _kBone = Color(0xFFCBD5E1);
const Color _kOrthosisFill = Color(0xFF0D9488);
const Color _kOrthosisStroke = Color(0xFF5EEAD4);
const Color _kBlockedArrow = Color(0xFFF97316);
const Color _kJointCircle = Color(0xFFFACC15);

// ---------------------------------------------------------------------------
// Widget
// ---------------------------------------------------------------------------

class FROBiomechanicsDemoWidget extends StatefulWidget {
  const FROBiomechanicsDemoWidget({
    super.key,
    this.initialType = AfoType.solidAfo,
  });

  final AfoType initialType;

  @override
  State<FROBiomechanicsDemoWidget> createState() =>
      _FROBiomechanicsDemoWidgetState();
}

class _FROBiomechanicsDemoWidgetState extends State<FROBiomechanicsDemoWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late AfoType _selectedType;

  @override
  void initState() {
    super.initState();
    _selectedType = widget.initialType;
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

  void _selectType(AfoType type) {
    if (type == _selectedType) return;
    setState(() {
      _selectedType = type;
      _controller
        ..reset()
        ..repeat();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: _kBackground,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // ---------- AFO selector chips ----------
          Wrap(
            spacing: 8,
            runSpacing: 8,
            alignment: WrapAlignment.center,
            children: AfoType.values.map((t) {
              final selected = t == _selectedType;
              return ChoiceChip(
                label: Text(
                  t.label,
                  style: TextStyle(
                    color: selected ? _kBackground : _kBone,
                    fontWeight:
                        selected ? FontWeight.bold : FontWeight.normal,
                    fontSize: 12,
                  ),
                ),
                selected: selected,
                selectedColor: _kTeal,
                backgroundColor: _kSurface,
                side: BorderSide(
                  color: selected ? _kTeal : _kBone.withValues(alpha: 0.3),
                ),
                onSelected: (_) => _selectType(t),
              );
            }).toList(),
          ),

          const SizedBox(height: 12),

          // ---------- Canvas ----------
          AnimatedBuilder(
            animation: _controller,
            builder: (context, _) {
              return CustomPaint(
                size: const Size(320, 360),
                painter: _AfoStancePainter(
                  type: _selectedType,
                  phase: _controller.value,
                ),
              );
            },
          ),

          const SizedBox(height: 12),

          // ---------- Description label ----------
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              color: _kSurface,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              _selectedType.description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: _kBone,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          // ---------- Pearl (FRO only) ----------
          if (_selectedType.pearl != null) ...[
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: _kTeal.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: _kTeal.withValues(alpha: 0.4)),
              ),
              child: Row(
                children: [
                  const Icon(Icons.lightbulb_outline,
                      color: _kTeal, size: 18),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      _selectedType.pearl!,
                      style: const TextStyle(
                        color: _kTeal,
                        fontSize: 12,
                        fontStyle: FontStyle.italic,
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
// CustomPainter -- lateral stance view
// ---------------------------------------------------------------------------

class _AfoStancePainter extends CustomPainter {
  _AfoStancePainter({required this.type, required this.phase});

  final AfoType type;

  /// 0..1 representing one stance-phase cycle.
  final double phase;

  // Geometry helpers
  static const double _legLen = 120.0;
  static const double _footLen = 60.0;

  @override
  void paint(Canvas canvas, Size size) {
    // Origin: ankle joint in the middle-bottom area.
    final ankleX = size.width * 0.45;
    final groundY = size.height - 40;
    final ankleY = groundY - 18; // slight offset above ground

    // Stance-phase ankle angle (dorsiflexion positive).
    final double ankleDeg = _ankleAngle();
    final double ankleRad = ankleDeg * math.pi / 180;

    // Knee position computed from tibia angle.
    // Tibia angle from vertical = ankleRad (simplification: tibia tilts
    // forward by the ankle DF angle).
    final double tibiaAngle = ankleRad; // forward lean
    final kneeX = ankleX + _legLen * math.sin(tibiaAngle);
    final kneeY = ankleY - _legLen * math.cos(tibiaAngle);

    // Knee flexion angle for FRO demo (crouch vs extension).
    final double kneeFlexDeg = _kneeFlexion();
    final double kneeFlexRad = kneeFlexDeg * math.pi / 180;

    // Femur: from knee going up-and-back.
    final femurAngle = tibiaAngle - kneeFlexRad;
    final hipX = kneeX - _legLen * math.sin(femurAngle);
    final hipY = kneeY - _legLen * math.cos(femurAngle);

    // Foot: flat on ground.
    final toeX = ankleX + _footLen * 0.65;
    final heelX = ankleX - _footLen * 0.35;

    // --- Draw ground ---
    final groundPaint = Paint()
      ..color = _kBone.withValues(alpha: 0.25)
      ..strokeWidth = 1.5;
    canvas.drawLine(
        Offset(0, groundY), Offset(size.width, groundY), groundPaint);

    // --- Draw orthosis (behind leg) ---
    _drawOrthosis(canvas, ankleX, ankleY, kneeX, kneeY, toeX, heelX,
        groundY, tibiaAngle);

    // --- Draw leg bones ---
    final bonePaint = Paint()
      ..color = _kBone
      ..strokeWidth = 6
      ..strokeCap = StrokeCap.round;

    // Tibia
    canvas.drawLine(
        Offset(ankleX, ankleY), Offset(kneeX, kneeY), bonePaint);
    // Femur
    canvas.drawLine(
        Offset(kneeX, kneeY), Offset(hipX, hipY), bonePaint);

    // Foot
    final footPaint = Paint()
      ..color = _kBone
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round;
    canvas.drawLine(
        Offset(heelX, groundY - 6), Offset(toeX, groundY - 6), footPaint);

    // --- Draw joints ---
    final jointPaint = Paint()..color = _kJointCircle;
    canvas.drawCircle(Offset(ankleX, ankleY), 5, jointPaint);
    canvas.drawCircle(Offset(kneeX, kneeY), 5, jointPaint);
    canvas.drawCircle(Offset(hipX, hipY), 5, jointPaint);

    // Articulated AFO: emphasise ankle joint.
    if (type == AfoType.articulatedAfo) {
      final artJointPaint = Paint()
        ..color = _kJointCircle
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2.5;
      canvas.drawCircle(Offset(ankleX, ankleY), 10, artJointPaint);
    }

    // --- GRF arrow ---
    _drawGrf(canvas, size, ankleX, ankleY, kneeX, kneeY, groundY, toeX,
        heelX);

    // --- 3-point pressure system ---
    _drawThreePointPressure(canvas, ankleX, ankleY, kneeX, kneeY, toeX,
        heelX, groundY, tibiaAngle);

    // --- Blocked / allowed motion arrows ---
    _drawMotionArrows(canvas, ankleX, ankleY);

    // --- Labels ---
    _drawLabels(canvas, size);
  }

  // -----------------------------------------------------------------------
  // Ankle angle per AFO type over stance phase
  // -----------------------------------------------------------------------
  double _ankleAngle() {
    // phase 0 = initial contact, 0.5 = midstance, 1.0 = terminal stance
    switch (type) {
      case AfoType.solidAfo:
        // Rigid: essentially 0 throughout.
        return 0;
      case AfoType.posteriorLeafSpring:
        // Allows slight DF at midstance, springs back at push-off.
        if (phase < 0.5) {
          return _lerp(0, 8, phase / 0.5);
        } else {
          return _lerp(8, -2, (phase - 0.5) / 0.5);
        }
      case AfoType.articulatedAfo:
        // Free DF, PF stop at 0.
        if (phase < 0.3) return 0; // loading response
        if (phase < 0.8) {
          return _lerp(0, 15, (phase - 0.3) / 0.5); // DF midstance-terminal
        }
        return _lerp(15, 0, (phase - 0.8) / 0.2);
      case AfoType.floorReactionOrthosis:
        // Blocks excessive DF. Tibia barely advances.
        if (phase < 0.5) {
          return _lerp(0, 4, phase / 0.5);
        } else {
          return _lerp(4, 0, (phase - 0.5) / 0.5);
        }
    }
  }

  double _kneeFlexion() {
    // Only FRO actively demonstrates knee extension moment.
    switch (type) {
      case AfoType.solidAfo:
        return 5;
      case AfoType.posteriorLeafSpring:
        return _lerp(8, 3, phase);
      case AfoType.articulatedAfo:
        return _lerp(10, 2, phase);
      case AfoType.floorReactionOrthosis:
        // Stays near full extension.
        return _lerp(3, 0, phase);
    }
  }

  // -----------------------------------------------------------------------
  // Orthosis shell drawing
  // -----------------------------------------------------------------------
  void _drawOrthosis(
    Canvas canvas,
    double ankleX,
    double ankleY,
    double kneeX,
    double kneeY,
    double toeX,
    double heelX,
    double groundY,
    double tibiaAngle,
  ) {
    final orthoFill = Paint()
      ..color = _kOrthosisFill.withValues(alpha: 0.35)
      ..style = PaintingStyle.fill;
    final orthoStroke = Paint()
      ..color = _kOrthosisStroke
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    switch (type) {
      case AfoType.solidAfo:
        _drawPosteriorShell(canvas, ankleX, ankleY, kneeX, kneeY, heelX,
            toeX, groundY, tibiaAngle, orthoFill, orthoStroke,
            thick: true);
        break;
      case AfoType.posteriorLeafSpring:
        _drawPosteriorShell(canvas, ankleX, ankleY, kneeX, kneeY, heelX,
            toeX, groundY, tibiaAngle, orthoFill, orthoStroke,
            thick: false);
        break;
      case AfoType.articulatedAfo:
        _drawArticulatedShell(canvas, ankleX, ankleY, kneeX, kneeY, heelX,
            toeX, groundY, tibiaAngle, orthoFill, orthoStroke);
        break;
      case AfoType.floorReactionOrthosis:
        _drawAnteriorShell(canvas, ankleX, ankleY, kneeX, kneeY, heelX,
            toeX, groundY, tibiaAngle, orthoFill, orthoStroke);
        break;
    }
  }

  /// Posterior shell (Solid AFO and PLS share this shape).
  void _drawPosteriorShell(
    Canvas canvas,
    double ankleX,
    double ankleY,
    double kneeX,
    double kneeY,
    double heelX,
    double toeX,
    double groundY,
    double tibiaAngle,
    Paint fill,
    Paint stroke, {
    required bool thick,
  }) {
    final shellWidth = thick ? 14.0 : 6.0;
    // PLS flex offset: the thin shell bends slightly during push-off.
    final double plsFlex =
        type == AfoType.posteriorLeafSpring && phase > 0.5
            ? 6.0 * ((phase - 0.5) / 0.5)
            : 0;

    // Build path along posterior tibia then under foot.
    final path = Path();

    // Posterior calf (offset behind the bone line).
    final dx = -math.cos(tibiaAngle) * shellWidth;
    final dy = -math.sin(tibiaAngle) * shellWidth;

    final calfTopX = kneeX + dx + 2;
    final calfTopY = kneeY + dy;

    // Posterior ankle (with optional PLS flex).
    final anklePostX = ankleX + dx + plsFlex;
    final anklePostY = ankleY + dy;

    path.moveTo(calfTopX, calfTopY);
    // Slight curve for aesthetics.
    path.quadraticBezierTo(
      (calfTopX + anklePostX) / 2 + dx * 0.3 + plsFlex * 0.5,
      (calfTopY + anklePostY) / 2,
      anklePostX,
      anklePostY,
    );
    // Under the heel.
    path.lineTo(heelX - 4, groundY - 2);
    // Footplate.
    path.lineTo(toeX - 8, groundY - 2);
    // Return path (inside edge of footplate).
    path.lineTo(toeX - 8, groundY - 2 - 4);
    path.lineTo(heelX - 4, groundY - 2 - 4);
    // Inside edge of calf.
    path.lineTo(anklePostX + shellWidth * 0.5, anklePostY);
    path.quadraticBezierTo(
      (calfTopX + shellWidth * 0.3 + anklePostX + shellWidth * 0.5) / 2 +
          plsFlex * 0.3,
      (calfTopY + anklePostY) / 2,
      calfTopX + shellWidth * 0.3,
      calfTopY,
    );
    path.close();

    canvas.drawPath(path, fill);
    canvas.drawPath(path, stroke);
  }

  /// Articulated shell: two separate pieces with a visible gap at ankle.
  void _drawArticulatedShell(
    Canvas canvas,
    double ankleX,
    double ankleY,
    double kneeX,
    double kneeY,
    double heelX,
    double toeX,
    double groundY,
    double tibiaAngle,
    Paint fill,
    Paint stroke,
  ) {
    const shellWidth = 10.0;
    final dx = -math.cos(tibiaAngle) * shellWidth;
    final dy = -math.sin(tibiaAngle) * shellWidth;

    // Upper cuff.
    final cuffPath = Path();
    final cuffTopX = kneeX + dx + 2;
    final cuffTopY = kneeY + dy;
    final cuffBottomX = ankleX + dx + (ankleX - kneeX) * -0.15;
    final cuffBottomY = ankleY + dy + (ankleY - kneeY) * -0.15;

    cuffPath.moveTo(cuffTopX, cuffTopY);
    cuffPath.lineTo(cuffBottomX, cuffBottomY);
    cuffPath.lineTo(cuffBottomX + shellWidth * 0.5, cuffBottomY);
    cuffPath.lineTo(cuffTopX + shellWidth * 0.3, cuffTopY);
    cuffPath.close();
    canvas.drawPath(cuffPath, fill);
    canvas.drawPath(cuffPath, stroke);

    // Lower footplate (starts just below ankle).
    final footPath = Path();
    footPath.moveTo(ankleX + dx * 0.6, ankleY + 8);
    footPath.lineTo(heelX - 4, groundY - 2);
    footPath.lineTo(toeX - 8, groundY - 2);
    footPath.lineTo(toeX - 8, groundY - 6);
    footPath.lineTo(heelX - 4, groundY - 6);
    footPath.lineTo(ankleX + dx * 0.6 + shellWidth * 0.4, ankleY + 8);
    footPath.close();
    canvas.drawPath(footPath, fill);
    canvas.drawPath(footPath, stroke);

    // Joint pin circle.
    final pinPaint = Paint()
      ..color = _kOrthosisStroke
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    canvas.drawCircle(Offset(ankleX - shellWidth * 0.5, ankleY), 7, pinPaint);
    final pinFill = Paint()..color = _kOrthosisFill.withValues(alpha: 0.5);
    canvas.drawCircle(Offset(ankleX - shellWidth * 0.5, ankleY), 7, pinFill);
  }

  /// Anterior shell (FRO / GRAFO).
  void _drawAnteriorShell(
    Canvas canvas,
    double ankleX,
    double ankleY,
    double kneeX,
    double kneeY,
    double heelX,
    double toeX,
    double groundY,
    double tibiaAngle,
    Paint fill,
    Paint stroke,
  ) {
    const shellWidth = 12.0;
    // Anterior = in front of tibia.
    final dx = math.cos(tibiaAngle) * shellWidth;
    final dy = math.sin(tibiaAngle) * shellWidth;

    final path = Path();

    // Anterior calf (proximal shell wraps the front of shin).
    final antTopX = kneeX + dx - 2;
    final antTopY = kneeY + dy;
    final antAnkleX = ankleX + dx;
    final antAnkleY = ankleY + dy;

    path.moveTo(antTopX, antTopY);
    path.quadraticBezierTo(
      (antTopX + antAnkleX) / 2 + dx * 0.4,
      (antTopY + antAnkleY) / 2,
      antAnkleX,
      antAnkleY,
    );
    // Anterior shell continues down to footplate.
    path.lineTo(toeX - 4, groundY - 2);
    path.lineTo(heelX + 2, groundY - 2);
    // Inner footplate edge.
    path.lineTo(heelX + 2, groundY - 6);
    path.lineTo(toeX - 4, groundY - 6);
    // Inner edge of anterior cuff.
    path.lineTo(antAnkleX - shellWidth * 0.35, antAnkleY);
    path.quadraticBezierTo(
      (antTopX - shellWidth * 0.2 + antAnkleX - shellWidth * 0.35) / 2 +
          dx * 0.2,
      (antTopY + antAnkleY) / 2,
      antTopX - shellWidth * 0.2,
      antTopY,
    );
    path.close();

    canvas.drawPath(path, fill);
    canvas.drawPath(path, stroke);
  }

  // -----------------------------------------------------------------------
  // GRF arrow
  // -----------------------------------------------------------------------
  void _drawGrf(
    Canvas canvas,
    Size size,
    double ankleX,
    double ankleY,
    double kneeX,
    double kneeY,
    double groundY,
    double toeX,
    double heelX,
  ) {
    final grfPaint = Paint()
      ..color = _kGrf
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;

    // GRF application point shifts from heel to forefoot over stance.
    final copX = _lerp(heelX + 8, toeX - 12, phase);
    final copY = groundY;

    double grfAngle; // from vertical, positive = anterior lean
    double grfLength = 100;

    switch (type) {
      case AfoType.solidAfo:
        grfAngle = _lerp(-0.08, 0.1, phase);
        break;
      case AfoType.posteriorLeafSpring:
        grfAngle = _lerp(-0.05, 0.15, phase);
        break;
      case AfoType.articulatedAfo:
        grfAngle = _lerp(-0.05, 0.12, phase);
        break;
      case AfoType.floorReactionOrthosis:
        // GRF shifts distinctly anterior to knee.
        grfAngle = _lerp(0.05, 0.22, phase);
        grfLength = 110;
        break;
    }

    final endX = copX + grfLength * math.sin(grfAngle);
    final endY = copY - grfLength * math.cos(grfAngle);

    _drawArrow(canvas, Offset(copX, copY), Offset(endX, endY), grfPaint,
        headSize: 10);

    // Label "GRF"
    _drawText(canvas, 'GRF', Offset(endX + 6, endY - 4), _kGrf, 10);

    // --- Moment arm for FRO: show line from knee to GRF vector ---
    if (type == AfoType.floorReactionOrthosis) {
      // Perpendicular distance indicator from knee to GRF line.
      final momentPaint = Paint()
        ..color = _kGrf.withValues(alpha: 0.5)
        ..strokeWidth = 1.5
        ..style = PaintingStyle.stroke;

      // Project knee onto GRF line.
      final grfDx = endX - copX;
      final grfDy = endY - copY;
      final len2 = grfDx * grfDx + grfDy * grfDy;
      final t = ((kneeX - copX) * grfDx + (kneeY - copY) * grfDy) / len2;
      final projX = copX + t * grfDx;
      final projY = copY + t * grfDy;

      // Dashed-style moment arm line.
      canvas.drawLine(
          Offset(kneeX, kneeY), Offset(projX, projY), momentPaint);

      // Small extension moment arc at knee.
      final extPaint = Paint()
        ..color = _kGrf
        ..strokeWidth = 2
        ..style = PaintingStyle.stroke;
      final arcRect =
          Rect.fromCircle(center: Offset(kneeX, kneeY), radius: 16);
      canvas.drawArc(arcRect, -math.pi * 0.7, math.pi * 0.35, false,
          extPaint);
      _drawText(canvas, 'Ext', Offset(kneeX - 30, kneeY - 22), _kGrf, 9);
    }
  }

  // -----------------------------------------------------------------------
  // 3-point pressure system
  // -----------------------------------------------------------------------
  void _drawThreePointPressure(
    Canvas canvas,
    double ankleX,
    double ankleY,
    double kneeX,
    double kneeY,
    double toeX,
    double heelX,
    double groundY,
    double tibiaAngle,
  ) {
    final forcePaint = Paint()
      ..color = _kForceRed
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    const arrowLen = 24.0;

    switch (type) {
      case AfoType.solidAfo:
        // P1: proximal calf (posterior push).
        _drawForceArrow(canvas, kneeX - 8, kneeY + 10, arrowLen, 0,
            forcePaint); // rightward
        // P2: ankle anterior (counter-force).
        _drawForceArrow(canvas, ankleX + 8, ankleY, arrowLen, math.pi,
            forcePaint); // leftward
        // P3: plantar foot (upward).
        _drawForceArrow(canvas, (heelX + toeX) / 2, groundY - 8, arrowLen,
            -math.pi / 2, forcePaint);
        break;
      case AfoType.posteriorLeafSpring:
        _drawForceArrow(canvas, kneeX - 8, kneeY + 10, arrowLen, 0,
            forcePaint);
        _drawForceArrow(canvas, ankleX + 6, ankleY, arrowLen * 0.8,
            math.pi, forcePaint);
        _drawForceArrow(canvas, (heelX + toeX) / 2, groundY - 8,
            arrowLen * 0.8, -math.pi / 2, forcePaint);
        break;
      case AfoType.articulatedAfo:
        _drawForceArrow(canvas, kneeX - 8, kneeY + 10, arrowLen, 0,
            forcePaint);
        _drawForceArrow(canvas, ankleX + 8, ankleY + 12, arrowLen * 0.7,
            math.pi, forcePaint); // PF stop
        _drawForceArrow(canvas, (heelX + toeX) / 2, groundY - 8,
            arrowLen * 0.8, -math.pi / 2, forcePaint);
        break;
      case AfoType.floorReactionOrthosis:
        // P1: proximal anterior shin (pushes back).
        _drawForceArrow(canvas, kneeX + 10, kneeY + 10, arrowLen,
            math.pi, forcePaint); // leftward (posterior)
        // P2: anterior distal tibia area (pushes back).
        _drawForceArrow(canvas, ankleX + 10, ankleY - 20, arrowLen * 0.7,
            math.pi, forcePaint);
        // P3: plantar foot (upward).
        _drawForceArrow(canvas, (heelX + toeX) / 2, groundY - 8, arrowLen,
            -math.pi / 2, forcePaint);
        break;
    }

    // Small label
    _drawText(canvas, '3-pt pressure', Offset(ankleX + 50, ankleY - 40),
        _kForceRed.withValues(alpha: 0.7), 8);
  }

  // -----------------------------------------------------------------------
  // Motion arrows at ankle (allowed / blocked)
  // -----------------------------------------------------------------------
  void _drawMotionArrows(
      Canvas canvas, double ankleX, double ankleY) {
    final blockedPaint = Paint()
      ..color = _kBlockedArrow
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    final allowedPaint = Paint()
      ..color = _kTeal
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    const r = 20.0;
    final center = Offset(ankleX, ankleY);

    switch (type) {
      case AfoType.solidAfo:
        // Both DF and PF blocked.
        _drawBlockedArc(canvas, center, r, -math.pi * 0.75,
            math.pi * 0.25, blockedPaint);
        _drawBlockedArc(canvas, center, r, -math.pi * 0.25,
            math.pi * 0.25, blockedPaint);
        break;
      case AfoType.posteriorLeafSpring:
        // DF allowed (small), PF limited.
        _drawAllowedArc(canvas, center, r, -math.pi * 0.75,
            math.pi * 0.2, allowedPaint);
        _drawBlockedArc(canvas, center, r, -math.pi * 0.25,
            math.pi * 0.2, blockedPaint);
        break;
      case AfoType.articulatedAfo:
        // Free DF, PF blocked.
        _drawAllowedArc(canvas, center, r, -math.pi * 0.75,
            math.pi * 0.3, allowedPaint);
        _drawBlockedArc(canvas, center, r, -math.pi * 0.25,
            math.pi * 0.25, blockedPaint);
        break;
      case AfoType.floorReactionOrthosis:
        // Excessive DF blocked, PF blocked.
        _drawBlockedArc(canvas, center, r, -math.pi * 0.75,
            math.pi * 0.25, blockedPaint);
        _drawBlockedArc(canvas, center, r, -math.pi * 0.25,
            math.pi * 0.2, blockedPaint);
        break;
    }
  }

  // -----------------------------------------------------------------------
  // Labels
  // -----------------------------------------------------------------------
  void _drawLabels(Canvas canvas, Size size) {
    // Phase indicator.
    final phaseLabel = phase < 0.15
        ? 'Loading Response'
        : phase < 0.5
            ? 'Midstance'
            : phase < 0.85
                ? 'Terminal Stance'
                : 'Pre-Swing';
    _drawText(
        canvas, phaseLabel, Offset(size.width * 0.5, 8), _kBone, 11,
        center: true);

    // Joint labels.
    // (ankle, knee already visible from yellow circles)
  }

  // -----------------------------------------------------------------------
  // Drawing helpers
  // -----------------------------------------------------------------------

  void _drawArrow(
      Canvas canvas, Offset from, Offset to, Paint paint,
      {double headSize = 8}) {
    canvas.drawLine(from, to, paint);
    final angle = math.atan2(to.dy - from.dy, to.dx - from.dx);
    final p1 = Offset(
      to.dx - headSize * math.cos(angle - 0.45),
      to.dy - headSize * math.sin(angle - 0.45),
    );
    final p2 = Offset(
      to.dx - headSize * math.cos(angle + 0.45),
      to.dy - headSize * math.sin(angle + 0.45),
    );
    final headPath = Path()
      ..moveTo(to.dx, to.dy)
      ..lineTo(p1.dx, p1.dy)
      ..lineTo(p2.dx, p2.dy)
      ..close();
    canvas.drawPath(
        headPath,
        Paint()
          ..color = paint.color
          ..style = PaintingStyle.fill);
  }

  void _drawForceArrow(Canvas canvas, double x, double y, double length,
      double angle, Paint paint) {
    final start = Offset(x, y);
    final end = Offset(
        x + length * math.cos(angle), y + length * math.sin(angle));
    _drawArrow(canvas, start, end, paint, headSize: 6);
  }

  void _drawBlockedArc(Canvas canvas, Offset center, double radius,
      double startAngle, double sweepAngle, Paint paint) {
    final rect = Rect.fromCircle(center: center, radius: radius);
    canvas.drawArc(rect, startAngle, sweepAngle, false, paint);
    // X through the arc midpoint.
    final midAngle = startAngle + sweepAngle / 2;
    final mx = center.dx + radius * math.cos(midAngle);
    final my = center.dy + radius * math.sin(midAngle);
    const s = 5.0;
    canvas.drawLine(Offset(mx - s, my - s), Offset(mx + s, my + s), paint);
    canvas.drawLine(Offset(mx + s, my - s), Offset(mx - s, my + s), paint);
  }

  void _drawAllowedArc(Canvas canvas, Offset center, double radius,
      double startAngle, double sweepAngle, Paint paint) {
    final rect = Rect.fromCircle(center: center, radius: radius);
    canvas.drawArc(rect, startAngle, sweepAngle, false, paint);
    // Small arrowhead at end of arc.
    final endAngle = startAngle + sweepAngle;
    final ex = center.dx + radius * math.cos(endAngle);
    final ey = center.dy + radius * math.sin(endAngle);
    final tangent = endAngle + math.pi / 2;
    const hs = 5.0;
    final p1 = Offset(
        ex - hs * math.cos(tangent - 0.5), ey - hs * math.sin(tangent - 0.5));
    final p2 = Offset(
        ex - hs * math.cos(tangent + 0.5), ey - hs * math.sin(tangent + 0.5));
    final headPath = Path()
      ..moveTo(ex, ey)
      ..lineTo(p1.dx, p1.dy)
      ..lineTo(p2.dx, p2.dy)
      ..close();
    canvas.drawPath(
        headPath,
        Paint()
          ..color = paint.color
          ..style = PaintingStyle.fill);
  }

  void _drawText(Canvas canvas, String text, Offset position, Color color,
      double fontSize,
      {bool center = false}) {
    final span = TextSpan(
      text: text,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: FontWeight.w600,
      ),
    );
    final painter = TextPainter(
      text: span,
      textDirection: TextDirection.ltr,
    )..layout();
    final offset = center
        ? Offset(position.dx - painter.width / 2, position.dy)
        : position;
    painter.paint(canvas, offset);
  }

  static double _lerp(double a, double b, double t) {
    return a + (b - a) * t.clamp(0.0, 1.0);
  }

  @override
  bool shouldRepaint(_AfoStancePainter oldDelegate) {
    return oldDelegate.phase != phase || oldDelegate.type != type;
  }
}

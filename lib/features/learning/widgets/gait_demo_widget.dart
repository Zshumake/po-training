import 'dart:math' as math;
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import '../models/gait_profile.dart';

// ---------------------------------------------------------------------------
// GaitDemoWidget — Animated gait figure using anatomical CustomPainter
// ---------------------------------------------------------------------------

class GaitDemoWidget extends StatefulWidget {
  final GaitProfile? profile;
  final double scale;

  const GaitDemoWidget({
    super.key,
    this.profile,
    this.scale = 1.0,
  });

  @override
  State<GaitDemoWidget> createState() => _GaitDemoWidgetState();
}

class _GaitDemoWidgetState extends State<GaitDemoWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    final duration =
        widget.profile?.duration ?? const Duration(milliseconds: 1200);
    _controller = AnimationController(vsync: this, duration: duration)
      ..repeat();
  }

  @override
  void didUpdateWidget(GaitDemoWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.profile?.duration != widget.profile?.duration ||
        oldWidget.profile?.type != widget.profile?.type) {
      _controller.duration =
          widget.profile?.duration ?? const Duration(milliseconds: 1200);
      _controller.repeat();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final p = widget.profile ?? GaitProfile.normal;

        final pose = _GaitPose(
          torsoY: p.torsoYOffset.evaluate(_controller),
          torsoRot: p.torsoRotation.evaluate(_controller),
          torsoLateral: p.torsoLateralShift.evaluate(_controller),
          rHip: p.rightHipFlexion.evaluate(_controller),
          rKnee: p.rightKneeFlexion.evaluate(_controller),
          rAnkle: p.rightAnkleFlexion.evaluate(_controller),
          lHip: p.leftHipFlexion.evaluate(_controller),
          lKnee: p.leftKneeFlexion.evaluate(_controller),
          lAnkle: p.leftAnkleFlexion.evaluate(_controller),
          rShoulder: p.rightShoulderFlexion.evaluate(_controller),
          lShoulder: p.leftShoulderFlexion.evaluate(_controller),
          rLateral: p.rightLegLateralOffset.evaluate(_controller),
          t: _controller.value,
        );

        return Transform.scale(
          scale: widget.scale,
          child: SizedBox(
            width: 200,
            height: 350,
            child: CustomPaint(
              size: const Size(200, 350),
              painter: _BodyPainter(pose: pose),
            ),
          ),
        );
      },
    );
  }
}

// ---------------------------------------------------------------------------
// Pose data transfer object
// ---------------------------------------------------------------------------

class _GaitPose {
  final double torsoY, torsoRot, torsoLateral;
  final double rHip, rKnee, rAnkle;
  final double lHip, lKnee, lAnkle;
  final double rShoulder, lShoulder;
  final double rLateral;
  final double t; // 0.0–1.0 animation progress

  const _GaitPose({
    required this.torsoY,
    required this.torsoRot,
    required this.torsoLateral,
    required this.rHip,
    required this.rKnee,
    required this.rAnkle,
    required this.lHip,
    required this.lKnee,
    required this.lAnkle,
    required this.rShoulder,
    required this.lShoulder,
    required this.rLateral,
    required this.t,
  });
}

// ---------------------------------------------------------------------------
// Anatomical body painter
// ---------------------------------------------------------------------------

class _BodyPainter extends CustomPainter {
  final _GaitPose pose;
  _BodyPainter({required this.pose});

  // Body proportions (7.5-head canon, scaled to ~280px figure)
  static const double _headR = 14.0;
  static const double _neckLen = 8.0;
  static const double _torsoLen = 90.0;
  static const double _upperArmLen = 50.0;
  static const double _forearmLen = 42.0;
  static const double _thighLen = 70.0;
  static const double _shinLen = 68.0;
  static const double _footLen = 30.0;
  static const double _footH = 10.0;

  // Limb widths (proximal → distal taper)
  static const double _torsoW = 32.0;
  static const double _hipW = 28.0;
  static const double _thighWTop = 18.0;
  static const double _thighWBot = 13.0;
  static const double _shinWTop = 13.0;
  static const double _shinWBot = 9.0;
  static const double _upperArmW = 11.0;
  static const double _forearmW = 9.0;

  // Colors
  static const _skinDark = Color(0xFF4A5568);
  static const _skinMid = Color(0xFF718096);
  static const _skinLight = Color(0xFF8DA2B5);
  static const _jointColor = Color(0xFF0D9488); // teal
  static const _groundColor = Color(0xFF4A5568);

  double _rad(double deg) => deg * math.pi / 180.0;

  @override
  void paint(Canvas canvas, Size size) {
    // Origin = top-center of the canvas, shifted down for head clearance
    final cx = size.width / 2 + pose.torsoLateral;
    final baseY = 50.0 + pose.torsoY;

    canvas.save();

    // Apply torso rotation around hip center
    final hipCenter = Offset(cx, baseY + _neckLen + _torsoLen);
    canvas.translate(hipCenter.dx, hipCenter.dy);
    canvas.rotate(_rad(pose.torsoRot));
    canvas.translate(-hipCenter.dx, -hipCenter.dy);

    // Calculate key joint positions using forward kinematics
    final headCenter = Offset(cx, baseY - _headR);
    final neckBase = Offset(cx, baseY);
    final shoulderCenter = Offset(cx, baseY + 10);
    final hipCenterPos = Offset(cx, baseY + _neckLen + _torsoLen);

    // -- Draw back (far) limbs first --
    _drawArm(canvas, shoulderCenter, _rad(pose.lShoulder), 0.55);
    _drawLeg(canvas, hipCenterPos, _rad(pose.lHip), _rad(pose.lKnee),
        _rad(pose.lAnkle), 0.0, 0.55);

    // -- Torso --
    _drawTorso(canvas, neckBase, hipCenterPos);

    // -- Head --
    _drawHead(canvas, headCenter);

    // -- Front (near) limbs --
    _drawLeg(canvas, hipCenterPos, _rad(pose.rHip), _rad(pose.rKnee),
        _rad(pose.rAnkle), pose.rLateral, 1.0);
    _drawArm(canvas, shoulderCenter, _rad(pose.rShoulder), 1.0);

    // -- Joint markers --
    _drawJointMarker(canvas, hipCenterPos);
    final rKneePos = _jointPos(hipCenterPos, _rad(pose.rHip), _thighLen);
    _drawJointMarker(canvas, rKneePos);
    final rAnklePos = _jointPos(rKneePos, _rad(pose.rHip + pose.rKnee), _shinLen);
    _drawJointMarker(canvas, rAnklePos);

    canvas.restore();

    // -- Ground line --
    _drawGround(canvas, size);

    // -- Phase label --
    _drawPhaseLabel(canvas, size);
  }

  Offset _jointPos(Offset origin, double angle, double length) {
    return Offset(
      origin.dx + length * math.sin(angle),
      origin.dy + length * math.cos(angle),
    );
  }

  void _drawHead(Canvas canvas, Offset center) {
    // Skull oval
    final headPaint = Paint()
      ..shader = ui.Gradient.radial(
        center + const Offset(-3, -3),
        _headR * 1.3,
        [_skinMid, _skinDark],
      );
    canvas.drawOval(
      Rect.fromCenter(
          center: center, width: _headR * 2, height: _headR * 2.2),
      headPaint,
    );

    // Neck
    final neckPath = Path();
    final neckTop = center.dy + _headR * 1.0;
    neckPath.moveTo(center.dx - 5, neckTop);
    neckPath.lineTo(center.dx - 6, neckTop + _neckLen);
    neckPath.lineTo(center.dx + 6, neckTop + _neckLen);
    neckPath.lineTo(center.dx + 5, neckTop);
    neckPath.close();
    canvas.drawPath(neckPath, Paint()..color = _skinMid);
  }

  void _drawTorso(Canvas canvas, Offset neckBase, Offset hipCenter) {
    final path = Path();
    // Shoulders (wider)
    path.moveTo(neckBase.dx - _torsoW / 2, neckBase.dy);
    // Left side — slight curve for ribcage
    path.quadraticBezierTo(
      neckBase.dx - _torsoW / 2 - 3,
      (neckBase.dy + hipCenter.dy) / 2,
      hipCenter.dx - _hipW / 2,
      hipCenter.dy,
    );
    // Bottom
    path.lineTo(hipCenter.dx + _hipW / 2, hipCenter.dy);
    // Right side
    path.quadraticBezierTo(
      neckBase.dx + _torsoW / 2 + 3,
      (neckBase.dy + hipCenter.dy) / 2,
      neckBase.dx + _torsoW / 2,
      neckBase.dy,
    );
    path.close();

    final torsoPaint = Paint()
      ..shader = ui.Gradient.linear(
        Offset(neckBase.dx - _torsoW / 2, neckBase.dy),
        Offset(neckBase.dx + _torsoW / 2, neckBase.dy),
        [_skinDark, _skinMid, _skinDark],
        [0.0, 0.4, 1.0],
      );
    canvas.drawPath(path, torsoPaint);

    // Subtle shoulder line
    canvas.drawLine(
      Offset(neckBase.dx - _torsoW / 2 + 2, neckBase.dy + 2),
      Offset(neckBase.dx + _torsoW / 2 - 2, neckBase.dy + 2),
      Paint()
        ..color = _skinLight.withValues(alpha: 0.3)
        ..strokeWidth = 1.5,
    );
  }

  void _drawLeg(Canvas canvas, Offset hip, double hipAngle, double kneeAngle,
      double ankleAngle, double lateralOffset, double opacity) {
    // Forward kinematics
    final hipPos = Offset(hip.dx + lateralOffset, hip.dy);
    final kneePos = Offset(
      hipPos.dx + _thighLen * math.sin(hipAngle),
      hipPos.dy + _thighLen * math.cos(hipAngle),
    );
    final totalKneeAngle = hipAngle + kneeAngle;
    final anklePos = Offset(
      kneePos.dx + _shinLen * math.sin(totalKneeAngle),
      kneePos.dy + _shinLen * math.cos(totalKneeAngle),
    );
    final totalAnkleAngle = totalKneeAngle + ankleAngle;
    final toePos = Offset(
      anklePos.dx + _footLen * math.sin(totalAnkleAngle + _rad(80)),
      anklePos.dy + _footLen * math.cos(totalAnkleAngle + _rad(80)),
    );

    final nearColor = _skinMid.withValues(alpha: opacity);
    final darkColor = _skinDark.withValues(alpha: opacity);

    // Thigh
    _drawTaperedLimb(canvas, hipPos, kneePos, _thighWTop, _thighWBot,
        nearColor, darkColor, hipAngle);

    // Shin
    _drawTaperedLimb(canvas, kneePos, anklePos, _shinWTop, _shinWBot,
        nearColor, darkColor, totalKneeAngle);

    // Foot
    _drawFoot(canvas, anklePos, toePos, totalAnkleAngle, opacity);
  }

  void _drawTaperedLimb(Canvas canvas, Offset top, Offset bottom,
      double wTop, double wBot, Color nearColor, Color darkColor, double angle) {
    // Calculate perpendicular offsets for limb width
    final perpX = math.cos(angle);
    final perpY = -math.sin(angle);

    final path = Path();
    path.moveTo(top.dx + perpX * wTop / 2, top.dy + perpY * wTop / 2);
    // Organic curve on outer edge
    final midOuter = Offset(
      (top.dx + bottom.dx) / 2 + perpX * (wTop + wBot) / 4 + perpX * 2,
      (top.dy + bottom.dy) / 2 + perpY * (wTop + wBot) / 4 + perpY * 2,
    );
    path.quadraticBezierTo(
        midOuter.dx, midOuter.dy,
        bottom.dx + perpX * wBot / 2, bottom.dy + perpY * wBot / 2);
    path.lineTo(bottom.dx - perpX * wBot / 2, bottom.dy - perpY * wBot / 2);
    // Inner edge
    final midInner = Offset(
      (top.dx + bottom.dx) / 2 - perpX * (wTop + wBot) / 4,
      (top.dy + bottom.dy) / 2 - perpY * (wTop + wBot) / 4,
    );
    path.quadraticBezierTo(
        midInner.dx, midInner.dy,
        top.dx - perpX * wTop / 2, top.dy - perpY * wTop / 2);
    path.close();

    final paint = Paint()
      ..shader = ui.Gradient.linear(
        Offset(top.dx - perpX * wTop / 2, top.dy),
        Offset(top.dx + perpX * wTop / 2, top.dy),
        [darkColor, nearColor, darkColor],
        [0.0, 0.35, 1.0],
      );
    canvas.drawPath(path, paint);
  }

  void _drawFoot(Canvas canvas, Offset ankle, Offset toe, double angle, double opacity) {
    final color = _skinDark.withValues(alpha: opacity);
    // Anatomical foot shape
    final path = Path();
    final heelBack = Offset(
      ankle.dx - _footH * 0.6 * math.sin(angle + _rad(80)),
      ankle.dy - _footH * 0.6 * math.cos(angle + _rad(80)),
    );
    path.moveTo(ankle.dx, ankle.dy);
    // Heel
    path.quadraticBezierTo(
      heelBack.dx, heelBack.dy + 4,
      heelBack.dx + 3, heelBack.dy + _footH,
    );
    // Sole to toe
    path.lineTo(toe.dx, toe.dy + _footH * 0.4);
    // Toe cap
    path.quadraticBezierTo(
      toe.dx + 4, toe.dy - 2,
      toe.dx - 2, toe.dy - 4,
    );
    // Dorsum back to ankle
    path.quadraticBezierTo(
      (ankle.dx + toe.dx) / 2, ankle.dy - 4,
      ankle.dx, ankle.dy,
    );
    path.close();
    canvas.drawPath(path, Paint()..color = color);
  }

  void _drawArm(Canvas canvas, Offset shoulder, double shoulderAngle, double opacity) {
    final nearColor = _skinMid.withValues(alpha: opacity);
    final darkColor = _skinDark.withValues(alpha: opacity);

    // Forward kinematics
    final elbowPos = Offset(
      shoulder.dx + _upperArmLen * math.sin(shoulderAngle),
      shoulder.dy + _upperArmLen * math.cos(shoulderAngle),
    );
    final elbowAngle = shoulderAngle + _rad(-15); // slight flexion
    final wristPos = Offset(
      elbowPos.dx + _forearmLen * math.sin(elbowAngle),
      elbowPos.dy + _forearmLen * math.cos(elbowAngle),
    );

    // Upper arm
    _drawTaperedLimb(canvas, shoulder, elbowPos, _upperArmW, _forearmW,
        nearColor, darkColor, shoulderAngle);

    // Forearm
    _drawTaperedLimb(canvas, elbowPos, wristPos, _forearmW, 7,
        nearColor, darkColor, elbowAngle);

    // Hand (small oval)
    canvas.drawOval(
      Rect.fromCenter(center: wristPos, width: 8, height: 10),
      Paint()..color = darkColor,
    );
  }

  void _drawJointMarker(Canvas canvas, Offset pos) {
    // Outer ring
    canvas.drawCircle(
      pos,
      4.5,
      Paint()
        ..color = _jointColor.withValues(alpha: 0.3)
        ..style = PaintingStyle.fill,
    );
    // Inner dot
    canvas.drawCircle(
      pos,
      2.5,
      Paint()
        ..color = _jointColor
        ..style = PaintingStyle.fill,
    );
  }

  void _drawGround(Canvas canvas, Size size) {
    final y = size.height - 15;
    // Ground shadow gradient
    final shadowPaint = Paint()
      ..shader = ui.Gradient.linear(
        Offset(0, y - 8),
        Offset(0, y + 4),
        [Colors.transparent, _groundColor.withValues(alpha: 0.15)],
      );
    canvas.drawRect(Rect.fromLTWH(0, y - 8, size.width, 12), shadowPaint);

    // Ground line
    canvas.drawLine(
      Offset(10, y),
      Offset(size.width - 10, y),
      Paint()
        ..color = _groundColor.withValues(alpha: 0.5)
        ..strokeWidth = 1.5,
    );
  }

  void _drawPhaseLabel(Canvas canvas, Size size) {
    final phase = _getPhaseLabel(pose.t);
    final tp = TextPainter(
      text: TextSpan(
        text: phase,
        style: TextStyle(
          color: _jointColor.withValues(alpha: 0.7),
          fontSize: 11,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    tp.layout();
    tp.paint(canvas, Offset((size.width - tp.width) / 2, size.height - 10));
  }

  String _getPhaseLabel(double t) {
    if (t < 0.02) return 'Initial Contact';
    if (t < 0.12) return 'Loading Response';
    if (t < 0.30) return 'Midstance';
    if (t < 0.50) return 'Terminal Stance';
    if (t < 0.62) return 'Pre-Swing';
    if (t < 0.75) return 'Initial Swing';
    if (t < 0.87) return 'Mid-Swing';
    return 'Terminal Swing';
  }

  @override
  bool shouldRepaint(_BodyPainter oldDelegate) => true;
}

import 'dart:math' as math;
import 'package:flutter/material.dart';

// ---------------------------------------------------------------------------
// Terminal device type enum
// ---------------------------------------------------------------------------

enum TerminalDeviceType {
  voHook('Voluntary Opening Hook'),
  vcHook('Voluntary Closing Hook'),
  myoelectricHand('Myoelectric Hand');

  const TerminalDeviceType(this.label);
  final String label;
}

// ---------------------------------------------------------------------------
// Colors
// ---------------------------------------------------------------------------

const Color _bgColor = Color(0xFF0F1923);
const Color _surfaceColor = Color(0xFF1A2332);
const Color _teal = Color(0xFF0D9488);
const Color _cableColor = Color(0xFFB0BEC5);
const Color _rubberBandColor = Color(0xFFE57373);
const Color _metalColor = Color(0xFF90A4AE);
const Color _metalHighlight = Color(0xFFCFD8DC);
const Color _electrodeColor = Color(0xFF4FC3F7);
const Color _emgSignalColor = Color(0xFF81C784);
const Color _forceArrowColor = Color(0xFFFFA726);
const Color _objectColor = Color(0xFF8D6E63);
const Color _labelColor = Color(0xFFB0BEC5);
const Color _chipSelectedBg = Color(0xFF0D9488);
const Color _chipUnselectedBg = Color(0xFF1A2332);
const Color _chipBorder = Color(0xFF2A3545);

// ---------------------------------------------------------------------------
// TerminalDeviceDemoWidget
// ---------------------------------------------------------------------------

class TerminalDeviceDemoWidget extends StatefulWidget {
  final TerminalDeviceType initialType;

  const TerminalDeviceDemoWidget({
    super.key,
    this.initialType = TerminalDeviceType.voHook,
  });

  @override
  State<TerminalDeviceDemoWidget> createState() =>
      _TerminalDeviceDemoWidgetState();
}

class _TerminalDeviceDemoWidgetState extends State<TerminalDeviceDemoWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late TerminalDeviceType _selectedType;

  @override
  void initState() {
    super.initState();
    _selectedType = widget.initialType;
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _selectType(TerminalDeviceType type) {
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
        color: _bgColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: _teal.withValues(alpha: 0.3)),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Title
          const Text(
            'Terminal Device Mechanics',
            style: TextStyle(
              color: _teal,
              fontSize: 16,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 12),

          // Type selector chips
          Wrap(
            spacing: 8,
            runSpacing: 8,
            alignment: WrapAlignment.center,
            children: TerminalDeviceType.values.map((type) {
              final isSelected = type == _selectedType;
              return GestureDetector(
                onTap: () => _selectType(type),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected ? _chipSelectedBg : _chipUnselectedBg,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: isSelected ? _teal : _chipBorder,
                      width: isSelected ? 1.5 : 1.0,
                    ),
                  ),
                  child: Text(
                    type.label,
                    style: TextStyle(
                      color: isSelected ? Colors.white : _labelColor,
                      fontSize: 12,
                      fontWeight:
                          isSelected ? FontWeight.w600 : FontWeight.w400,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 16),

          // Animation canvas
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return SizedBox(
                width: double.infinity,
                height: 320,
                child: CustomPaint(
                  painter: _TerminalDevicePainter(
                    type: _selectedType,
                    progress: _controller.value,
                  ),
                ),
              );
            },
          ),

          const SizedBox(height: 12),

          // Descriptive label
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: Container(
              key: ValueKey(_selectedType),
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: _surfaceColor,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: _teal.withValues(alpha: 0.2)),
              ),
              child: Text(
                _labelForType(_selectedType),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: _labelColor,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  height: 1.4,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _labelForType(TerminalDeviceType type) {
    switch (type) {
      case TerminalDeviceType.voHook:
        return 'Rubber bands provide grip force\n'
            'Cable pull opens hook against rubber band tension';
      case TerminalDeviceType.vcHook:
        return 'Cable tension provides grip force — better proprioception\n'
            'User directly feels how hard they are gripping';
      case TerminalDeviceType.myoelectricHand:
        return 'EMG signals control motors — no cable needed\n'
            'Electrodes detect muscle contraction on residual limb';
    }
  }
}

// ---------------------------------------------------------------------------
// CustomPainter for the terminal device animation
// ---------------------------------------------------------------------------

class _TerminalDevicePainter extends CustomPainter {
  final TerminalDeviceType type;
  final double progress;

  _TerminalDevicePainter({required this.type, required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    switch (type) {
      case TerminalDeviceType.voHook:
        _paintVOHook(canvas, size);
      case TerminalDeviceType.vcHook:
        _paintVCHook(canvas, size);
      case TerminalDeviceType.myoelectricHand:
        _paintMyoelectricHand(canvas, size);
    }
  }

  // -----------------------------------------------------------------------
  // Utility: animation phase helper
  // 0.0–0.3  = cable pull / action phase
  // 0.3–0.5  = hold
  // 0.5–0.8  = release phase
  // 0.8–1.0  = rest
  // -----------------------------------------------------------------------
  double _actionAmount() {
    if (progress < 0.3) {
      return Curves.easeInOut.transform(progress / 0.3);
    } else if (progress < 0.5) {
      return 1.0;
    } else if (progress < 0.8) {
      return Curves.easeInOut.transform(1.0 - (progress - 0.5) / 0.3);
    } else {
      return 0.0;
    }
  }

  // -----------------------------------------------------------------------
  // Draw harness cable from shoulder area to wrist
  // -----------------------------------------------------------------------
  void _drawHarness(Canvas canvas, Size size, double cableTension) {
    final cablePaint = Paint()
      ..color = _cableColor.withValues(alpha: 0.6 + 0.4 * cableTension)
      ..strokeWidth = 2.0 + cableTension
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    // Figure-8 harness: shoulder -> across back -> down arm
    final shoulderX = size.width * 0.25;
    final shoulderY = size.height * 0.08;
    final elbowX = size.width * 0.42;
    final elbowY = size.height * 0.30;
    final wristX = size.width * 0.50;
    final wristY = size.height * 0.48;

    final path = Path()
      ..moveTo(shoulderX, shoulderY)
      ..quadraticBezierTo(
        size.width * 0.20,
        size.height * 0.18,
        elbowX,
        elbowY,
      )
      ..quadraticBezierTo(
        size.width * 0.48,
        size.height * 0.38,
        wristX,
        wristY,
      );

    canvas.drawPath(path, cablePaint);

    // Shoulder harness loop indicator
    final loopPaint = Paint()
      ..color = _cableColor.withValues(alpha: 0.4)
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(
      Offset(shoulderX, shoulderY),
      12,
      loopPaint,
    );

    // Tension label
    if (cableTension > 0.1) {
      _drawSmallLabel(
        canvas,
        'PULL',
        Offset(size.width * 0.18, size.height * 0.20),
        _cableColor.withValues(alpha: cableTension),
      );
    }
  }

  // -----------------------------------------------------------------------
  // VO Hook: rest=closed, cable opens, release grips object
  // -----------------------------------------------------------------------
  void _paintVOHook(Canvas canvas, Size size) {
    final action = _actionAmount();
    final cx = size.width * 0.50;
    final hookBaseY = size.height * 0.50;

    _drawHarness(canvas, size, action);
    _drawWristUnit(canvas, size, cx, hookBaseY);

    // Hook opening angle: 0 = closed, 1 = fully open
    final openAngle = action * 0.6; // ~35 degrees max

    // Draw rubber bands (always present, stretching when open)
    _drawRubberBands(canvas, cx, hookBaseY + 60, openAngle);

    // Draw hook tines
    _drawHookTines(canvas, cx, hookBaseY + 20, openAngle);

    // Draw object being gripped when closed (release phase and rest)
    if (action < 0.15) {
      _drawGrippedObject(canvas, cx, hookBaseY + 70);
    }

    // Force arrows: rubber bands pulling inward (grip force)
    if (action < 0.3) {
      final gripForce = 1.0 - action;
      _drawForceArrows(
        canvas,
        cx,
        hookBaseY + 65,
        inward: true,
        strength: gripForce,
      );
    }

    // Cable tension force arrow (pulling open)
    if (action > 0.1) {
      _drawForceArrows(
        canvas,
        cx,
        hookBaseY + 40,
        inward: false,
        strength: action,
      );
    }

    // Phase label
    _drawPhaseLabel(canvas, size, _voPhaseLabel());
  }

  String _voPhaseLabel() {
    if (progress < 0.3) {
      return 'Cable pulls — hook OPENS';
    } else if (progress < 0.5) {
      return 'Hook open — position over object';
    } else if (progress < 0.8) {
      return 'Cable released — rubber bands CLOSE hook';
    } else {
      return 'Rest — hook closed (gripping)';
    }
  }

  // -----------------------------------------------------------------------
  // VC Hook: rest=open, cable closes, release opens
  // -----------------------------------------------------------------------
  void _paintVCHook(Canvas canvas, Size size) {
    final action = _actionAmount();
    final cx = size.width * 0.50;
    final hookBaseY = size.height * 0.50;

    _drawHarness(canvas, size, action);
    _drawWristUnit(canvas, size, cx, hookBaseY);

    // Hook closing angle: 0 = open, 1 = fully closed
    final openAngle = (1.0 - action) * 0.6;

    _drawHookTines(canvas, cx, hookBaseY + 20, openAngle);

    // Draw object being gripped when closed (during action)
    if (action > 0.85) {
      _drawGrippedObject(canvas, cx, hookBaseY + 70);
    }

    // Force arrows: cable pulling inward (grip force)
    if (action > 0.1) {
      _drawForceArrows(
        canvas,
        cx,
        hookBaseY + 65,
        inward: true,
        strength: action,
      );
    }

    // Spring force pushing open (at rest)
    if (action < 0.3) {
      _drawForceArrows(
        canvas,
        cx,
        hookBaseY + 40,
        inward: false,
        strength: 1.0 - action,
      );
    }

    _drawPhaseLabel(canvas, size, _vcPhaseLabel());
  }

  String _vcPhaseLabel() {
    if (progress < 0.3) {
      return 'Cable pulls — hook CLOSES (gripping)';
    } else if (progress < 0.5) {
      return 'Holding — cable maintains grip force';
    } else if (progress < 0.8) {
      return 'Cable released — hook OPENS';
    } else {
      return 'Rest — hook open (no grip)';
    }
  }

  // -----------------------------------------------------------------------
  // Myoelectric hand
  // -----------------------------------------------------------------------
  void _paintMyoelectricHand(Canvas canvas, Size size) {
    final action = _actionAmount();
    final cx = size.width * 0.50;
    final forearmTop = size.height * 0.18;
    final forearmBottom = size.height * 0.52;

    // Forearm
    final forearmPaint = Paint()..color = _metalColor.withValues(alpha: 0.6);
    final forearmRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(cx - 22, forearmTop, 44, forearmBottom - forearmTop),
      const Radius.circular(10),
    );
    canvas.drawRRect(forearmRect, forearmPaint);

    // Electrode dots
    _drawElectrodes(canvas, cx, forearmTop, forearmBottom);

    // EMG signal animation
    _drawEMGSignal(canvas, cx, forearmTop, forearmBottom);

    // Hand
    _drawMyoHand(canvas, cx, forearmBottom, action);

    // Object when gripped
    if (action > 0.85) {
      _drawGrippedObject(canvas, cx, forearmBottom + 55);
    }

    // Force arrows for grip
    if (action > 0.2) {
      _drawForceArrows(
        canvas,
        cx,
        forearmBottom + 45,
        inward: true,
        strength: action,
      );
    }

    _drawPhaseLabel(canvas, size, _myoPhaseLabel());
  }

  String _myoPhaseLabel() {
    if (progress < 0.3) {
      return 'EMG signal detected — hand CLOSES';
    } else if (progress < 0.5) {
      return 'Motor holding — proportional grip';
    } else if (progress < 0.8) {
      return 'Signal relaxes — hand OPENS';
    } else {
      return 'Rest — hand open';
    }
  }

  // -----------------------------------------------------------------------
  // Shared drawing helpers
  // -----------------------------------------------------------------------

  void _drawWristUnit(Canvas canvas, Size size, double cx, double baseY) {
    // Socket / forearm stub
    final socketPaint = Paint()..color = _metalColor.withValues(alpha: 0.5);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(cx - 18, baseY - 50, 36, 55),
        const Radius.circular(8),
      ),
      socketPaint,
    );

    // Wrist disconnect ring
    final ringPaint = Paint()
      ..color = _metalHighlight
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5;
    canvas.drawCircle(Offset(cx, baseY + 2), 14, ringPaint);
  }

  void _drawHookTines(
      Canvas canvas, double cx, double topY, double openAngle) {
    final tinePaint = Paint()
      ..color = _metalHighlight
      ..strokeWidth = 5.0
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final tineLength = 55.0;

    // Left tine
    canvas.save();
    canvas.translate(cx - 4, topY);
    canvas.rotate(-openAngle);
    canvas.drawLine(
      Offset.zero,
      Offset(-8, tineLength),
      tinePaint,
    );
    // Hook curve at end
    final leftHookPath = Path()
      ..moveTo(-8, tineLength)
      ..quadraticBezierTo(-4, tineLength + 12, 4, tineLength + 6);
    canvas.drawPath(leftHookPath, tinePaint);
    canvas.restore();

    // Right tine
    canvas.save();
    canvas.translate(cx + 4, topY);
    canvas.rotate(openAngle);
    canvas.drawLine(
      Offset.zero,
      Offset(8, tineLength),
      tinePaint,
    );
    // Hook curve at end
    final rightHookPath = Path()
      ..moveTo(8, tineLength)
      ..quadraticBezierTo(4, tineLength + 12, -4, tineLength + 6);
    canvas.drawPath(rightHookPath, tinePaint);
    canvas.restore();
  }

  void _drawRubberBands(
      Canvas canvas, double cx, double bandY, double openAngle) {
    final bandPaint = Paint()
      ..color = _rubberBandColor
      ..strokeWidth = 3.0
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final spread = 8.0 + openAngle * 30.0;

    // Three rubber bands at different heights
    for (int i = 0; i < 3; i++) {
      final y = bandY + i * 8.0;
      canvas.drawLine(
        Offset(cx - spread, y),
        Offset(cx + spread, y),
        bandPaint,
      );
    }

    // Label near bands
    _drawSmallLabel(
      canvas,
      'Rubber bands',
      Offset(cx + spread + 8, bandY + 4),
      _rubberBandColor.withValues(alpha: 0.8),
    );
  }

  void _drawGrippedObject(Canvas canvas, double cx, double objY) {
    final objPaint = Paint()..color = _objectColor;
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(center: Offset(cx, objY), width: 16, height: 20),
        const Radius.circular(3),
      ),
      objPaint,
    );
  }

  void _drawForceArrows(
    Canvas canvas,
    double cx,
    double arrowY, {
    required bool inward,
    required double strength,
  }) {
    final arrowPaint = Paint()
      ..color = _forceArrowColor.withValues(alpha: 0.3 + 0.7 * strength)
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final halfSpan = 28.0 + (1.0 - strength) * 10.0;
    final arrowLen = 10.0 * strength;

    if (inward) {
      // Left arrow pointing right
      _drawArrowLine(
        canvas,
        Offset(cx - halfSpan, arrowY),
        Offset(cx - halfSpan + arrowLen, arrowY),
        arrowPaint,
      );
      // Right arrow pointing left
      _drawArrowLine(
        canvas,
        Offset(cx + halfSpan, arrowY),
        Offset(cx + halfSpan - arrowLen, arrowY),
        arrowPaint,
      );
    } else {
      // Left arrow pointing left (outward)
      _drawArrowLine(
        canvas,
        Offset(cx - 6, arrowY),
        Offset(cx - 6 - arrowLen, arrowY),
        arrowPaint,
      );
      // Right arrow pointing right (outward)
      _drawArrowLine(
        canvas,
        Offset(cx + 6, arrowY),
        Offset(cx + 6 + arrowLen, arrowY),
        arrowPaint,
      );
    }
  }

  void _drawArrowLine(
      Canvas canvas, Offset from, Offset to, Paint paint) {
    canvas.drawLine(from, to, paint);
    // Arrowhead
    final dir = (to - from);
    final len = dir.distance;
    if (len < 2) return;
    final unit = dir / len;
    final perp = Offset(-unit.dy, unit.dx);
    final headSize = 4.0;
    canvas.drawLine(to, to - unit * headSize + perp * headSize * 0.5, paint);
    canvas.drawLine(to, to - unit * headSize - perp * headSize * 0.5, paint);
  }

  void _drawElectrodes(
      Canvas canvas, double cx, double forearmTop, double forearmBottom) {
    final electrodePaint = Paint()..color = _electrodeColor;
    final midY = (forearmTop + forearmBottom) / 2;

    // Two electrode sites (extensors and flexors)
    canvas.drawCircle(Offset(cx - 24, midY - 15), 5, electrodePaint);
    canvas.drawCircle(Offset(cx + 24, midY + 15), 5, electrodePaint);

    // Labels
    _drawSmallLabel(
      canvas,
      'E1',
      Offset(cx - 38, midY - 19),
      _electrodeColor,
    );
    _drawSmallLabel(
      canvas,
      'E2',
      Offset(cx + 32, midY + 11),
      _electrodeColor,
    );
  }

  void _drawEMGSignal(
      Canvas canvas, double cx, double forearmTop, double forearmBottom) {
    final action = _actionAmount();
    if (action < 0.05) return;

    final signalPaint = Paint()
      ..color = _emgSignalColor.withValues(alpha: 0.4 + 0.6 * action)
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    final midY = (forearmTop + forearmBottom) / 2;

    // Sine wave emanating from electrode 1
    _drawSineWave(canvas, cx - 24, midY - 15, -1, action, signalPaint);
    // Sine wave emanating from electrode 2
    _drawSineWave(canvas, cx + 24, midY + 15, 1, action, signalPaint);
  }

  void _drawSineWave(Canvas canvas, double startX, double startY,
      int direction, double amplitude, Paint paint) {
    final path = Path();
    final amp = 6.0 * amplitude;
    final xDir = direction.toDouble();

    path.moveTo(startX, startY);
    for (int i = 1; i <= 12; i++) {
      final x = startX + xDir * i * 3.0;
      final y = startY +
          math.sin((i.toDouble() + progress * 10) * math.pi / 3) * amp;
      if (i == 1) {
        path.lineTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    canvas.drawPath(path, paint);
  }

  void _drawMyoHand(Canvas canvas, double cx, double handTop, double action) {
    // Palm
    final palmPaint = Paint()..color = _metalColor.withValues(alpha: 0.7);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(cx - 20, handTop, 40, 35),
        const Radius.circular(6),
      ),
      palmPaint,
    );

    final fingerPaint = Paint()
      ..color = _metalHighlight.withValues(alpha: 0.8)
      ..strokeWidth = 5.0
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    // Close amount: 0 = open, 1 = closed
    final closeAngle = action * 0.8;
    final fingerBaseY = handTop + 35;

    // Four fingers
    for (int i = 0; i < 4; i++) {
      final fx = cx - 12.0 + i * 8.0;
      canvas.save();
      canvas.translate(fx, fingerBaseY);
      canvas.rotate(closeAngle * (i == 0 ? 0.3 : i == 3 ? 0.3 : 0.0));
      final fingerLen = 22.0;
      canvas.drawLine(
        Offset.zero,
        Offset(0, fingerLen),
        fingerPaint,
      );
      // Fingertip curl
      canvas.save();
      canvas.translate(0, fingerLen);
      canvas.rotate(closeAngle * 1.2);
      canvas.drawLine(
        Offset.zero,
        Offset(0, 12),
        fingerPaint,
      );
      canvas.restore();
      canvas.restore();
    }

    // Thumb
    canvas.save();
    canvas.translate(cx - 22, handTop + 18);
    canvas.rotate(-0.4 + closeAngle * 0.9);
    canvas.drawLine(
      Offset.zero,
      Offset(-12, 18),
      fingerPaint,
    );
    canvas.restore();

    // Motor indicator inside palm
    final motorPaint = Paint()
      ..color = _teal.withValues(alpha: 0.5 + 0.5 * action)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(cx, handTop + 17), 6, motorPaint);

    final motorRingPaint = Paint()
      ..color = _teal
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;
    canvas.drawCircle(Offset(cx, handTop + 17), 6, motorRingPaint);

    _drawSmallLabel(
      canvas,
      'Motor',
      Offset(cx + 24, handTop + 13),
      _teal,
    );
  }

  void _drawPhaseLabel(Canvas canvas, Size size, String text) {
    final textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: const TextStyle(
          color: _teal,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    );
    textPainter.layout(maxWidth: size.width - 32);
    textPainter.paint(
      canvas,
      Offset(
        (size.width - textPainter.width) / 2,
        size.height - textPainter.height - 4,
      ),
    );
  }

  void _drawSmallLabel(
      Canvas canvas, String text, Offset position, Color color) {
    final textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(
          color: color,
          fontSize: 9,
          fontWeight: FontWeight.w500,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(canvas, position);
  }

  @override
  bool shouldRepaint(_TerminalDevicePainter oldDelegate) {
    return oldDelegate.progress != progress || oldDelegate.type != type;
  }
}

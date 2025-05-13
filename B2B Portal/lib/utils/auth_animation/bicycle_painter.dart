
import 'dart:math';
import 'package:flutter/material.dart';

class BicyclePainter extends CustomPainter {
  final double bikeX;

  BicyclePainter({required this.bikeX});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.black;
    final roadPaint = Paint()
      ..color = Colors.grey.shade300
      ..style = PaintingStyle.fill;
    final linePaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 3;

    // Draw road
    canvas.drawRect(Rect.fromLTWH(0, size.height - 100, size.width, 100), roadPaint);

    for (double i = 0; i < size.width; i += 40) {
      canvas.drawLine(Offset(i, size.height - 50), Offset(i + 20, size.height - 50), linePaint);
    }

    double centerY = size.height - 120;
    double wheelRadius = 24;

    final wheelPaint = Paint()..color = Colors.black;
    final framePaint = Paint()
      ..color = Colors.blueGrey
      ..strokeWidth = 4;

    final personPaint = Paint()..color = Colors.deepOrangeAccent;

    // Draw wheels
    Offset frontWheel = Offset(bikeX + 80, centerY);
    Offset backWheel = Offset(bikeX + 20, centerY);
    canvas.drawCircle(frontWheel, wheelRadius, wheelPaint);
    canvas.drawCircle(backWheel, wheelRadius, wheelPaint);

    // Draw cycle frame
    canvas.drawLine(frontWheel, backWheel, framePaint);
    canvas.drawLine(backWheel, Offset(bikeX + 50, centerY - 40), framePaint);
    canvas.drawLine(Offset(bikeX + 50, centerY - 40), frontWheel, framePaint);

    // Draw seat & handle
    canvas.drawLine(Offset(bikeX + 50, centerY - 40), Offset(bikeX + 45, centerY - 60), framePaint);
    canvas.drawLine(frontWheel, Offset(bikeX + 90, centerY - 60), framePaint);

    // Draw person
    Offset head = Offset(bikeX + 45, centerY - 70);
    canvas.drawCircle(head, 8, personPaint); // head
    canvas.drawLine(Offset(bikeX + 45, centerY - 62), Offset(bikeX + 45, centerY - 40), personPaint); // torso
    canvas.drawLine(Offset(bikeX + 45, centerY - 60), Offset(bikeX + 30, centerY - 50), personPaint); // left arm
    canvas.drawLine(Offset(bikeX + 45, centerY - 60), Offset(bikeX + 60, centerY - 50), personPaint); // right arm
    canvas.drawLine(Offset(bikeX + 45, centerY - 40), Offset(bikeX + 30, centerY - 20), personPaint); // left leg
    canvas.drawLine(Offset(bikeX + 45, centerY - 40), Offset(bikeX + 60, centerY - 20), personPaint); // right leg

    // Draw newspaper in hand before throw
    if (bikeX < 150) {
      final newspaper = Rect.fromLTWH(bikeX + 65, centerY - 55, 20, 10);
      canvas.drawRect(newspaper, Paint()..color = Colors.grey.shade400);
      final textPainter = TextPainter(
        text: const TextSpan(text: 'NEWS', style: TextStyle(color: Colors.black, fontStyle: FontStyle.italic, fontSize: 8)),
        textDirection: TextDirection.ltr,
      )..layout();
      textPainter.paint(canvas, Offset(bikeX + 66, centerY - 54));
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

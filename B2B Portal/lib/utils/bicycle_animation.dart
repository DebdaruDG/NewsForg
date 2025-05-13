import 'package:flutter/material.dart';

class BicycleAnimation extends StatefulWidget {
  const BicycleAnimation({super.key});

  @override
  State<BicycleAnimation> createState() => _BicycleAnimationState();
}

class _BicycleAnimationState extends State<BicycleAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _bikePosition;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat();

    _bikePosition = Tween<double>(
      begin: -300,
      end: 600,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.linear));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool isDelivering(double xPos) {
    return xPos > 350 && xPos < 370;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _bikePosition,
      builder: (context, child) {
        return CustomPaint(
          painter: BicyclePainter(
            _bikePosition.value,
            isDelivering(_bikePosition.value),
          ),
          child: Container(),
        );
      },
    );
  }
}

class BicyclePainter extends CustomPainter {
  final double xPos;
  final bool deliver;

  BicyclePainter(this.xPos, this.deliver);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // Background
    paint.color = const Color(0xFFEAEFF4); // Soft pastel blue
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);

    // Road
    double roadTop = size.height - 100;
    paint.color = const Color(0xFFD0D0D0);
    canvas.drawRect(Rect.fromLTWH(0, roadTop, size.width, 100), paint);

    // Dashed center line
    paint.color = Colors.white;
    paint.strokeWidth = 2;
    double dashWidth = 20, dashSpace = 10;
    double startX = 0;
    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, roadTop + 50),
        Offset(startX + dashWidth, roadTop + 50),
        paint,
      );
      startX += dashWidth + dashSpace;
    }

    // Positioning
    double yBase = roadTop;
    double bikeY = yBase - 30;

    // Wheels
    final wheelPaint =
        Paint()
          ..color = Colors.black.withOpacity(0.8)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2;

    Offset wheelFront = Offset(xPos + 80, bikeY);
    Offset wheelBack = Offset(xPos + 20, bikeY);
    canvas.drawCircle(wheelFront, 20, wheelPaint);
    canvas.drawCircle(wheelBack, 20, wheelPaint);

    // Frame
    final framePaint =
        Paint()
          ..color = Colors.grey.shade800
          ..strokeWidth = 2;

    Offset seat = Offset(xPos + 50, bikeY - 25);
    canvas.drawLine(wheelBack, wheelFront, framePaint); // base bar
    canvas.drawLine(wheelBack, seat, framePaint);
    canvas.drawLine(wheelFront, seat, framePaint);

    // Handlebar
    Offset handle = Offset(xPos + 85, bikeY - 30);
    canvas.drawLine(seat, handle, framePaint);
    canvas.drawLine(handle, Offset(handle.dx + 10, handle.dy - 5), framePaint);

    // Seat post
    canvas.drawLine(seat, Offset(seat.dx, seat.dy - 10), framePaint);

    // Rider (stick figure)
    final riderPaint =
        Paint()
          ..color = Colors.brown
          ..strokeWidth = 2;

    Offset head = Offset(seat.dx, seat.dy - 20);
    canvas.drawCircle(head, 6, riderPaint); // Head
    canvas.drawLine(head, Offset(head.dx, head.dy + 15), riderPaint); // Body
    canvas.drawLine(
      Offset(head.dx, head.dy + 5),
      Offset(head.dx - 10, head.dy + 10),
      riderPaint,
    ); // Left arm
    canvas.drawLine(
      Offset(head.dx, head.dy + 5),
      Offset(head.dx + 10, head.dy + 10),
      riderPaint,
    ); // Right arm
    canvas.drawLine(
      Offset(head.dx, head.dy + 15),
      Offset(head.dx - 8, head.dy + 30),
      riderPaint,
    ); // Left leg
    canvas.drawLine(
      Offset(head.dx, head.dy + 15),
      Offset(head.dx + 8, head.dy + 30),
      riderPaint,
    ); // Right leg

    // Newspaper
    if (deliver) {
      final newspaperX = xPos + 90;
      final newspaperY = bikeY - 30;

      final newspaperPaint =
          Paint()
            ..color = Colors.white
            ..style = PaintingStyle.fill;
      canvas.drawRect(
        Rect.fromLTWH(newspaperX, newspaperY, 30, 16),
        newspaperPaint,
      );

      final borderPaint =
          Paint()
            ..color = Colors.black
            ..style = PaintingStyle.stroke
            ..strokeWidth = 1;
      canvas.drawRect(
        Rect.fromLTWH(newspaperX, newspaperY, 30, 16),
        borderPaint,
      );

      // Draw "NEWS" text
      final textPainter = TextPainter(
        text: const TextSpan(
          text: 'NEWS',
          style: TextStyle(
            fontSize: 8,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      textPainter.paint(canvas, Offset(newspaperX + 3, newspaperY + 2));

      // Italic lines
      final linePaint =
          Paint()
            ..color = Colors.grey.shade700
            ..strokeWidth = 1;

      for (int i = 0; i < 3; i++) {
        double y = newspaperY + 10 + i * 2;
        canvas.drawLine(
          Offset(newspaperX + 3, y),
          Offset(newspaperX + 25, y - 2),
          linePaint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant BicyclePainter oldDelegate) {
    return oldDelegate.xPos != xPos || oldDelegate.deliver != deliver;
  }
}

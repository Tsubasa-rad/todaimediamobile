
import 'package:flutter/material.dart';

class WavePainter extends CustomPainter {
  final Color color1, color2;

  WavePainter({super.repaint, required this.color1, required this.color2});
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..style = PaintingStyle.fill;

    // 青色の部分
    paint.color = color1;
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height * 0.7),
      paint,
    );

    // 波線と黄色の部分
    Path path = Path();
    path.moveTo(0, size.height * 0.5);
    double waveHeight = size.height * 0.05;

    path.quadraticBezierTo(size.width * 0.125, size.height * 0.5 - waveHeight,
        size.width * 0.25, size.height * 0.5);
    path.quadraticBezierTo(size.width * 0.375, size.height * 0.5 + waveHeight,
        size.width * 0.5, size.height * 0.5);
    path.quadraticBezierTo(size.width * 0.625, size.height * 0.5 - waveHeight,
        size.width * 0.75, size.height * 0.5);
    path.quadraticBezierTo(size.width * 0.875, size.height * 0.5 + waveHeight,
        size.width, size.height * 0.5);

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    paint.color = color2;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

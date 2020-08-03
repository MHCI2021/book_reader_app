import 'package:flutter/material.dart';


class LinearPainter extends CustomPainter {
  
  final double progress;
  final Color progressColor;
  final Color backgroundColor;
  final double strokeWidth;

  LinearPainter({
    this.progress,
    this.progressColor,
    this.backgroundColor,
    this.strokeWidth=5.0
  }) ;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint _paintBackground = new Paint()
..color= backgroundColor
..style = PaintingStyle.stroke
..strokeWidth=strokeWidth
 ..strokeCap=StrokeCap.round;


  final Paint _paintLine = new Paint()
  ..color=progressColor
  ..style = PaintingStyle.stroke
  ..strokeWidth=strokeWidth
  ..strokeCap=StrokeCap.round;
    final start = Offset(0.0, size.height / 2);
    final end = Offset(size.width, size.height / 2);
    canvas.drawLine(start, end, _paintBackground);
      final xProgress = size.width * progress;


      canvas.drawLine(start, Offset(xProgress, size.height / 2), _paintLine);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}


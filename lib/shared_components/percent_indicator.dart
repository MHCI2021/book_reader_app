import 'package:flutter/material.dart';



class ProgressBar extends StatelessWidget {
  final double progress, width, height;
  final Color progressColor, backgroundColor;
  final EdgeInsets padding;

  ProgressBar({
    Key key,
    @required this.progress,
    this.width=300.0,
    this.height=30.0,
    this.padding,
    this.progressColor= Colors.black,
    this.backgroundColor= Colors.grey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      padding: padding,
      child: Center(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("   "),
              SizedBox(width: 15,),
              Container(
                width: 150,
                height: 50,
                child: CustomPaint(
                  painter: LinearPainter(
                      progress: progress,
                      progressColor: Colors.black,
                      backgroundColor: Colors.grey[300],
                      strokeWidth: 8),
                ),
              ),
              SizedBox( width: 15,),
              Text(progToPcnt(progress
                  //   appState.currentBook.savedProgress
                  ))
            ],
 
      )),
    );
  }
}

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

String progToPcnt(double prog) => "${(prog * 100).toStringAsFixed(0)}%";

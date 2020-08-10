
import 'package:flutter/material.dart';
import 'package:scroll_book/state/service_locator.dart';
import 'package:scroll_book/state/state.dart';

class TimeBar extends StatefulWidget {
  final int currentTime, totalTime;
  final double width, height;
  final Color progressColor, backgroundColor;
  final EdgeInsets padding;

  TimeBar({
    Key key,
    this.currentTime=0,
    @required this.totalTime,
    this.width=300.0,
    this.height=70.0,
    this.padding,
    this.progressColor= Colors.black,
    this.backgroundColor= Colors.grey,
  }) : super(key: key);

  @override
  _TimeBarState createState() => _TimeBarState();
}

class _TimeBarState extends State<TimeBar> {
  @override
  Widget build(BuildContext context) {
     var readerController = locator<ReaderController>();
    return Container(
      height: widget.height,
      width: double.infinity,
      padding: widget.padding,
      child: Center(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal:50.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               Container(
                      width:double.infinity,
                      height: 20,
                        child:SliderTheme(
      data: SliderTheme.of(context).copyWith(
        activeTrackColor: Colors.grey[700],
        inactiveTrackColor: Colors.grey[700],
        trackShape: RoundedRectSliderTrackShape(),
        trackHeight: 4.0,
        thumbColor: Colors.black,
        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 6.5),
        overlayColor: Colors.red.withAlpha(32),
        overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
      ),
                        child:
                        Slider(
                          max:100.0,
                          value: readerController.currentTime, 
                        onChanged: (val){
                          readerController.currentTime=val;
                          setState(() {
                          });
                        }
                        )
                    )),
           
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text("5:10", style: TextStyle(fontSize:10.0),),
                  Text("-7:34", style: TextStyle(fontSize:10.0),),

                ],)
               
                    //   appState.currentBook.savedProgress
                    
              ],
 
      ),
        )),
    );
  }
}

// class LinearPainter extends CustomPainter {
  
//   final double progress;
//   final Color progressColor;
//   final Color backgroundColor;
//   final double strokeWidth;

//   LinearPainter({
//     this.progress,
//     this.progressColor,
//     this.backgroundColor,
//     this.strokeWidth=5.0
//   }) ;

//   @override
//   void paint(Canvas canvas, Size size) {
//     final Paint _paintBackground = new Paint()
// ..color= backgroundColor
// ..style = PaintingStyle.stroke
// ..strokeWidth=strokeWidth
//  ..strokeCap=StrokeCap.round;


//   final Paint _paintLine = new Paint()
//   ..color=progressColor
//   ..style = PaintingStyle.stroke
//   ..strokeWidth=strokeWidth
//   ..strokeCap=StrokeCap.round;
//   final Paint _paintScrubber = new Paint()
//   ..color=progressColor
//   ..style = PaintingStyle.fill;
//     final start = Offset(0.0, size.height / 2);
//     final end = Offset(size.width, size.height / 2);
//     canvas.drawLine(start, end, _paintBackground);
//       final xProgress = size.width * progress;
//      // canvas.drawLine(start, Offset(xProgress, size.height / 2), _paintLine);
//       canvas.drawCircle(
//         Offset(xProgress, size.height / 2),
//         6.5, 
//       _paintScrubber);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return true;
//   }
// }
//      Container(
//                   width:double.infinity,
//                   height: 20,
//                     child: CustomPaint(
//                       painter: LinearPainter(
//                           progress: 0.5,
//                           progressColor: Colors.black,
//                           backgroundColor: Colors.grey[300],
//                           strokeWidth: 6),
//                     ),
                  
//                 ),
                
               
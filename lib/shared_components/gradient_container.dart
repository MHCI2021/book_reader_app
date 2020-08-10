import 'package:flutter/material.dart';



class GradientContainer extends StatelessWidget {
  
  const GradientContainer({
    Key key, 
    this.height, 
    this.width,
    @required this.begin, 
    @required this.end,
    this.middleColors,
    this.padding,
    this.child
  }) : super(key: key);

  final double height, width;
  final GradientInfo begin, end;
  final List<Color> middleColors;
  final EdgeInsets padding;
  final Widget child;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width??double.infinity,
      height: height??double.infinity,
      padding: padding,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: begin.alignment,
              end: end.alignment,
              colors: [
                begin.color,
                ...middleColors??[],
                end.color
                ])),
    child: child,
    );
  }
}

class GradientInfo {
  final Color color;
  final Alignment alignment;

  GradientInfo({@required this.color,@required this.alignment});
}

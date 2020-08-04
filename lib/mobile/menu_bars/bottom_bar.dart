import 'package:flutter/material.dart';
import 'package:scroll_book/mobile/shared_components/gradient_container.dart';

class BottomBar extends StatelessWidget {
  final List<Widget> children;
  final MainAxisAlignment axisAlignment;

  const BottomBar(
      {Key key,
      @required this.children,
      this.axisAlignment = MainAxisAlignment.spaceEvenly})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: GradientContainer(
          width: double.infinity,
          height: 120.0,
          padding: EdgeInsets.only(top: 20, bottom: 20),
          begin:
              GradientInfo(color: Colors.white, alignment: Alignment.topCenter),
          middleColors: [
            Colors.white.withOpacity(0.9),
          ],
          end: GradientInfo(
            color: Colors.white.withOpacity(0.8),
            alignment: Alignment.bottomCenter,
          ),
          child: Row(
            mainAxisAlignment: axisAlignment,
            children: children,
          )),
    );
  }
}

// Container(
//       width: double.infinity,
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//             begin: Alignment.bottomCenter,
//             end: Alignment.topCenter,
//             colors: [
//               Colors.white,
//               Colors.white,
//               Colors.white.withOpacity(0.7),
//             ]),
//       ),

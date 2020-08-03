

import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  final List<Widget> children;
  final MainAxisAlignment axisAlignment;

  const BottomBar({Key key, @required this.children, this.axisAlignment=MainAxisAlignment.spaceEvenly}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.white,
                  Colors.white,
                  Colors.white.withOpacity(0.7),
                ]),
          ),
          height: 120.0,
          padding: EdgeInsets.only(top: 20, bottom: 20),
          child: Row(
            mainAxisAlignment: axisAlignment,
            children: children,
          )),
    );
      
  
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MenuButton extends StatelessWidget {
  final double h, w;
  final String asset;
  final Function() onPressed;

  const MenuButton({Key key, this.h, this.w, this.asset, this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
                onTap: onPressed,
                child: Container(
                  height: h, width: w,
                  child: SvgPicture.asset(
                    "assets/icons/$asset.svg",
                    // placeholderBuilder: (context) => CircularProgressIndicator(),
                    height: h,
                  ),
                ),
              );
  }
}
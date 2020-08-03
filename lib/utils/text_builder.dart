
import 'package:flutter/material.dart';
import 'package:scroll_book/utils/fonts.dart';


class CustomRichText extends StatelessWidget {
  final String text;
  final double fontSize;
  final String fontFam;
  final TextAlign align;
  final int highlightStart;
  final int highlightSpan;
  final Color highlightColor;

  const CustomRichText({
    Key key, 
    @required this.text,
    this.fontSize=16.0,
    this.fontFam='Alegreya Sans',
    this.highlightColor=Colors.yellow,
    this.align= TextAlign.left, 
    this.highlightStart=0, 
    this.highlightSpan=30
    }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RichText(
    overflow: TextOverflow.clip,
    textAlign: align,
    text: TextSpan(
      children: 
      toTextSpan()
      )
    );
  }
   
 List<TextSpan> toTextSpan() {
    int highlightEnd = highlightStart+highlightSpan;
     TextStyle ts= TextStyle(
        fontSize: fontSize,
        color: Colors.black
        );
        TextStyle tss= TextStyle(
        fontSize: fontSize,
        backgroundColor: highlightColor,
        color: Colors.black
        );

  List<TextSpan> textWidgets = [
          TextSpan(
            text: text.substring(0, highlightStart),
            style:fontFam!=null?getGoogleFonts[fontFam](ts):ts
           ),
           TextSpan(
            text: text.substring(highlightStart, highlightEnd),
            style:fontFam!=null?getGoogleFonts[fontFam](tss):tss
           ),
           TextSpan(
            text: text.substring(highlightEnd),
            style:fontFam!=null?getGoogleFonts[fontFam](ts):ts
           )

  ];
  return textWidgets;
}
}



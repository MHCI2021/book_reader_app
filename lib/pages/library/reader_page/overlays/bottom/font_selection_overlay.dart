import 'package:flutter/material.dart';
import 'package:scroll_book/utils/fonts.dart';

class FontSelectorOverlay extends StatelessWidget {
  final String fontFam;
  final double fontSize;
  final Function(String fontFam, double fontSize) onChanged;
  final Function() onClose;

  const FontSelectorOverlay({
    Key key, 
    this.fontFam, 
    this.fontSize, 
    this.onChanged, 
    this.onClose
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(height: 100, color: Colors.grey.withOpacity(0.9),
  child: Row(
    children:[
       new DropdownButton<String>(
  items: getGoogleFonts.keys.map((String value) {
    return new DropdownMenuItem<String>(
      value: value,
      child: new Text(value),
    );
  }).toList(),
  value: fontFam,
  onChanged: (val) =>onChanged(val, fontSize)
  ),]));
  }
}
 
// setState(() {
//       fontFam= val;
//     });
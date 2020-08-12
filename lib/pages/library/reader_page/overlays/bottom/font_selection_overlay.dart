import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:scroll_book/state/state.dart';
import 'package:scroll_book/utils/fonts.dart';

//
class FontSelectorOverlay extends StatefulWidget {
  final Function() onClose;

  FontSelectorOverlay({Key key, this.onClose}) : super(key: key);

  @override
  _FontSelectorOverlayState createState() => _FontSelectorOverlayState();
}

class _FontSelectorOverlayState extends State<FontSelectorOverlay> {
  @override
  Widget build(BuildContext context) {
    var readerController = locator<ReaderController>();
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
          height: 150,
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    readerController.closeOverlay();
                    widget.onClose();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(width: 200, height: 5, color: Colors.grey),
                  ),
                ),
                new DropdownButton<String>(
                    items: getGoogleFonts.keys.map((String value) {
                      return new DropdownMenuItem<String>(
                        value: value,
                        child: new Text(value),
                      );
                    }).toList(),
                    value: readerController.fontFam,
                    onChanged: (val) {
                      //widget.onChanged(val, widget.fontSize)
                      readerController.fontFam = val;
                      setState(() {});
                    }),
                Row(
                  children: [
                    Icon(
                      FontAwesome.font,
                      size: 20,
                    ),
                    Expanded(
                        child: SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              activeTrackColor: Colors.grey[900],
                              inactiveTrackColor: Colors.grey[700],
                              trackShape: RoundedRectSliderTrackShape(),
                              trackHeight: 2.0,
                              thumbColor: Colors.black,
                              thumbShape: SliderComponentShape.noThumb,
                              overlayColor: null,
                              overlayShape:
                                  RoundSliderOverlayShape(overlayRadius: 28.0),
                            ),
                            child: Slider(
                                divisions: 6,
                                min: 12.0,
                                max: 30.0,
                                value: readerController.fontSize,
                                onChanged: (val) {
                                  readerController.fontSize = val;
                                  setState(() {});
                                }))),
                    Icon(
                      FontAwesome.font,
                      size: 40,
                    ),
                  ],
                ),
              ])),
    );
  }
}

//final String fontFam;
//final double fontSize;
//final Function(String fontFam, double fontSize) onChanged;
//this.fontFam,
//this.fontSize,
//this.onChanged,

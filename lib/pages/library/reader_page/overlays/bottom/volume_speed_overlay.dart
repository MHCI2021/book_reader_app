
import 'package:flutter/material.dart';
import 'package:scroll_book/state/state.dart';

class VolumeBar extends StatefulWidget {

  final double volume;
  final double width, height;
  final Function() onClose;
  final Color progressColor, backgroundColor;
  final EdgeInsets padding;

  VolumeBar({
    Key key,
    this.volume=0.0,
    this.width=300.0,
    this.height=150.0,
    @required this.onClose,
    this.padding,
    this.progressColor= Colors.black,
    this.backgroundColor= Colors.grey,
  }) : super(key: key);

  @override
  _VolumeBarState createState() => _VolumeBarState();
}

class _VolumeBarState extends State<VolumeBar> {
  @override
  Widget build(BuildContext context) {
    var readerController = locator<ReaderController>();
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        color: Colors.white,
        height: widget.height,
        width: double.infinity,
        padding: widget.padding,
        child: Center(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal:50.0),
            child: Column(
              //  mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 GestureDetector(
                   onTap: (){
                     widget.onClose();
                     setState(() { });
                   },
                   child: Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Container(width:200,height:5, color:Colors.grey),
                   ),
                 ),
                  SizedBox(height:20.0),
                 Container(
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children:[
                       Text("0.5x"),Text("0.75x"),Text("1.0x"),Text("1.5x"),Text("2.0x"),
                     ]
                   ),
                 ),
                 SizedBox(height:20.0),
                  Container(
                    width:double.infinity,
                    height: 20,
                      child:SliderTheme(
      data: SliderTheme.of(context).copyWith(
      activeTrackColor: Colors.grey[200],
      inactiveTrackColor: Colors.grey[200],
      trackShape: RectangularSliderTrackShape(),
      trackHeight: 4.0,
      thumbColor: Colors.black,
      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
      overlayColor: Colors.red.withAlpha(32),
      overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
      ),
                      child:
                      Slider(
                        max:100.0,
                        value: readerController.volume, 
                      onChanged: (val){
                        readerController.volume=val;
                        setState(() {
                        });
                      }
                      )
                  )),
                ],
        ),
          )),
      ),
    );
  }
}

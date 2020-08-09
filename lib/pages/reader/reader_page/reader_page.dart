import 'package:flutter/material.dart';
import 'package:scroll_book/menu_bars/menu_bars.dart';
import 'components/crousel_test.dart';

import 'package:scroll_book/state/state.dart';
import 'package:scroll_book/utils/fonts.dart';
import 'components/top_menu_bar.dart';


class ReaderPage extends StatefulWidget {
  @override
  _ReaderPageState createState() => _ReaderPageState();
}

class _ReaderPageState extends State<ReaderPage> {
  bool playing = true;
  bool isSpeedShown = false, isFontMenuShown = false;

  @override
  Widget build(BuildContext context) {
    var libState = locator<LibState>();
    return Scaffold(
      body: Stack(children: [
        VerticalSliderDemo(),
        TopMenuBar(),
        BottomBar(
          children: [
            IconButton(icon: Icon(Icons.text_format), onPressed: null),
          
IconButton(
                    iconSize: 80,
                    icon: Icon(
                      libState.isPlaying?Icons.pause_circle_outline:
                      Icons.play_circle_outline),
                    onPressed: () {
                      libState.isPlaying?libState.pause():libState.play();
                      setState(() {});
                    }),
                
          
            GestureDetector(
              onTap:() {
                  setState(() {
                    isSpeedShown = !isSpeedShown;
                  });
                },
              child: Container(
                height: 80,
                width: 80,
                child: Center(child: Text("2x", style: TextStyle(fontSize:26, fontWeight: FontWeight.bold),)),
              ),
            )
          ],
        ),
       isSpeedShown?_speedMenu():SizedBox(),

        Align(
  alignment: Alignment.bottomCenter,
  child:   Padding(
    padding:EdgeInsets.only(bottom:100.0),
    child: Container(height: 70, color: Colors.grey[300].withOpacity(0.9),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children:[
        SizedBox(width:15),
         new DropdownButton<String>(
    items: getGoogleFonts.keys.map((String value) {
      return new DropdownMenuItem<String>(
        value: value,
        child: new Text(value),
      );
    }).toList(),
    value: libState.fontFam,
    onChanged: (val) {
      setState(() {
        libState.fontFam= val;
      });
    }
    ),
    Center(child: IconButton(icon: Icon(Icons.minimize), onPressed: (){
     if(libState.fontSize>8){
       setState(() {
         libState.fontSize-=1;
    });
     }

    })),
  IconButton(icon: Icon(Icons.add), onPressed: (){
    setState(() {
      libState.fontSize+=1;
    });
  }),
  
      ])),
  )),
      ]),
    );
  }

  Widget _speedMenu()=> Positioned(
            bottom: 80.0,
            right: 30.0,
            child: Container(
              height: 160.0,
              width: 70.0,
              decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey[300]),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[200].withOpacity(0.5),
                  spreadRadius: 5,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(height: 5,),
                Text("2x", style: TextStyle(fontWeight:FontWeight.w700),),
                Divider(),
                Text("1.5x"),
                Divider(),
                Text("1x"),
                Divider(),
                Text("0.5x"),
                 SizedBox(height: 5,),
              ]),
            ));
}

// Container(
//           padding: EdgeInsets.all(30.0),
//           height: double.infinity,
//           width: double.infinity,
//           child:

//         Align(
//   alignment: Alignment.bottomCenter,
//   child:   Container(height: 100, color: Colors.grey.withOpacity(0.9),
//   child: Row(
//     children:[
//        new DropdownButton<String>(
//   items: getGoogleFonts.keys.map((String value) {
//     return new DropdownMenuItem<String>(
//       value: value,
//       child: new Text(value),
//     );
//   }).toList(),
//   value: fontFam,
//   onChanged: (val) {
//     setState(() {
//       fontFam= val;
//     });
//   }
//   ),]))

// ),

// FloatingActionButton(
//           onPressed: (){

//           },
//           tooltip: 'Start',
//           child: Icon(playing?Icons.pause_circle_outline:Icons.play_arrow,),
//         ),
        //TextScrollWidget(),
       // getVersion(),
        //TextSwipeWidget(),


// Widget getVersion(){
//   switch (v) {
//     case TestVersion.Carousel:
//       return VerticalSliderDemo();
//       break;
//     case TestVersion.Swipe:
//       return TextSwipeWidget();
//       break;
//     default: 
//       return TextScrollWidget();
//   }
// }

import 'package:flutter/material.dart';
import 'package:scroll_book/mobile/pages/reader_page/components/text_scroll_widget.dart';
import 'package:scroll_book/mobile/menu_bars/bottom_bar.dart';
import 'package:scroll_book/mobile/menu_bars/menu_button.dart';
import 'package:scroll_book/state/state.dart';
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
    var appState = locator<AppState>();
    return Scaffold(
      body: Stack(children: [
        TextScrollWidget(),
        TopMenuBar(),
        BottomBar(
          children: [
            IconButton(icon: Icon(Icons.font_download), onPressed: null),
            Image.asset("assets/icons/back5.png"),
            appState.isPlaying
                ? MenuButton(
                    asset: "pause",
                    h: 80,
                    w: 80,
                    onPressed: () {
                      appState.pause();
                      setState(() {});
                    })
                : MenuButton(
                    asset: "play",
                    h: 80,
                    w: 80,
                    onPressed: () {
                      appState.play();
                      setState(() {});
                    }),
            Image.asset("assets/icons/forward5.png"),
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
       isSpeedShown?_speedMenu():SizedBox()
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

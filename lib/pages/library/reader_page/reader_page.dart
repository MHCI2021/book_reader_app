import 'package:flutter/material.dart';
import 'package:scroll_book/menu_bars/menu_bars.dart';
import 'package:scroll_book/models/library_book_model.dart';
import 'package:scroll_book/shared_components/shared_components.dart';
import 'package:scroll_book/state/state.dart';

class ReaderPage extends StatefulWidget {
  final int currentSentence;
  final LibraryBook book;
  final Function(LibraryBook) toBookView;

  const ReaderPage({
    Key key, 
    this.currentSentence=50, 
    this.book, 
    @required this.toBookView
  }) : super(key: key);
  @override
  _ReaderPageState createState() => _ReaderPageState();
}

class _ReaderPageState extends State<ReaderPage> {
  bool playing = true, isSpeedShown = false, isFontMenuShown = false;
  ReaderController readerController;

@override
  void initState() {
    super.initState();
     readerController= locator<ReaderController>();
     readerController.init(sentenceStart: widget.currentSentence);
  }

  @override
  Widget build(BuildContext context) {
   Size s = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(children: [
        Scaffold(
      body: Center(
        child: Container(
          color: Colors.grey[200],
          height: s.height,
          child: CarouselSlider(
            options: 
            CarouselOptions(//aspectRatio: 1.5,
              viewportFraction: 0.15,
              enlargeCenterPage: false,
               enableInfiniteScroll: false,
              scrollDirection: Axis.vertical,
              autoPlay: true,
              initialPage: readerController.currentIndex
            ),
            items:readerController.textBlocks,
          )
        ),
      ),
    ),
        _topMenuBar(),
        BottomBar(
          children: [
            IconButton(icon: Icon(Icons.text_format), onPressed: null),
            IconButton(
                iconSize: 80,
                icon: Icon(readerController.isPlaying
                    ? Icons.pause_circle_outline
                    : Icons.play_circle_outline),
                onPressed: () {
                  readerController.isPlaying ? 
                  readerController.pause() : 
                  readerController.play();
                  setState(() {});
                }),
            GestureDetector(
              onTap: () {
                setState(() { isSpeedShown = !isSpeedShown;});
              },
              child: Container(
                height: 80,
                width: 80,
                child: Center(
                    child: Text("2x",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                )),
              ),
            )
          ],
        ),
        isSpeedShown ? _speedMenu() : SizedBox(),
     
      ]),
    );
  }

  Widget _speedMenu() => Positioned(
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
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          SizedBox( height: 5,),
          Text("2x",style: TextStyle(fontWeight: FontWeight.w700),),
          Divider(),Text("1.5x"),Divider(),
          Text("1x"),Divider(),Text("0.5x"),SizedBox(height: 5,),
        ]),
      ));


      Widget _topMenuBar()=>GradientContainer(
        width: double.infinity,
        height: 60.0,
        begin:
            GradientInfo(color: Colors.white, alignment: Alignment.topCenter),
        middleColors: [
          Colors.white.withOpacity(0.95),
        ],
        end: GradientInfo(
          color: Colors.white.withOpacity(0.9),
          alignment: Alignment.bottomCenter,
        ),
        child: ListTile(
            leading: IconButton(
             iconSize: 40,
              icon: Icon(Icons.arrow_back),
              onPressed: (){
                readerController.pause();
                widget.toBookView(widget.book);
              },
            ),
            trailing: IconButton(
             iconSize: 40,
              icon: Icon(Icons.more_horiz),
              onPressed: () {},
            ),
            title: Text(widget.book.bookInfo.title,
                style: Theme.of(context).textTheme.headline2)));
}


  //  Align(
  //           alignment: Alignment.bottomCenter,
  //           child: Padding(
  //             padding: EdgeInsets.only(bottom: 100.0),
  //             child: Container(
  //                 height: 70,
  //                 color: Colors.grey[300].withOpacity(0.9),
  //                 child: Row(
  //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                     children: [
  //                       SizedBox(width: 15),
  //                       new DropdownButton<String>(
  //                           items: getGoogleFonts.keys.map((String value) {
  //                             return new DropdownMenuItem<String>(
  //                               value: value,
  //                               child: new Text(value),
  //                             );
  //                           }).toList(),
  //                           value: readerController.fontFam,
  //                           onChanged: (val) {
  //                             setState(() { readerController.fontFam = val; });}),
  //                       Center(
  //                           child: IconButton(
  //                               icon: Icon(Icons.minimize),
  //                               onPressed: () {
  //                                 if (readerController.fontSize > 8) {
  //                                   setState(() {
  //                                     readerController.fontSize -= 1;
  //                                   });
  //                                 }
  //                               })),
  //                       IconButton(
  //                           icon: Icon(Icons.add),
  //                           onPressed: () {
  //                             setState(() {readerController.fontSize += 1;});
  //                           }),
  //                     ])),
  //           )),
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

import 'package:flutter/material.dart';
import 'package:scroll_book/models/library_book_model.dart';
import 'package:scroll_book/pages/library/reader_page/components/time_indicator.dart';
import 'package:scroll_book/pages/library/reader_page/new_note.dart';
import 'package:scroll_book/shared_components/shared_components.dart';
import 'package:scroll_book/state/state.dart';
import 'package:scroll_book/utils/fonts.dart';

class ReaderPage extends StatefulWidget {
  final int currentSentence;
  final LibraryBook book;
  final Function(LibraryBook) toBookView;

  const ReaderPage(
      {Key key,
      this.currentSentence = 50,
      this.book,
      @required this.toBookView})
      : super(key: key);
  @override
  _ReaderPageState createState() => _ReaderPageState();
}

class _ReaderPageState extends State<ReaderPage> {
  bool playing = true,
      menuShown = false,
      pagesOpen = false,
      chapterOpen = false,
      fontOverlayOpen = false,
      volumeOpen = false;
  //isSpeedShown = false, isFontMenuShown = false;
  ReaderController readerController;

  @override
  void initState() {
    super.initState();
    readerController = locator<ReaderController>();
    readerController.init(sentenceStart: widget.currentSentence);
  }

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          leading:
              // GestureDetector(
              //           child: Container(
              //             height: 40.0,
              //             width: 40.0,
              //             child: Image.asset("assets/icons/Back Arrow.png")),
              //           onTap: (){
              //             readerController.pause();
              //         widget.toBookView(widget.book);
              //           }
              //           ),
              IconButton(
            iconSize: 30,
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              readerController.pause();
              widget.toBookView(widget.book);
            },
          ),
          title: Text(widget.book.bookInfo.title,
              style: Theme.of(context).textTheme.headline2),
          actions: [
            IconButton(
              iconSize: 30,
              icon: Icon(
                Icons.bookmark_border,
                color: Colors.black,
              ),
              onPressed: () {
                // setState(() {
                //   menuShown=!menuShown;
                // });
              },
            ),
            IconButton(
              iconSize: 30,
              icon: Icon(
                Icons.more_horiz,
                color: Colors.black,
              ),
              onPressed: () {
                setState(() {
                  menuShown = !menuShown;
                });
              },
            ),
          ]),
      body: Stack(children: [
        Container(
          height: s.height - 200,
          child: Scaffold(
            floatingActionButton: FloatingActionButton(
                child: Icon(Icons.add_circle_outline),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EditorPage(
                                currentBlock: readerController
                                    .textBlocks[readerController.currentIndex],
                              )));
                }),
            body: Center(
              child: Container(
                  color: Colors.grey[200],
                  height: s.height,
                  child: CarouselSlider(
                    options: CarouselOptions(
                        //aspectRatio: 1.5,
                        viewportFraction: 0.15,
                        enlargeCenterPage: false,
                        enableInfiniteScroll: false,
                        scrollDirection: Axis.vertical,
                        autoPlay: true,
                        initialPage: readerController.currentIndex),
                    items: readerController.textBlocks,
                  )),
            ),
          ),
        ),
        Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.white,
              height: 150.0,
              width: double.infinity,
              child: Column(children: [
                SizedBox(height: 15.0),
                Container(
                  width: s.width - 40,
                  height: 32,
                  //color:Colors.pink,
                  child: TimeBar(
                    totalTime: 200,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  child: Container(
                    height: 70,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          GestureDetector(
                              child: Container(
                                  height: 40.0,
                                  width: 40.0,
                                  child: Image.asset(
                                      "assets/icons/Font_Icon.png")),
                              onTap: () {
                                // readerController.setOverlay(ReaderOverlay.Font);
                                setState(() {
                                  fontOverlayOpen = !fontOverlayOpen;
                                });
                              }),
                          GestureDetector(
                              child: Container(
                                  height: 40.0,
                                  width: 40.0,
                                  child: Image.asset(
                                      "assets/icons/15-Seconds-Back_Icon.png")),
                              onTap: () {}),
                          GestureDetector(
                              child: Container(
                                height: 60.0,
                                width: 60.0,
                                child: Image.asset(
                                  readerController.isPlaying
                                      ? "assets/icons/Pause_Icon.png"
                                      : "assets/icons/Play_Icon.png",
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                              onTap: () {
                                readerController.isPlaying
                                    ? readerController.pause()
                                    : readerController.play();
                                setState(() {});
                              }),
                          GestureDetector(
                              child: Container(
                                  height: 40.0,
                                  width: 40.0,
                                  child: Image.asset(
                                      "assets/icons/15-Seconds-Forward_Icon.png")),
                              onTap: () {}),
                          IconButton(
                              icon: Icon(Icons.volume_down),
                              onPressed: () {
                                // readerController.setOverlay(ReaderOverlay.VolSpeed);
                                setState(() {
                                  volumeOpen = true;
                                });
                              }),
                        ]),
                  ),
                )
              ]),
            )),
        _pages(s),
        // _getOverlay(),
        fontSelection(s),
        _volumeOverlay(s),
        menuShown ? menuOptions() : SizedBox()
      ]),
    );
  }

  Widget _pages(Size s) {
    return AnimatedPositioned(
      height: s.height - 200,
      width: s.width,
      left: pagesOpen ? 0 : s.width,
      duration: Duration(milliseconds: 200),
      child: Container(
        height: s.height - 200,
        width: s.width,
        color: Colors.blue,
        child: Stack(
          children: [
            Positioned(
                bottom: 20,
                height: 100.0,
                left: 30,
                width: 150,
                child: Container(
                  color: Colors.green,
                ))
          ],
        ),
      ),
    );
  }

  Widget menuOptions() => Align(
        alignment: Alignment.topRight,
        child: Padding(
          padding: EdgeInsets.only(top: 0.0, right: 20.0),
          child: Container(
            height: 70,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey[300]),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[200].withOpacity(0.5),
                  spreadRadius: 5,
                  //  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                      onTap: () {},
                      //widget.onRemoveClicked(widget.book),
                      child: Text("See Chapters")),
                  Divider(),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          pagesOpen = !pagesOpen;
                        });
                      },
                      //widget.onShareClicked(widget.book),
                      child: Text("See Pages")),
                  SizedBox(
                    height: 5,
                  ),
                ]),
          ),
        ),
      );

  Widget fontSelection(Size s) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 500),
      height: 150.0,
      width: s.width,
      bottom: fontOverlayOpen ? 0 : -150,
      child: Container(
          height: 150,
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      fontOverlayOpen = false;
                    });
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
                      readerController.setFontFam(val);
                      
                      setState(() {});
                     
                      
                    }),
                Row(
                  children: [
                    Container(
                        height: 20.0,
                        width: 20.0,
                        child: Image.asset("assets/icons/Font_Icon.png")),
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
                    Container(
                        height: 50.0,
                        width: 50.0,
                        child: Image.asset("assets/icons/Font_Icon.png")),
                  ],
                ),
              ])),
    );
  }

  Widget _volumeOverlay(Size s) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 500),
      height: 150.0,
      width: s.width,
      bottom: volumeOpen ? 0 : -150,
      child: Container(
        height: 150,
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 30.0),
        child: Center(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 50.0),
          child: Column(
            //  mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    volumeOpen = false;
                  });
                },
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Container(width: 200, height: 5, color: Colors.grey),
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(child: Text("0.5x", style: readerController.speed==0.5?TextStyle(fontWeight:FontWeight.bold):null,), onTap: (){
                        readerController.setSpeed(0.5);
                        setState(() {});
                      },),
                      GestureDetector(child: Text("0.75x", style: readerController.speed==0.75?TextStyle(fontWeight:FontWeight.bold):null,),onTap: (){
                         readerController.setSpeed(0.75);
                         setState(() {});
                      },),
                      GestureDetector(child: Text("1.0x", style: readerController.speed==1.0?TextStyle(fontWeight:FontWeight.bold):null,),onTap: (){
                         readerController.setSpeed(1.0);
                         setState(() {});
                      },),
                      GestureDetector(child: Text("1.5x", style: readerController.speed==1.5?TextStyle(fontWeight:FontWeight.bold):null,),onTap: (){
                         readerController.setSpeed(1.5);
                         setState(() {});
                      },),
                      GestureDetector(child: Text("2.0x", style: readerController.speed==2.0?TextStyle(fontWeight:FontWeight.bold):null,),onTap: (){
                         readerController.setSpeed(2.0);
                         setState(() { });
                      },),
                    ]),
              ),
              SizedBox(height: 20.0),
              Container(
                  width: double.infinity,
                  height: 20,
                  child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.grey[200],
                        inactiveTrackColor: Colors.grey[200],
                        trackShape: RectangularSliderTrackShape(),
                        trackHeight: 4.0,
                        thumbColor: Colors.black,
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 12.0),
                        overlayColor: Colors.red.withAlpha(32),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 28.0),
                      ),
                      child: Slider(
                          max: 1.0,
                          value: readerController.volume,
                          onChanged: (val) {
                            readerController.setVolume(val);
                            setState(() {});
                          }))),
            ],
          ),
        )),
      ),
    );
  }
}

// Widget _getOverlay(){
//     switch (readerController.currentOverlay) {
//       case ReaderOverlay.VolSpeed:
//         return VolumeBar(
//           onClose: (){
//             readerController.closeOverlay();
//            setState(() {});
//           },
//         );
//         break;
//       case ReaderOverlay.Font:
//         return FontSelectorOverlay(
//          onClose: (){
//            print("HELLO");
//            readerController.closeOverlay();
//            setState(() {});
//          }
//        );
//         break;
//       default:
//       return SizedBox();
//     }
//   }

// Widget _topMenuBar()=>GradientContainer(
//   width: double.infinity,
//   height: 60.0,
//   begin:
//       GradientInfo(color: Colors.white, alignment: Alignment.topCenter),
//   middleColors: [
//     Colors.white.withOpacity(0.95),
//   ],
//   end: GradientInfo(
//     color: Colors.white.withOpacity(0.9),
//     alignment: Alignment.bottomCenter,
//   ),
//   child: ListTile(
//       leading: IconButton(
//        iconSize: 40,
//         icon: Icon(Icons.arrow_back),
//         onPressed: (){
//           readerController.pause();
//           widget.toBookView(widget.book);
//         },
//       ),
//       trailing: IconButton(
//        iconSize: 40,
//         icon: Icon(Icons.more_horiz),
//         onPressed: () {},
//       ),
//       title: Text(widget.book.bookInfo.title,
//           style: Theme.of(context).textTheme.headline2)));

//  Widget _timeBar(Size s)=>Align(
//     alignment: Alignment.bottomCenter,
//     child: Padding(padding: EdgeInsets.only(bottom:110),
//     child:Container(
//       width:s.width-40,
//       height:40,
//       //color:Colors.pink,
//       child:
//       TimeBar(totalTime: 200,),
//     )
//     ),

//     );
//   Widget _bottomMenuBar()=>Align(
//     alignment: Alignment.bottomCenter,

//     child: GradientContainer(
//           width: double.infinity,
//           height: 80.0,
//           begin:GradientInfo(color: Colors.white.withOpacity(0.9), alignment: Alignment.topCenter),
//           middleColors: [
//             Colors.white.withOpacity(0.95),
//           ],
//           end: GradientInfo(
//             color: Colors.white,
//             alignment: Alignment.bottomCenter,
//           ),
//           child:Padding(
//             padding: EdgeInsets.only(bottom:40.0, left:30, right:30),
//             child: Container(
//               height: 40,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children:[
//                     IconButton(
//                     icon: Icon(FontAwesome.font),
//                     onPressed: (){
//                       readerController.setOverlay(ReaderOverlay.Font);
//                       setState(() {});
//                     }
//                   ),
//                   IconButton(icon: Icon(FontAwesome.undo), onPressed: (){

//                   }),
//                 SizedBox(width:100),
//                 IconButton(icon: Icon(FontAwesome.refresh), onPressed: (){}),
//                   IconButton(
//                     icon: Icon(Icons.volume_down),
//                     onPressed: (){
//                       readerController.setOverlay(ReaderOverlay.VolSpeed);
//                       setState(() {});
//                     }
//                   )
//                 ]
//     ),
//             ),
//           )),
//   );

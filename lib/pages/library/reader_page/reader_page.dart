import 'package:flutter/material.dart';
import 'package:scroll_book/models/library_book_model.dart';
import 'package:scroll_book/pages/library/reader_page/components/time_indicator.dart';
import 'package:scroll_book/pages/library/reader_page/new_note.dart';
import 'package:scroll_book/shared_components/shared_components.dart';
import 'package:scroll_book/state/state.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'overlays/bottom/font_selection_overlay.dart';
import 'overlays/bottom/volume_speed_overlay.dart';
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
      appBar: AppBar(
        leading: IconButton(
             iconSize: 40,
              icon: Icon(Icons.arrow_back),
              onPressed: (){
                readerController.pause();
                widget.toBookView(widget.book);
              },
            ),
            title: Text(widget.book.bookInfo.title,
                style: Theme.of(context).textTheme.headline2),
            actions:[ 
              IconButton(
             iconSize: 40,
              icon: Icon(Icons.more_horiz),
              onPressed: () {},
            ),
            ]),

      body: Stack(children: [
        Container(
          height: s.height-200,
          child: Scaffold(

      floatingActionButton: FloatingActionButton(
       
          child: Icon(Icons.add_circle_outline),
          onPressed: (){
            Navigator.push(context,
        MaterialPageRoute(builder: (context) => EditorPage(
          currentBlock: readerController.textBlocks[ readerController.currentIndex],
        )));
          }),
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
        ),
    Align(
    alignment: Alignment.bottomCenter,
    child:Container(
      color:Colors.white,
      height: 150.0,
      width: double.infinity,
      child: Column(
        children:[
          Container(
      width:s.width-40,
      height:40,
      //color:Colors.pink,
      child: 
      TimeBar(totalTime: 200,),
    ),
    Padding(
            padding: EdgeInsets.only(bottom:40.0, left:30, right:30),
            child: Container(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children:[
                    IconButton(
                    icon: Icon(FontAwesome.font), 
                    onPressed: (){
                      readerController.setOverlay(ReaderOverlay.Font);
                      setState(() {});
                    }
                  ),
                  IconButton(icon: Icon(FontAwesome.undo), onPressed: (){
                  
                  }),
              GestureDetector(
                        
                            child: Icon(readerController.isPlaying
                                ? Icons.pause_circle_outline
                                : Icons.play_circle_outline,  size: 70,),
                            onTap: () {
                              print("Play");
                              readerController.isPlaying ? 
                              readerController.pause() : 
                              readerController.play();
                              setState(() {});
                            }),
                IconButton(icon: Icon(FontAwesome.refresh), onPressed: (){}),
                  IconButton(
                    icon: Icon(Icons.volume_down), 
                    onPressed: (){
                      readerController.setOverlay(ReaderOverlay.VolSpeed);
                      setState(() {

                      });
                    }
                  )
                ]
    ),
            ),
          )
        ]
      ),
      )
    ),
       // _topMenuBar(),
       //_bottomMenuBar(),
      // _playButton(),
      // _timeBar(s),
       _getOverlay()
       
     //  
      ]),
    );
  }

  Widget _getOverlay(){
    switch (readerController.currentOverlay) {
      case ReaderOverlay.VolSpeed:
        return VolumeBar(
          onClose: (){
            readerController.closeOverlay();
           setState(() {});
          },
        );
        break;
      case ReaderOverlay.Font:
        return FontSelectorOverlay(
         onClose: (){
           print("HELLO");
           readerController.closeOverlay();
           setState(() {});
         }
       );
        break;
      default:
      return SizedBox();
    }
  }
  Widget _timeBar(Size s)=>Align(
    alignment: Alignment.bottomCenter,
    child: Padding(padding: EdgeInsets.only(bottom:110),
    child:Container(
      width:s.width-40,
      height:40,
      //color:Colors.pink,
      child: 
      TimeBar(totalTime: 200,),
    )
    ),
    
    );
  Widget _bottomMenuBar()=>Align(
    alignment: Alignment.bottomCenter,

    child: GradientContainer(
          width: double.infinity,
          height: 80.0,
          begin:GradientInfo(color: Colors.white.withOpacity(0.9), alignment: Alignment.topCenter),
          middleColors: [
            Colors.white.withOpacity(0.95),
          ],
          end: GradientInfo(
            color: Colors.white,
            alignment: Alignment.bottomCenter,
          ),
          child:Padding(
            padding: EdgeInsets.only(bottom:40.0, left:30, right:30),
            child: Container(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children:[
                    IconButton(
                    icon: Icon(FontAwesome.font), 
                    onPressed: (){
                      readerController.setOverlay(ReaderOverlay.Font);
                      setState(() {});
                    }
                  ),
                  IconButton(icon: Icon(FontAwesome.undo), onPressed: (){
                    
                  }),
                SizedBox(width:100),
                IconButton(icon: Icon(FontAwesome.refresh), onPressed: (){}),
                  IconButton(
                    icon: Icon(Icons.volume_down), 
                    onPressed: (){
                      readerController.setOverlay(ReaderOverlay.VolSpeed);
                      setState(() {});
                    }
                  )
                ]
    ),
            ),
          )),
  );

  _playButton()=>  Align(
    alignment: Alignment.bottomCenter,
    child: Padding(
      padding:  EdgeInsets.only(bottom:30.0),
      child: IconButton(
                    iconSize: 70,
                    icon: Icon(readerController.isPlaying
                        ? Icons.pause_circle_outline
                        : Icons.play_circle_outline),
                    onPressed: () {
                      readerController.isPlaying ? 
                      readerController.pause() : 
                      readerController.play();
                      setState(() {});
                    }),
    ),
  );
  
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
}

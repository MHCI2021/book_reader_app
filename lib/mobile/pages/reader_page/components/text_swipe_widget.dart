import 'dart:async';

import 'package:flutter/material.dart';
import 'package:scroll_book/state/app_state.dart';
import 'package:scroll_book/state/state.dart';

class TextSwipeWidget extends StatefulWidget {
  final Duration animationDuration;
  TextSwipeWidget({
    this.animationDuration = const Duration(milliseconds: 5000),
  });

  @override
  _TextSwipeWidgetState createState() => _TextSwipeWidgetState();
}

class _TextSwipeWidgetState extends State<TextSwipeWidget>
    with TickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;
  double startScroll = 0, speed = 80, currentScroll = 0;
  int currentBlock = 0, blocksPer500px = 20;
  double blockheight=50.0;
  List<String> blocks = [];
  final ScrollController _scrollController = ScrollController();
  bool isPlaying = false;
  Timer _timer;
  AppState appState;
  List<int> shownBlocks = [];

  @override
  void initState() {
    super.initState();
    appState = locator<AppState>();
    blocks = appState.getTextBlocks();
    shownBlocks = List.generate(blocks.length, (index) => index).toList();
    currentBlock = appState.currentBook.chapterSentenceNum;
    _timer = Timer.periodic(Duration(seconds: 2), (Timer t) {
      if (currentBlock < blocks.length - 1 && appState.isPlaying){
         setState(() {  currentBlock += 1;});
        _scrollController.animateTo(currentBlock*blockheight-200, duration: Duration(milliseconds:500), curve: Curves.easeIn);
     
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: ListView(
        controller: _scrollController,
        children: 
        [
          Container(height:100),
          ...shownBlocks.map((index)=> Container(
            height: blockheight,
            child: Row(
              children: [
                Container(height: 15,width: 15,decoration: currentBlock==index?BoxDecoration(shape:BoxShape.circle, color: Colors.redAccent):null,),
                SizedBox(width: 5.0,),
                Expanded(child: Text(blocks[index], style: TextStyle(color:index>currentBlock?Colors.grey:Colors.black ),)),
              ]
       ) )).toList()
        ]
      )
    );
  }

  String padTop(String text, int lines) => "\n" * lines + text;
}



        // setState(() {
        //   currentBlock += 1;
        //   print(currentBlock);
        // });

  // appState.addListener(() {
  //     if(appState.isPlaying!=isPlaying){
  //       isPlaying=appState.isPlaying;
  //       if(isPlaying)controller.forward();
  //       else controller.stop();
  //     }
  //   });
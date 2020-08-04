import 'dart:async';

import 'package:flutter/material.dart';
import 'package:scroll_book/mobile/pages/reader_page/block_highlight_widget.dart';
import 'package:scroll_book/state/app_state.dart';
import 'package:scroll_book/state/state.dart';

class TextScrollWidget extends StatefulWidget {
  final Duration animationDuration;
  TextScrollWidget({
    this.animationDuration = const Duration(milliseconds: 5000),
  });

  @override
  _TextScrollWidgetState createState() => _TextScrollWidgetState();
}

class _TextScrollWidgetState extends State<TextScrollWidget>
    with TickerProviderStateMixin {
  double startScroll = 0, speed = 80, currentScroll = 0;
  int currentBlock = 0, blocksPer500px = 20;
  List<String> blocks = [];
  final ScrollController _scrollController = ScrollController();

  bool isPlaying = false;
  List<String> textBlocks = [];
  Timer _timer;
  AppState appState;

  @override
  void initState() {
    super.initState();
    appState = locator<AppState>();
     blocks =test.replaceAll("\n", "").split("&&");
      _timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
        if (currentBlock < blocks.length-1 && appState.isPlaying)
              setState(() {
                currentBlock += 1;
                print(currentBlock);
              });
          });
  }

  scroll() async {
    if (_scrollController.hasClients) {
      if (currentBlock < blocks.length && appState.isPlaying )
        await _scrollController.animateTo(_scrollController.offset + 100,
            duration: widget.animationDuration, curve: Curves.linear);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    scroll();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: SingleChildScrollView(
        child: BlockHighlightWidget(
          textStyle: appState.currentTextStyle,
          blocks: blocks,
          currentBlock: currentBlock,
        ),
        scrollDirection: Axis.vertical,
        controller: _scrollController,
      ),
    );
  }
  String padTop(String text, int lines) => "\n" * lines + text;
}




// appState.addListener(() {
//       if (appState.isPlaying != isPlaying) {
//         isPlaying = appState.isPlaying;
//         if (isPlaying)
        
//         else  _timer.cancel();}
//     });

// text: "\n" * 10 + appState.currentBook.text,
//               fontFam: appState.fontFam

//  else {
//     startScroll += speed;
//     //controller.forward(from: 0.0);
//  }

//     AnimationController(duration: widget.animationDuration, vsync: this);
// animation = Tween<double>(begin: 0, end: 1).animate(
//   controller,
// );
// ..addListener(() {// setState(() {currentScroll=animation.value*speed+startScroll;});
//   })
// ..addStatusListener((status) {
//   if (status == AnimationStatus.completed) {
//     startScroll += speed;
//     controller.forward(from: 0.0);
//   }
// });
//while (true) {
// scroll() async {
//   if (_scrollController.hasClients) {
//     _scrollController.jumpTo(animation.value * speed + startScroll);
//   }
// }
//controller.forward();
//controller.stop();
//AnimationController controller;
//Animation<double> animation;

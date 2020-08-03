import 'package:flutter/material.dart';
import 'package:scroll_book/state/app_state.dart';
import 'package:scroll_book/state/state.dart';
import 'package:scroll_book/utils/text_builder.dart';

    
class TextScrollWidget extends StatefulWidget {
  final Duration animationDuration; 
  TextScrollWidget({
    this.animationDuration = const Duration(milliseconds: 5000),
  });

  @override
  _TextScrollWidgetState createState() => _TextScrollWidgetState();
}

class _TextScrollWidgetState extends State<TextScrollWidget> with TickerProviderStateMixin {
  double highlightStart = 0, startScroll = 0, speed = 80;
  int  highlightSpan = 50;
  final ScrollController _scrollController = ScrollController();
  AnimationController controller;
  Animation<double> animation;
  bool isPlaying=false;
  
  AppState appState;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: widget.animationDuration, vsync: this);
    animation = Tween<double>(begin: 0, end: 1).animate(
      controller,
    )
      ..addListener(() { setState(() {});})
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          startScroll += speed;
          controller.forward(from: 0.0);
        }
      });
      appState = locator<AppState>();
      appState.addListener(() {
        if(appState.isPlaying!=isPlaying){
          isPlaying=appState.isPlaying;
          if(isPlaying)controller.forward();
          else controller.stop();
        
        }
      });
  }

  scroll() async {
    if (_scrollController.hasClients) {
      highlightStart += 0.7;
      _scrollController.jumpTo(animation.value * speed + startScroll);
    }
  }

  @override
  Widget build(BuildContext context) {
    scroll();

    return  Padding(
        padding: EdgeInsets.symmetric(horizontal:30.0),
        child: SingleChildScrollView(
          child: CustomRichText(
            text: appState.getText(),
           // padTop(appState.currentBook.previewText, 10),
            highlightSpan: highlightSpan,
            highlightStart: highlightStart.round(),
            fontFam: appState.fontFam,
          ),
          scrollDirection: Axis.vertical,
          controller: _scrollController,
        ),
      
    );
  }

  String padTop(String text, int lines)=>"\n" * lines + text;
}


  // text: "\n" * 10 + appState.currentBook.text,
  //               fontFam: appState.fontFam

import 'package:flutter/material.dart';
import 'package:scroll_book/mobile/route_transitions.dart';
import 'package:scroll_book/mobile/menu_bars/menu_button.dart';
import 'package:scroll_book/state/state.dart';

class TopMenuBar extends StatelessWidget {
  const TopMenuBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appState = locator<AppState>();
    double height=70;
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white,
                Colors.white.withOpacity(0.9),
                Colors.white.withOpacity(0.8),
              ]),
        ),
        height: 100.0,
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MenuButton(
                asset: "back",
                h: height,w:height, onPressed: ()=>Navigator.of(context).push(readerToPreviewRoute()),), 
              Expanded(
                  child: Center(
                      child: Text(appState.currentBook.title,
                      style: Theme.of(context).textTheme.headline2))),
               MenuButton(
                asset: "show-more",
                h: height,w:height, onPressed: (){},),
             
            ],
          ),
        ));
  }
}






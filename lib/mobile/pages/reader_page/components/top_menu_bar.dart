import 'package:flutter/material.dart';
import 'package:scroll_book/mobile/route_transitions.dart';
import 'package:scroll_book/mobile/menu_bars/menu_button.dart';
import 'package:scroll_book/mobile/shared_components/gradient_container.dart';
import 'package:scroll_book/state/state.dart';

class TopMenuBar extends StatelessWidget {
  const TopMenuBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appState = locator<AppState>();
    double height = 70;
    return GradientContainer(
        width: double.infinity,
        height: 100.0,
        begin:
            GradientInfo(color: Colors.white, alignment: Alignment.topCenter),
        middleColors: [
          Colors.white.withOpacity(0.9),
        ],
        end: GradientInfo(
          color: Colors.white.withOpacity(0.8),
          alignment: Alignment.bottomCenter,
        ),
        child: ListTile(
            leading: MenuButton(
              asset: "back",
              h: height,
              w: height,
              onPressed: () =>
                  Navigator.of(context).push(readerToPreviewRoute()),
            ),
            trailing: MenuButton(
              asset: "show-more",
              h: height,
              w: height,
              onPressed: () {},
            ),
            title: Text(appState.currentBook.bookInfo.title,
                style: Theme.of(context).textTheme.headline2)));
  }
}

// Padding(
//           padding:  EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               MenuButton(
//                 asset: "back",
//                 h: height,w:height, onPressed: ()=>Navigator.of(context).push(readerToPreviewRoute()),),
//               Expanded(
//                   child: Center(
//                       child: Text(appState.currentBook.title,
//                       style: Theme.of(context).textTheme.headline2))),
//                MenuButton(
//                 asset: "show-more",
//                 h: height,w:height, onPressed: (){},),

//             ],
//           ),
//         ),

// Container(

//     decoration: BoxDecoration(
//       gradient: LinearGradient(
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//           colors: [
//             Colors.white,
//             Colors.white.withOpacity(0.9),
//             Colors.white.withOpacity(0.8),
//           ]),
//     ),

//     child: Padding(
//       padding:  EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           MenuButton(
//             asset: "back",
//             h: height,w:height, onPressed: ()=>Navigator.of(context).push(readerToPreviewRoute()),),
//           Expanded(
//               child: Center(
//                   child: Text(appState.currentBook.title,
//                   style: Theme.of(context).textTheme.headline2))),
//            MenuButton(
//             asset: "show-more",
//             h: height,w:height, onPressed: (){},),

//         ],
//       ),
//     ));

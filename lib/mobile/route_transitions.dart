
import 'package:flutter/material.dart';
import 'package:scroll_book/mobile/pages/library/library_list_view.dart';
import 'package:scroll_book/mobile/pages/library/library_scroll_view.dart';
import 'package:scroll_book/mobile/pages/reader_page/reader_page.dart';
// TODO finish create route function


enum Dir {LEFT, RIGHT, TOP, BOTTOM}
enum AnimType {MoveIn, MoveOut, Push, SlideIn, SlideOut}


Route createRoute({@required Widget newScreen, Dir directionIn=Dir.LEFT, AnimType animType= AnimType.MoveIn}){
return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => newScreen,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.decelerate;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}



Route homeToReaderRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => ReaderPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.decelerate;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}




Route libToPreviewRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => LibraryScrollView(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.bounceInOut;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      
      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

Route previewToLibRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => LibraryListView(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(-1.0, 0.0);
      var end = Offset.zero;
      var curve = Curves.ease;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      
      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}




Route readerToPreviewRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => LibraryScrollView(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(-1.0, 0.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}


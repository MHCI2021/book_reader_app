import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scroll_book/pages/library/library_list_view/library_list_view.dart';

// import 'package:scroll_book/models/book.dart';
// import 'package:scroll_book/models/models.dart';
import 'package:scroll_book/state/state.dart';

import 'package:scroll_book/utils/custom_expansion_tile.dart' as custom;

///  [LibraryListView] is a list of a users books

class LibraryHome extends StatefulWidget {
  
  @override
  _LibraryHomeState createState() => _LibraryHomeState();
}

class _LibraryHomeState extends State<LibraryHome> {



  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    var appState = locator<AppState>();
    double paddingHor=30.0, paddingTop=30.0;
    return  Stack(
      children: [
        Positioned(
          height: s.height-paddingTop,
          width: s.width-2*paddingHor,
          left: paddingHor,
          top: paddingTop,
          child: LibraryListView()
        )
      ]
    );
  }
}
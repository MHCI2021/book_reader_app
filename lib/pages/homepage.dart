import 'package:flutter/material.dart';
import 'package:scroll_book/pages/library/library_home.dart';
import 'package:scroll_book/state/state.dart';

//import 'package:scroll_book/utils/custom_expansion_tile.dart' as custom;

import 'library/library_list_view.dart';
//https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1447560400l/27831864._SY475_.jpg
//"https://m.media-amazon.com/images/I/41P0vehqsRL.jpg",
//
///  [LibraryListView] is a list of a users books

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   int _currentIndex=1;
   final List<Widget> _children = [
        Container(color:Colors.grey),
        LibraryHome(),
        Container(color:Colors.blue),    
    ];

  void onTabTapped(int index) {
   setState(() {
     _currentIndex = index;
   });
 }

  @override
  Widget build(BuildContext context) {
   // Size s = MediaQuery.of(context).size;
  //  var appState= locator<AppState>();
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(
           icon: new Icon(Icons.store),
           title: new Text('Bookstore'),
         ),
         BottomNavigationBarItem(
           icon: new Icon(Icons.book),
           title: new Text('Library'),
         ),
         BottomNavigationBarItem(
           icon: Icon(Icons.person),
           title: Text('Profile')
         )
        ]),
        body: SafeArea(
        top: false,
        child: IndexedStack(
          index: _currentIndex,
          children: _children,
        ),
      ),
    );
  }
}

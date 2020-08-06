import 'package:flutter/material.dart';
import 'package:scroll_book/mobile/pages/library/book_tile.dart';
// import 'package:scroll_book/models/book.dart';
// import 'package:scroll_book/models/models.dart';
import 'package:scroll_book/state/state.dart';

import 'package:scroll_book/utils/custom_expansion_tile.dart' as custom;
//https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1447560400l/27831864._SY475_.jpg
//"https://m.media-amazon.com/images/I/41P0vehqsRL.jpg",
//
///  [LibraryListView] is a list of a users books

class LibraryListView extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    final TextStyle headerFont = Theme.of(context).textTheme.headline2;
    final TextStyle subHeaderFont = Theme.of(context).textTheme.headline3;
    var appState= locator<AppState>();
    
    final Size bookSize = Size(100, s.width - 60.0);

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 30.0, right: 30, top: 30.0),
        child: ListView(
          children: [
            ListTile(
              title: Text("Library",style: headerFont,),
              trailing:  Image.asset("assets/icons/profile.png"),
            ),
          custom.ExpansionTile(
            leading:(bool isExpanded)=> isExpanded? Icon(Icons.keyboard_arrow_up):Icon(Icons.keyboard_arrow_down),
            title: Text("In Progress",style: subHeaderFont,),
            trailing: SizedBox(),
            initiallyExpanded: true,
            children: appState.getInProgressBooks().map((e) => Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: BookListTile(size: bookSize, book: e),
                    ))
                .toList(),
          ),
          custom.ExpansionTile(
            leading:(bool isExpanded)=> isExpanded? Icon(Icons.keyboard_arrow_up):Icon(Icons.keyboard_arrow_down),
            title: Text("In Progress",style: subHeaderFont,),
            trailing: SizedBox(),
            initiallyExpanded: true,
            children:  appState.getToStartBooks().map((e) => Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: BookListTile(size: bookSize, book: e),
                    ))
                .toList(),
          ),

          ],
        ),
      ),
    );
  }
}

// final List<LibraryBook> inProgressBooks=[];
    // final List<LibraryBook> inUnstartedBooks=[];
 // Row(children: [
            //   Expanded(
            //       child: ),
             
            // ]),
  // List<Widget> _listSection({String title, List<LibraryBook> books}){
  //   return [
  //     Row(
  //                 children: [
  //                   Icon(Icons.keyboard_arrow_up),
  //                   Text(
  //                     "To Start",
  //                     style: subHeaderFont,
  //                   )
  //                 ],
  //               ),
  //               Divider(),
  //               //...appState.libBooks
  //               ...books.map((e) => Padding(
  //                         padding: EdgeInsets.symmetric(vertical: 8.0),
  //                         child: BookListTile(size: bookSize, book2: e),
  //                       ))
  //                   .toList(),
                
  //   ];
  // }


            // Row(
            //   children: [
            //     Icon(Icons.keyboard_arrow_up),
            //     Text(
            //       "In Progress",
            //       style: subHeaderFont,
            //     )
            //   ],
            // ),
            // Divider(),
            // //...appState.libBooks
            // ...books.map((e) => Padding(
            //           padding: EdgeInsets.symmetric(vertical: 8.0),
            //           child: BookListTile(size: bookSize, book2: e),
            //         ))
            //     .toList(),
            
            // Divider(),
            // //...appState.libBooks
            // ...books
            //     .map((e) => Padding(
            //           padding: EdgeInsets.symmetric(vertical: 8.0),
            //           child: BookListTile(size: bookSize,book2: e), //book: e),
            //         ))
            //     .toList(),
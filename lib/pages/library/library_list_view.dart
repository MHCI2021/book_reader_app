import 'package:flutter/material.dart';
import 'package:scroll_book/models/library_book_model.dart';

import 'package:scroll_book/utils/custom_expansion_tile.dart' as custom;

import 'library_list_book_tile.dart';
//https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1447560400l/27831864._SY475_.jpg
//"https://m.media-amazon.com/images/I/41P0vehqsRL.jpg",
//
///  [LibraryListView] is a list of a users books

class LibraryListView extends StatelessWidget {
  final Function(LibraryBook) toBookView;
  final List<LibraryBook> library;
  const LibraryListView(
      {Key key, @required this.toBookView, @required this.library})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    final TextStyle headerFont = Theme.of(context).textTheme.headline2;
    final TextStyle subHeaderFont = Theme.of(context).textTheme.headline3;
    final Size bookSize = Size(100, s.width - 60.0);

    return ListView(
      children: [
        ListTile(
          title: Text(
            "Library",
            style: headerFont,
          ),
        ),
        custom.ExpansionTile(
          leading: (bool isExpanded) => isExpanded
              ? Icon(Icons.keyboard_arrow_up)
              : Icon(Icons.keyboard_arrow_down),
          title: Text(
            "In Progress",
            style: subHeaderFont,
          ),
          trailing: SizedBox(),
          initiallyExpanded: true,
          children: library
              .where((element) => element.isStarted)
              .toList()
              .map((e) => Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: LibraryListBookTile(
                      size: bookSize,
                      book: e,
                      onSelected: () => toBookView(e),
                    ),
                  ))
              .toList(),
        ),
        custom.ExpansionTile(
          leading: (bool isExpanded) => isExpanded
              ? Icon(Icons.keyboard_arrow_up)
              : Icon(Icons.keyboard_arrow_down),
          title: Text(
            "Not Started",
            style: subHeaderFont,
          ),
          trailing: SizedBox(),
          initiallyExpanded: true,
          children: library
              .where((element) => !element.isStarted)
              .toList()
              .map((e) => Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: LibraryListBookTile(
                      size: bookSize,
                      book: e,
                      onSelected: () => toBookView(e),
                    ),
                  ))
              .toList(),
        ),
      ],
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
//               //...libState.libBooks
//               ...books.map((e) => Padding(
//                         padding: EdgeInsets.symmetric(vertical: 8.0),
//                         child: LibraryListBookTile(size: bookSize, book2: e),
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
// //...libState.libBooks
// ...books.map((e) => Padding(
//           padding: EdgeInsets.symmetric(vertical: 8.0),
//           child: LibraryListBookTile(size: bookSize, book2: e),
//         ))
//     .toList(),

// Divider(),
// //...libState.libBooks
// ...books
//     .map((e) => Padding(
//           padding: EdgeInsets.symmetric(vertical: 8.0),
//           child: LibraryListBookTile(size: bookSize,book2: e), //book: e),
//         ))
//     .toList(),

import 'package:flutter/material.dart';
import 'package:scroll_book/mobile/menu_bars/bottom_bar.dart';
import 'package:scroll_book/mobile/menu_bars/menu_button.dart';
import 'package:scroll_book/mobile/shared_components/gradient_container.dart';
import 'package:scroll_book/mobile/shared_components/percent_indicator.dart';
import 'package:scroll_book/models/sample_data/ruined_by_design.dart';
import 'package:scroll_book/state/app_state.dart';
import 'package:scroll_book/mobile/route_transitions.dart';
import 'package:scroll_book/state/service_locator.dart';

class LibraryScrollView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = locator<AppState>();
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(children: [
        GradientContainer(
          height: s.height * 0.45,
          begin: GradientInfo(
              color:appState.currentBook.bookInfo.color1,
              alignment: Alignment.topLeft),
          end: GradientInfo(
            color: appState.currentBook.bookInfo.color2,
            alignment: Alignment.bottomRight,
          ),
        ),
        TopMenuBar(),
        Positioned(
            left: 0.0,
            top: s.height * 0.1,
            height: s.height * 0.9,
            width: s.width,
            child: Container(
              child: Column(children: [
                Container(
                  width: s.width / 2,
                  height: 1.5 * s.width / 2,
                  child: Image.network(
                    appState.currentBook.bookInfo.imageUrl,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(height: 10),
                Text(appState.currentBook.bookInfo.title,
                    style: Theme.of(context).textTheme.headline2),
                SizedBox(height: 10),
                Text(
                  appState.currentBook.bookInfo.author,
                ),
                ProgressBar(progress: 0.25,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: Container(
                      height: s.height * 0.25,
                      child: Text(
                        appState.currentBook.chapterText,
                    
                        overflow: TextOverflow.clip,
                        style: Theme.of(context).textTheme.bodyText1,
                      )),
                )
              ]),
            )),
        BottomBar(
          children: [
            GestureDetector(
                onTap: () {
                  Navigator.of(context).push(homeToReaderRoute());
                },
                child: Image.asset("assets/icons/play.png")),
          ],
        ),
      ]),
    );
  }
}


class TopMenuBar extends StatelessWidget {
  const TopMenuBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        height: 70.0,
        child: Row(
            //mainAxisAlignment: MainAxisAlignment.start,
            children: [
              MenuButton(
                h: 70,
                w: 70,
                asset: "back",
                onPressed: () =>
                    Navigator.of(context).push(previewToLibRoute()),
              ),
              Expanded(child: SizedBox()),
              Image.asset("assets/icons/bookshelf.png"),
              SizedBox(width: 20),
              Image.asset("assets/icons/profile.png"),
            ]),
      ),
    );
  }
}

 //  ruinedByD,
                        //  appState.currentBook.previewText,
// CenterAbout(
//   position: Offset(s.width / 2, s.height * 0.35),
//   child: Container(
//     width: s.width / 2,
//     height: 1.5 * s.width / 2,
//     child: Image.network(
//       appState.currentBook.imageUrl,
//      // "assets/images/ruined.jpg",
//       fit: BoxFit.fill,
//     ),
//   ),
// ),

// import 'package:flutter/material.dart';
// import 'package:scroll_book/models/book.dart';
// import 'package:scroll_book/mobile/route_transitions.dart';
// //https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1447560400l/27831864._SY475_.jpg
// //"https://m.media-amazon.com/images/I/41P0vehqsRL.jpg",
// //
// class LibraryPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     Size s = MediaQuery.of(context).size;
//     Size bookSize = Size(s.width/3, 2*(s.width/3));
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: SingleChildScrollView(
//           child: Wrap(
//              children: books.map((e) => Padding(
//                padding: EdgeInsets.all(s.width/18),
//                child: BookTile(size: bookSize, book:e),
//              )).toList(),
//             ),
//         ),
//       ),);
//   }
// }

// class BookTile extends StatelessWidget {
//   const BookTile({
//     Key key,
//     @required this.size,
//     @required this.book,
//   }) : super(key: key);

//   final Size size;
//   final BookModel book;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: size.width,
//       child: Column(children: [
//               Container(
//               width: size.width,
//               height: 1.5 *  size.width,
//               child: GestureDetector(
//               onTap: () {
//                 Navigator.of(context).push(libToPreviewRoute());
//               },
//                 child: Image.network(
//                   book.imageUrl,
//                   fit: BoxFit.fill,
//                 ),
//               ),
//             ),
//             SizedBox(height: 5),
//                   Text(book.title,

//                     //"Ruined By Design",
//                       style: Theme.of(context).textTheme.headline2.copyWith(fontSize:16)),
//                   SizedBox(height: 5),
//                   Text(book.author,style: TextStyle(fontSize:12),
//                    // "Mike Montero"
//                     ),

//                 ]),
//     );
//   }
// }

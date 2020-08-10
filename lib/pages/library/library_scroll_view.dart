import 'package:flutter/material.dart';
import 'package:scroll_book/menu_bars/menu_bars.dart';
import 'package:scroll_book/models/library_book_model.dart';
import 'package:scroll_book/shared_components/shared_components.dart';

class LibraryScrollView extends StatefulWidget {
  final List<LibraryBook> library;
  final int initalBookIndex;
  final Function() toListView;
  final Function(LibraryBook) toReaderScreen;
  final Function(LibraryBook) toNotesScreen;

  const LibraryScrollView(
      {Key key,
      @required this.library,
      this.initalBookIndex = 0,
      @required this.toListView,
      @required this.toReaderScreen,
      @required this.toNotesScreen})
      : super(key: key);

  @override
  _LibraryScrollViewState createState() => _LibraryScrollViewState();
}

class _LibraryScrollViewState extends State<LibraryScrollView> {
  int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initalBookIndex;
  }

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(children: [
        GradientContainer(
          height: s.height * 0.45,
          begin: GradientInfo(
              color: widget.library[currentIndex].bookInfo.color1,
              alignment: Alignment.topLeft),
          end: GradientInfo(
            color: widget.library[currentIndex].bookInfo.color2,
            alignment: Alignment.bottomRight,
          ),
        ),
        _topBar(),
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
                    widget.library[currentIndex].bookInfo.imageUrl,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(height: 10),
                Text(widget.library[currentIndex].bookInfo.title,
                    style: Theme.of(context).textTheme.headline2),
                SizedBox(height: 10),
                Text(
                  widget.library[currentIndex].bookInfo.author,
                ),
                ProgressBar(
                  progress: 0.25,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: Container(
                      height: s.height * 0.25,
                      child: Text(
                        widget.library[currentIndex].chapterText,
                        overflow: TextOverflow.clip,
                        style: Theme.of(context).textTheme.bodyText1,
                      )),
                )
              ]),
            )),
        Padding(
          padding: const EdgeInsets.only(bottom:50.0),
          child: BottomBar(
            children: [
              MaterialButton(
                color: Colors.white,
                  child: Container(
                     width: s.width/3,
                    height: 50.0,
                    child: Center(
                      child: Text(
                        "View Notes",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  onPressed: ()=>widget.toNotesScreen(widget.library[currentIndex])),
              MaterialButton(
                color: Colors.black,
                  child: Container(
                    width: s.width/3,
                    height: 50.0,
                    child: Center(
                      child: Text(
                        "Read",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  onPressed: ()=>widget.toReaderScreen(widget.library[currentIndex])),
            ],
          ),
        ),
      ]),
    );
  }

  Widget _topBar() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0 ),
        child: Container(
          height: 50.0,
          child: Row(
              //mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                    iconSize: 40,
                    icon: Icon(Icons.arrow_back),
                    onPressed: () => widget.toListView()
                    //Navigator.of(context).push(previewToLibRoute()),
                    ),
                Expanded(child: SizedBox()),
               
              ]),
        ),
      );
}




 // Icon(icon)
                //SvgPicture.asset("assets/icons/library-active.svg"),
                //  SizedBox(width: 20),
                //SvgPicture.asset("assets/icons/profile-inactive.svg"),
// class TopMenuBar extends StatelessWidget {
//   const TopMenuBar({
//     Key key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20.0),
//       child: Container(
//         height: 70.0,
//         child: Row(
//             //mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               IconButton(
//                iconSize: 70,
//                icon: Icon(Icons.arrow_back),
//                 onPressed: () =>{}
//                     //Navigator.of(context).push(previewToLibRoute()),
//               ),
//               Expanded(child: SizedBox()),
//             // Icon(icon)
//               //SvgPicture.asset("assets/icons/library-active.svg"),
//             //  SizedBox(width: 20),
//               //SvgPicture.asset("assets/icons/profile-inactive.svg"),
//             ]),
//       ),
//     );
//   }
// }

// GestureDetector(
//               onTap: () {

//                // Navigator.of(context).push(homeToReaderRoute());
//               },
//               child: Icon(Icons.play_circle_outline)
//              // SvgPicture.asset("assets/icons/play.svg")
//               ),

//  ruinedByD,
//  widget.library[currentIndex].previewText,
// CenterAbout(
//   position: Offset(s.width / 2, s.height * 0.35),
//   child: Container(
//     width: s.width / 2,
//     height: 1.5 * s.width / 2,
//     child: Image.network(
//       widget.library[currentIndex].imageUrl,
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

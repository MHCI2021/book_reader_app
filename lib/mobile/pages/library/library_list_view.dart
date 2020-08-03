import 'package:flutter/material.dart';
import 'package:scroll_book/mobile/route_transitions.dart';
import 'package:scroll_book/models/book.dart';
import 'package:scroll_book/models/user.dart';
import 'package:scroll_book/state/state.dart';

//https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1447560400l/27831864._SY475_.jpg
//"https://m.media-amazon.com/images/I/41P0vehqsRL.jpg",
//
class LibraryListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextStyle headerFont = Theme.of(context).textTheme.headline2;
    TextStyle subHeaderFont = Theme.of(context).textTheme.headline3;
    Size s = MediaQuery.of(context).size;
    var appState= locator<AppState>();
    Size bookSize = Size(100, s.width - 60.0);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 30.0, right: 30, top: 30.0),
        child: Column(
          children: [
            Row(children: [
              Expanded(
                  child: Text(
                "Library",
                style: headerFont,
              )),
              Image.asset("assets/icons/profile.png"),
            ]),
            Expanded(
              child: ListView(children: [
                Row(
                  children: [
                    Icon(Icons.keyboard_arrow_up),
                    Text(
                      "In Progress",
                      style: subHeaderFont,
                    )
                  ],
                ),
                Divider(),
                ...appState.libBooks.map((e) => Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          child: BookTile(size: bookSize, book: e),
                        ))
                    .toList(),
                Row(
                  children: [
                    Icon(Icons.keyboard_arrow_up),
                    Text(
                      "To Start",
                      style: subHeaderFont,
                    )
                  ],
                ),
                Divider(),
                //...appState.libBooks
                ...books
                    .map((e) => Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          child: BookTile(size: bookSize,book2: e), //book: e),
                        ))
                    .toList(),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

class BookTile extends StatefulWidget {
  const BookTile({
    Key key,
    @required this.size,
    this.book,
    this.book2,
  }) : super(key: key);

  final Size size;
  final BookModel book2;
  final LibraryBook book;

  @override
  _BookTileState createState() => _BookTileState();
}

class _BookTileState extends State<BookTile> {
  bool menuOpen = false;
 
  @override
  Widget build(BuildContext context) {
    dynamic book = widget.book??widget.book2;
    return Stack(
      children: [
        Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            width: 75.0, //size.height/1.5,
            height: 100.0, // size.height,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(libToPreviewRoute());
              },
              child: Image.network(
                book.imageUrl,
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Container(
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(book.title,
                      textAlign: TextAlign.left,
                      style: Theme.of(context)
                          .textTheme
                          .headline2
                          .copyWith(fontSize: 16)),
                  SizedBox(height: 5),
                  Text(
                    book.author,
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "25%",
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
          IconButton(
            alignment: Alignment.topCenter,
            icon: Icon(Icons.more_horiz),
            onPressed: () => setState(() => menuOpen = !menuOpen),
          )
        ]),
        menuOpen ? menuOptions() : SizedBox()
      ],
    );
  }

  Widget menuOptions() => Align(
        alignment: Alignment.bottomRight,
        child: Padding(
          padding: EdgeInsets.only(top: 30.0),
          child: Container(
            height: 70,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey[300]),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[200].withOpacity(0.5),
                  spreadRadius: 5,
                  //  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(height: 5,),
                  Text("Remove"),
                  Divider(),
                  Text("Share"),
                  SizedBox( height: 5,),
                ]),
          ),
        ),
      );
}

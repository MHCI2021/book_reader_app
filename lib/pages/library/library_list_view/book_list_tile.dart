
import 'package:flutter/material.dart';
import 'package:scroll_book/models/library_book_model.dart';
import 'package:scroll_book/models/models.dart';
import 'package:scroll_book/state/route_transitions.dart';
import 'package:scroll_book/state/state.dart';



///  [BookListTile] 

class BookListTile extends StatefulWidget {
  
  BookListTile({
    Key key,
    @required this.size,
    this.book,
    this.book2,
    this.onRemoveClicked, 
    this.onShareClicked, 
    this.onSelected,
  }): 
  super(key: key);

  final Size size;
  final BookModel book2;
  final LibraryBook book;
  final Function() onRemoveClicked;
  final Function() onShareClicked;
  final Function() onSelected;

  @override
  _BookListTileState createState() => _BookListTileState();
}

class _BookListTileState extends State<BookListTile> {
  bool menuOpen = false;
  @override
  Widget build(BuildContext context) {
     dynamic b = widget.book??widget.book2;
   BookInfo bookInfo=b.bookInfo;
    return Stack(
      children: [
        Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            width: 75.0,//size.height/1.5,
            height: 100.0,//size.height,
            child: GestureDetector(
              onTap: () {
               // var libState = locator<AppState>();
               // libState.setBook(widget.book);
                //Navigator.of(context).push(libToPreviewRoute());
              },
              child: Image.network(
               bookInfo.imageUrl,
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
                  Text(bookInfo.title,
                      textAlign: TextAlign.left,
                      style: Theme.of(context)
                          .textTheme
                          .headline2
                          .copyWith(fontSize: 16)),
                  SizedBox(height: 5),
                  Text(
                    bookInfo.author,
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(height: 5),
                  Text(//"25%",
                  progToPcnt(b.progress),
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
                  GestureDetector(
                    onTap: widget.onRemoveClicked,
                    child: Text("Remove")
                    ),
                  Divider(),
                  GestureDetector(
                    onTap: widget.onShareClicked,
                    child: Text("Remove")
                    ),
                  SizedBox( height: 5,),
                ]),
          ),
        ),
      );
}

String progToPcnt(double prog) => "${(prog * 100).toStringAsFixed(0)}%";


// class BookListTile2 extends StatelessWidget {

//   final double progress;
//   final BookInfo bookInfo;
//   final Function() onRemoveClicked;
//   final Function() onShareClicked;
//   final Function() onSelected;
  
//   BookListTile2({
//     Key key,
//     this.bookInfo,
//     this.progress, 
//     this.onRemoveClicked, 
//     this.onShareClicked, 
//     this.onSelected,
//   }): 
//   super(key: key);
//   void onIconClicked(){}

//   bool menuOpen = false;
//   @override
//   Widget build(BuildContext context) {

//     return Stack(
//       children: [
//         Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
//           Container(
//             width: 75.0, //size.height/1.5,
//             height: 100.0, // size.height,
//             child: GestureDetector(
//               onTap: onSelected,
//               child: Image.network(
//                bookInfo.imageUrl,
//                 fit: BoxFit.fill,
//               ),
//             ),
//           ),
//           SizedBox(width: 10),
//           Expanded(
//             child: Container(
//               height: 100,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(bookInfo.title,
//                       textAlign: TextAlign.left,
//                       style: Theme.of(context)
//                           .textTheme
//                           .headline2
//                           .copyWith(fontSize: 16)),
//                   SizedBox(height: 5),
//                   Text(
//                     bookInfo.author,
//                     style: TextStyle(fontSize: 12),
//                   ),
//                   SizedBox(height: 5),
//                   Text(//"25%",
//                   progToPcnt(progress??0.0),
//                     style: TextStyle(fontSize: 12),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           IconButton(
//             alignment: Alignment.topCenter,
//             icon: Icon(Icons.more_horiz),
//             onPressed:()=> onIconClicked()
//             //() => setState(() => menuOpen = !menuOpen),
//           )
//         ]),
        
//         menuOpen ? menuOptions() : SizedBox()
//       ],
//     );
//   }

//   Widget menuOptions() => Align(
//         alignment: Alignment.bottomRight,
//         child: Padding(
//           padding: EdgeInsets.only(top: 30.0),
//           child: Container(
//             height: 70,
//             width: 100,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               border: Border.all(color: Colors.grey[300]),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey[200].withOpacity(0.5),
//                   spreadRadius: 5,
//                   //  blurRadius: 7,
//                   offset: Offset(0, 3), // changes position of shadow
//                 ),
//               ],
//             ),
//             child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   SizedBox(height: 5,),
//                   GestureDetector(
//                     onTap: onRemoveClicked,
//                     child: Text("Remove")
//                     ),
//                   Divider(),
//                   GestureDetector(
//                     onTap: onShareClicked,
//                     child: Text("Remove")
//                     ),
//                   SizedBox( height: 5,),
//                 ]),
//           ),
//         ),
//       );
// }

// //String progToPcnt(double prog) => "${(prog * 100).toStringAsFixed(0)}%";

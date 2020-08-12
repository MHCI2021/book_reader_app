import 'package:flutter/material.dart';
import 'package:scroll_book/models/library_book_model.dart';
import 'package:scroll_book/state/state.dart';


class PagesPage extends StatefulWidget {
  final LibraryBook book;

  const PagesPage(
      {Key key,
      @required this.book,})
      : super(key: key);
  @override
  _PagesPageState createState() => _PagesPageState();
}

class _PagesPageState extends State<PagesPage> {
  bool playing = true, menuShown = false;
  ReaderController readerController;

  @override
  void initState() {
    super.initState();
    readerController = locator<ReaderController>();
  }

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
          title: Text(widget.book.bookInfo.title,
              style: Theme.of(context).textTheme.headline2),
          actions: [
            IconButton(
              iconSize: 30,
              icon: Icon(Icons.bookmark_border,color: Colors.black,),
              onPressed: () {},
            ),
            IconButton(
              iconSize: 30,
              icon: Icon(Icons.more_horiz,color: Colors.black,),
              onPressed: () {setState(() {menuShown = !menuShown; });
              },
            ),
          ]),
      body: Stack(children: [
        Positioned(
          bottom: s.height/4,
          height: 100.0,
          left: 30,
          width: 150,

          child: Container(color: Colors.green,))
       
      ]),
    );
  }

}


  // Widget _getOverlay() {
  //   switch (readerController.currentOverlay) {
  //     case ReaderOverlay.VolSpeed:
  //       return VolumeBar(
  //         onClose: () {
  //           readerController.closeOverlay();
  //           setState(() {});
  //         },
  //       );
  //       break;
  //     case ReaderOverlay.Font:
  //       return FontSelectorOverlay(onClose: () {
  //         print("HELLO");
  //         readerController.closeOverlay();
  //         setState(() {});
  //       });
  //       break;
  //     default:
  //       return SizedBox();
  //   }
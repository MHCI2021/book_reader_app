import 'package:flutter/material.dart';
import 'package:scroll_book/models/library_book_model.dart';
import 'package:scroll_book/state/state.dart';
import 'library_list_view.dart';
import 'library_scroll_view.dart';
import 'notes_page/book_notes_page.dart';
import 'reader_page/reader_page.dart';

///  [LibraryListView] is a list of a users books
enum CurrentScreen { ListView, NotesView, ScrollView, ReaderView }

class LibraryHome extends StatefulWidget {
  @override
  _LibraryHomeState createState() => _LibraryHomeState();
}

class _LibraryHomeState extends State<LibraryHome> {
  CurrentScreen currentScreen = CurrentScreen.ListView;
  List<LibraryBook> library;
  LibraryBook currentBook;

  @override
  void initState() {
    super.initState();
    var libState = locator<LibState>();
    library = libState.library;
  }

  // States
  // List View Page
  // Scroll View Page
  // Notes Page
  // Reader Page
  //


  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
  
   // double paddingHor = 30.0, paddingTop = 30.0;
    return Stack(children: [
      Positioned(
          height: s.height,
          width: s.width,
          child: _getCurrentScreen(context)),
    ]);
  }

  Widget _getCurrentScreen(BuildContext context) {
    switch (currentScreen) {
      case CurrentScreen.ListView:
        return Padding(
          padding: const EdgeInsets.all(30.0),
          child: LibraryListView(
              toBookView: onBookSelected, library: library),
        );
        break;
      case CurrentScreen.ScrollView:
        return LibraryScrollView(
          toListView: toListScreen,
          toNotesScreen: toNotesScreen,
          toReaderScreen: (book)=>toReaderScreen(book, context),
          library: library,
        );
        break;
      case CurrentScreen.NotesView:
        return BookNotesPage(
          book: currentBook,
          toBookView: onBookSelected
          )  ;
        break;
      // case CurrentScreen.ReaderView:
      //   return ReaderPage();
      //   break;
      default:
        return Container();
    }
  }

  void onBookSelected(LibraryBook book) {
    print("Book");
    setState(() {
      currentBook = book;
      currentScreen = CurrentScreen.ScrollView;
    });
  }

  void toListScreen() {
    setState(() {
      currentBook = null;
      currentScreen = CurrentScreen.ListView;
    });
  }

  void toNotesScreen(LibraryBook book) {
    setState(() {
      currentBook = book;
      currentScreen = CurrentScreen.NotesView;
    });
  }

  void toReaderScreen(LibraryBook book, BuildContext context) {
    var readerController = locator<ReaderController>();
    readerController.setBook(book);
    currentBook=book;
    Navigator.of(context).push(homeToReaderRoute());
  }

Route homeToReaderRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => 
    ReaderPage(
      toBookView: (b){
        onBookSelected(currentBook);
        Navigator.of(context).pop();
      },
      book: currentBook,
    ),
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
}

 // setState(() {
    //   currentBook = book;
    //   currentScreen = CurrentScreen.ReaderView;
    // });
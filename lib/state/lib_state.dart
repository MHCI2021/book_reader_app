import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:scroll_book/models/library_book_model.dart';
import 'package:scroll_book/utils/fonts.dart';

// /https://blog.codemagic.io/deploying-flutter-app-to-firebase-app-distribution-using-fastlane/

class LibState extends ChangeNotifier {
  bool isPlaying = false;
  String fontFam = 'Alegreya Sans';
  double progress, fontSize = 16.0;
  LibraryBook _currentBook;
  bool isInit= false;
  List<LibraryBook> library;

  LibState();
  LibraryBook get currentBook => _currentBook;
  TextStyle get currentTextStyle =>getGoogleFonts[fontFam](TextStyle(fontSize: 16.0, color: Colors.black));
  init(List<LibraryBook> userlibrary)  { 
    library=userlibrary;
    isInit=true;
  }
  //Widget getCurrentScreen() => LibraryListView();
  String getText() => "";

 setBook(LibraryBook _newBook) async{
   // await flutterTts.speak(designerPreview);
   _currentBook = _newBook;
    var chapterData = await Firestore.instance.collection('books').document('7sTQD2II1dpxWfSSUGfk').get();
 }

}


// flutterTts.setProgressHandler((String text, int startOffset, int endOffset, String word) {
//   setState(() {
//     _currentWord = word;
//   });
// });

  // getTextBlocks() => _currentBook.chapterText
  //     .replaceAll(".", ".&&")
  //     .replaceAll("&&\"", "\"&&")
  //     .replaceAll("&&)", ")&&")
  //     .split("&&")
  //     .map((e) => e.trim() + " ")
  //     .toList();
  // getFontStyle() => getGoogleFonts[fontFam](
  //     TextStyle(color: Colors.black, fontSize: fontSize));
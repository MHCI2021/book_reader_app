
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:scroll_book/models/library_book_model.dart';
import 'package:scroll_book/state/app_state.dart';
import 'package:scroll_book/state/state.dart';
import 'package:scroll_book/utils/fonts.dart';


class ReaderController extends ChangeNotifier {
 bool isPlaying = false, isScrolling=false;
  String fontFam = 'Alegreya Sans';
  double progress, fontSize = 16.0, volume = 0.5, speed = 1.0;
  LibraryBook _currentBook;
  double chapterTime=300.0, currentTime=0.0;
  FlutterTts flutterTts;
  List<String> textBlocks;
 
  int currentIndex;
  ReaderController();
  
  LibraryBook get currentBook => _currentBook;
  init({int sentenceStart=0})  async{ 
      textBlocks = _getTextBlocks(sentenceStart);
     flutterTts = FlutterTts();//await flutterTts.setSharedInstance(true);
     flutterTts.setCompletionHandler(() {
      print("Complete");
      if(isPlaying &&currentIndex<textBlocks.length-1 && !isScrolling){
        currentIndex+=1;
        flutterTts.speak(textBlocks[currentIndex]);//next();
        notifyListeners();
      }
     });
      flutterTts.setProgressHandler((String text, int startOffset, int endOffset, String word) {
        //print("handle");
        //print(word);
     });
  }


   List<String> _getTextBlocks(int sentenceStart) {
    List<String> blocks = [""];
    int i=0;
    _splitIntoSentences().forEach((b){
      if(blocks.last.length<100)blocks.last+=b;
      else blocks.add(b);
      if(i==sentenceStart){currentIndex=blocks.length-1;}
      i+=1;
    });
    return blocks;
  }

  setIndex(int newIndex)=>currentIndex=newIndex;
  setFontFam(String val){
    fontFam=val;
    notifyListeners();
  }
  setVolume(double _vol) async{
    volume = _vol;
    await flutterTts.setVolume(_vol);
  }
   setSpeed(double _speed)async{
     speed= _speed;
     await flutterTts.setSpeechRate(_speed);
  }
  play() {
    print("Play");
    if (!isPlaying || !isScrolling) {
      isPlaying = true;
      flutterTts.speak(textBlocks[currentIndex]);
      print(textBlocks[currentIndex]);
    }
  }
  pause({bool scrolling=false}) {
    isScrolling=scrolling;
    if (isPlaying) {
      flutterTts.stop();
      if(!scrolling)isPlaying = false;
      }
  }
  
  TextStyle get currentTextStyle =>getGoogleFonts[fontFam](TextStyle(fontSize: 16.0, color: Colors.black));


  String getText() => "";


 setBook(LibraryBook _newBook) async{
   // await flutterTts.speak(designerPreview);
   _currentBook = _newBook;
   // var chapterData = await Firestore.instance.collection('books').document('7sTQD2II1dpxWfSSUGfk').get();
 }

  List<String> _splitIntoSentences() => designers
  //_currentBook.chapterText
      .replaceAll(".", ".&&")
      .replaceAll("&&\"", "\"&&")
      .replaceAll("&&)", ")&&")
      .split("&&")
      .map((e) => e.trim() + " ")
      .toList();
  
  getFontStyle(Color color) => getGoogleFonts[fontFam](
      TextStyle(color:color, fontSize: fontSize));

}



// enum ReaderOverlay{
//   VolSpeed,
//   Font,
//   TopMenu,
//   NewNote,
//   NoteInfo,
//   ChapterList,
// }
// //DefaultBottom,

//   closeOverlay(){
//      currentOverlay = null;
//    }

//    setOverlay(ReaderOverlay _newOverlay){
//      currentOverlay = _newOverlay;
//    }

//     ReaderOverlay currentOverlay; 
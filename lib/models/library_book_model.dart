


import 'package:flutter/material.dart';
import 'package:scroll_book/utils/utils.dart';

import 'book_model.dart';
import 'bookmark_model.dart';
import 'chapter_model.dart';

class LibraryBook {
  final bool isDone;
  final bool isStarted;
  final double progress;
  final String chapterText;
  final int chapterSentenceNum;
  final int chapterNum;
  final BookInfo bookInfo; 
  final List<Bookmark> bookmarks;

  LibraryBook({
    @required this.bookInfo,
    this.isDone,
    this.isStarted, 
    this.progress, 
    this.chapterText,
    this.bookmarks,
    this.chapterNum,
    this.chapterSentenceNum, 
 //   this.notes
    });

   LibraryBook.fromFirebase(Map map):
    this.bookInfo= BookInfo.fromFirebase(safe("bookInfo",map)),
    this.isDone= safe("isDone", map), 
    this.isStarted= safe("isStarted", map), 
    this.progress= safe("progress", map),
    this.chapterText = safe("chapterText", map),
    this.chapterSentenceNum= safe("chapterSentenceNum", map),
    this.chapterNum = safe("chapterNum", map),
    this.bookmarks = safeGet(key:"bookmarks", map:map, alt: []).map<Bookmark>((b)=>Bookmark.fromFirebase(b)).toList();
  
}




// class LibraryBook {
//   final String bookID;
//   final String title;
//   final String author;
//   final String imageUrl;
//   final bool isDone;
//   final bool isStarted;
//   final double progress;
//   final int wordCount;
//   final String chapterText;
//   final Color color1, color2;
//   final int chapterSentenceNum;
//   final int chapterNum;
  
//   final List<Bookmark> bookmarks;

//   LibraryBook({
//     this.bookID, 
//     this.title, 
//     this.author, 
//     this.isDone,
//     this.color1,
//     this.color2,
//     this.isStarted, 
//     this.progress, 
//     this.imageUrl,
//     this.wordCount,
//     this.chapterText,
//     this.bookmarks,
//     this.chapterNum,
//     this.chapterSentenceNum, 
//  //   this.notes
//     });

//    LibraryBook.fromFirebase(Map map):
//     this.bookID= safe("bookID",map),
//     this.title= safe("title", map), 
//     this.author=safe("author", map), 
//     this.imageUrl=safe("imageUrl", map), 
//     this.isDone= safe("isDone", map), 
//     this.isStarted= safe("isStarted", map), 
//     this.color1=Colors.white,
//     this.color2=Colors.white,
//     this.wordCount = safe("words", map),
//     this.progress= safe("progress", map),
//     this.chapterText = safe("chapterText", map),
//     this.chapterSentenceNum= safe("chapterSentenceNum", map),
//     this.chapterNum = safe("chapterNum", map),
//     this.bookmarks = safeGet(key:"library", map:map, alt: []).map<LibraryBook>((b)=>LibraryBook.fromFirebase(b)).toList();
    
//    // this.notes = safe("bookmarks", map)?.map<Bookmark>((b)=>Bookmark.fromFirebase(b));

// }

/*
All Immutable info that is shared with the user
// this.notes = safe("bookmarks", map)?.map<Bookmark>((b)=>Bookmark.fromFirebase(b));*/

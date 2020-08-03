

import 'package:flutter/material.dart';
import 'package:scroll_book/utils/utils.dart';

class UserModel {
  final String email;
  final String username;
  final String firstName;
  final String lastName;
  final String profilePic;
  List<LibraryBook> library;

  UserModel({
    @required this.email, 
    @required this.username, 
    this.firstName, 
    this.lastName, 
    this.profilePic,
    this.library
    });

  UserModel.fromFirebase(String id,Map<String, dynamic> map):
    this.email= safe("email",map),
    this.username= safe("username", map), 
    this.firstName=safe("firstName", map), 
    this.lastName= safe("lastName", map), 
    this.profilePic= safe("profilePic", map),
    this.library = safeGet(key:"library", map:map, alt: []).map<LibraryBook>((b)=>LibraryBook.fromFirebase(b)).toList();

}

class LibraryBook {
  final String bookID;
  final String title;
  final String author;
  final String imageUrl;
  final bool isDone;
  final bool isStarted;
  final double progress;
  final int wordCount;
  final String chapterText;
 // final List<Bookmark> notes;

  LibraryBook({
    this.bookID, 
    this.title, 
    this.author, 
    this.isDone,
    this.isStarted, 
    this.progress, 
    this.imageUrl,
    this.wordCount,
    this.chapterText, 
 //   this.notes
    });

   LibraryBook.fromFirebase(Map map):
    this.bookID= safe("bookID",map),
    this.title= safe("title", map), 
    this.author=safe("author", map), 
    this.imageUrl=safe("imageUrl", map), 
    this.isDone= safe("isDone", map), 
    this.isStarted= safe("isStarted", map), 
    this.wordCount = safe("words", map),
    this.progress= safe("progress", map),
    this.chapterText = safe("chapterText", map);
   // this.notes = safe("bookmarks", map)?.map<Bookmark>((b)=>Bookmark.fromFirebase(b));

}

class Bookmark{
  final String id;
  final String bookID;
  final String text;
  final bool shared;
  final double progress;
  final double progressEnd;


 Bookmark({
    this.id, 
    this.bookID, 
    this.text, 
    this.shared, 
    this.progress,
    this.progressEnd
  });
  Bookmark.fromFirebase(Map<String, dynamic> map):
    this.id= safe("id",map),
    this.bookID= safe("bookID", map), 
    this.text=safe("text", map), 
    this.shared= safe("shared", map), 
    this.progress= safe("progress", map),
    this.progressEnd= safe("progressEnd", map)??safe("progress", map);
}
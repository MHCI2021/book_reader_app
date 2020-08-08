


import 'package:flutter/material.dart';
import 'package:scroll_book/utils/utils.dart';

class Bookmark{
  final String id;
  final String bookID;
  final String text;
  //final String note;
 // final Color highlightColor;
  final bool shared;
//  final double progressEnd;

 Bookmark({
    this.id, 
    this.bookID, 
    this.text, 
    this.shared, 
   // this.progress,
  //  this.progressEnd
  });
  Bookmark.fromFirebase(Map<String, dynamic> map):
    this.id= safe("id",map),
    this.bookID= safe("bookID", map), 
    this.text=safe("text", map), 
    this.shared= safe("shared", map); 
  //  this.progress= safe("progress", map),
 //   this.progressEnd= safe("progressEnd", map)??safe("progress", map);
}



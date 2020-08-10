


import 'package:flutter/material.dart';
import 'package:scroll_book/utils/utils.dart';



class Note{
  final String id;
  final String bookID;
  final String text;
  final String locationString;
  final String note;
  final bool shared;
  final Color highlightColor;

 Note({
    this.id, 
    this.bookID, 
    this.text, 
    this.shared, 
    this.locationString,
    this.note,
    this.highlightColor
  });
  Note.fromFirebase(Map<String, dynamic> map):
    this.id= safe("id",map),
    this.bookID= safe("bookID", map), 
    this.text=safe("text", map), 
    this.shared= safe("shared", map),
    this.locationString= safe("locationString", map), 
    this.note= safe("note", map),
    this.highlightColor=Colors.yellow; 
}


class Bookmark{
  final String bookID;
  final String chapter;
  final int secondStarts;
  final int secondEnds;
  final String note;
  final List<String> tags;

 Bookmark({
    this.bookID, 
    @required this.chapter,
    @required this.secondEnds,
    this.secondStarts,
    this.note,
    this.tags
  });
  Bookmark.fromFirebase(Map<String, dynamic> map, ):
    
    this.bookID= safe("bookID", map), 
    this.chapter=safe("chapter", map), 
    this.secondEnds= safe("secondEnds", map),
    this.secondStarts= safe("secondStarts", map),
    this.note= safe("note", map),
    this.tags = safeGet(key:"tags", map:map, alt: []); 
  
}



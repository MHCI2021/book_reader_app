

import 'package:flutter/material.dart';
import 'package:scroll_book/utils/utils.dart';

class SectionModel {
  final SectionInfo info;
  final Map<String, dynamic> data;

  SectionModel({
    @required this.info, 
    this.data
    });

  SectionModel.fromFirebase(Map<String, dynamic> map):
      this.info = SectionInfo.fromFirebase(safe("info", map)),
      this.data = safe("data", map);
}


@immutable
class SectionInfo {
  final String id;
  final String title;
  final int pageStart;
  final int pageEnd;
  final int wordCount;
  final int sentenceCount;
  final String startStr;
  final String endStr;
  final List<SectionInfo> subsectionsInfo;
  
  SectionInfo.fromFirebase(Map map):
    this.id= safe("id",map),
    this.title= safe("name",map),
    this.pageStart= safe("pageStart", map), 
    this.pageEnd=safe("pageEnd", map), 
    this.wordCount = safe("wordCount", map),
    this.sentenceCount = safe("sentenceCount", map),
    this.startStr=safe("startStr", map), 
    this.endStr = safe("endStr", map),
    this.subsectionsInfo = safe("sections", map)??[]
      .map<SectionInfo>((b)=>SectionInfo.fromFirebase(b)).toList();
}


  //final int wordCount;
  //final List<String> paragraphs;
// this.number,
//     this.wordCount,
//     this.paragraphs
// class ChapterModel {
//   final int number;
//   final String title;
//   final int wordCount;
//   final List<String> paragraphs;

//   ChapterModel({
//     @required this.title, 
//     this.number,
//     this.wordCount,
//     this.paragraphs
//     });

//   ChapterModel.fromFirebase(Map<String, dynamic> map):
//       this.number= safe("number",map),
//       this.title= safe("title", map), 
//       this.wordCount=safe("words", map), 
//       this.paragraphs = safe("paragraphs", map)??[];
// }


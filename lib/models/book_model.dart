import 'package:flutter/material.dart';
import 'package:scroll_book/models/chapter_model.dart';
import 'package:scroll_book/models/sample_data/ruined_by_design.dart';
import 'package:scroll_book/utils/utils.dart';

class BookModel {
  final String id;
  final BookInfo bookInfo;
  final List<SectionInfo> chapters;

  BookModel({@required this.bookInfo, this.chapters, this.id});
  BookModel.fromFirebase(String id, Map<String, dynamic> map)
      : this.id = id,
        this.bookInfo = BookInfo.fromFirebase( map),
        this.chapters = safe("chapters", map)
            ?.map<SectionInfo>((b) => SectionInfo.fromFirebase(b));
}

@immutable
class BookInfo {
  final String id;
  final String title;
  final String author;
  final String imageUrl;
  final String previewText;
  final int wordCount;
  final Color color1, color2;
  final List<SectionInfo> chaptersInfo;
  BookInfo({
    @required this.title,
    @required this.author,
    this.imageUrl,
    this.wordCount,
    this.previewText,
    this.color1,
    this.color2,
    this.id,
    this.chaptersInfo,
  });
  BookInfo.fromFirebase(Map map)
      : this.id = safe("id", map),
        this.title = safe("title", map),
        this.author = safe("author", map),
        this.imageUrl = safe("imageUrl", map),
        this.previewText = safe('previewText', map) ?? ruinedByD,
       this.color1= Color.fromRGBO(243, 236, 218,1.0),
        this.color2= Color.fromRGBO(255, 163, 169,1.0),
        this.wordCount = safe("words", map),
        this.chaptersInfo = safe("chapters", map) ??
            safe("sections", map) ??
            [].map<SectionInfo>((b) => SectionInfo.fromFirebase(b)).toList();
}

List<BookModel> books = [
  BookModel(
      bookInfo: BookInfo(
    title: "The Innovator's Dilemma",
    author: "Clayton Christensen",
    imageUrl: "https://m.media-amazon.com/images/I/51CMOkZGqML.jpg",
    previewText: ruinedByD,
  )),
  BookModel(
      bookInfo: BookInfo(
    title: "Ruined By Design",
    author: "Mike Montero",
    previewText: ruinedByD,
    imageUrl: "https://m.media-amazon.com/images/I/41P0vehqsRL.jpg",
  )),
  BookModel(
      bookInfo: BookInfo(
    title: "Sprint",
    author: "Jake Knapp",
    previewText: ruinedByD,
    imageUrl:
        "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1447560400l/27831864._SY475_.jpg",
  )),
  BookModel(
      bookInfo: BookInfo(
    title: "How Buildings Learn",
    author: "Stewart Brand",
    previewText: ruinedByD,
    imageUrl:
        "https://img1.od-cdn.com/ImageType-400/1523-1/1FA/701/FE/%7B1FA701FE-EC71-4D4E-805D-04F4CCA4E23E%7DImg400.jpg",
  )),
  BookModel(
      bookInfo: BookInfo(
    title: "The Design Way",
    author: "Erik Stolterman and Harold G. Nelson",
    previewText: ruinedByD,
    imageUrl:
        "https://i0.wp.com/www.creativityatwork.com/wp-content/uploads/9780262526708-e1482464548272.jpg?resize=200%2C296",
  )),
];


Map sects = {
  "sectionID":"text",
};



// class BookModel {
//   final String id;
//   final String title;
//   final String author;
//   final String previewText;
//   final String imageUrl;
//   final Color color1, color2;
//   final int wordCount;
//   final List<ChapterModel> chapters;

//   BookModel({
//     @required this.title,
//     @required this.author,
//     this.chapters,
//     this.imageUrl,
//     this.wordCount,
//     this.previewText,
//     this.color1,
//     this.color2,
//     this.id
//     });
//     BookModel.fromFirebase(String id, Map<String, dynamic> map):
//       this.id= id,
//       this.title= safe("title", map),
//       this.author=safe("author", map),
//       this.imageUrl= safe("imageUrl", map),
//       this.color1 = safe("color1", map),
//       this.color2 = safe("color2", map), //dd
//       this.wordCount= safe("profilePic", map),
//       this.previewText= safe('previewText', map)??ruinedByD,
//       this.chapters = safe("chapters", map)?.map<ChapterModel>((b)=>ChapterModel.fromFirebase(b));
// }

// this.imageUrl,
// this.wordCount,
// this.previewText,
// this.color1,
// this.color2,

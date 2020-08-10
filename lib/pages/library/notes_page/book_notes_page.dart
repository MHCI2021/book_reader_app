

import 'package:flutter/material.dart';
import 'package:scroll_book/models/library_book_model.dart';

import 'bookmark_list_tile.dart';
import 'highlights_list_tile.dart';
import 'note_list_tile.dart';
class BookNotesPage extends StatelessWidget {
  final LibraryBook book;
  final Function(LibraryBook) toBookView;

  const BookNotesPage({Key key, 
  @required this.book,
  this.toBookView
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
       length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(icon: Icon(Icons.arrow_back, color:Colors.black),
          onPressed:()=>toBookView(book),
          ),
        title: Text(book.bookInfo.title, style: TextStyle(color:Colors.black),),
        bottom:TabBar(
          labelColor: Colors.black,
          tabs: [
          Tab(text: "Highlights",),
          Tab(text: "Notes",),
          Tab(text: "Bookmarks",),
        ],)),
        body: TabBarView(
  children: [
    ListView(
      children: book.highlights.map((bookmark)=>
        HighlightListTile(
          highlight: bookmark,
        )).toList()
    ),
  ListView(
      children: book.notes.map((bookmark)=>
        NotesListTile(
          note: bookmark,
        )).toList()
    ),

    ListView(
      children: book.bookmarks.map((bookmark)=>
        BookmarkListTile(
          bookmark: bookmark,
        )).toList()
    ),
   
  ],
),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:scroll_book/models/bookmark_model.dart';
import 'package:scroll_book/pages/library/notes_page/utils.dart';

class BookmarkListTile extends StatelessWidget {
  final Bookmark bookmark;

  const BookmarkListTile({Key key, this.bookmark}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      
      children: [
        ListTile(leading:Icon(Icons.bookmark), title: Text(bookmark.chapter, textAlign: TextAlign.start,),),
        Text(timeToString(start: bookmark.secondStarts, end:bookmark.secondEnds))
      ],
    );
  }
}


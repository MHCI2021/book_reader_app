import 'package:flutter/material.dart';
import 'package:scroll_book/models/bookmark_model.dart';

class NotesListTile extends StatelessWidget {
final Note note;

  const NotesListTile({Key key,@required this.note}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children:[
          Text(note.text,),
          Text(note.locationString),
          Text(note.note)
        ]
      ),
      
    );
  }
}
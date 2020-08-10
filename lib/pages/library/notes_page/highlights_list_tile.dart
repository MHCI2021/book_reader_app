import 'package:flutter/material.dart';
import 'package:scroll_book/models/bookmark_model.dart';

class HighlightListTile extends StatelessWidget {
  final Note highlight;

  const HighlightListTile({Key key,@required this.highlight}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children:[
          Center(child: Text(highlight.text, style: TextStyle(color:Colors.black, background: Paint()..color=highlight.highlightColor),)),
          Text(highlight.locationString)
        ]
      ),
      
    );
  }
}
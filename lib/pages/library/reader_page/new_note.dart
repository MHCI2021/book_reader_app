import 'package:flutter/material.dart';
import 'package:quill_delta/quill_delta.dart';
import 'package:zefyr/zefyr.dart';
import 'dart:convert'; 
class EditorPage extends StatefulWidget {
  final String currentBlock;

  const EditorPage({Key key, this.currentBlock}) : super(key: key);
  @override
  EditorPageState createState() => EditorPageState();
}

class EditorPageState extends State<EditorPage> {
  ZefyrController _controller;
  FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    // Here we must load the document and pass it to Zefyr controller.
    final document = _loadDocument();
    _controller = ZefyrController(document);
    _focusNode = FocusNode();
    
  }

  /// Loads the document to be edited in Zefyr.
  NotusDocument _loadDocument() {
    // For simplicity we hardcode a simple document with one line of text
    // saying "Zefyr Quick Start".
    // (Note that delta must always end with newline.)
    //final Delta delta = Delta()..insert("Zefyr Quick Start\n");
    
    final List<dynamic> map = [{"insert":widget.currentBlock??""},{"insert":"\n","attributes":{"block":"quote"}}];
    return  NotusDocument.fromJson(map);
    //return NotusDocument.fromDelta(map);
  }

  void _saveDocument(BuildContext context) {
    // Notus documents can be easily serialized to JSON by passing to
    // `jsonEncode` directly
    final contents = jsonEncode(_controller.document);
    print(contents);
    // For this example we save our document to a temporary file.
    //final file = File(Directory.systemTemp.path + "/quick_start.json");
    // And show a snack bar on success.
   // file.writeAsString(contents).then((_) {
    //  Scaffold.of(context).showSnackBar(SnackBar(content: Text("Saved.")));
    //});
  }

  @override
  Widget build(BuildContext context) {
    // Note that the editor requires special `ZefyrScaffold` widget to be
    // one of its parents.
    return Scaffold(
      appBar:AppBar(
        title: Text("Editor page"),
        // <<< begin change
        actions: <Widget>[
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.save),
              onPressed: () => _saveDocument(context),
            ),
          )
        ],
        // end change >>>
      ),
      body: ZefyrScaffold(
        child: ZefyrEditor(
          padding: EdgeInsets.all(16),
          controller: _controller,
          focusNode: _focusNode,
        ),
      ),
    );
  }
}
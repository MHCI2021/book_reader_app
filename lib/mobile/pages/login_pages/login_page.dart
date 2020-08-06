import 'package:flutter/material.dart';
import 'package:scroll_book/mobile/pages/library/book_tile.dart';
import 'package:scroll_book/mobile/pages/library/library_list_view.dart';
import 'package:scroll_book/mobile/pages/login_pages/form_components/form_entry_field.dart';
import 'package:scroll_book/state/state.dart';

import 'package:scroll_book/utils/custom_expansion_tile.dart' as custom;

import '../../route_transitions.dart';

class LoginPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    var appState= locator<AppState>();
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 30.0, right: 30, top: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(height: s.height*0.3,),
            Text("Email", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
            FormEntryField(
              labelText:"Email",
            ),
            Text("Password", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
            FormEntryField(
              labelText:"Email",
            ),
            Center(child:Text("Forgot Password?", style: TextStyle(color:Colors.blue),)),
            RaisedButton(
              padding: EdgeInsets.symmetric(vertical:15.0),
              onPressed: (){
                Navigator.of(context).push(createRoute(
                  newScreen: LibraryListView()
                ));
              },
              color: Colors.black,
              child: Center(child:Text("Log In", style:TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
            ),
            Container(
              width: double.infinity,
              child: Row(
                children:[
                  Expanded(child: Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: Container(color: Colors.grey,height: 1.0,),
                  ),),
                  Text("or sign in with"),
                  Expanded(child: Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: Container(color: Colors.grey,height: 1.0,),
                  ),),
                ]
              ),
            ),
            RaisedButton(
              padding: EdgeInsets.symmetric(vertical:15.0),
              onPressed: (){},
              color: Color.fromRGBO(80, 133, 235, 1.0),
               child: Center(child:Text("Google", style:TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
            ),
            RaisedButton(
              padding: EdgeInsets.symmetric(vertical:15.0),
              onPressed: (){},
              color: Color.fromRGBO(70, 94, 168, 1.0),
               child: Center(child:Text("Facebook", style:TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
            ),
            SizedBox(height: s.height*0.15,),
          ],
        ),
      ),
    );
  }
}
//rgb(80, 133, 235)
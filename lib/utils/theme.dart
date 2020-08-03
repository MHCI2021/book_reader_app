
import 'package:flutter/material.dart';

import 'fonts.dart';

final ThemeData themeData= ThemeData(
    textTheme: TextTheme(
      headline2:getGoogleFonts['Alegreya Sans'](TextStyle(color:Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),),
      headline3:getGoogleFonts['Alegreya Sans'](TextStyle(color:Colors.black, fontSize: 18.0, fontWeight: FontWeight.bold),),
      subtitle1: getGoogleFonts['Alegreya Sans'](TextStyle(color:Colors.black, fontSize: 16.0, ),),
      bodyText1: getGoogleFonts['Alegreya Sans'](TextStyle(color:Colors.black, fontSize: 14.0, ),),
    ),
  );


// final ThemeData themeData= ThemeData(
  
//     // Define the default brightness and colors.
//     accentColor: Colors.cyan[600],
//     backgroundColor: Colors.white,
//     buttonColor: Colors.orange,
//     cardColor: Colors.white,
//     //canvasColor: ,
//     //cursorColor: ,
//     //disabledColor: ,
//     //dividerColor: ,
//     //errorColor: ,
//     //focusColor: ,
//     //highlightColor: ,
//     //hintColor: ,
//     //hoverColor: ,
    
//     primaryColor: Colors.lightBlue[800],
//     primaryColorDark: Colors.black,
//     primaryColorLight: Colors.grey,
//     //splashColor: ,
//     secondaryHeaderColor: Colors.grey[300],
    
  
//     // Define the default font family.
//    // fontFamily: 'Georgia',ThemeData(
//      fontFamily: 'HelveticaNeue',
//       //),
//     // Define the default TextTheme. Use this to specify the default
//     // text styling for headlines, titles, bodies of text, and more.
//     textTheme: TextTheme(
//       headline1:getGoogleFonts['Bebas Neue'](TextStyle(fontSize: 340.0,color: Colors.white,)),
//       headline2: TextStyle( color:Colors.white, fontSize:30.0,fontWeight: FontWeight.bold),
//       headline3: TextStyle( color:Colors.white, fontSize:25.0),
//       headline5: TextStyle( color:Colors.white, fontSize: 20.0,fontWeight: FontWeight.bold),
//       headline6:TextStyle( color:Colors.white, fontSize: 16.0, fontWeight: FontWeight.bold),
//       subtitle1: TextStyle( color:Colors.white, fontSize:20.0),
//       subtitle2: TextStyle( color:Colors.white, fontSize:16.0),
//       bodyText1: getGoogleFonts['Hind'](TextStyle(fontSize: 16.0,color:Colors.white,letterSpacing: 1.5 )),
//       bodyText2: getGoogleFonts['Hind'](TextStyle(fontSize: 12.0,color:Colors.white)),
//     ),
//   );

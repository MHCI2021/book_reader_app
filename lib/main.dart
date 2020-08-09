import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:scroll_book/pages/homepage.dart';
import 'package:scroll_book/state/service_locator.dart';
import 'package:scroll_book/state/state.dart';
import 'package:scroll_book/utils/theme.dart';
import 'package:scroll_book/utils/vector_painter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  
  var appState= locator<AppState>();
  appState.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  // static FirebaseAnalytics analytics = FirebaseAnalytics();
  // static FirebaseAnalyticsObserver observer =
  //     FirebaseAnalyticsObserver(analytics: analytics);

  @override
  Widget build(BuildContext context) {

var appState= locator<AppState>();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: themeData,
      //navigatorObservers: [ observer],
      debugShowCheckedModeBanner: false,
      home:HomePage()
    //  appState.getCurrentScreen()
      
   
    );
  }
}

   // Scaffold(
      //   body: Center(
      //     child: Container(height:100, width:100.0,
      //     color: Colors.redAccent,
      //     child: 
      //     v.toWidget(h: 100, w: 100)),
      //   ),
      // )
      
      
      // appState.getCurrentScreen()
      //(Platform.isIOS || Platform.isAndroid)?LibraryListView(): 
      
//     VectorImg v= toVectorImage(svgData: '''<svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
// <rect width="24" height="24" fill="white" fill-opacity="0.01"/>
// <mask id="mask0" mask-type="alpha" maskUnits="userSpaceOnUse" x="0" y="0" width="24" height="24">
// <rect width="24" height="24" fill="white"/>
// </mask>
// <g mask="url(#mask0)">
// <path d="M20.5529 2H5.34822C4.29909 2 3.44763 2.86667 3.44763 3.93452M3.44763 3.93452C3.44763 5.00335 4.29909 5.86905 5.34822 5.86905H20.5529V22.247H5.34822C4.29909 22.247 3.44763 21.3813 3.44763 20.3125V3.93452Z" stroke="black" stroke-linecap="round" stroke-linejoin="round"/>
// <path d="M3.5 6H21V22H4L3.5 14L3.5 6Z" fill="black"/>
// </g>
// </svg>''');

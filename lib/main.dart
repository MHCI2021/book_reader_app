import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:scroll_book/mobile/pages/library/library_list_view.dart';
import 'package:scroll_book/mobile/pages/library/library_scroll_view.dart';
import 'package:scroll_book/state/service_locator.dart';
import 'package:scroll_book/state/state.dart';
import 'package:scroll_book/utils/theme.dart';
import 'dart:io';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  var appState= locator<AppState>();
  appState.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  static FirebaseAnalytics analytics = FirebaseAnalytics();
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: themeData,
      navigatorObservers: [
        observer
      ],
      debugShowCheckedModeBanner: false,
      home: (Platform.isIOS || Platform.isAndroid)?LibraryListView()
      : LibraryScrollView(),
    );
  }
}




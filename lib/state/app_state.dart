import 'package:flutter/material.dart';
import 'package:scroll_book/models/book.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:scroll_book/models/user.dart';
enum Overlays {
  BookOptions,
  ScrollSpeed,

}



class AppState extends ChangeNotifier {
  Map userProfileData;
  
  bool isPlaying = false;
  String fontFam='Alegreya Sans';
  double progress;
  UserModel currentUser, userProfile;
  List<LibraryBook> libBooks;

  AppState();
  BookModel get currentBook=>books[0];
  //LibraryBook get currentBook=>libBooks[0];

  play(){if(!isPlaying){isPlaying=true; notifyListeners();}}
  pause(){if(isPlaying){isPlaying=false; notifyListeners();}}

  Map getProfileData() => userProfileData ?? {};

  init()async {
    //cOXfQtu96Drok7c01qh1
    var dummyUser =  await Firestore.instance.collection('users').document('cOXfQtu96Drok7c01qh1').get();
    currentUser = UserModel.fromFirebase( dummyUser.documentID, dummyUser.data);
    libBooks = currentUser.library;
  }
  String getText(){
    return "";
  }
}


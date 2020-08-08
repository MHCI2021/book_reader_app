

import 'package:flutter/material.dart';
import 'package:scroll_book/utils/utils.dart';

import 'library_book_model.dart';

class UserModel {
  final String email;
  final String username;
  final String firstName;
  final String lastName;
  final String profilePic;
  List<LibraryBook> library;

  UserModel({
    @required this.email, 
    @required this.username, 
    this.firstName, 
    this.lastName, 
    this.profilePic,
    this.library
    });

  UserModel.fromFirebase(String id,Map<String, dynamic> map):
    this.email= safe("email",map),
    this.username= safe("username", map), 
    this.firstName=safe("firstName", map), 
    this.lastName= safe("lastName", map), 
    this.profilePic= safe("profilePic", map),
    this.library = safeGet(key:"library", map:map, alt: []).map<LibraryBook>((b)=>LibraryBook.fromFirebase(b)).toList();

}


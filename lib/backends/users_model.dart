import 'package:flutter/cupertino.dart';

// the users model class here

class User {
  String userName;
  String userImg;
  bool userIsOnline;

  User({this.userName, @required this.userImg, @required this.userIsOnline});
}

import 'package:flutter/cupertino.dart';

// the story model class goes here

class Story {
  String userImg;
  String userName;
  bool isViewed;

  Story(
      {@required this.userImg,
      @required this.userName,
      @required this.isViewed});
}

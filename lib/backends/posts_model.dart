// the post class model goes here
import 'package:flutter/cupertino.dart';

class Post {
  String userImg;
  String userName;
  String post;
  String time;
  int likes;
  int comments;

  Post(
      {@required this.userName,
      @required this.userImg,
      @required this.post,
      @required this.time,
      @required this.likes,
      @required this.comments});
}

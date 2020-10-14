import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// here, i am defining the colors and other gradient effects

class Palette {
  static const Color facebookBlue = Color(0xFF1777F2);

  static Color scaffoldColor = Colors.grey[200];

  static const LinearGradient storyGradient = LinearGradient(
      colors: [Colors.transparent, Colors.black26],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter);

  static const Color onlineColor = Color(0xFF4BCB1F);

  static const LinearGradient createRoomGradient =
      LinearGradient(colors: [Color(0xFF496AE1), Color(0xFFCE48B1)]);
}

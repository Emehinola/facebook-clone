import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:facebook/config/palette.dart';

class ProfileAvatar extends StatelessWidget {
  final String userImg;
  final bool userIsOnline;

  ProfileAvatar({@required this.userImg, @required this.userIsOnline});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: CircleAvatar(
              backgroundImage: AssetImage(userImg),
              backgroundColor: Colors.grey[200]),
        ),
        Positioned(
          bottom: 4,
          right: 0,
          child: Container(
            height: 10,
            width: 10,
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.white),
                shape: BoxShape.circle,
                color: Palette.onlineColor),
          ),
        )
      ],
    );
  }
}

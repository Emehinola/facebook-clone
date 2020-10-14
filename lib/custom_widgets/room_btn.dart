// program to create room button outline

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:facebook/config/palette.dart';

class RoomBtn extends StatelessWidget {
  final Function onPressed;

  RoomBtn({@required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
        onPressed: onPressed,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        borderSide: BorderSide(color: Colors.blueAccent[200], width: 3.0),
        child: Row(
          children: [
            ShaderMask(
                child: Icon(Icons.video_call, color: Colors.white),
                shaderCallback: (rect) =>
                    Palette.createRoomGradient.createShader(rect)),
            Text('Create \n Room', style: TextStyle(color: Colors.blue))
          ],
        ));
  }
}

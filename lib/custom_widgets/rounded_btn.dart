import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// custom roun buttons here

class RoundBtn extends StatelessWidget {
  final Widget icon;
  final Function onPressed;

  RoundBtn({@required this.icon, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 8),
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey[200],
        ),
        child: IconButton(
          icon: icon,
          onPressed: onPressed,
          color: Colors.black,
          iconSize: 30,
          alignment: Alignment.center,
        ));
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReactionBtn extends StatelessWidget {
  final IconData icon;
  final Function onPressed;
  final String text;

  ReactionBtn(
      {@required this.icon, @required this.onPressed, @required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(300)),
      child: FlatButton.icon(
          icon: Icon(icon, color: Colors.grey),
          label: Text(text),
          onPressed: onPressed),
    );
  }
}

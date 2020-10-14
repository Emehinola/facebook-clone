// add to story custom style

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddToStory extends StatelessWidget {
  final String img;
  final String story;
  final String userName;
  final bool isViewed;

  AddToStory(
      {@required this.img,
      @required this.story,
      @required this.userName,
      this.isViewed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10),
      height: double.infinity,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              img,
              height: double.infinity,
              // width: 120,
            ),
          ),
          Positioned(
              left: 6,
              bottom: 6,
              child: Text('$userName',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold))),
          Positioned(
              top: 10,
              left: 10,
              child: Container(
                height: 45,
                width: 45,
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(600),
                    color: Colors.blue,
                    border: Border.all(color: Colors.blue, width: 2)),
                child: Center(
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 35,
                  ),
                ),
              ))
        ],
      ),
    );
  }
}

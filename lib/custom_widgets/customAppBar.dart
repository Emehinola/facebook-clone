import 'package:facebook/custom_widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:facebook/config/palette.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: AppBar(
      backgroundColor: Colors.white,
      title: Text('facebook',
          style: TextStyle(
              color: Palette.facebookBlue,
              fontSize: 35,
              letterSpacing: -1.2,
              fontWeight: FontWeight.bold)),
      actions: [
        RoundBtn(
          icon: Icon(Icons.search),
          onPressed: () {
            print('search clicked');
          },
        ),
        RoundBtn(
          icon: Icon(MdiIcons.facebookMessenger),
          onPressed: () {
            print('messenger clicked');
          },
        )
      ],
      bottom: PreferredSize(
          child: BottomBar(),
          preferredSize:
              Size(MediaQuery.of(context).size.width, kToolbarHeight)),
    ));
  }
}

// the bottom app bar here
class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabs: [Tab(icon: Icon(Icons.home, color: Colors.black))],
    );
  }
}

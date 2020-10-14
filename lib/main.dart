// project to clone facebook app design for android device

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:facebook/screen_views/screens.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: NavBar());
  }
}

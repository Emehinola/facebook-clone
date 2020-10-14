import 'package:facebook/screen_views/screens.dart';
import 'package:facebook/config/palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:facebook/custom_widgets/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> with SingleTickerProviderStateMixin {
  TabController _tabController; // for controlling tabs
  bool _loading = true; // for loading at start up
  int _currentIndex = 0;
  final _pages = [
    Home(),
    Scaffold(
      body: Center(child: Text('requests here...')),
    ),
    Scaffold(
      body: Center(child: Text('Messages here...')),
    ),
    Scaffold(
      body: Center(child: Text('videos here...')),
    ),
    Scaffold(
      body: Center(child: Text('notifications here...')),
    ),
    Scaffold(
      body: Center(child: Text('menu here...')),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
    futureLoader();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  _tabPressed(index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Future<void> futureLoader() async {
    await loader();
  }

  Future<void> loader() async {
    await Future.delayed(
        Duration(seconds: 3),
        () => setState(() {
              _loading = false;
            }));
  }

  @override
  Widget build(BuildContext context) {
    final List tabs = [
      Icons.home,
      MdiIcons.accountCircleOutline,
      MdiIcons.facebookMessenger,
      Icons.ondemand_video,
      MdiIcons.bellOutline,
      Icons.menu
    ]; // this holds the list of icons for the tab

    return _loading
        ? Scaffold(
            body: Center(
                child: CircularProgressIndicator())) // for loading at start up
        : Scaffold(
            backgroundColor: Palette.scaffoldColor,
            appBar: PreferredSize(
              preferredSize: Size(double.infinity, 110),
              child: Container(
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
                  bottom: TabBar(
                      indicator: null,
                      isScrollable: false,
                      onTap: _tabPressed,
                      tabs: tabs
                          .asMap()
                          .map((index, e) {
                            return MapEntry(
                                index,
                                Tab(
                                    icon: Icon(e,
                                        color: index == _currentIndex
                                            ? Palette.facebookBlue
                                            : Colors.black45,
                                        size: 30)));
                          })
                          .values
                          .toList(),
                      controller: _tabController),
                ),
              ),
            ),
            body: IndexedStack(index: _currentIndex, children: _pages));
    // body: TabBarView(
    //   children: _pages,
    //   controller: _tabController,
    // ));
  }
}

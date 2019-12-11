import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import './shark_page/index.dart';
import './user_page/index.dart';
import './home_page/index.dart';

class Layout extends StatefulWidget {
  @override
  _LayoutState createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  PageController _pageController;

  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(
      icon:Icon(Icons.dvr),
      title:Text('状态监控')
    ),
    BottomNavigationBarItem(
      icon:Icon(CupertinoIcons.search),
      title:Text('震动监控')
    ),
    BottomNavigationBarItem(
      icon:Icon(CupertinoIcons.profile_circled),
      title:Text('会员中心')
    ),
  ];

  final List<Widget> tabBodies = [
    HomePage(),
    SharkPage(),
    UserPage(),
  ];

  int currentIndex= 0;
  var currentPage;

  @override
  void initState() { 
    currentPage = tabBodies[currentIndex];
    _pageController = new PageController()
      ..addListener(() {
        if (currentPage != _pageController.page.round()) {
          setState(() {
            currentPage = _pageController.page.round();
          });
        }
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
      bottomNavigationBar: BottomNavigationBar(
        type:BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        items:bottomTabs,
        onTap: (index){
          setState(() {
            currentIndex = index;
            currentPage = tabBodies[currentIndex]; 
          });
        },
      ),
      body: IndexedStack(
        index: currentIndex,
        children: tabBodies
      )
    );
  }
}
import 'package:flutter/material.dart';
import './shark_page/index.dart';
import './user_page/index.dart';
import './home_page/index.dart';
import '../components/myIcons.dart';

class Layout extends StatefulWidget {
  @override
  _LayoutState createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {

  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(
      icon:Icon(Icons.dvr),
      title:Text('状态监控')
    ),
    BottomNavigationBarItem(
      icon:Icon(MyIcons.vibration),
      title:Text('震动监控')
    ),
    BottomNavigationBarItem(
      icon:Icon(MyIcons.user),
      title:Text('会员中心')
    ),
  ];

  final List<Widget> tabBodies = [
    HomePage(),
    SharkPage(),
    UserPage(),
  ];

  int currentIndex= 0;
  PageController pageController = PageController(initialPage: 0,keepPage: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        items:bottomTabs,
        onTap: (index)=> pageController.animateToPage(index,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut
        ),
      ),
      body: PageView(
        onPageChanged: (i) => setState(()=> currentIndex = i),
        controller: pageController,
        children: tabBodies,
      )
    );
  }
}
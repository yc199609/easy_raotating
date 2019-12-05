import 'package:flutter/material.dart';
import './login_page/index.dart';
import './home_page/index.dart';

class IndexPage extends StatefulWidget {
  IndexPage({Key key}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  bool isLogin = false;
  void login(){
    setState(() {
      isLogin = true;
    });
  }
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: isLogin?HomePage():LoginPage(login:login),
    );
  }
}
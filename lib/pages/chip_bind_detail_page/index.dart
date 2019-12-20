import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../components/myExpansionTile.dart';

class ChipBindDetailPage extends StatefulWidget {
  ChipBindDetailPage({Key key}) : super(key: key);

  @override
  _ChipBindDetailPageState createState() => _ChipBindDetailPageState();
}

class _ChipBindDetailPageState extends State<ChipBindDetailPage> {
  int activeInt;
  bool isActive(int n){
    return n == activeInt;
  }

  @override
  void initState() {
    activeInt = -1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Scaffold(
      appBar: AppBar(title: Text('设备信息'),),
      backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
      body: ListView(
        children: [
          MyExpansionTile(
            onTap: (){
              setState(() {
                activeInt = activeInt == 0 ? -1 : 0;
              });
            },
            isExpanded: isActive(0),
            title:Text('好友'),
            children: <Widget>[
              ListTile(title: Text('我的好友1')),
              ListTile(title: Text('我的好友1'))
            ],
          ),
          MyExpansionTile(
            onTap: (){
              setState(() {
                activeInt = activeInt == 1 ? -1 : 1;
              });
            },
            isExpanded: isActive(1),
            title:Text('家人'),
            children: <Widget>[
              ListTile(title: Text('我的家人1')),
              ListTile(title: Text('我的家人1')),
              ListTile(title: Text('我的家人1')),
              ListTile(title: Text('我的家人1')),
              ListTile(title: Text('我的家人1')),
              ListTile(title: Text('我的家人1')),
              ListTile(title: Text('我的家人1')),
              ListTile(title: Text('我的家人1')),
            ],
          ),
          MyExpansionTile(
            onTap: (){
              setState(() {
                activeInt = activeInt == 2 ? -1 : 2;
              });
            },
            isExpanded: isActive(2),
            title:Text('朋友'),
            children: <Widget>[
              ListTile(title: Text('我的朋友1')),
              ListTile(title: Text('我的朋友1')),
              ListTile(title: Text('我的朋友1')),
              ListTile(title: Text('我的朋友1'))
            ],
          ),
        ],
      ),
    );
  }
}


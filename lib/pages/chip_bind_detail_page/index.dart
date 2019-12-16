import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      body: SingleChildScrollView(
        child: ExpansionPanelList(
          expansionCallback: (index,torf){
            setState(() {
              if(torf){
                activeInt = -1;
              }else{
                activeInt = index;
              }
            });
          },
          children: [
            ExpansionPanel(
              isExpanded: isActive(0),
              headerBuilder: (context,isExpanded){
                return ListTile(
                  title:Text('好友')
                );
              },
              body: Column(
                children: <Widget>[
                  ListTile(title: Text('我的好友1')),
                  ListTile(title: Text('我的好友1')),
                  ListTile(title: Text('我的好友1')),
                  ListTile(title: Text('我的好友1')),
                  ListTile(title: Text('我的好友1')),
                  ListTile(title: Text('我的好友1')),
                  ListTile(title: Text('我的好友1')),
                  ListTile(title: Text('我的好友1')),
                  ListTile(title: Text('我的好友1')),
                  ListTile(title: Text('我的好友1')),
                  ListTile(title: Text('我的好友1')),
                  ListTile(title: Text('我的好友1')),
                  ListTile(title: Text('我的好友1')),
                  ListTile(title: Text('我的好友1')),
                ],
              )
            ),
            ExpansionPanel(
              isExpanded: isActive(1),
              headerBuilder: (context,isExpanded){
                return ListTile(
                  title:Text('家人')
                );
              },
              body: Column(
                children: <Widget>[
                  ListTile(title: Text('我的家人1')),
                  ListTile(title: Text('我的家人1')),
                  ListTile(title: Text('我的家人1')),
                  ListTile(title: Text('我的家人1')),
                  ListTile(title: Text('我的家人1')),
                  ListTile(title: Text('我的家人1')),
                  ListTile(title: Text('我的家人1')),
                  ListTile(title: Text('我的家人1')),
                  ListTile(title: Text('我的家人1')),
                  ListTile(title: Text('我的家人1')),
                  ListTile(title: Text('我的家人1')),
                  ListTile(title: Text('我的家人1')),
                  ListTile(title: Text('我的家人1')),
                  ListTile(title: Text('我的家人1')),
                ],
              )
            ),
            ExpansionPanel(
              isExpanded: isActive(2),
              headerBuilder: (context,isExpanded){
                return ListTile(
                  title:Text('朋友')
                );
              },
              body: Column(
                children: <Widget>[
                  ListTile(title: Text('我的朋友1')),
                  ListTile(title: Text('我的朋友1')),
                  ListTile(title: Text('我的朋友1')),
                  ListTile(title: Text('我的朋友1')),
                  ListTile(title: Text('我的朋友1')),
                  ListTile(title: Text('我的朋友1')),
                  ListTile(title: Text('我的朋友1')),
                  ListTile(title: Text('我的朋友1')),
                  ListTile(title: Text('我的朋友1')),
                  ListTile(title: Text('我的朋友1')),
                  ListTile(title: Text('我的朋友1')),
                  ListTile(title: Text('我的朋友1')),
                  ListTile(title: Text('我的朋友1')),
                  ListTile(title: Text('我的朋友1')),
                ],
              )
            ),
          ],
        ),
      )
    );
  }
}


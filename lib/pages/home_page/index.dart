import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './status/index.dart';
import '../../components/myExpansionTile.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      appBar: AppBar(
        title: Text('设备状态监控'),
      ),
      backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
      body: ListView(
        children: <Widget>[
          MyExpansionTile(
            onTap: (){
              setState(() {
                activeInt = activeInt == 0 ? -1 : 0;
              });
            },
            isExpanded: isActive(0),
            title:Text('保定容城'),
            children: List.generate(5, (i)=>(
              ListTile(
                leading: Container(
                  width: ScreenUtil().setWidth(176),
                  height: ScreenUtil().setHeight(162),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        child: Image.network(
                          'https://cdn.gosafenet.com/static/weixin/static/device.png',
                          width: ScreenUtil().setWidth(169),
                          height: ScreenUtil().setHeight(95),
                        ),
                        bottom: 0,
                      ),
                      Positioned(
                        top: 0,
                        child: Container(
                          width: ScreenUtil().setWidth(44),
                          height: ScreenUtil().setWidth(44),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.only(bottomRight:Radius.circular(ScreenUtil().setWidth(40)) )
                          ),
                          child: Text('在线',style: TextStyle(color: Colors.white,fontSize: ScreenUtil().setSp(18)),),
                        ),
                      )
                    ],
                  ),
                ),
                title: Text('设备名称$i') ,
                subtitle: Text('$i中的内容'),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: (){
                  Navigator.push( context,
                    MaterialPageRoute(
                      builder: (context){
                        return StatusPage();
                      }
                    )
                  );
                },
              )
            )),
          ),
          MyExpansionTile(
            onTap: (){
              setState(() {
                activeInt = activeInt == 1 ? -1 : 1;
              });
            },
            isExpanded: isActive(1),
            title:Text('南方泵业'),
            children: List.generate(5, (i)=>(
              ListTile(
                leading: Container(
                  width: ScreenUtil().setWidth(176),
                  height: ScreenUtil().setHeight(162),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        child: Image.network(
                          'https://cdn.gosafenet.com/static/weixin/static/device.png',
                          width: ScreenUtil().setWidth(169),
                          height: ScreenUtil().setHeight(95),
                        ),
                        bottom: 0,
                      ),
                      Positioned(
                        top: 0,
                        child: Container(
                          width: ScreenUtil().setWidth(44),
                          height: ScreenUtil().setWidth(44),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.only(bottomRight:Radius.circular(ScreenUtil().setWidth(40)) )
                          ),
                          child: Text('在线',style: TextStyle(color: Colors.white,fontSize: ScreenUtil().setSp(18)),),
                        ),
                      )
                    ],
                  ),
                ),
                title: Text('设备名称$i') ,
                subtitle: Text('$i中的内容'),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: (){
                  Navigator.push( context,
                    MaterialPageRoute(
                      builder: (context){
                        return StatusPage();
                      }
                    )
                  );
                },
              )
            )),
          ),
          MyExpansionTile(
            onTap: (){
              setState(() {
                activeInt = activeInt == 2 ? -1 : 2;
              });
            },
            isExpanded: isActive(2),
            title:Text('新沙水厂'),
            children: List.generate(5, (i)=>(
              ListTile(
                leading: Container(
                  width: ScreenUtil().setWidth(176),
                  height: ScreenUtil().setHeight(162),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        child: Image.network(
                          'https://cdn.gosafenet.com/static/weixin/static/device.png',
                          width: ScreenUtil().setWidth(169),
                          height: ScreenUtil().setHeight(95),
                        ),
                        bottom: 0,
                      ),
                      Positioned(
                        top: 0,
                        child: Container(
                          width: ScreenUtil().setWidth(44),
                          height: ScreenUtil().setWidth(44),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.only(bottomRight:Radius.circular(ScreenUtil().setWidth(40)) )
                          ),
                          child: Text('在线',style: TextStyle(color: Colors.white,fontSize: ScreenUtil().setSp(18)),),
                        ),
                      )
                    ],
                  ),
                ),
                title: Text('设备名称$i') ,
                subtitle: Text('$i中的内容'),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: (){
                  Navigator.push( context,
                    MaterialPageRoute(
                      builder: (context){
                        return StatusPage();
                      }
                    )
                  );
                },
              )
            )),
          ),
        ],
      )
    );
  }
}

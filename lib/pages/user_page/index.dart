import '../../components/institutions_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  void changeInstitutions(context) async {
    var s = await showDialog(
      context: context,
      builder: (context) {
        return MyDialog(groupValue: 1);
      }
    );
  }

  void logout(BuildContext context) async {
    var s = await showDialog(
      context: context,
      builder: (context) {
        return new AlertDialog(
          title: new Text("退出登录?"),
          actions: <Widget>[
            new FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: new Text("取消"),
            ),
            new FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: new Text("确认"),
            ),
          ],
        );
      }
    );
  }
  
  List itemList;

  @override
  void initState() {
    itemList = [
      {
        'name':'设备交接',
        'imgUrl':'https://cdn.gosafenet.com/static/weixin/static/equipment_handover.png'
      },
      {
        'name':'芯片注册',
        'imgUrl':'https://cdn.gosafenet.com/static/weixin/static/chip_register.png'
      },
      {
        'name':'切换机构',
        'imgUrl':'https://cdn.gosafenet.com/static/weixin/static/institutions_handover.png',
        "fn":changeInstitutions
      },
      {
        'name':'退出登录',
        'imgUrl':'https://cdn.gosafenet.com/static/weixin/static/logout.png',
        "fn":logout
      }
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
      body: Column(
        children: <Widget>[
          userBar(),
          Container(
            width: ScreenUtil().setWidth(750),
            height: ScreenUtil().setHeight(564),
            margin: EdgeInsets.only(top: ScreenUtil().setHeight(118)),
            padding: EdgeInsets.only(left: ScreenUtil().setWidth(10)),
            child: Wrap(
              spacing: ScreenUtil().setWidth(10), // 主轴(水平)方向间距
              runSpacing: ScreenUtil().setHeight(10), // 纵轴（垂直）方向间距
              children: List.generate(itemList.length, (i)=>(
                buttonItem(itemList[i])
              ))
            )
          )
        ],
      )
    );
  }

  Widget buttonItem(item){
    return InkWell(
      child: Ink(
        color: Colors.white,
        width: ScreenUtil().setWidth(360),
        height: ScreenUtil().setHeight(277),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              child:Image.network(
                item['imgUrl'],
                width: ScreenUtil().setWidth(77),
                fit: BoxFit.fitWidth,
              ),
              padding: EdgeInsets.only(right: ScreenUtil().setWidth(5)),
            ),
            Text(
              item['name'],
              style: TextStyle(
                color: Colors.grey,
                fontSize: ScreenUtil().setSp(42),
                fontWeight: FontWeight.w700
              ),
            )
          ],
        ),
      ),
      onTap: () {
        if(item.containsKey('fn')){
          item['fn'](context);
        }
      },
    );
  }

  Widget userBar(){
    return Stack(
      children: <Widget>[
        Image.network(
          'https://cdn.gosafenet.com/static/weixin/static/login/login.png',
          width: ScreenUtil().setWidth(750),
          height: ScreenUtil().setHeight(444),
          fit: BoxFit.fitWidth,
        ),
        Positioned(
          top: ScreenUtil().setHeight(112),
          left: ScreenUtil().setWidth(305.5),
          child: CircleAvatar(
            radius: ScreenUtil().setWidth(70),
            backgroundImage: AssetImage('assets/images/avatar.jpeg'),
          )
        ),
        Positioned(
          top: ScreenUtil().setHeight(282),
          child: Container(
            width: ScreenUtil().setWidth(750),
            child:Text('伟大的袁常',
              style: TextStyle(
                color: Colors.white,
                fontSize: ScreenUtil().setSp(40)
              ),
              textAlign: TextAlign.center,
            ),
          ),
        )
      ],
    );
  }
}
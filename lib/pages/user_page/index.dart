import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserPage extends StatelessWidget {
  final itemList = [
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
      'imgUrl':'https://cdn.gosafenet.com/static/weixin/static/institutions_handover.png'
    },
    {
      'name':'退出登录',
      'imgUrl':'https://cdn.gosafenet.com/static/weixin/static/logout.png'
    }
  ];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
      body: Column(
        children: <Widget>[
          Stack(
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
          ),
          Container(
            width: ScreenUtil().setWidth(750),
            height: ScreenUtil().setHeight(564),
            margin: EdgeInsets.only(top: ScreenUtil().setHeight(118)),
            padding: EdgeInsets.only(left: ScreenUtil().setWidth(10)),
            child: Wrap(
              spacing: ScreenUtil().setWidth(10), // 主轴(水平)方向间距
              runSpacing: ScreenUtil().setHeight(10), // 纵轴（垂直）方向间距
              children: List.generate(itemList.length, (i)=>(
                Container(
                  color: Colors.white,
                  width: ScreenUtil().setWidth(360),
                  height: ScreenUtil().setHeight(277),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        child:Image.network(
                          itemList[i]['imgUrl'],
                          width: ScreenUtil().setWidth(77),
                          fit: BoxFit.fitWidth,
                        ),
                        padding: EdgeInsets.only(right: ScreenUtil().setWidth(5)),
                      ),
                      Text(
                        itemList[i]['name'],
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: ScreenUtil().setSp(42),
                          fontWeight: FontWeight.w700
                        ),
                      )
                    ],
                  ),
                )
              ))
            )
          )
        ],
      )
    );
  }
}
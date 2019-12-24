import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './detail/index.dart';

class EquipmentErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Scaffold(
      appBar: AppBar(title: Text('设备故障列表'),),
      body: ListView(
        children: <Widget>[
          header(context),
          myListTile(context),
          myListTile(context),
          myListTile(context),
        ],
      ),
    );
  }
}

Widget header(BuildContext context){
  return Card(
    child: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Image.network('https://cdn.gosafenet.com/static/weixin/static/warn.png',
            width: ScreenUtil().setWidth(188),
            height: ScreenUtil().setHeight(188),
          ),
          Text('安波宁德五号车间空压机',
            style: TextStyle(
              color: Colors.grey,
              fontSize: ScreenUtil().setSp(24)
            ),
          ),
          Text('AATJ00018000810000000065',
            style: TextStyle(
              color: Colors.grey,
              fontSize: ScreenUtil().setSp(20)
            ),
          )
        ],
      ),
      height: ScreenUtil().setHeight(314),
    ),
  );
}

Widget myListTile(BuildContext context){
  ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
  return Card(
    child: InkWell(
      onTap: (){
        Navigator.push( context,
          MaterialPageRoute(
            builder: (context){
              return EquipmentErrorDetail();
            }
          )
        );
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(10), ScreenUtil().setHeight(18), ScreenUtil().setWidth(10), ScreenUtil().setHeight(18)),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Theme.of(context).dividerColor))
        ),
        child:Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('故障时间:',
                  style: TextStyle(fontSize: ScreenUtil().setSp(30)),
                ),
                Text('故障类型:',
                  style: TextStyle(fontSize: ScreenUtil().setSp(30)),
                ),
                Text('故障类型:',
                  style: TextStyle(fontSize: ScreenUtil().setSp(30)),
                ),
              ],
            ),
            Icon(Icons.keyboard_arrow_right),
          ],
        ),
      ),
    )
  );
  
}
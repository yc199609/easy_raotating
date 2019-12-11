import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EquipmentHandoverPage extends StatelessWidget {
  const EquipmentHandoverPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('设备交接'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: (){
              showDialog(
                context: context,
                builder: (context) {
                  return new AlertDialog(
                    title: new Text("领用新设备"),
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
            },
          )
        ],
      ),
      backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
      body: ListView.builder(
        itemExtent: ScreenUtil().setHeight(170),
        itemCount:5,
        itemBuilder: (BuildContext context,int index) => 
          Card(
            child:InkWell(
              child:Ink(
                child:Row(
                  mainAxisAlignment:MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          child: Image.network('https://cdn.gosafenet.com/static/weixin/static/device.png',
                            height: ScreenUtil().setHeight(146),
                            width: ScreenUtil().setWidth(146),
                            fit: BoxFit.fitHeight,
                          ),
                          margin: EdgeInsets.only(right: 10),
                        ),
                        Column(
                          mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment:CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('这是第$index项',style: TextStyle(fontSize: ScreenUtil().setSp(32),color: Colors.grey),),
                            Text('这是sub',style: TextStyle(fontSize: ScreenUtil().setSp(28),color: Colors.grey))
                          ],
                        ),
                      ],
                    ),
                    Icon(Icons.keyboard_arrow_right)
                  ]
                ),
                height: ScreenUtil().setHeight(170),
                padding: EdgeInsets.all(5),
              ),
              onTap: (){},
            )      
          )
      ),
    );
  }
}
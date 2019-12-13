import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../components/search_bar.dart';

class ChipBindPage extends StatelessWidget {
  const ChipBindPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title:Text('芯片绑定'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: (){
                showSearch(context: context, delegate: SearchBarDelegate());
              },
            )
          ],
        ),
        backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: ScreenUtil().setWidth(10)),
              child: Text('设备列表',style: TextStyle(color: Colors.grey,fontSize: ScreenUtil().setSp(34)),),
            ),
            Padding(
              padding: EdgeInsets.only(left: ScreenUtil().setWidth(10)),
              child: Text('点击对应设备,进行NFC芯片绑定',style: TextStyle(color: Colors.grey,fontSize: ScreenUtil().setSp(18)),),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (BuildContext context,int index)=>
                  Card(
                    child: ListTile(
                      title: Text('南方泵业宿舍1号水泵'),
                      subtitle: Text('AATJ00018000810000000087'),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: (){},
                    ),
                  ),
                itemCount: 5,
              ),
            )
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './status_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Scaffold(
      appBar: AppBar(title: Text('设备状态监控')),
      backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
      body: new ListView.builder(
        itemBuilder: (BuildContext context, int index) => new EntryItem(data[index]),
        itemCount: data.length,
      )
    );
  }
}

class Entry {
  Entry(this.title, [this.children = const <Entry>[]]);
  final String title;
  final List<Entry> children;
}

final List<Entry> data = <Entry>[
  new Entry('Chapter A',
    <Entry>[
      new Entry('Section A0'),
      new Entry('Section A1'),
      new Entry('Section A2'),
    ],
  ),
  new Entry('Chapter B',
    <Entry>[
      new Entry('Section B0'),
      new Entry('Section B1'),
    ],
  ),
  new Entry('Chapter C',
  ),
];

class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);
  final Entry entry;

  Widget _buildTiles(BuildContext context,Entry root) {
    if (root.children.isEmpty)
      return new ListTile(title: new Text(root.title));
    return new ExpansionTile(
      // backgroundColor:Colors.white,
      key: new PageStorageKey<Entry>(root),
      title: new Text(root.title),
      children: root.children.map((item) => _childrenItems(context, item)).toList(),
    );
  }

  Widget _childrenItems(BuildContext context,item) {
    return Card(
      child: ListTile(
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
      title: Text(item.title) ,
      subtitle: Text('A strong animal'),
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
    ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(context,entry);
  }
}
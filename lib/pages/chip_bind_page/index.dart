import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../components/myExpansionTile.dart';
import '../../components/search_bar.dart';
import './detail/index.dart';

class ChipBindPage extends StatefulWidget {
  ChipBindPage({Key key}) : super(key: key);

  @override
  _ChipBindDetailPageState createState() => _ChipBindDetailPageState();
}

class _ChipBindDetailPageState extends State<ChipBindPage> {
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
        title: Text('设备信息'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: (){
              Navigator.push( context,
                MaterialPageRoute(
                  builder: (context){
                    return ChipBindDetail();
                  }
                )
              );
            },
          )
        ],
      ),
      backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
      body: ListView(
        children: [
          SearchBarDemo(),
          MyExpansionTile(
            onTap: (){
              setState(() {
                activeInt = activeInt == 0 ? -1 : 0;
              });
            },
            isExpanded: isActive(0),
            title:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('南方泵业宿舍1号水泵',style: TextStyle(
                  fontSize: ScreenUtil().setSp(30)
                ),),
                Text('AATJ00018000810000000087',style: TextStyle(
                  fontSize: ScreenUtil().setSp(24),
                  color: Colors.grey
                ),)
              ],
            ),
            children: List.generate(5, (i)=>(
              Slidable(
                actionPane: SlidableScrollActionPane(),//滑出选项的面板 动画
                actionExtentRatio: 0.25,
                child: ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset('assets/images/chip.png',width: 56,height: 55),
                  ),
                  title: Text('DSFSDSGDSGSDF$i'),
                  subtitle: Text('前轴承'),
                ),
                secondaryActions: <Widget>[//右侧按钮列表
                  IconSlideAction(
                    caption: 'More',
                    color: Colors.black45,
                    icon: Icons.more_horiz,
                    onTap: (){},
                  ),
                  IconSlideAction(
                    caption: 'Delete',
                    color: Colors.red,
                    icon: Icons.delete,
                    closeOnTap: false,
                    onTap: (){},
                  ),
                ],
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
            title:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('南方泵业宿舍2号水泵',style: TextStyle(
                  fontSize: ScreenUtil().setSp(30)
                ),),
                Text('AATJ000180008100002323087',style: TextStyle(
                  fontSize: ScreenUtil().setSp(24),
                  color: Colors.grey
                ),)
              ],
            ),
            children: List.generate(5, (i)=>(
              Slidable(
                actionPane: SlidableScrollActionPane(),//滑出选项的面板 动画
                actionExtentRatio: 0.25,
                child: ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset('assets/images/chip.png',width: 56,height: 55),
                  ),
                  title: Text('DSFSDSGDSGSDF$i'),
                  subtitle: Text('后轴承'),
                ),
                secondaryActions: <Widget>[//右侧按钮列表
                  IconSlideAction(
                    caption: 'More',
                    color: Colors.black45,
                    icon: Icons.more_horiz,
                    onTap: (){},
                  ),
                  IconSlideAction(
                    caption: 'Delete',
                    color: Colors.red,
                    icon: Icons.delete,
                    closeOnTap: false,
                    onTap: (){},
                  ),
                ],
              )
            ))
          ),
          MyExpansionTile(
            onTap: (){
              setState(() {
                activeInt = activeInt == 2 ? -1 : 2;
              });
            },
            isExpanded: isActive(2),
            title:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('南方泵业宿舍3号水泵',style: TextStyle(
                  fontSize: ScreenUtil().setSp(30)
                ),),
                Text('AATJ000180008100002323087',style: TextStyle(
                  fontSize: ScreenUtil().setSp(24),
                  color: Colors.grey
                ),)
              ],
            ),
            children: List.generate(5, (i)=>(
              Slidable(
                actionPane: SlidableScrollActionPane(),//滑出选项的面板 动画
                actionExtentRatio: 0.25,
                child: ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset('assets/images/chip.png',width: 56,height: 55),
                  ),
                  title: Text('DSFSDSGDSGSDF$i'),
                  subtitle: Text('左侧面'),
                ),
                secondaryActions: <Widget>[//右侧按钮列表
                  IconSlideAction(
                    caption: 'More',
                    color: Colors.black45,
                    icon: Icons.more_horiz,
                    onTap: (){},
                  ),
                  IconSlideAction(
                    caption: 'Delete',
                    color: Colors.red,
                    icon: Icons.delete,
                    closeOnTap: false,
                    onTap: (){},
                  ),
                ],
              )
            ))
          ),
        ],
      ),
    );
  }
}


class SearchBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52.0,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: new RaisedButton.icon(
          label: Text('搜索',style: TextStyle(color: Colors.grey),),
          icon: Icon(Icons.search,color: Colors.grey,),
          onPressed: (){
            showSearch(context: context, delegate: SearchBarDelegate());
          },
          color: Colors.white,
          shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        )
      ),
    );
  }
}

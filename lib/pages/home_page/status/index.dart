import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../components/myIcons.dart';
import './current.dart';
import './voltage.dart';
import './temperature.dart';
import './warn.dart';
import './pressure.dart';
import 'package:badges/badges.dart';

class StatusPage extends StatefulWidget {
  @override
  _StatusPageState createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> with SingleTickerProviderStateMixin {

  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('南方泵业宿舍1号水泵'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.error),
            onPressed: (){
              Navigator.of(context).pushNamed("/equipment_error");
            },
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Card(
            child:Container(
              padding: EdgeInsets.all(2),
              width: ScreenUtil().setWidth(750),
              height: ScreenUtil().setHeight(180),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('运行状态:运行',style: TextStyle(fontSize: ScreenUtil().setSp(30)),),
                      Text('更新时间:08/07 17:26',style: TextStyle(fontSize: ScreenUtil().setSp(30)))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('功率因数:0.84',style: TextStyle(fontSize: ScreenUtil().setSp(30))),
                      Text('运行时长:70000',style: TextStyle(fontSize: ScreenUtil().setSp(30))),
                      Text('消耗电量:33333.3',style: TextStyle(fontSize: ScreenUtil().setSp(30)))
                    ],
                  )
                  
                ],
              )
            )
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Material(
                  child: TabBar(
                    indicatorColor:Colors.lightBlue,
                    controller: _tabController,
                    tabs: <Widget>[
                      Tab(icon: Icon(MyIcons.current,color: Colors.grey,),),
                      Tab(icon: Icon(MyIcons.voltage,color: Colors.grey),),
                      Tab(icon: Icon(MyIcons.temperature,color: Colors.grey),),
                      Tab(icon: Icon(MyIcons.pressure,color: Colors.grey),),
                      Badge(
                        position: BadgePosition.topRight(top: -0, right: -15),
                        badgeContent: Text('3',style: TextStyle(color: Colors.white),),
                        child: Tab(icon: Icon(MyIcons.warn,color: Colors.grey),),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: <Widget>[
                      Current(),
                      Voltage(),
                      Temperature(),
                      Pressure(),
                      Warn()
                    ],
                  ),
                )
              ]
            ),
          )
        ],
      ),
    );
  }
}

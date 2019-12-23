import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../components/myIcons.dart';
import './current.dart';
import './voltage.dart';
import './temperature.dart';
import './warn.dart';
import './pressure.dart';

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
              width: ScreenUtil().setWidth(750),
              child: Column(
                children: <Widget>[
                  Text('运行状态:运行'),
                  Text('功率因数:0.84'),
                  Text('运行时长:70000'),
                  Text('更新时间:08/07/17:26')
                ],
              )
            )
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Material(
                  color: Colors.indigo,
                  child: TabBar(
                    indicatorColor:Colors.lightBlue,
                    controller: _tabController,
                    tabs: <Widget>[
                      Tab(icon: Icon(MyIcons.current),),
                      Tab(icon: Icon(MyIcons.voltage),),
                      Tab(icon: Icon(MyIcons.temperature),),
                      Tab(icon: Icon(MyIcons.pressure),),
                      Tab(icon: Icon(MyIcons.warn),)
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

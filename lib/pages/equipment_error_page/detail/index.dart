import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';

class EquipmentErrorDetail extends StatelessWidget {
  
  List<TimelineModel> items = [
      TimelineModel(Placeholder(),
          position: TimelineItemPosition.random,
          iconBackground: Colors.redAccent,
          icon: Icon(Icons.blur_circular)),
      TimelineModel(Placeholder(),
          position: TimelineItemPosition.random,
          iconBackground: Colors.redAccent,
          icon: Icon(Icons.blur_circular)),
    ];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Scaffold(
      appBar: AppBar(title: Text('设备故障详情'),),
      body: ListView(
        children: <Widget>[
          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Text('安波宁德五号车间空压机'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('故障类型:通知'),
                    Text('故障时间:2019-08-19 5:59:32')
                  ],
                ),
                Text('故障症状:'),
                Text('真实原因:'),
                Text('责任员工:')
              ],
            ),
          ),
          Timeline.builder(
            itemBuilder: centerTimelineBuilder,
            itemCount: items.length,
            physics:  NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            position: TimelinePosition.Left
          ),
        ],
      )

    );
  }
}

TimelineModel centerTimelineBuilder(BuildContext context, int i) {
  return TimelineModel(
    Card(
      child: Container(
        width: 700,
        height: 300,
        child: Text('sdsdsd'),
      ),
    ),

    position: TimelineItemPosition.left,
    isFirst: i == 0,
    isLast: i == items.length,
    iconBackground: Colors.cyanAccent,
    icon: Icon(Icons.blur_circular)
  );
}

List items = [
  {},{}
];
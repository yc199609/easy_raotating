import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'dart:math';


class Current extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Container(
      height: ScreenUtil().setHeight(80),
      padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(10),ScreenUtil().setHeight(80),0,0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text('A相: 43.0',
                style: TextStyle(fontSize: ScreenUtil().setSp(36)),
              ),
              Text('B相: 30.0',
                style: TextStyle(fontSize: ScreenUtil().setSp(36)),
              ),
              Text('C相: 31.0',
                style: TextStyle(fontSize: ScreenUtil().setSp(36)),
              )
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: ScreenUtil().setHeight(40)),
            width: ScreenUtil().setWidth(750),
            height: ScreenUtil().setHeight(600),
            child: CustomMeasureTickCount.withRandomData(),
          )
        ],
      ),
    );
  }
}

class CustomMeasureTickCount extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  CustomMeasureTickCount(this.seriesList, {this.animate});


  factory CustomMeasureTickCount.withRandomData() {
    return new CustomMeasureTickCount(_createRandomData());
  }

  static List<charts.Series<MyRow, DateTime>> _createRandomData() {
    final random = new Random();

    final data1 = [
      new MyRow(new DateTime(2017, 9, 25), random.nextInt(100)),
      new MyRow(new DateTime(2017, 9, 26), random.nextInt(100)),
      new MyRow(new DateTime(2017, 9, 27), random.nextInt(100)),
      new MyRow(new DateTime(2017, 9, 28), random.nextInt(100)),
      new MyRow(new DateTime(2017, 9, 29), random.nextInt(100)),
      new MyRow(new DateTime(2017, 9, 30), random.nextInt(100)),
      new MyRow(new DateTime(2017, 10, 01), random.nextInt(100)),
      new MyRow(new DateTime(2017, 10, 02), random.nextInt(100)),
      new MyRow(new DateTime(2017, 10, 03), random.nextInt(100)),
      new MyRow(new DateTime(2017, 10, 04), random.nextInt(100)),
      new MyRow(new DateTime(2017, 10, 05), random.nextInt(100)),
    ];

    final data2 = [
      new MyRow(new DateTime(2017, 9, 25), random.nextInt(100)),
      new MyRow(new DateTime(2017, 9, 26), random.nextInt(100)),
      new MyRow(new DateTime(2017, 9, 27), random.nextInt(100)),
      new MyRow(new DateTime(2017, 9, 28), random.nextInt(100)),
      new MyRow(new DateTime(2017, 9, 29), random.nextInt(100)),
      new MyRow(new DateTime(2017, 9, 30), random.nextInt(100)),
      new MyRow(new DateTime(2017, 10, 01), random.nextInt(100)),
      new MyRow(new DateTime(2017, 10, 02), random.nextInt(100)),
      new MyRow(new DateTime(2017, 10, 03), random.nextInt(100)),
      new MyRow(new DateTime(2017, 10, 04), random.nextInt(100)),
      new MyRow(new DateTime(2017, 10, 05), random.nextInt(100)),
    ];

    final data3 = [
      new MyRow(new DateTime(2017, 9, 25), random.nextInt(100)),
      new MyRow(new DateTime(2017, 9, 26), random.nextInt(100)),
      new MyRow(new DateTime(2017, 9, 27), random.nextInt(100)),
      new MyRow(new DateTime(2017, 9, 28), random.nextInt(100)),
      new MyRow(new DateTime(2017, 9, 29), random.nextInt(100)),
      new MyRow(new DateTime(2017, 9, 30), random.nextInt(100)),
      new MyRow(new DateTime(2017, 10, 01), random.nextInt(100)),
      new MyRow(new DateTime(2017, 10, 02), random.nextInt(100)),
      new MyRow(new DateTime(2017, 10, 03), random.nextInt(100)),
      new MyRow(new DateTime(2017, 10, 04), random.nextInt(100)),
      new MyRow(new DateTime(2017, 10, 05), random.nextInt(100)),
    ];

    return [
      new charts.Series<MyRow, DateTime>(
        id: 'A相电压',
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        domainFn: (MyRow row, _) => row.timeStamp,
        measureFn: (MyRow row, _) => row.cost,
        data: data1,
      ),
      new charts.Series<MyRow, DateTime>(
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        id: 'B相电压',
        domainFn: (MyRow row, _) => row.timeStamp,
        measureFn: (MyRow row, _) => row.cost,
        data: data2,
      ),
      new charts.Series<MyRow, DateTime>(
        id: 'C相电压',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (MyRow row, _) => row.timeStamp,
        measureFn: (MyRow row, _) => row.cost,
        data: data3,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return new charts.TimeSeriesChart(seriesList,
      animate: animate,
      primaryMeasureAxis: new charts.NumericAxisSpec(
        tickProviderSpec:
          new charts.BasicNumericTickProviderSpec(desiredTickCount: 6)
      ),
      defaultRenderer: new charts.LineRendererConfig(includeArea: true, stacked: true),
      behaviors: [new charts.SeriesLegend()],
    );
  }
}

class MyRow {
  final DateTime timeStamp;
  final int cost;
  MyRow(this.timeStamp, this.cost);
}

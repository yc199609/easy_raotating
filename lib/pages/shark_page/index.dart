import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../components/search_bar.dart';
import 'package:transparent_image/transparent_image.dart';

class SharkPage extends StatelessWidget {
  final buttonList = <Map>[
    {
      'name':'电机前轴传感器',
      'position':<double>[20,19,0,0],
      'svgUrl':'assets/svg/1.svg',
      'svgPosition':<double>[123,38,0,0],
      'svgWidth':196.0,
      'svgHeight':113.0
    },
    {
      'name':'水泵前轴传感器',
      'position':<double>[20,0,0,54],
      'svgUrl':'assets/svg/2.svg',
      'svgPosition':<double>[153,33,0,0],
      'svgWidth':134.0,
      'svgHeight':113.0
    },
    {
      'name':'电机后轴传感器',
      'position':<double>[0,19,30,0],
      'svgUrl':'assets/svg/3.svg',
      'svgPosition':<double>[-113,35,0,0],
      'svgWidth':146.0,
      'svgHeight':68.0
    },
    {
      'name':'水泵后轴传感器',
      'position':<double>[0,105,30,0],
      'svgUrl':'assets/svg/4.svg',
      'svgPosition':<double>[-92,30,0,0],
      'svgWidth':104.0,
      'svgHeight':18.0
    },
    {
      'name':'水泵后轴传感器',
      'position':<double>[0,191,30,0],
      'svgUrl':'assets/svg/5.svg',
      'svgPosition':<double>[-115,-18,0,0],
      'svgWidth':170.0,
      'svgHeight':67.0
    }
  ];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('设备震动监控'),
        //放大镜效果
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
      body: ListView(
        children: <Widget>[
          myCard(context),
          myCard(context),
          myCard(context)
        ],
      ),
    );
  }

  Widget myCard(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(
        ScreenUtil().setWidth(7), 
        ScreenUtil().setHeight(18), 
        ScreenUtil().setWidth(7), 
        ScreenUtil().setHeight(8)
      ),
      child: Container(
        width: ScreenUtil().setWidth(736),
        height: ScreenUtil().setHeight(323),
        child: cardContent(context)
      ) 
    );
  }

  Widget cardContent(BuildContext context){
    List<Widget> tiles = [];
    Widget content;
    tiles.add(
      Positioned(
        top: ScreenUtil().setHeight(63),
        left: ScreenUtil().setWidth(276),
        child: FadeInImage.memoryNetwork(
          placeholder: kTransparentImage,
          image: 'https://cdn.gosafenet.com/static/weixin/static/资源1.png',
          width:ScreenUtil().setWidth(188),
          fit: BoxFit.fitWidth,
        ),
      ),
    );

    for(var item in buttonList){
      tiles.add(
        Positioned(
          left: List.from(item['position'])[0]!=0? ScreenUtil().setWidth(List.from(item['position'])[0]):null,
          top: List.from(item['position'])[1]!=0? ScreenUtil().setHeight(List.from(item['position'])[1]):null,
          right:List.from(item['position'])[2]!=0? ScreenUtil().setWidth(List.from(item['position'])[2]):null,
          bottom:List.from(item['position'])[3]!=0? ScreenUtil().setHeight(List.from(item['position'])[3]):null,
          child: Stack(
            fit:StackFit.loose,
            overflow: Overflow.visible,
            children: <Widget>[
              Positioned(
                left: List.from(item['svgPosition'])[0]!=0? ScreenUtil().setWidth(List.from(item['svgPosition'])[0]):null,
                top: List.from(item['svgPosition'])[1]!=0? ScreenUtil().setHeight(List.from(item['svgPosition'])[1]):null,
                right: List.from(item['svgPosition'])[2]!=0? ScreenUtil().setWidth(List.from(item['svgPosition'])[2]):null,
                bottom: List.from(item['svgPosition'])[3]!=0? ScreenUtil().setHeight(List.from(item['svgPosition'])[3]):null,
                child: SvgPicture.asset(
                  item['svgUrl'],
                  height: ScreenUtil().setHeight(item['svgHeight']),
                  width: ScreenUtil().setWidth(item['svgWidth'])
                ),
              ),
              myButton(context,item['name'])
            ],
          ),
        )
      );
    }

    content = Stack(
      children: tiles,
    );
    return content;
    // return Text('sdsd');
  }

  Widget myButton(BuildContext context,title){
    return ButtonTheme(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      height: ScreenUtil().setHeight(60),
      minWidth: ScreenUtil().setWidth(180),
      child:RaisedButton(
        child: Text(title,style: TextStyle(fontSize: ScreenUtil().setSp(22)),),
        onPressed: (){
          Navigator.of(context).pushNamed("/vibration_curves");
        },
        colorBrightness:Brightness.dark,
        color: Colors.blue,
        highlightColor: Colors.blue[700]
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyDialog extends StatefulWidget {
  MyDialog({Key key,this.groupValue}) : super(key: key);
  final int groupValue;
  @override
  _MyDialogState createState() => _MyDialogState();
}

class _MyDialogState extends State<MyDialog> {
  int groupValue;
  List<String> groups = [
    '新沙水厂',
    '南方泵业',
    '岳阳水泵',
    '伟大袁常',
    '安波电机'
  ];
  bool isCheck (int n){
    return groupValue == n ? true: false;
  }
  void changed(val){
    setState(() {
      groupValue = val;
    });
  }
  @override
  void initState() {
    groupValue = widget.groupValue;
    super.initState();
  }
  @override
    Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return AlertDialog(
      title: Text("请选择机构"),
      content: Container(
        width: ScreenUtil().setWidth(500),
        height: ScreenUtil().setHeight(500),
        child: ListView.separated(
          itemCount: groups.length,
          itemBuilder: (BuildContext context,int index){
            return  ListTile(
              title: Text(groups[index]),
              trailing: AnimatedSwitcher(
                transitionBuilder: (child, anim){
                  return ScaleTransition(child: child,scale: anim,);
                },
                duration: Duration(milliseconds: 300),
                child: Container(
                  child: isCheck(index) ? Icon(Icons.check_circle,color: Colors.blueAccent,): Icon(Icons.panorama_fish_eye),
                  key: ValueKey(isCheck(index)),
                ),
              ),
              onTap: () => changed(index),
            );
          },
          separatorBuilder: (BuildContext context,int index){
            return Divider();
          },
        )
      ),
      actions: <Widget>[
        FlatButton(
          child: Text("取消"),
          onPressed: () => Navigator.of(context).pop(false), // 关闭对话框
        ),
        FlatButton(
          child: Text("确定"),
          onPressed: () {
            //关闭对话框并返回true
            Navigator.of(context).pop(groupValue);
          },
        ),
      ],
    );
  }
}
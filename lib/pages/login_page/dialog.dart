import 'package:flutter/material.dart';

class LoginDialog extends StatefulWidget {
  LoginDialog({Key key,this.groupValue}) : super(key: key);
  final groupValue;
  @override
  _LoginDialogState createState() => _LoginDialogState();
}

class _LoginDialogState extends State<LoginDialog> {
  String groupValue;
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
    return AlertDialog(
      title: Text("请选择机构"),
      content: Column(
        children: <Widget>[
          RadioListTile<String>(
            title: Text('yc'),
            value: 'yc',
            groupValue: groupValue,
            onChanged: changed
          ),
          RadioListTile<String>(
            title: Text('lk'),
            value: 'lk',
            groupValue: groupValue,
            onChanged: changed
          ),
          RadioListTile<String>(
            title: Text('sed'),
            value: 'sed',
            groupValue: groupValue,
            onChanged: changed
          ),
        ],
      ),
      actions: <Widget>[
        FlatButton(
          child: Text("取消"),
          onPressed: () => Navigator.of(context).pop(), // 关闭对话框
        ),
        FlatButton(
          child: Text("确定"),
          onPressed: () {
            //关闭对话框并返回true
            Navigator.of(context).pop(true);
          },
        ),
      ],
    );
  }
}
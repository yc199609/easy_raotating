import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'dart:convert';

class ChipBindDetail extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('芯片绑定'),),
      body: Column(
        children: <Widget>[
          TextField(
            autofocus: false,
            decoration: InputDecoration(
              labelText: "芯片编号",
              hintText: "用户名或邮箱",
            ),
          ),
          RaisedButton(
            child: Text('安装位置'),
            onPressed: (){
              showPicker(context);
            },
          )
        ],
      ),
    );
  }

  showPicker(BuildContext context) {
    Picker picker = Picker(
      adapter: PickerDataAdapter<String>(pickerdata: JsonDecoder().convert(PickerData)),
      changeToFirst: false,
      textAlign: TextAlign.left,
      textStyle: const TextStyle(color: Colors.blue),
      selectedTextStyle: TextStyle(color: Colors.red),
      columnPadding: const EdgeInsets.all(8.0),
      onConfirm: (Picker picker, List value) {
        print(value.toString());
        print(picker.getSelectedValues());
      }
    );
    picker.show(_scaffoldKey.currentState);
  }
}


const PickerData = '''
[
    {
        "a": [
            {
                "a1": [
                    1,
                    2,
                    3,
                    4
                ]
            },
            {
                "a2": [
                    5,
                    6,
                    7,
                    8,
                    555,
                    666,
                    999
                ]
            },
            {
                "a3": [
                    9,
                    10,
                    11,
                    12
                ]
            }
        ]
    },
    {
        "b": [
            {
                "b1": [
                    11,
                    22,
                    33,
                    44
                ]
            },
            {
                "b2": [
                    55,
                    66,
                    77,
                    88,
                    99,
                    1010,
                    1111,
                    1212,
                    1313,
                    1414,
                    1515,
                    1616
                ]
            },
            {
                "b3": [
                    1010,
                    1111,
                    1212,
                    1313,
                    1414,
                    1515,
                    1616
                ]
            }
        ]
    },
    {
        "c": [
            {
                "c1": [
                    "a",
                    "b",
                    "c"
                ]
            },
            {
                "c2": [
                    "aa",
                    "bb",
                    "cc"
                ]
            },
            {
                "c3": [
                    "aaa",
                    "bbb",
                    "ccc"
                ]
            },
            {
                "c4": [
                    "a1",
                    "b1",
                    "c1",
                    "d1"
                ]
            }
        ]
    }
]
    ''';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, ScreenUtil().setHeight(116), 0, ScreenUtil().setHeight(30)),
      child: Text('登  录',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: ScreenUtil().setSp(38)
        ),
      ),
    );
  }
}
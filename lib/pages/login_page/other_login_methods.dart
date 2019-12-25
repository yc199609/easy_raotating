import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtherLoginMethods extends StatelessWidget {
  OtherLoginMethods({Key key,this.changeMode,this.mode}) : super(key: key);
  final changeMode;
  final String mode;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth(690),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Divider(
                    height: ScreenUtil().setHeight(4),
                  ),
                ),
                Text('其他登录方式',style: TextStyle(color: Color.fromRGBO(202, 202, 203, 1.0)),),
                Expanded(
                  child: Divider(
                    height: ScreenUtil().setHeight(4),
                  ),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: changeMode,
            child: Container(
              padding: EdgeInsets.fromLTRB(
                0,
                ScreenUtil().setHeight(10),
                0,
                ScreenUtil().setHeight(20)
              ),
              child: AnimatedSwitcher(
                transitionBuilder: (child,anim){
                  return ScaleTransition(child: child,scale: anim);
                },
                duration: Duration(milliseconds: 300),
                child: Image.asset(
                  mode == 'weixin'?
                  'assets/images/login_person.png':
                  'assets/images/login_weixin.png',
                  width: ScreenUtil().setWidth(54),
                height: ScreenUtil().setHeight(54),
                  key: ValueKey(mode),
                ),
              )
            ),
          )
        ],
      ),
    );
  }
}
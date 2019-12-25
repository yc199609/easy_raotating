import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginTypeImage extends StatelessWidget {
  LoginTypeImage({Key key,this.mode}) : super(key: key);
  final String mode;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(30)),
      child: Stack(
        alignment:AlignmentDirectional.center,
        children: <Widget>[
          Image.asset(
            'assets/images/login_circle.png',
            width: ScreenUtil().setWidth(139),
            height: ScreenUtil().setHeight(173),
          ),
          Positioned(
            top: ScreenUtil().setHeight(41),
            child: AnimatedSwitcher(
              transitionBuilder: (child,anim){
                return ScaleTransition(child: child,scale: anim);
              },
              duration: Duration(milliseconds: 300),
              child: Image.asset(
                mode == 'weixin'?
                'assets/images/login_weixin.png':
                'assets/images/login_person.png',
                width: ScreenUtil().setWidth(72),
                height: ScreenUtil().setHeight(56),
                key: ValueKey(mode),
              ),
            )
          )
        ],
      ),
    );
  }
}
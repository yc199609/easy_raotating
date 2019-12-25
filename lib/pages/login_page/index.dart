import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './login_form.dart';
import './other_login_methods.dart';
import './login_type_image.dart';
import './login_title.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String mode = 'weixin';
  void _changeMode(){
    mode == 'weixin'?
      setState(() {
        mode='phone';
      })
      :
      setState(() {
        mode='weixin';
      });
  }
  void login(int n){
    Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => route == null);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
      body: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Stack(
          children: <Widget>[
            Positioned(
              child: Image.asset(
                'assets/images/login_bg.png',
                width: ScreenUtil().setWidth(750),
                fit: BoxFit.fitWidth,
                height: ScreenUtil().setHeight(446),
              ),
              top: 0,
              left: 0,
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children:<Widget>[
                        LoginTitle(),  // 登录标题
                        LoginTypeImage(mode:mode),  // 微信登录还是手机登录的气泡
                        AnimatedSwitcher(
                          transitionBuilder: (child,anim){
                            return ScaleTransition(child: child,scale: anim);
                          },
                          duration: Duration(milliseconds: 300),
                          child: LoginForm(mode:mode,login:login,key: ValueKey(mode),),
                        ),  // 登录的表单
                      ]
                    ),
                    OtherLoginMethods(changeMode:_changeMode,mode:mode)  // 底部的选择登录方式
                  ],
              ),
            ),
          ],
        )
      ),
      resizeToAvoidBottomPadding: false
    );
  }
}

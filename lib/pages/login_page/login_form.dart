import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginForm extends StatefulWidget {
  LoginForm({Key key,this.mode,this.login}) : super(key: key);
  final login;
  final String mode;
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController _unameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 15.0, //设置阴影
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(7.0))),  //设置圆角
        child: Container(
          width: ScreenUtil().setWidth(620),
          child: widget.mode == 'weixin' ? _weixin(context) : _phone(context)
        )
      ), 
    );
  }

  Widget _phone(BuildContext context){
    return Container(
      padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(32), ScreenUtil().setHeight(80),ScreenUtil().setWidth(32),0),
      child: Column(
        children: <Widget>[
          Theme(
            data: new ThemeData(
              hintColor:  Color.fromRGBO(202,202,203, 1.0)
            ),
            child: TextField(
              controller: _unameController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(238,238,238, 1))),
                // focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.lightGreenAccent)), 
                contentPadding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(30),ScreenUtil().setHeight(34),ScreenUtil().setWidth(32),ScreenUtil().setHeight(30)),
                hintText: "请输入电话号码",
                prefixIcon: Icon(Icons.person) 
              ),
              style: TextStyle(fontSize: ScreenUtil().setSp(34)),//输入文本的样式
            ),
          ),
          Theme(
            data: new ThemeData(
              hintColor:  Color.fromRGBO(202,202,203, 1.0)
            ),
            child:TextField(
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(238,238,238, 1))),
                contentPadding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(30),ScreenUtil().setHeight(34),ScreenUtil().setWidth(32),ScreenUtil().setHeight(30)),
                hintText: "请输入登录密码",
                prefixIcon: Icon(Icons.lock)
              ),
              controller: _passwordController,
              obscureText: true, //是否是密码
              style: TextStyle(fontSize: ScreenUtil().setSp(34)),//输入文本的样式
            ), 
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0 ,ScreenUtil().setHeight(60),0,ScreenUtil().setHeight(70)),
            child: _button(context)
          )
        ],
      ),
    );
  }

  Widget _weixin(BuildContext context){
    return Container(
      padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(129)),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(0, ScreenUtil().setHeight(80), 0, ScreenUtil().setHeight(10)),
            child: Image.network(
              'https://cdn.gosafenet.com/static/weixin/static/device.png',
              width: ScreenUtil().setWidth(129),
              height: ScreenUtil().setHeight(129),
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(28)),
            child: Text(
              '用户名',
              style: TextStyle(
                fontSize: ScreenUtil().setSp(59)
              ),
            ),
          ),
          _button(context)
        ],
      ),
    );
  }

  Widget _button(BuildContext context){
    return RaisedButton(
      color: Colors.lightBlue,
      highlightColor: Colors.blue[700],
      child: Text('登录',style: TextStyle(color: Colors.white,fontSize: ScreenUtil().setSp(32)),),
      onPressed: (){
        print(_unameController.text);
        widget.login();
      },
      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.0)),
      padding: EdgeInsets.fromLTRB(
        ScreenUtil().setWidth(240), 
        ScreenUtil().setHeight(30), 
        ScreenUtil().setWidth(240), 
        ScreenUtil().setHeight(30)
      ),
    );
  }
}

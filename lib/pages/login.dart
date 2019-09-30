import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:wan_android/configs/router_config.dart';
import 'package:wan_android/net/wan_repository.dart';
import 'package:wan_android/widgets/bottom_clipper.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool loginning;
  TextEditingController _usernameController;
  TextEditingController _passwordController;
  GlobalKey<FormState> _formKey;
  TapGestureRecognizer _tapRecognizer;

  @override
  void initState() {
    super.initState();
    loginning = false;
    _formKey = GlobalKey();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
    _tapRecognizer = TapGestureRecognizer();
    _tapRecognizer.onTap = _goRegister;
  }

  _goRegister() {
    Navigator.pushNamed(context, RouterNames.REGISTER);
  }

  _login() {
    if (loginning) {
      return;
    }
    setState(() {
      loginning = true;
    });
    FormState formState = _formKey.currentState;
    if (formState.validate()) {
      String username = _usernameController.text;
      String password = _passwordController.text;
      print('${username}====${password}');
      WanRepository.login(username, password).then((data) {
        print(data);
      });
    }
    setState(() {
      loginning = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        leading: IconButton(
            icon: Icon(
              Icons.clear,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text(
          '登录',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            ClipPath(
              clipper: BottomClipper(),
              child: Container(
                height: 200,
                color: Theme.of(context).primaryColor,
              ),
            ),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                margin: EdgeInsets.only(top: 40),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/logo.png',
                      width: 80,
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 20, left: 30, right: 30),
                        padding:
                            EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(3, 3),
                                  blurRadius: 6)
                            ]),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              FormItem(_usernameController, Icons.person, '用户名',
                                  TextInputType.text, false),
                              FormItem(_passwordController, Icons.lock, '密码',
                                  TextInputType.text, true),
                              SizedBox(
                                height: 20,
                              ),
                              RaisedButton(
                                  child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 80),
                                      child: Row(
                                        children: <Widget>[
                                          if (loginning)
                                            CupertinoActivityIndicator(
                                              radius: 8,
                                            ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            '登录',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ],
                                      )),
                                  onPressed: _login,
                                  color: Theme.of(context).primaryColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)))
                            ],
                          ),
                        )),
                    SizedBox(
                      height: 30,
                    ),
                    RichText(
                      text: TextSpan(
                          text: '还没有账号?',
                          style:
                              TextStyle(color: Color(0xff666666), fontSize: 14),
                          children: [
                            TextSpan(
                                text: '去注册',
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor),
                                recognizer: _tapRecognizer)
                          ]),
                      textAlign: TextAlign.center,
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

class FormItem extends StatefulWidget {
  TextEditingController _controller;
  String _hint;
  IconData _iconData;
  TextInputType _textInputType;
  bool _obscureText;

  FormItem(this._controller, this._iconData, this._hint, this._textInputType,
      this._obscureText);

  @override
  _FormItemState createState() => _FormItemState();
}

class _FormItemState extends State<FormItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: TextFormField(
      style: TextStyle(color: Color(0xff666666), fontSize: 14),
      controller: widget._controller,
      keyboardType: widget._textInputType,
      obscureText: widget._obscureText,
      decoration: InputDecoration(
          icon: Icon(
            widget._iconData,
            color: Theme.of(context).primaryColor,
          ),
          hintText: widget._hint,
          hintStyle: TextStyle(color: Color(0xff999999), fontSize: 13)),
      validator: (text) {
        return text.trim().length > 0 ? null : '${widget._hint}不能为空';
      },
      cursorColor: Theme.of(context).primaryColor,
    ));
  }
}

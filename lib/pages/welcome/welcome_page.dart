import 'package:flutter/material.dart';
import 'package:wan_android/configs/router_config.dart';

import 'widgets/anim_text.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset('assets/images/launch_image.png', fit: BoxFit.fill),
        //动画：一起来玩吧
        AnimText('一', -0.6, 0),
        AnimText('起', -0.3, 500),
        AnimText('来', 0, 1000),
        AnimText('玩', 0.3, 1500),
        AnimText('吧', 0.6, 2000,callback: (){
          Navigator.pushReplacementNamed(context, RouterNames.LOGIN);
        },),
      ],
    );
  }
}

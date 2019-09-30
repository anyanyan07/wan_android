import 'package:flutter/material.dart';

import 'configs/router_config.dart';
import 'pages/welcome/welcome_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Color(0xff17CAA2)
      ),
      onGenerateRoute: RouterConfig.generateRouter,
      home: WelcomePage(),
    );
  }
}
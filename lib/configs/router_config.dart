import 'package:flutter/material.dart';
import 'package:wan_android/pages/article_detail.dart';
import 'package:wan_android/pages/login.dart';
import 'package:wan_android/pages/register.dart';
import 'package:wan_android/pages/tab/tab_page.dart';

class RouterNames {
  static const String TAB = 'TAB';
  static const String DETAIL = 'DETAIL';
  static const String LOGIN = 'LOGIN';
  static const String REGISTER = 'REGISTER';
}

class RouterConfig {
  static Route<dynamic> generateRouter(RouteSettings settings) {
    var arguments = settings.arguments;
    switch (settings.name) {
      case RouterNames.TAB:
        return MaterialPageRoute(builder: (context) => TabPage());
        break;
      case RouterNames.DETAIL:
        return MaterialPageRoute(
            builder: (context) => ArticleDetail(arguments));
        break;
      case RouterNames.LOGIN:
        return MaterialPageRoute(builder: (context) => Login());
        break;
      case RouterNames.REGISTER:
        return MaterialPageRoute(builder: (context) => Register());
        break;
      default:
        return MaterialPageRoute(builder: (context) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Center(
                child: Text(
              '您访问的页面不存在',
              style: TextStyle(color: Color(0xff666666), fontSize: 20),
            )),
          );
        });
        break;
    }
  }
}

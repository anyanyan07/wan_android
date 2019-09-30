import 'environment/pre.dart';
import 'environment/pro.dart';
import 'environment/test.dart';

class NetConfig {
  static const Env env = Env.pro;
  static const int CONNECT_TIMEOUT = 10000;
  static const int RECEIVE_TIMEOUT = 60000;
  static String baseUrl;

  static String getBaseUrl() {
    switch (env) {
      case Env.pro:
        baseUrl = Pro.BASE_URL;
        break;
      case Env.pre:
        baseUrl = Pre.BASE_URL;
        break;
      case Env.test:
        baseUrl = Test.BASE_URL;
        break;
    }
    return baseUrl;
  }
}

enum Env { pro, pre, test }

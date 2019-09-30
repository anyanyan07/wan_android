//对使用者暴露，get  post ...
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:wan_android/models/base_model.dart';

import 'package:wan_android/net/dio_util.dart';

class Http {
  static Future get(String path, {Map<String, dynamic> queryParams}) async {
    return await DioUtil.instance.request(path,
        queryParameters: queryParams, options: Options(method: 'get'));
  }

  static Future<dynamic> post(String path, dynamic data) async {
    return await DioUtil.instance
        .request(path, data: data, options: Options(method: 'post'));
  }
}

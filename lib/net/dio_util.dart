import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wan_android/configs/net_config.dart';
import 'package:wan_android/models/base_model.dart';

class DioUtil {
  Dio _dio;

  // 工厂模式
  factory DioUtil() => _getInstance();

  static DioUtil get instance => _getInstance();
  static DioUtil _instance;

  DioUtil._internal() {
    _dio = Dio(BaseOptions(
        baseUrl: NetConfig.getBaseUrl(),
        connectTimeout: NetConfig.CONNECT_TIMEOUT,
        receiveTimeout: NetConfig.RECEIVE_TIMEOUT,
        headers: {'content-type': 'application/json',
        'cache-control':'no-cache'}));
    _addInterceptors();
  }

  static DioUtil _getInstance() {
    if (_instance == null) {
      _instance = new DioUtil._internal();
    }
    return _instance;
  }

  void _addInterceptors() {
    _dio.interceptors.add(InterceptorsWrapper(
        onRequest: (RequestOptions options) {},
        onResponse: (Response<dynamic> response) {
          BaseModel baseModel = BaseModel.fromJson(response.data);
          if (baseModel.errorCode != 0) {
            Fluttertoast.showToast(msg: baseModel.errorMsg);
          }
        },
        onError: (DioError error) {
          Fluttertoast.showToast(msg: '网络异常');
        }));
  }

  Future request(
    String path, {
    data,
    Map<String, dynamic> queryParameters,
    CancelToken cancelToken,
    Options options,
    ProgressCallback onSendProgress,
    ProgressCallback onReceiveProgress,
  }) {
    return _dio.request(path,
        data: data,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        options: options,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress);
  }
}

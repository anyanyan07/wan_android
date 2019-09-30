import 'package:dio/dio.dart';
import 'package:wan_android/models/article.dart';
import 'package:wan_android/models/banner.dart';

import 'http.dart';

class WanRepository {
  //请求首页banner数据
  static Future fetchBanner() async {
    Response response = await Http.get('banner/json');
    return response.data['data']
        .map<BannerModel>((item) => BannerModel.fromJson(item))
        .toList();
  }

  //首页置顶文章 article/top/json
  static Future fetchTopArticle() async {
    Response response = await Http.get('article/top/json');
    return response.data['data']
        .map<Article>((item) => Article.fromJson(item))
        .toList();
  }

  //首页文章 article/list/0/json
  static Future fetchArticle(int pageNum) async {
    Response response = await Http.get('article/list/$pageNum/json');
    return ArticleWithPage.fromJson(response.data['data']);
  }

  //登录
  static Future login(String username, String password) async {
    Response response = await Http.post(
        'user/login', {'username': username, 'password': password});
    return response.data;
  }
}

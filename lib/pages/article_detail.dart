import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class ArticleDetail extends StatelessWidget {
  String url;
  String title;

  ArticleDetail(Map<String, dynamic> map)
      : url = map['url'],
        title = map['title'];

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: url,
      withZoom: false,
      withJavascript: true,
      appBar: AppBar(
        title: Text(title??'文章详情',style: TextStyle(color: Colors.white),),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share, color: Colors.white),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}

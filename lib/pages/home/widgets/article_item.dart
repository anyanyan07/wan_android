import 'package:flutter/material.dart';
import 'package:wan_android/configs/router_config.dart';
import 'package:wan_android/models/article.dart';
import 'package:wan_android/widgets/wrapped_image.dart';

class ArticleItemWidget extends StatelessWidget {
  Article _article;
  bool _top;

  ArticleItemWidget(this._article, this._top);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.pushNamed(context, RouterNames.DETAIL,
              arguments:{'url':_article.link,'title':_article.title} );
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          decoration: BoxDecoration(
              color: _top ? Color(0xffFEFFE5) : Colors.white,
              border: Border(bottom: BorderSide(color: Color(0xffededed)))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  ClipOval(
                    child: WrappedImage('http://placeimg.com/20/20/666666', 20, 20),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text(
                      _article.author,
                      style: TextStyle(color: Color(0xff666666), fontSize: 14),
                    ),
                  ),
                  Expanded(
                    child: SizedBox.shrink(),
                  ),
                  Text(_article.niceDate,
                      style: TextStyle(color: Color(0xff999999), fontSize: 13)),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  _article.title,
                  style: TextStyle(
                      color: Color(0xff333333),
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Row(
                children: <Widget>[
                  if (_top)
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 1, horizontal: 2),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.deepOrange,
                          ),
                          borderRadius: BorderRadius.circular(3)),
                      child: Text(
                        '置顶',
                        style: TextStyle(color: Colors.deepOrange, fontSize: 8),
                      ),
                    ),
                  for (var item in _article.tags)
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 1, horizontal: 2),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.green,
                          ),
                          borderRadius: BorderRadius.circular(3)),
                      child: Text(
                        item['name'],
                        style: TextStyle(color: Colors.green, fontSize: 8),
                      ),
                    ),
                  Container(
                      padding: EdgeInsets.only(left: 5),
                      child: Text(
                        '${_article.superChapterName}/${_article.chapterName}',
                        style:
                            TextStyle(color: Color(0xff999999), fontSize: 12),
                      ))
                ],
              )
            ],
          ),
        ));
  }
}

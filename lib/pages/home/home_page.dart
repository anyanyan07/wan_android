import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wan_android/models/article.dart';
import 'package:wan_android/models/banner.dart';
import 'package:wan_android/net/wan_repository.dart';
import 'package:wan_android/pages/home/widgets/article_item.dart';
import 'package:wan_android/widgets/skeleton.dart';
import 'package:wan_android/widgets/skeleton_article.dart';
import 'package:wan_android/widgets/wrapped_image.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  List<BannerModel> _bannerData;
  List<Article> _articleData;
  List<Article> _topArticleData;
  RefreshController _refreshController;
  int currentPageNum = 0;

  @override
  void initState() {
    super.initState();
    _refreshController = RefreshController();
    loadData();
  }

  void loadData() async {
    List<Future> futures = [];
    futures.add(WanRepository.fetchBanner());
    futures.add(WanRepository.fetchTopArticle());
    futures.add(WanRepository.fetchArticle(currentPageNum));
    var result = await Future.wait(futures);
    _refreshController.refreshCompleted();
    setState(() {
      _bannerData = result[0];
      _topArticleData = result[1];
      ArticleWithPage articleWithPage = result[2];
      currentPageNum = articleWithPage.curPage;
      _articleData = articleWithPage.datas;
    });
  }

  void loadMore() {
    WanRepository.fetchArticle(currentPageNum).then((articleWithPage) {
      currentPageNum = articleWithPage.curPage;
      _refreshController.loadComplete();
      setState(() {
        if (_articleData == null) {
          _articleData = articleWithPage.datas;
        } else {
          _articleData.addAll(articleWithPage.datas);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    double bannerHeight = 150 + MediaQuery.of(context).padding.top;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SmartRefresher(
            controller: _refreshController,
            enablePullUp: true,
            onRefresh: loadData,
            onLoading: loadMore,
            child: CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  expandedHeight: 150,
                  pinned: true,
                  backgroundColor: Theme.of(context).primaryColor,
                  title: Text(
                    '玩安卓',
                    style: TextStyle(color: Colors.white),
                  ),
                  actions: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    )
                  ],
                  flexibleSpace: FlexibleSpaceBar(
                    background: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Offstage(
                            offstage: _bannerData != null,
                            child: Container(
                                height: bannerHeight,
                                color: Colors.white,
                                child: CupertinoActivityIndicator(
                                  radius: 10,
                                ))),
                        Offstage(
                          offstage: _bannerData == null,
                          child: Container(
                              height: bannerHeight,
                              color: Colors.red,
                              child: Swiper(
                                autoplay: true,
                                pagination: SwiperPagination(),
                                loop: true,
                                itemCount: _bannerData?.length ?? 0,
                                itemBuilder: (context, index) {
                                  BannerModel item = _bannerData[index];
                                  return WrappedImage(item.imagePath,
                                      double.infinity, bannerHeight);
                                },
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
                if(_topArticleData != null)
                  topArticleList(),
                articleList()
              ],
            )));
  }

  Widget topArticleList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return ArticleItemWidget(_topArticleData[index], true);
      }, childCount: _topArticleData?.length ?? 0),
    );
  }

  Widget articleList() {
    if (_articleData == null) {
      return SliverToBoxAdapter(
        child: Skeleton(8, (context) {
          return SkeletonArticle();
        }),
      );
    } else {
      return SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
          return ArticleItemWidget(_articleData[index], false);
        }, childCount: _articleData?.length ?? 0),
      );
    }
  }

  @override
  bool get wantKeepAlive => true;
}

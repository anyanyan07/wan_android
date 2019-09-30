class Article {
  String apkLink;
  int audit;
  String author;
  int chapterId;
  String chapterName;
  bool collect;
  int courseId;
  String desc;
  String envelopePic;
  bool fresh;
  int id;
  String link;
  String niceDate;
  String niceShareDate;
  String origin;
  String prefix;
  String projectLink;
  int publishTime;
  int shareDate;
  String shareUser;
  int superChapterId;
  String superChapterName;
  List tags;
  String title;
  int type;
  int userId;
  int visible;
  int zan;

  Article.fromJson(Map<String, dynamic> map)
      : apkLink = map['apkLink'],
        audit = map['audit'],
        author = map['author'],
        chapterId = map['chapterId'],
        chapterName = map['chapterName'],
        collect = map['collect'],
        courseId = map['courseId'],
        desc = map['desc'],
        envelopePic = map['envelopePic'],
        fresh = map['fresh'],
        id = map['id'],
        link = map['link'],
        niceDate = map['niceDate'],
        niceShareDate = map['niceShareDate'],
        origin = map['origin'],
        prefix = map['prefix'],
        projectLink = map['projectLink'],
        publishTime = map['publishTime'],
        shareDate = map['shareDate'],
        shareUser = map['shareUser'],
        superChapterId = map['superChapterId'],
        superChapterName = map['superChapterName'],
        tags = map['tags'],
        title = map['title'],
        type = map['type'],
        userId = map['userId'],
        visible = map['visible'],
        zan = map['zan'];
}

class ArticleWithPage {
  int curPage;
  int offset;
  bool over;
  int pageCount;
  int size;
  int total;
  List<Article> datas;

  ArticleWithPage.fromJson(Map<String, dynamic> map)
      : curPage = map['curPage'],
        offset = map['offset'],
        over = map['over'],
        pageCount = map['pageCount'],
        size = map['size'],
        total = map['total'],
        datas = map['datas']
            .map<Article>((item) => Article.fromJson(item))
            .toList();
}

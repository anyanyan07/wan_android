class BannerModel {
  String desc;
  int id;
  String imagePath;
  int isVisible;
  int order;
  String title;
  int type;
  String url;

  BannerModel.fromJson(Map<String, dynamic> map)
      : desc = map['desc'],
        id = map['id'],
        imagePath = map['imagePath'],
        isVisible = map['isVisible'],
        order = map['order'],
        title = map['title'],
        type = map['type'],
        url = map['url'];
}

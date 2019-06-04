//class ArticleBean {
//  String apkLink;
//  String author;
//  int chapterId;
//  String chapterName;
//  bool collect;
//  int courseId;
//  String desc;
//  String envelopePic;
//  bool fresh;
//  int id;
//  String link;
//  String niceDate;
//  String origin;
//  String projectLink;
//  int publishTime;
//  int superChapterId;
//  String superChapterName;
//  List<ArticleTags> tags;
//  String title;
//  int type;
//  int userId;
//  int visible;
//  int zan;
//
//  ArticleBean ({this.apkLink,
//    this.author,
//    this.chapterId,
//    this.chapterName,
//    this.collect,
//    this.courseId,
//    this.desc,
//    this.envelopePic,
//    this.fresh,
//    this.id,
//    this.link,
//    this.niceDate,
//    this.origin,
//    this.projectLink,
//    this.publishTime,
//    this.superChapterId,
//    this.superChapterName,
//    this.tags,
//    this.title,
//    this.type,
//    this.userId,
//    this.visible,
//    this.zan});
//
//  ArticleBean.fromJson(Map<String, dynamic> json) {
//    apkLink = json['apkLink'];
//    author = json['author'];
//    chapterId = json['chapterId'];
//    chapterName = json['chapterName'];
//    collect = json['collect'];
//    courseId = json['courseId'];
//    desc = json['desc'];
//    envelopePic = json['envelopePic'];
//    fresh = json['fresh'];
//    id = json['id'];
//    link = json['link'];
//    niceDate = json['niceDate'];
//    origin = json['origin'];
//    projectLink = json['projectLink'];
//    publishTime = json['publishTime'];
//    superChapterId = json['superChapterId'];
//    superChapterName = json['superChapterName'];
//    if (json['tags'] != null) {
//      tags = new List<ArticleTags>();
//      json['tags'].forEach((v) {
//        tags.add(new ArticleTags.fromJson(v));
//      });
//    }
//    title = json['title'];
//    type = json['type'];
//    userId = json['userId'];
//    visible = json['visible'];
//    zan = json['zan'];
//  }
//}
//
//  class ArticleTags {
//  String name;
//  String url;
//
//  ArticleTags({this.name, this.url});
//
//  ArticleTags.fromJson(Map<String, dynamic> json) {
//  name = json['name'];
//  url = json['url'];
//  }
//
//  Map<String, dynamic> toJson() {
//  final Map<String, dynamic> data = new Map<String, dynamic>();
//  data['name'] = this.name;
//  data['url'] = this.url;
//  return data;
//  }
//  }
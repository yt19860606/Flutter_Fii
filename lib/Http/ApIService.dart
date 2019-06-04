import 'package:dio/dio.dart';
import 'dart:convert';
import 'DioManager.dart';
import 'APICenter.dart';
import 'package:fii/Model/User.dart';
import 'package:fii/Model/Banner.dart';
import 'package:fii/Model/Article.dart';

class APIService{

  void getBanner(Function callBlock)async{
    DioManager.singletion.dio.get(APICenter.HOME_BANNER,options:_getOptions()).then((response){
      Map bannerMap = jsonDecode(response.toString());

      print("bannerMap:$bannerMap");
      callBlock(Banner.fromJson(bannerMap));
    });
  }


  void getArticleList(Function callback,int _page) async {
    DioManager.singletion.dio.get(APICenter.HOME_ARTICLE_LIST+"$_page/json", options: _getOptions()).then((response) {
      Map articleMap = jsonDecode(response.toString());
      callback(Article.fromJson(articleMap));
    });
  }

  Options _getOptions(){
    Map<String,String>map = Map();
    List<String>cookies = User().cookie;
map["Cookie"] = cookies.toString();
return Options(headers: map);

  }


}
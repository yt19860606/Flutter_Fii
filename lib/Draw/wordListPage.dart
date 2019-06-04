import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:fii/Model/wordListModel.dart';
import 'package:fii/Http/ApIService.dart';
import 'package:fii/Model/Article.dart';
import 'package:fii/Draw/WordListDetailPage.dart';

class WordListPageView extends StatefulWidget {
  @override
  _WordListPageViewState createState() => _WordListPageViewState();
}

class _WordListPageViewState extends State<WordListPageView> {
  @override
  // TODO: implement initState

  List<ArticleBean> _datas = List();
  int _page = 0; /*加载的页数*/
  List<WordPair> _suggestions = List();
  ScrollController _scrollController = ScrollController();
  final _saved = new Set<WordPair>();

  // 增大字体大小
  final _biggerFont = const TextStyle(fontSize: 18.0);
  // 副标题字体样式
  final _smallFont = const TextStyle(
      fontSize: 12.0, fontWeight: FontWeight.bold, color: Colors.red);

  // 头像样式
  final _userHeadImage = Image(
    width: 32,
    height: 32,
    image: NetworkImage("https://profile.csdnimg.cn/9/4/6/1_itxiaodong"),
    fit: BoxFit.cover,
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    _suggestions.addAll(generateWordPairs().take(20));

    _scrollController.addListener((){
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        _getMoreData();
      }
    });


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("单词列表"),
      ),

      body: RefreshIndicator(child: _buildSuggestions(), onRefresh: _handleRefresh),

    );
  }


  // listView 列表
  Widget _buildSuggestions() {
    return new ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: _suggestions.length + 1,
      itemBuilder: (context, i) {
        // 在每一列之前，添加一个1像素高的分隔线widget
        if (i.isOdd) return new Divider();

        // 最后一个单词对
        if (i == _suggestions.length) {
          return _buildLoadMore();
        } else {
          return _buildRow(_suggestions[i]);
        }
      },
      controller: _scrollController,
    );
  }

  Widget _buildLoadMore() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Center(
          // 转圈加载中
          child: new CircularProgressIndicator(),
        ),
      ),
      color: Colors.white70,
    );
  }

  // listView 每一行的内容和样式
  Widget _buildRow(WordPair pair) {
    // 检查确保单词对还没有添加到收藏夹中
    final alreadySaved = _saved.contains(pair);

    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      subtitle: new Text(
        pair.asString,
        style: _smallFont,
      ),
      //item 前置图标
      leading: _userHeadImage,
      // item 后置图标
      trailing: new GestureDetector(
        child: new Icon(
          alreadySaved ? Icons.favorite : Icons.favorite_border,
          color: alreadySaved ? Colors.red : null,
        ),
        onTap: () {
          // 通知框架状态已经改变
          setState(() {
            if (alreadySaved) {
              _saved.remove(pair);
            } else {
              _saved.add(pair);
            }
          });
        },
      ),
      onTap: () {
        onItemClick(pair);
      },
    );
  }


  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  void onItemClick(WordPair pair) {
    // 跳转详情页面
    Navigator.of(context).push(new MaterialPageRoute(
      builder: (context) => WordListDetailPage(
        pair: pair,
      ),
    ));
  }

  Future<Null> getData() async {
    _page = 0;
    print("当前页面--$_page");

    APIService().getArticleList((Article _articleModel) {
      setState(() {
        _datas = _articleModel.data.datas;
      });
      print("返回的总数："+_articleModel.data.total.toString());
      print("返回的总数："+_articleModel.data.datas.length.toString());
      print("返回的title："+_datas[0].title.toString());
    }, _page);
  }

  // 加载更多
  Future _getMoreData() async {
    print("开始加载更多");
    await Future.delayed(Duration(seconds: 3), () {
      setState(() {
        // 这里是本地数据，因此在无网的时候也会加载数据
        _suggestions.addAll(generateWordPairs().take(10));
        return _suggestions;
      });
    });
  }

  // 处理下拉刷新
  Future _handleRefresh() async {
    await Future.delayed(Duration(seconds: 3), () {
      print('refresh');
      setState(() {
        _suggestions.clear();
        _suggestions.addAll(generateWordPairs().take(20));
        return _suggestions;
      });
    });
  }

}

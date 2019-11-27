import 'package:flutter/material.dart';
import 'package:flutter_web/pages/about_us_page.dart';
import 'package:flutter_web/pages/home_page.dart';
import 'package:flutter_web/pages/news_page.dart';
import 'package:flutter_web/pages/product_page.dart';

/// [author] MARS <wangyunfan66@gmail.com>
/// [date] 2019-11-20
/// [fileoverview] 底部导航栏集成
class AppPage extends StatefulWidget {
  @override
  _AppPageState createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  // ?当前选择页面索引
  int _currentIndex = 0;
  // ?引入相关页面
  HomePage homePage;
  ProductPage productPage;
  NewsPage newsPage;
  AboutUsPage aboutUsPage;

  /// [@method] 页面展示
  /// [@description] 根据当前索引返回不同页面

  /// [method]
  /// [params]
  /// [description]
  currentPage() {
    switch (_currentIndex) {
      case 0:
        if (homePage == null) homePage = HomePage();
        return homePage;
      case 1:
        if (productPage == null) productPage = ProductPage();
        return productPage;
      case 2:
        if (newsPage == null) newsPage = NewsPage();
        return newsPage;
      case 3:
        if (aboutUsPage == null) aboutUsPage = AboutUsPage();
        return aboutUsPage;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.home),
          title: Text('App'),
          actions: <Widget>[
            Padding(
              // ?搜索按钮
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  print('点击了搜索');
                },
                child: Icon(Icons.search),
              ),
            ),
          ],
        ),
        body: currentPage(),
        // ?底部导航
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              title: Text('Home'),
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              title: Text('Chart'),
              icon: Icon(Icons.apps),
            ),
            BottomNavigationBarItem(
              title: Text('News'),
              icon: Icon(Icons.new_releases),
            ),
            BottomNavigationBarItem(
              title: Text('User'),
              icon: Icon(Icons.insert_comment),
            )
          ],
          onTap: ((index) {
            setState(() {
              _currentIndex = index;
            });
          }),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.http),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('company_info');
          },
        ));
  }
}

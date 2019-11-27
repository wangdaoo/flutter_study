import 'package:flutter/material.dart';
import 'package:flutter_web/model/news.dart';
import 'package:flutter_web/pages/news_detail.dart';
import 'package:flutter_web/services/news.dart';
import 'package:flutter_web/utils/utils.dart';
import 'package:date_format/date_format.dart';

class NewsPage extends StatefulWidget {
  NewsPage({Key key}) : super(key: key);

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  NewsListModal listData = NewsListModal([]);

  /// [method] 新闻列表
  void getNewsList() async {
    var data = await getNewsResult();
    NewsListModal list = NewsListModal.fromJson(data);
    setState(() {
      listData.data.addAll(list.data);
    });
  }

  @override
  void initState() {
    getNewsList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ?列表项构建器
    return ListView.separated(
      scrollDirection: Axis.vertical,
      itemCount: listData.data.length,
      // ?分割线
      separatorBuilder: (BuildContext context, int index) => Divider(
        height: 1.0,
        color: Colors.grey,
      ),
      itemBuilder: (BuildContext context, int index) {
        NewsItemModel item = listData.data[index];
        return ListTile(
          leading: Icon(Icons.supervisor_account),
          title: Text(
            item.title != null ? item.title : '-',
            style: getEnCustomFont(14.0, Colors.black87),
          ),
          subtitle: Text(
            item.date != null ? item.date : '-',
            style: getEnCustomFont(12.0, Colors.black45),
          ),
          trailing: Icon(Icons.keyboard_arrow_right),
          contentPadding: EdgeInsets.all(10.0),
          enabled: true,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NewsDetails(
                  item: item,
                ),
              ),
            );
          },
          onLongPress: () {
            print('长按事件');
          },
        );
      },
    );
  }
}

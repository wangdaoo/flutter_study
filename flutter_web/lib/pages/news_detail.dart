import 'package:flutter/material.dart';
import 'package:flutter_web/model/news.dart';
import 'package:flutter_web/utils/utils.dart';

class NewsDetails extends StatelessWidget {
  final NewsItemModel item;
  NewsDetails({Key key, @required this.item}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          item.title,
          style: getEnCustomFont(13.0, Colors.white),
        ),
      ),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(width: 10.0),
              Text(
                'Title: ',
                style: getEnCustomFont(22.0, Colors.black87),
              ),
              SizedBox(width: 5.0),
              Text(
                item.title != null ? item.title : '-',
                style: getEnCustomFont(22.0, Colors.black87),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(width: 10.0),
              Text(
                'Date: ',
                style: getEnCustomFont(16.0, Colors.black87),
              ),
              Text(
                item.date != null ? item.date : '-',
                style: getEnCustomFont(14.0, Colors.black54),
              )
            ],
          ),
          SizedBox(height: 10.0),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text(
              item.content != null ? item.content : 'Not Content',
              style: getEnCustomFont(14.0, Colors.black54),
            ),
          ),
          SizedBox(height: 50.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                item.author != null ? item.author : '-',
                style: getEnCustomFont(18.0, Colors.black54),
              ),
              SizedBox(width: 10.0),
            ],
          )
        ],
      ),
    );
  }
}

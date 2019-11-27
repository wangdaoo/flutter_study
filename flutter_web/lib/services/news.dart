import 'package:flutter_web/conf/config.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

/// [author] MARS <wangyunfan66@gmail.com>
/// [date] 2019-11-27
/// [fileoverview] 新闻列表数据

getNewsResult() async {
  String url = 'http://' + Config.IP + ':' + Config.PORT + '/?action=getNews';

  var res = await http.get(url);
  String body = res.body;
  var json = jsonDecode(body);
  return json['item'] as List;
}

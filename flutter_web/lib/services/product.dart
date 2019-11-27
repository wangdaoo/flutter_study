import 'package:flutter_web/conf/config.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

/// [author] MARS <wangyunfan66@gmail.com>
/// [date] 2019-11-21
/// [fileoverview] 获取产品列表数据

getProductResult([int page = 0]) async {
  String url = 'http://' +
      Config.IP +
      ':' +
      Config.PORT +
      '/?action=getProducts&page=$page';

  var res = await http.get(url);
  String body = res.body;
  var json = jsonDecode(body);
  return json['item'] as List;
}

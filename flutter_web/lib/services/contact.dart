import 'package:flutter/material.dart';
import 'package:flutter_web/conf/config.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

/// [author] MARS <wangyunfan66@gmail.com>
/// [date] 2019-11-27
/// [fileoverview] 提交数据

getContact(String msg) async {
  String url = 'http://' +
      Config.IP +
      ':' +
      Config.PORT +
      '/?action=contactCompany&msg=$msg';

  var res = await http.get(url);
  String body = res.body;
  var info = body;
  Fluttertoast.showToast(
    msg: info,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.TOP,
    timeInSecForIos: 1,
    backgroundColor: Colors.black54,
    textColor: Colors.white,
    fontSize: 16.0,
  );
  return info;
}

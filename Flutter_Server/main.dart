import 'dart:convert';
import 'dart:io';
import 'data.dart';

main() async {
  var requestServer = await HttpServer.bind('192.168.10.149', 8080);
  print('启动服务');

  // ?处理请求
  // todo:
  await for (HttpRequest request in requestServer) {
    handleMessage(request);
  }
}

void handleMessage(HttpRequest request) {
  try {
    if (request.method == 'GET') {
      handleGET(request);
    } else if (request.method == 'POST') {
      handlePOST(request);
    }
  } catch (e) {
    print('出现了异常, $e');
  }
}

void handleGET(HttpRequest request) {
  // ?获取请求参数
  var action = request.uri.queryParameters['action'];

  if (action == 'getProducts') {
    var page = request.uri.queryParameters['page'];

    print('第$page页数据:' + json.encode(products));

    print('获取产品数据');
    request.response
      ..statusCode = HttpStatus.ok
      ..write(json.encode(products))
      ..close();
  }

  if (action == 'getImages') {
    print('获取轮播图');
    request.response
      ..statusCode = HttpStatus.ok
      ..write(json.encode(images))
      ..close();
  }

  if (action == 'getNews') {
    print('获取新闻数据');
    request.response
      ..statusCode = HttpStatus.ok
      ..write(json.encode(news))
      ..close();
  } else if (action == 'contactCompany') {
    var msg = request.uri.queryParameters['msg'];
    print('留言: ' + msg);

    request.response
      ..statusCode = HttpStatus.ok
      ..write('提交成功')
      ..close();
  }
}

void handlePOST(HttpRequest request) {
  // todo: 处理 post 请求
}

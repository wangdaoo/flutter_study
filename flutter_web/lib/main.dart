import 'package:flutter/material.dart';
import 'package:flutter_web/app.dart';
import 'package:flutter_web/loading.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

// void main() => runApp(MyApp());
void main() {
  // ?视觉调试卡关
  // debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      routes: <String, WidgetBuilder>{
        "app": (BuildContext context) => AppPage(),
        // ?WebView 页面
        "company_info": (BuildContext context) => WebviewScaffold(
              url: "https://www.baidu.com/",
              appBar: AppBar(
                title: Text('WebView 演示'),
                leading: IconButton(
                  icon: Icon(Icons.keyboard_return),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
      },
      home: LoadingPage(),
    );
  }
}

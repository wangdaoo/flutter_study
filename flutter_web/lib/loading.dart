import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/rendering.dart';

/* *
 * @author MARS  <wangyunfan66@gmail.com>
 * @fileoverview 启动页
 */
class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  int _timing = 3;
  Timer _timerPeriod;

  @override
  void initState() {
    super.initState();
    _timerPeriod = new Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (_timing == 0) {
        _timerPeriod.cancel();
        print('启动页展示完毕');
        Navigator.of(context).pushReplacementNamed('app');
        return;
      }
      _timing--;
      setState(() {
        _timing;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Center(
        child: Stack(
          children: <Widget>[
            // ?加载页面背景图
            ConstrainedBox(
              child: Image.asset(
                'assets/images/loading.jpg',
                fit: BoxFit.cover,
              ),
              constraints: BoxConstraints.expand(),
            ),
            Center(
              child: Text(
                'Flutter 启动页',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 28.0,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
            Positioned(
              right: 10.0,
              top: 38.0,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                color: Colors.black12,
                child: Text(
                  '跳过 ${_timing}s',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('app');
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

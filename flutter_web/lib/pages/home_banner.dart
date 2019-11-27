import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

class BannerWidget extends StatefulWidget {
  BannerWidget({Key key}) : super(key: key);

  @override
  _BannerWidgetState createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  /// [method] 轮播图
  /// [description] 获取轮播图地址
  /// todo: 后期替换网络图片
  // _getImage() async {
  //   String url = 'http://192.168.10.145:8080/?action=getImages';
  //   var res = await http.get(url);
  //   String body = res.body;
  //   var json = jsonDecode(body);
  //   var newList = json['list'].map((item) => item['url']).toList();
  //   return newList;
  // }

  List<String> banners = <String>[
    'assets/images/banners/1.jpg',
    'assets/images/banners/2.jpg',
    'assets/images/banners/3.jpg',
    'assets/images/banners/4.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = width * 540.0 / 1080.0;

    return Container(
      width: width,
      height: height,
      child: Swiper(
        itemBuilder: (BuildContext context, index) {
          return Container(
            margin: EdgeInsets.fromLTRB(6.0, 8.0, 6.0, 8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(const Radius.circular(20.0)),
              image: DecorationImage(
                image: AssetImage(
                  banners[index],
                ),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
        // ?轮播数量
        itemCount: banners.length,
        // ?方向
        scrollDirection: Axis.horizontal,
        // ?是否自动播放
        autoplay: true,
      ),
    );
  }
}

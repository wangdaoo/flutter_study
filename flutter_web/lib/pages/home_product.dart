import 'package:flutter/material.dart';
import 'package:flutter_web/model/product.dart';
import 'package:flutter_web/pages/product_detail.dart';
import 'package:flutter_web/utils/utils.dart' as utils;

/// [author] MARS <wangyunfan66@gmail.com>
/// [date] 2019-11-21
/// [fileoverview] 列表展示

class HomeProduct extends StatelessWidget {
  final ProductListModal list;
  HomeProduct(this.list);

  @override
  Widget build(BuildContext context) {
    // ?计算宽度
    double deviceWidth = MediaQuery.of(context).size.width;

    // ?背景容器
    return Container(
      width: deviceWidth,
      color: Colors.white,
      padding: EdgeInsets.all(6.0),
      child: _build(context, deviceWidth),
    );
  }

  Widget _build(BuildContext context, double deviceWidth) {
    // ?Item 宽度
    double itemWidth = deviceWidth * 168.5 / 360;
    double imageWidth = deviceWidth * 110.0 / 360;

    // ?返回产品列表
    List<Widget> listWidgets = list.data.map((i) {
      // * 颜色值定义
      var bgColor = utils.string2Color('#f8f8f8');
      Color titleColor = utils.string2Color('#db5411');
      Color subTitleColor = utils.string2Color('#999999');

      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetail(item: i),
            ),
          );
        },
        child: Container(
          width: itemWidth,
          margin: EdgeInsets.only(bottom: 5.0, left: 3.5),
          padding: EdgeInsets.fromLTRB(13.0, 10.0, 0, 7.0),
          color: bgColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                i.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: utils.getEnCustomFont(15.0, titleColor),
              ),
              Text(
                i.desc,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: utils.getEnCustomFont(12.0, subTitleColor),
              ),
              Container(
                alignment: Alignment(0, 0),
                margin: EdgeInsets.only(top: 5.0),
                child: Image.network(
                  i.imageUrl,
                  width: imageWidth,
                  height: imageWidth,
                ),
              ),
            ],
          ),
        ),
      );
    }).toList();

    // ?最终要返回的
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 5.0, bottom: 5.0),
          child: Text(
            'Chief Group Consultant',
            style: utils.getEnCustomFont(16.0, Color(0xff40c4ff)),
          ),
        ),
        // ?流式布局
        Wrap(
          spacing: 2,
          children: listWidgets,
        ),
      ],
    );
  }
}

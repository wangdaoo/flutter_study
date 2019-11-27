import 'package:flutter/material.dart';
import 'package:flutter_web/model/product.dart';
import 'package:flutter_web/utils/utils.dart' as utils;

class ProductDetail extends StatelessWidget {
  final ProductItemModel item;
  const ProductDetail({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(5.0),
            child: Image.network(
              item.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            item.name,
            style: utils.getEnCustomFont(20.0, Colors.black87),
            textAlign: TextAlign.start,
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              item.desc,
              style: utils.getEnCustomFont(16.0, Colors.black54),
            ),
          )
        ],
      ),
    );
  }
}

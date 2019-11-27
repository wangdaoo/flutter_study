import 'package:flutter/material.dart';
import 'package:flutter_web/model/product.dart';
import 'package:flutter_web/pages/home_banner.dart';
import 'package:flutter_web/pages/home_product.dart';
import 'package:flutter_web/services/product.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ProductListModal listData = ProductListModal([]);

  void getProductList() async {
    var data = await getProductResult();
    ProductListModal list = ProductListModal.fromJson(data);

    setState(() {
      listData.data.addAll(list.data);
    });
  }

  @override
  void initState() {
    super.initState();
    getProductList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          BannerWidget(),
          HomeProduct(listData),
        ],
      ),
    );
  }
}

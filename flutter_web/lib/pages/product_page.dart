import 'package:flutter/material.dart';
import 'package:flutter_web/model/product.dart';
import 'package:flutter_web/services/product.dart';
import 'package:flutter_web/pages/demo/chart_page.dart';
import 'package:flutter_web/pages/product_list_page.dart';

class ProductPage extends StatefulWidget {
  ProductPage({Key key}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  ProductListModal listData = ProductListModal([]);
  int page = 0;
  void getProductList() async {
    var data = await getProductResult(page++);
    ProductListModal list = ProductListModal.fromJson(data);

    setState(() {
      listData.data.addAll(list.data);
    });
  }

  void initState() {
    super.initState();
    getProductList();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ChartDemo(),
        SizedBox(height: 20.0),
        ProductResultListWidget(
          listData,
          getNextPage: () => getProductList(),
        ),
      ],
    );
  }
}

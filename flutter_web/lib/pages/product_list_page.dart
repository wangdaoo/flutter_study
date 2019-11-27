import 'package:flutter/material.dart';
import 'package:flutter_web/model/product.dart';
import 'package:flutter_web/pages/product_detail.dart';
import 'package:flutter_web/style/index.dart';
import 'package:flutter_web/utils/utils.dart' as utils;

class ProductResultListWidget extends StatelessWidget {
  final ProductListModal list;
  // ?获取下一页列表数据
  final VoidCallback getNextPage;
  const ProductResultListWidget(this.list, {this.getNextPage});

  @override
  Widget build(BuildContext context) {
    return list.data.length == 0
        ? Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            // ?解决无线高度问题
            shrinkWrap: true,
            // ?禁用滑动事件
            physics: NeverScrollableScrollPhysics(),
            itemCount: list.data.length,
            padding: EdgeInsets.symmetric(horizontal: 10),
            itemBuilder: (BuildContext context, int i) {
              ProductItemModel item = list.data[i];
              // todo: 有问题, 后续调研一下下拉加载组件
              // print(list.data.length);
              // if ((i + 1) == list.data.length) {
              //   getNextPage();
              // }

              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetail(item: item),
                    ),
                  );
                },
                child: Container(
                  color: ProductColors.bgColor,
                  padding: EdgeInsets.fromLTRB(0, 5.0, 5.0, 0),
                  child: Row(
                    children: <Widget>[
                      // ?图片
                      Image.network(
                        item.imageUrl,
                        width: 120.0,
                        height: 100.0,
                      ),
                      SizedBox(width: 10.0),
                      // ?防止溢出
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                width: 1.0,
                                color: ProductColors.divideLineColor,
                              ),
                            ),
                          ),
                          // ?产品信息 垂直布局
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                item.desc,
                                style: utils.getEnCustomFont(
                                  14.0,
                                  Colors.black54,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(width: 5.0),
                              Text(
                                item.type,
                                style: utils.getEnCustomFont(
                                  14.0,
                                  Colors.red,
                                ),
                              ),
                              Text(
                                item.name,
                                style: utils.getEnCustomFont(
                                  12.0,
                                  Color(0xFF999999),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
              // return ListTile(
              //   // leading: Icon(Icons.local_offer),
              //   leading: CircleAvatar(
              //     backgroundImage: NetworkImage(item.imageUrl),
              //   ),
              //   title: Text(
              //     item.name,
              //     style: utils.getEnCustomFont(14.0, Colors.black87),
              //   ),
              //   subtitle: Text(
              //     item.desc,
              //     style: utils.getEnCustomFont(11.0, Colors.black54),
              //     maxLines: 2,
              //     overflow: TextOverflow.ellipsis,
              //   ),
              //   // ?dense 使文本更小，并将所有内容打包在一起
              //   // dense: true,
              //   trailing: Icon(Icons.keyboard_arrow_right),
              //   // ?轻触点击事件
              //   onTap: () {
              //     print('轻触点击事件');
              //   },
              //   // ?长按点击事件
              //   onLongPress: () {
              //     print('长按点击事件~~~~~~~');
              //   },
              // );
            },
          );
  }
}

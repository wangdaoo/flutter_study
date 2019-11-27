/// [author] MARS <wangyunfan66@gmail.com>
/// [date] 2019-11-21
/// [fileoverview] 模型层

// ?产品列表项数据转换
class ProductItemModel {
  String desc;
  String type;
  String name;
  String imageUrl;

  ProductItemModel({
    this.desc,
    this.type,
    this.name,
    this.imageUrl,
  });

  // ?工厂模式
  factory ProductItemModel.fromJson(dynamic json) {
    return ProductItemModel(
      desc: json['desc'],
      type: json['type'],
      name: json['name'],
      imageUrl: json['imageUrl'],
    );
  }
}

// ?列表数据转换
class ProductListModal {
  List<ProductItemModel> data;
  ProductListModal(this.data);

  factory ProductListModal.fromJson(List json) {
    return ProductListModal(
      json.map((f) => ProductItemModel.fromJson((f))).toList(),
    );
  }
}

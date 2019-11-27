/// [author] MARS <wangyunfan66@gmail.com>
/// [date] 2019-11-21
/// [fileoverview] 新闻数据模型层

// ?新闻列表项数据转换
class NewsItemModel {
  String author;
  String title;
  String date;
  String content;

  NewsItemModel({
    this.author,
    this.title,
    this.date,
    this.content,
  });

  // ?工厂模式
  factory NewsItemModel.fromJson(dynamic json) {
    return NewsItemModel(
      author: json['author'],
      title: json['title'],
      date: json['date'],
      content: json['content'],
    );
  }
}

// ?列表数据转换
class NewsListModal {
  List<NewsItemModel> data;
  NewsListModal(this.data);

  factory NewsListModal.fromJson(List json) {
    return NewsListModal(
      json.map((f) => NewsItemModel.fromJson((f))).toList(),
    );
  }
}

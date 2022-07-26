import 'package:news_api/models/source_model.dart';

class Artical {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Artical(
      {this.title,
      this.url,
      this.author,
      this.content,
      this.description,
      this.publishedAt,
      this.source,
      this.urlToImage});
  factory Artical.fromJson(Map<String, dynamic> json) {
    return Artical(
      title: json['title'],
      url: json['url'],
      author: json['author'],
      content: json['content'],
      description: json['description'],
      publishedAt: json['publishedAt'],
      urlToImage: json['urlToImage'],
      source: Source.fromJson(json['source']),
    );
  }
}

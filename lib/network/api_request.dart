import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:news_api/const/const.dart';
import 'package:news_api/models/news.dart';

News parseNews(String responseBody) {
  var l = json.decode(responseBody);
  var news = News.fromJson(l);
  return news;
}

Future<News> fetchNewsByCategory(String category) async {
  final response = await http.get(Uri.parse(
      '$mainUrl$topHeadlines?language=en&category=$category&country=us&$apiKey'));
  if (response.statusCode == 200)
    return compute(parseNews, response.body);
  else if (response.statusCode == 404)
    throw Exception();
  else
    throw Exception('Not get aPI');
}

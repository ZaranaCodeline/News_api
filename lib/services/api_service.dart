import 'dart:convert';

import 'package:http/http.dart';
import 'package:news_api/models/artical_model.dart';

class ApiService {
  final endPointUrl =
      'https://newsapi.org/v2/top-headlines?country=us&apiKey=be444e0368f64d58b63fbd4623aa63c4';
  Future<List<Artical>> getArtical() async {
    Response res = await get(Uri.parse(endPointUrl));
    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);
      List<dynamic> body = json['articles'];

      List<Artical> articles =
          body.map((dynamic item) => Artical.fromJson(item)).toList();

      return articles;
    } else {
      throw ('Error>>>>>>');
    }
  }
}

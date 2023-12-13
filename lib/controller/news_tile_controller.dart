import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/model/news_tile_model.dart';

class NewsTileController with ChangeNotifier {
  NewsApiModel newsModel = NewsApiModel();
  Map<String, dynamic> decodeData = {};
  bool isLoading = false;

  Future fetchData() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.parse(
      "https://newsapi.org/v2/everything?q=tesla&from=2023-11-13&sortBy=publishedAt&apiKey=2026da76706e49c697d9a1c0cc8928d1",
    );
    final res = await http.get(url);

    if (res.statusCode == 200) {
      decodeData = jsonDecode(res.body);
      newsModel = NewsApiModel.fromJson(decodeData);
    } else {
      print("api failed");
    }
    isLoading = false;
    notifyListeners();
  }
}

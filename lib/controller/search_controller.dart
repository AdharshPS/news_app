import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/model/news_tile_model.dart';

class SearchScreenController with ChangeNotifier {
  bool isLoading = false;
  NewsApiModel newsSearchModel = NewsApiModel();
  Map<String, dynamic> data = {};

  Future searchData({required String searchData}) async {
    isLoading = true;
    notifyListeners();
    final url = Uri.parse(
      "https://newsapi.org/v2/everything?q=$searchData&from=2023-11-13&sortBy=publishedAt&apiKey=2026da76706e49c697d9a1c0cc8928d1",
    );
    final response = await http.get(url);

    if (response.statusCode == 200) {
      data = jsonDecode(response.body);
      newsSearchModel = NewsApiModel.fromJson(data);
    }
    isLoading = false;
    notifyListeners();
  }
}

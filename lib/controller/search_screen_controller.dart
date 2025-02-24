import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_aggregator_app/model/newsModel.dart';

class SearchScreenController with ChangeNotifier {
  bool isLoading = false;
  NewsModel? searchNewsData;
  getSearchNews(String query) async {
    isLoading = true;
    notifyListeners();
    final url = Uri.parse(
        "https://newsapi.org/v2/everything?q=$query&apiKey=60edf66736d044eb9be30750d8fa0ee8");
    final responseData = await http.get(url);
    try {
      if (responseData.statusCode == 200) {
        searchNewsData = newsModelFromJson(responseData.body);
      }
      isLoading = false;
      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }
}

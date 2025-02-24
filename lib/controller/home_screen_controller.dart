import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_aggregator_app/model/newsModel.dart';

class HomeScreenController with ChangeNotifier {
  NewsModel? newsData;
  bool isLoading = false;
  getAllNews() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.parse(
        "https://newsapi.org/v2/everything?q=everything&apiKey=60edf66736d044eb9be30750d8fa0ee8");
    final response = await http.get(url);
    try {
      if (response.statusCode == 200) {
        newsData = newsModelFromJson(response.body);
      }
    } catch (e) {
      print(e.toString());
    }

    isLoading = false;
    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import 'package:news_aggregator_app/model/newsModel.dart';
import 'package:http/http.dart' as http;

class DiscoveryScreenController with ChangeNotifier {
  int selectedCategoryIndex = 0;
  final List<String> categories = [
    'general',
    'business',
    'sports',
    'health',
    'technology'
  ];
  String apiKey = "60edf66736d044eb9be30750d8fa0ee8";
  NewsModel? newsData;
  bool isLoading = false;
  getAllNews({String category = ''}) async {
    isLoading = true;
    notifyListeners();
    final url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=$apiKey");
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

  getNewsByCategory(String category) {
    // To implement when getting working api
    // https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=d97946e870be4d1e85ef8d1ad96965ac
  }

  onCategorySelection(int index) {
    selectedCategoryIndex = index;
    getAllNews(category: categories[selectedCategoryIndex]);

    notifyListeners();
  }
}
// https://newsapi.org/v2/top-headlines?country=de&category=business&apiKey=d97946e870be4d1e85ef8d1ad96965ac

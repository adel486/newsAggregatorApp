import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:news_aggregator_app/model/bookmarkModel.dart';

class Bookmarkcontroller with ChangeNotifier {
  final Box<Bookmark> _bookmarkBox = Hive.box<Bookmark>('bookmarks');

  List<Bookmark> get bookmarks => _bookmarkBox.values.toList();

  void toggleBookmark(Bookmark bookmark) {
    if (_bookmarkBox.containsKey(bookmark.title)) {
      _bookmarkBox.delete(bookmark.title);
    } else {
      _bookmarkBox.put(bookmark.title, bookmark);
    }
    notifyListeners();
  }

  bool isBookmarked(String title) {
    return _bookmarkBox.containsKey(title);
  }
}

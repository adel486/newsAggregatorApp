import 'package:hive/hive.dart';

part 'bookmarkModel.g.dart';

@HiveType(typeId: 0)
class Bookmark {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final String description;

  @HiveField(2)
  final String author;

  @HiveField(3)
  final String content;

  @HiveField(4)
  final String publishedAt;

  @HiveField(5)
  final String imageUrl;

  Bookmark({
    required this.title,
    required this.description,
    required this.author,
    required this.content,
    required this.publishedAt,
    required this.imageUrl,
  });
}

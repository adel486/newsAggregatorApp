import 'package:flutter/material.dart';
import 'package:news_aggregator_app/controller/bookmarkController.dart';
import 'package:news_aggregator_app/model/bookmarkModel.dart';
import 'package:provider/provider.dart';

class newsCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String author;
  final String content;
  final String publishedAt;

  const newsCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.author,
    required this.content,
    required this.publishedAt,
  });

  @override
  Widget build(BuildContext context) {
    final bookmarkProvider = Provider.of<Bookmarkcontroller>(context);
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Container
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              imageUrl,
              height: 125,
              width: 125,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 10), // Increased spacing for better layout
          // News Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4),
                Text(
                  description,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    // Author Profile Image
                    CircleAvatar(
                      radius: 15,
                      backgroundImage: NetworkImage(
                        "https://images.pexels.com/photos/1708539/pexels-photo-1708539.jpeg?auto=compress&cs=tinysrgb&w=600",
                      ),
                    ),
                    SizedBox(width: 10),
                    // Author Name & Published Date
                    Expanded(
                      child: Text(
                        "$author  •  $publishedAt",
                        style: TextStyle(fontSize: 12, color: Colors.black54),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),

                    Expanded(
                      child: IconButton(
                          onPressed: () {
                            Bookmark bookmark = Bookmark(
                              title: title,
                              description: description,
                              author: author,
                              content: content,
                              publishedAt: publishedAt,
                              imageUrl: imageUrl,
                            );
                            bookmarkProvider.toggleBookmark(bookmark);
                          },
                          icon: Icon(
                            bookmarkProvider.isBookmarked(title)
                                ? Icons.bookmark
                                : Icons.bookmark_border,
                            color: bookmarkProvider.isBookmarked(title)
                                ? Colors.blue
                                : Colors.grey,
                          )),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:news_aggregator_app/controller/bookmarkController.dart';
import 'package:news_aggregator_app/controller/home_screen_controller.dart';
import 'package:news_aggregator_app/view/newsDetailsScreen/news_details_screen.dart';
import 'package:provider/provider.dart';

class BookmarksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<HomeScreenController>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white, title: Text("Bookmarked Articles")),
      body: Consumer<Bookmarkcontroller>(
        builder: (context, bookmarkProvider, child) {
          if (bookmarkProvider.bookmarks.isEmpty) {
            return Center(child: Text("No Bookmarks Yet!"));
          }
          return ListView.builder(
            itemCount: bookmarkProvider.bookmarks.length,
            itemBuilder: (context, index) {
              final bookmark = bookmarkProvider.bookmarks[index];
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewsDetailsScreen(
                          Author: bookmarkProvider.bookmarks[index].author
                              .toString(),
                          title: bookmarkProvider.bookmarks[index].title
                              .toString(),
                          description: bookmarkProvider
                              .bookmarks[index].description
                              .toString(),
                          image: bookmarkProvider.bookmarks[index].imageUrl
                              .toString(),
                        ),
                      ));
                },
                child: ListTile(
                  leading: Image.network(bookmark.imageUrl,
                      width: 50, height: 50, fit: BoxFit.cover),
                  title: Text(bookmark.title),
                  subtitle: Text(bookmark.publishedAt),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      bookmarkProvider.toggleBookmark(bookmark);
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

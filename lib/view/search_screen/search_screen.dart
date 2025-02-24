import 'package:flutter/material.dart';
import 'package:news_aggregator_app/controller/search_screen_controller.dart';
import 'package:news_aggregator_app/view/home_screen/widgets/newsCard.dart';
import 'package:news_aggregator_app/view/newsDetailsScreen/news_details_screen.dart';

import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            children: [
              SearchBar(
                onChanged: (value) async {
                  if (value.length.isEven) {
                    await context
                        .read<SearchScreenController>()
                        .getSearchNews(value);
                  }
                },
                leading: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                backgroundColor: WidgetStatePropertyAll(Colors.white),
                textStyle:
                    WidgetStatePropertyAll(TextStyle(color: Colors.black)),
              ),
              Expanded(
                  child: Consumer<SearchScreenController>(
                      builder: (context, value, child) => value.isLoading
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              child: ListView.builder(
                                itemBuilder: (context, index) => InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => NewsDetailsScreen(
                                              Author: value
                                                      .searchNewsData!
                                                      .articles![index]
                                                      .author ??
                                                  "No author",
                                              title: value.searchNewsData!
                                                      .articles![index].title ??
                                                  "No title",
                                              description: value
                                                      .searchNewsData!
                                                      .articles![index]
                                                      .description ??
                                                  "No description",
                                              image: value
                                                      .searchNewsData!
                                                      .articles![index]
                                                      .urlToImage ??
                                                  "https://images.pexels.com/photos/1323550/pexels-photo-1323550.jpeg?auto=compress&cs=tinysrgb&w=600"),
                                        ));
                                  },
                                  child: newsCard(
                                      imageUrl: value.searchNewsData!
                                              .articles![index].urlToImage ??
                                          "https://images.pexels.com/photos/1323550/pexels-photo-1323550.jpeg?auto=compress&cs=tinysrgb&w=600",
                                      title: value.searchNewsData!.articles![index].title ??
                                          "no title",
                                      description: value.searchNewsData!
                                              .articles![index].description ??
                                          "no description",
                                      author: value.searchNewsData!.articles![index].author ??
                                          "no author",
                                      content: value.searchNewsData!
                                              .articles![index].content ??
                                          "no content",
                                      publishedAt: value.searchNewsData!
                                          .articles![index].publishedAt
                                          .toString()),
                                ),
                              ),
                            )))
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:news_aggregator_app/controller/discovery_screen_controller.dart';
import 'package:news_aggregator_app/view/home_screen/widgets/newsCard.dart';
import 'package:news_aggregator_app/view/newsDetailsScreen/news_details_screen.dart';
import 'package:news_aggregator_app/view/search_screen/search_screen.dart';
import 'package:provider/provider.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        await context.read<DiscoveryScreenController>().getAllNews();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final discoverProvider = context.watch<DiscoveryScreenController>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.arrow_back_ios,
              size: 30,
            ),
          ),
          Spacer(),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchScreen(),
                  ));
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.search,
                size: 30,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: Consumer<DiscoveryScreenController>(
        builder: (context, discoveryProvider, child) => SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Discover",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "News from all around the world...",
                  style: TextStyle(fontSize: 13, color: Colors.grey.shade700),
                ),
                SizedBox(height: 5),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(discoveryProvider.categories.length,
                        (index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            context
                                .read<DiscoveryScreenController>()
                                .onCategorySelection(index);
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            height: 40,
                            decoration: BoxDecoration(
                                color: index ==
                                        discoveryProvider.selectedCategoryIndex
                                    ? Colors.blue
                                    : Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(30)),
                            child: Text(
                              discoveryProvider.categories[index],
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14,
                                  color: index ==
                                          discoveryProvider
                                              .selectedCategoryIndex
                                      ? Colors.white
                                      : Colors.grey.shade700),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                SizedBox(
                  height: 550,
                  child: discoverProvider.isLoading
                      ? Center(child: CircularProgressIndicator())
                      : ListView.separated(
                          itemBuilder: (context, index) => InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => NewsDetailsScreen(
                                              Author: discoverProvider
                                                      .newsData!
                                                      .articles![index]
                                                      .author ??
                                                  "No author",
                                              title: discoverProvider.newsData!
                                                      .articles![index].title ??
                                                  "No title",
                                              description: discoverProvider
                                                      .newsData!
                                                      .articles![index]
                                                      .description ??
                                                  "No discription",
                                              image: discoverProvider
                                                      .newsData!
                                                      .articles![index]
                                                      .urlToImage ??
                                                  "https://images.pexels.com/photos/1323550/pexels-photo-1323550.jpeg?auto=compress&cs=tinysrgb&w=600")));
                                },
                                child: newsCard(
                                  imageUrl: discoveryProvider.newsData!
                                          .articles![index].urlToImage ??
                                      "https://images.pexels.com/photos/30326244/pexels-photo-30326244/free-photo-of-classic-car-driving-through-snowy-mountain-landscape.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load",
                                  title: discoveryProvider
                                      .newsData!.articles![index].title
                                      .toString(),
                                  description: discoveryProvider
                                      .newsData!.articles![index].description
                                      .toString(),
                                  author: discoveryProvider
                                      .newsData!.articles![index].author
                                      .toString(),
                                  content: discoveryProvider
                                      .newsData!.articles![index].content
                                      .toString(),
                                  publishedAt: discoveryProvider
                                      .newsData!.articles![index].publishedAt
                                      .toString(),
                                ),
                              ),
                          separatorBuilder: (context, index) => SizedBox(
                                height: 5,
                              ),
                          itemCount:
                              discoveryProvider.newsData!.articles!.length),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

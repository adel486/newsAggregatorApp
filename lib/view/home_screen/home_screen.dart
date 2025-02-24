import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:news_aggregator_app/controller/home_screen_controller.dart';
import 'package:news_aggregator_app/view/home_screen/widgets/newsCard.dart';
import 'package:news_aggregator_app/view/newsDetailsScreen/news_details_screen.dart';
import 'package:news_aggregator_app/view/search_screen/search_screen.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timestamp) async {
      await context.read<HomeScreenController>().getAllNews();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final homeProvider = context.watch<HomeScreenController>();
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "News app",
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          actions: [
            Icon(Icons.notifications_outlined),
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
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
        body: homeProvider.isLoading
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Breaking news",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1, color: Colors.grey),
                                color: Colors.transparent,
                                shape: BoxShape.circle),
                            child: Icon(
                              Icons.arrow_forward,
                              color: Colors.black,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CarouselSlider(
                          items: List.generate(
                              homeProvider.newsData!.articles!.length,
                              (index) => InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => NewsDetailsScreen(
                                                Author: homeProvider
                                                        .newsData!
                                                        .articles![index]
                                                        .author ??
                                                    "No Athour",
                                                title: homeProvider
                                                        .newsData!
                                                        .articles![index]
                                                        .title ??
                                                    "No article available",
                                                description: homeProvider
                                                        .newsData!
                                                        .articles![index]
                                                        .description ??
                                                    "No discription",
                                                image: homeProvider
                                                        .newsData!
                                                        .articles![index]
                                                        .urlToImage ??
                                                    "https://images.pexels.com/photos/1563356/pexels-photo-1563356.jpeg?auto=compress&cs=tinysrgb&w=600"),
                                          ));
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Stack(
                                        children: [
                                          Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              child: CachedNetworkImage(
                                                  imageUrl: homeProvider
                                                          .newsData!
                                                          .articles![index]
                                                          .urlToImage ??
                                                      "https://images.pexels.com/photos/247851/pexels-photo-247851.jpeg?auto=compress&cs=tinysrgb&w=600",
                                                  errorWidget: (context, url,
                                                          error) =>
                                                      Image.network(
                                                          "https://images.pexels.com/photos/247851/pexels-photo-247851.jpeg?auto=compress&cs=tinysrgb&w=600")),
                                            ),
                                          ),
                                          Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                    colors: [
                                                  Colors.black.withOpacity(0.6),
                                                  Colors.transparent
                                                ],
                                                    begin:
                                                        Alignment.bottomCenter,
                                                    end: Alignment.topCenter)),
                                          ),
                                          Positioned(
                                              bottom: 20,
                                              left: 20,
                                              right: 20,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    homeProvider
                                                            .newsData!
                                                            .articles![index]
                                                            .title ??
                                                        "No title",
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    homeProvider
                                                            .newsData!
                                                            .articles![index]
                                                            .description ??
                                                        "No discription",
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 2,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.normal),
                                                  )
                                                ],
                                              ))
                                        ],
                                      ),
                                    ),
                                  )),
                          options: CarouselOptions(
                              height: 225,
                              autoPlay: true,
                              enlargeCenterPage: true,
                              aspectRatio: 16 / 9,
                              viewportFraction: 0.9)),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            "Recommendation",
                            style: TextStyle(
                                fontSize: 28,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          Text(
                            "View all",
                            style: TextStyle(fontSize: 14, color: Colors.blue),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 400,
                        child: ListView.separated(
                            itemBuilder: (context, index) => InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => NewsDetailsScreen(
                                              Author: homeProvider
                                                      .newsData!
                                                      .articles![index]
                                                      .author ??
                                                  "No author",
                                              title: homeProvider.newsData!
                                                      .articles![index].title ??
                                                  "No title",
                                              description: homeProvider
                                                      .newsData!
                                                      .articles![index]
                                                      .description ??
                                                  "No discription",
                                              image: homeProvider
                                                      .newsData!
                                                      .articles![index]
                                                      .urlToImage ??
                                                  "https://images.pexels.com/photos/30326244/pexels-photo-30326244/free-photo-of-classic-car-driving-through-snowy-mountain-landscape.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load"),
                                        ));
                                  },
                                  child: newsCard(
                                    imageUrl: homeProvider.newsData!
                                            .articles![index].urlToImage ??
                                        "https://images.pexels.com/photos/30326244/pexels-photo-30326244/free-photo-of-classic-car-driving-through-snowy-mountain-landscape.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load",
                                    title: homeProvider
                                            .newsData!.articles![index].title ??
                                        "No title",
                                    description: homeProvider.newsData!
                                            .articles![index].description ??
                                        "No discirption",
                                    author: homeProvider.newsData!
                                            .articles![index].author ??
                                        "No author",
                                    content: homeProvider.newsData!
                                            .articles![index].content ??
                                        "No content",
                                    publishedAt: homeProvider
                                        .newsData!.articles![index].publishedAt
                                        .toString(),
                                  ),
                                ),
                            separatorBuilder: (context, index) => SizedBox(
                                  height: 5,
                                ),
                            itemCount: homeProvider.newsData!.articles!.length),
                      )
                    ],
                  ),
                ),
              ));
  }
}

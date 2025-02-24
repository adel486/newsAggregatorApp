import 'package:flutter/material.dart';

class NewsDetailsScreen extends StatelessWidget {
  final String Author;
  final String title;
  final String description;
  final String image;
  const NewsDetailsScreen(
      {super.key,
      required this.Author,
      required this.title,
      required this.description,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Stack(children: [
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          fit: BoxFit.cover, image: NetworkImage(image))),
                  // child: Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Container(
                  //       alignment: Alignment.bottomCenter,
                  //       height: 300,
                  //       decoration: BoxDecoration(color: Colors.transparent),
                  //       child: Column(
                  //         mainAxisSize: MainAxisSize.min,
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Text(
                  //             Author,
                  //             style: TextStyle(
                  //                 color: Colors.white,
                  //                 fontSize: 30,
                  //                 fontWeight: FontWeight.bold),
                  //           ),
                  //           Text(
                  //             maxLines: 3,
                  //             overflow: TextOverflow.ellipsis,
                  //             title,
                  //             style: TextStyle(
                  //                 fontSize: 18,
                  //                 fontWeight: FontWeight.bold,
                  //                 color: Colors.white),
                  //           ),
                  //         ],
                  //       )),
                  // ),
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Colors.black.withOpacity(0.6),
                    Colors.transparent
                  ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
                ),
                Positioned(
                    bottom: 20,
                    left: 20,
                    right: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          description,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.normal),
                        )
                      ],
                    ))
              ]),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.transparent),
                child: Text(
                  description,
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

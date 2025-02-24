import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_aggregator_app/controller/auth_controller.dart';
import 'package:news_aggregator_app/view/bookmarkScreen/bookmarkScreen.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 120,
                  ),
                ),
                SizedBox(height: 25),
                Center(
                  child: Text("Name",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                ),
                Center(
                  child: Text("Name@gmail.com", style: TextStyle(fontSize: 18)),
                ),
                SizedBox(height: 30),
                Row(
                  children: [
                    Icon(Icons.edit, color: Colors.black, size: 18),
                    SizedBox(width: 8),
                    Text(
                      "Edit profile",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios_outlined, size: 18)
                  ],
                ),
                SizedBox(height: 15),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BookmarksScreen(),
                        ));
                  },
                  child: Row(
                    children: [
                      Icon(Icons.bookmark, color: Colors.black, size: 18),
                      SizedBox(width: 8),
                      Text(
                        "Saved Articles",
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios_outlined, size: 18)
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Icon(Icons.account_box_rounded,
                        color: Colors.black, size: 18),
                    SizedBox(width: 8),
                    Text(
                      "Contact Me",
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios_outlined, size: 18)
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Icon(CupertinoIcons.exclamationmark_circle,
                        color: Colors.black, size: 18),
                    SizedBox(width: 8),
                    Text(
                      "About",
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 18,
                    )
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Icon(Icons.logout_outlined, color: Colors.black, size: 18),
                    SizedBox(width: 8),
                    InkWell(
                      onTap: () {
                        context.read<AuthController>().logout(context);
                      },
                      child: Text(
                        "Logout",
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 18,
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}

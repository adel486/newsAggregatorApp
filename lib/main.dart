import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:news_aggregator_app/controller/auth_controller.dart';
import 'package:news_aggregator_app/controller/bookmarkController.dart';

import 'package:news_aggregator_app/controller/discovery_screen_controller.dart';
import 'package:news_aggregator_app/controller/home_screen_controller.dart';
import 'package:news_aggregator_app/controller/login_screen_controller.dart';
import 'package:news_aggregator_app/controller/registration_screen_controller.dart';
import 'package:news_aggregator_app/controller/search_screen_controller.dart';
import 'package:news_aggregator_app/firebase_options.dart';
import 'package:news_aggregator_app/model/bookmarkModel.dart';
import 'package:news_aggregator_app/view/splash_screen/splash_screen.dart';
import 'package:provider/provider.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(BookmarkAdapter());
  await Hive.openBox<Bookmark>('bookmarks');

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeScreenController(),
        ),
        ChangeNotifierProvider(
          create: (context) => RegistrationScreenController(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoginScreenController(),
        ),
        ChangeNotifierProvider(
          create: (context) => DiscoveryScreenController(),
        ),
        ChangeNotifierProvider(
          create: (context) => Bookmarkcontroller(),
        ),
        ChangeNotifierProvider(
          create: (context) => AuthController(),
        ),
        ChangeNotifierProvider(
          create: (context) => SearchScreenController(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}

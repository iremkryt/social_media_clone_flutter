import 'package:flutter/material.dart';
import 'package:social_media_clone/pages/auth/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:social_media_clone/pages/auth/sign_up.dart';
import 'package:social_media_clone/pages/home_page.dart';
import 'package:social_media_clone/pages/tab_bar_controller.dart';
import 'package:social_media_clone/utils/customColors.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routes: {
        "/loginPage" :(context) => LoginPage(),
        "/signUp" :(context) => SignUp(),
        "/homePage" :(context) => HomePage(),
      },
      theme: ThemeData(
        scaffoldBackgroundColor: CustomColors.ScaffoldBackgroundColor,
        appBarTheme: AppBarTheme(color: CustomColors.ScaffoldBackgroundColor),
      ),
      home: TabBarController(),
    );
  }
}



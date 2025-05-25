import 'package:flutter/material.dart';
import 'package:ortucare/pages/chat_page.dart';
import 'package:ortucare/pages/class_page.dart';
import 'package:ortucare/pages/first_page.dart';
import 'package:ortucare/pages/home_page.dart';
import 'package:ortucare/pages/login_page.dart';
import 'package:ortucare/pages/register_page.dart';
// import 'package:ortucare/pages/tes.dart';
import 'package:ortucare/pages/profil_page.dart';
import 'package:ortucare/pages/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'lexend'),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => SplashScreen(),
        '/first': (context) => FirstPage(),
        '/register': (context) => RegisterPage(),
        '/login': (context) => LoginOrtuPage(),
        '/home': (context) => HomePageOrtu(),
        '/class': (context) => ClassPage(),
        '/chat': (context) => ChatPage(),
        '/profil': (context) => ProfilePage(),
        // '/tes': (context) => HomePageBook(),
      },
    );
  }
}

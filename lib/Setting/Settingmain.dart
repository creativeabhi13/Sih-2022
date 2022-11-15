import 'package:flutter/material.dart';
import 'package:swaps/pages/Setting_page.dart';
import 'package:swaps/pages/home_page.dart';
import 'package:swaps/pages/Account_page.dart';
import 'package:swaps/pages/test_page.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseApp app= await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Color(0xff6251D1),
        primaryColor: Color(0xff6251D1),
      ),
      routes: {
        "/":(context)=>Homepage(),
        "/h":(context)=>SettingPage(),
        "/a":(context)=>AccountPage(),
        "/t":(context)=>testPage()
      },
    );
  }
}

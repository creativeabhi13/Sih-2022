import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';

import 'Account_Page.dart';
import 'Setting_page.dart';
import 'home_page.dart';


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
        "/a":(context)=>AccountPage()

      },
    );
  }
}

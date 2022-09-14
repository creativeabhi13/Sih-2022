import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:swap/login_page.dart';
import 'package:swap/sign_up_page.dart';
import './Dashboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';
import 'package:awesome_notifications/awesome_notifications.dart';

import 'Utils/Complaint.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      fontFamily: 'Montserrat',
    ),
    title: 'SWAP',
    home: const LoginPage(),
  ));
}

/*

class _LoginPageState extends State<LoginPage> {
  successfulLogin(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Dashboard()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              _addImages("complaint1");
            },
            child: const Text('Student Test Login')),
      ),
    );
  }

  void _addImages(String complaintid) async {
    var storage = FirebaseStorage.instance;

    String img = 'assets/testimage.jpg';
    String imageName = "photo";

    String path = "images";

    final Directory systemTempDir = Directory.systemTemp;
    final byteData = await rootBundle.load(img);
    final file = File('${systemTempDir.path}/$imageName.jpg');

    await file.writeAsBytes(byteData.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

    TaskSnapshot taskSnapshot =
        await storage.ref('$path/$imageName').putFile(file);
    final String downloadUrl = await taskSnapshot.ref.getDownloadURL();

    await FirebaseFirestore.instance
        .collection("complaints")
        .doc("Jyothy")
        .collection("data")
        .doc(complaintid)
        .update({"url": downloadUrl, "name": imageName});
  }
}
*/

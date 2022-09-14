import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:swap/Dashboard.dart';
import 'package:swap/sign_up_page.dart';
import 'Utils/fire_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  final _focusEmail = FocusNode();
  final _focusPassword = FocusNode();

  bool _isProcessing = false;
  var college;

  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      var collection = FirebaseFirestore.instance.collection('userdata');
      var querySnapshot =
          await collection.where('id', isEqualTo: user.uid).get();
      for (var snapshot in querySnapshot.docs) {
        Map<String, dynamic> data = snapshot.data();
        college = data['college'];
      }

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => Dashboard(uid: user.uid, college: college),
        ),
      );
    }

    return firebaseApp;
  }

  String? validateEmail({required String? email}) {
    if (email == null) {
      return null;
    }

    RegExp emailRegExp = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

    if (email.isEmpty) {
      return 'Email can\'t be empty';
    } else if (!emailRegExp.hasMatch(email)) {
      return 'Enter a correct email';
    }

    return null;
  }

  String? validatePassword({required String? password}) {
    if (password == null) {
      return null;
    }

    if (password.isEmpty) {
      return 'Password can\'t be empty';
    } else if (password.length < 6) {
      return 'Enter a password with length at least 6';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _focusEmail.unfocus();
        _focusPassword.unfocus();
      },
      child: Scaffold(
        body: FutureBuilder(
          future: _initializeFirebase(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Padding(
                padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 24.0),
                      child: Text(
                        'Welcome Back!',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                    ),
                    Form(
                      key: _formKey,
                      child: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              controller: _emailTextController,
                              focusNode: _focusEmail,
                              validator: (value) => validateEmail(
                                email: value,
                              ),
                              decoration: InputDecoration(
                                hintText: 'Email',
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 3,
                                      color: Color.fromRGBO(52, 73, 85, 1)),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 2,
                                      color: Color.fromRGBO(52, 73, 85, 1)),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 3, color: Colors.red),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),
                            SizedBox(height: 8.0),
                            TextFormField(
                              controller: _passwordTextController,
                              focusNode: _focusPassword,
                              obscureText: true,
                              validator: (value) => validatePassword(
                                password: value,
                              ),
                              decoration: InputDecoration(
                                hintText: 'Password',
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 3,
                                      color: Color.fromRGBO(52, 73, 85, 1)),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 2,
                                      color: Color.fromRGBO(52, 73, 85, 1)),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 3, color: Colors.red),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),
                            SizedBox(height: 24.0),
                            _isProcessing
                                ? CircularProgressIndicator()
                                : Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: ElevatedButton(
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateColor.resolveWith(
                                              (states) => const Color.fromRGBO(
                                                  249, 170, 51, 1),
                                            ),
                                          ),
                                          onPressed: () async {
                                            _focusEmail.unfocus();
                                            _focusPassword.unfocus();

                                            if (_formKey.currentState!
                                                .validate()) {
                                              setState(() {
                                                _isProcessing = true;
                                              });

                                              User? user = await FireAuth
                                                  .signInUsingEmailPassword(
                                                email:
                                                    _emailTextController.text,
                                                password:
                                                    _passwordTextController
                                                        .text,
                                              );

                                              setState(() {
                                                _isProcessing = false;
                                              });

                                              if (user != null) {
                                                try {} on FirebaseAuthException catch (e) {
                                                  if (e.code ==
                                                      'weak-password') {
                                                  } else if (e.code ==
                                                      'email-already-in-use') {
                                                  } else if (e.code ==
                                                      'user-not-found') {
                                                  } else if (e.code ==
                                                      'wrong-password') {}

                                                  print(e
                                                      .code); //Add this line to see other firebase exceptions.
                                                } catch (e) {
                                                  print(e);
                                                }
                                                Navigator.of(context)
                                                    .pushAndRemoveUntil(
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                Dashboard(
                                                                    uid: user
                                                                        .uid,
                                                                    college:
                                                                        college)),
                                                        (route) => false);
                                              }
                                            }
                                          },
                                          child: Text(
                                            'Sign In',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 24.0),
                                      Expanded(
                                        child: ElevatedButton(
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateColor.resolveWith(
                                              (states) => const Color.fromRGBO(
                                                  249, 170, 51, 1),
                                            ),
                                          ),
                                          onPressed: () {
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    SignUpPage(),
                                              ),
                                            );
                                          },
                                          child: Text(
                                            'Register',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            }

            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}

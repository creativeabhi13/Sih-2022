import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'Dashboard.dart';
import 'Utils/fire_auth.dart';
import 'Utils/size_config.dart';
import 'Utils/validator.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user = FirebaseAuth.instance.currentUser;
  final firestoreInstance = FirebaseFirestore.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  final _registerFormKey = GlobalKey<FormState>();

  final _clgTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  final _focusName = FocusNode();
  final _focusEmail = FocusNode();
  final _focusPassword = FocusNode();

  bool _isProcessing = false;
  int _groupValue = 1;
  bool _isAdmin = false;

  String? validateEmail({required String? email}) {
    if (email == null) {
      setState(() {
        _isProcessing = false;
      });
      return null;
    }

    RegExp emailRegExp = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

    if (email.isEmpty) {
      setState(() {
        _isProcessing = false;
      });
      return 'Email can\'t be empty';
    } else if (!emailRegExp.hasMatch(email)) {
      setState(() {
        _isProcessing = false;
      });
      return 'Enter a correct email';
    }
    setState(() {
      _isProcessing = false;
    });
    return null;
  }

  String? validatePassword({required String? password}) {
    if (password == null) {
      setState(() {
        _isProcessing = false;
      });
      return null;
    }

    if (password.isEmpty) {
      setState(() {
        _isProcessing = false;
      });
      return 'Password can\'t be empty';
    } else if (password.length < 6) {
      setState(() {
        _isProcessing = false;
      });
      return 'Enter a password with length at least 6';
    }
    setState(() {
      _isProcessing = false;
    });

    return null;
  }

  String? validateCollege({required String? clg}) {
    if (clg == null) {
      return null;
    }

    if (clg.isEmpty) {
      return 'Please select a school';
    } else if (clg.length < 6) {
      return 'Enter a password with length at least 6';
    }

    return null;
  }

  String dropdownvalue = 'Select a School';

  // List of items in our dropdown menu
  var items = [
    'Select a School',
    'AID- S B CHANNAPAGOUDAR GIRLS HIGH SCHOOL',
    'GOVT- HIGH SCHOOL AND Jr. COMP BADAMI CITY',
    'GHS ANDHRAL',
    'LPS TIGER HILLS ANDRAL BELLARY',
    'GOVT HIGHSCHOOL MARKANDEYNAGAR',
    'JNYAN GANGOTRI VIDYA SAMSTE PUBLIC SCHOOL VIJAYANAGAR HALGA',
    'SREE RAMAKRISHNA RURAL HIGH SCHOOL',
    'G LPS AGALAKOTE',
    'SREE BYLANJANEYASWAMY HS',
    'SHANTHINIKETAN PUBLIC SCHOOL'
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GestureDetector(
      onTap: () {
        _focusName.unfocus();
        _focusEmail.unfocus();
        _focusPassword.unfocus();
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: SizeConfig.blockSizeVertical * 20,
              ),
              const Center(
                child: Text(
                  "Welcome!",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
              const SizedBox(height: 10), //email text box
              Form(
                key: _registerFormKey,
                child: Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: TextFormField(
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
                                    width: 3,
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
                        ),
                        const SizedBox(height: 10.0),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: TextFormField(
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
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),

                        DropdownButton(
                          // Initial Value
                          isExpanded: true,
                          value: dropdownvalue,

                          // Down Arrow Icon
                          icon: const Icon(Icons.keyboard_arrow_down),

                          // Array list of items
                          items: items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Center(child: Text(items)),
                            );
                          }).toList(),
                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownvalue = newValue!;
                            });
                          },
                        ),
                        const SizedBox(height: 10.0),

                        //if (_isAdmin!)
                        // TypeAheadField(
                        //     suggestionsCallback: suggestionsCallback,
                        //     itemBuilder: (context, suggestion) {
                        //       return ListTile(
                        //         title: Text(),
                        //       );
                        //     },
                        //     onSuggestionSelected: onSuggestionSelected),
                        //SizedBox(height: 20),
                        //typefield
                        Row(
                          children: [
                            Expanded(
                              child: RadioListTile(
                                value: 0,
                                groupValue: _groupValue,
                                title: const Text(
                                  "Admin",
                                  style: TextStyle(fontSize: 22),
                                ),
                                onChanged: (newValue) {
                                  _groupValue = newValue as int;
                                  _isAdmin = true;
                                  ChildWidget(notifyParent: refresh);
                                },
                                activeColor: Colors.red,
                                selected: false,
                              ),
                            ),
                            Expanded(
                              child: RadioListTile(
                                value: 1,
                                groupValue: _groupValue,
                                title: const Text(
                                  "User",
                                  style: TextStyle(fontSize: 22),
                                ),
                                onChanged: (newValue) {
                                  setState(() {
                                    _groupValue = newValue as int;
                                    _isAdmin = false;
                                  });
                                },
                                activeColor: Colors.red,
                                selected: false,
                              ),
                            ),
                          ],
                        ),

                        if (_isProcessing)
                          const CircularProgressIndicator()
                        else
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 25.0),
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateColor.resolveWith(
                                        (states) => const Color.fromRGBO(
                                            249, 170, 51, 1),
                                      ),
                                    ),
                                    onPressed: () async {
                                      setState(() {
                                        _isProcessing = true;
                                      });

                                      if (_registerFormKey.currentState!
                                          .validate()) {
                                        User? user = await FireAuth
                                            .registerUsingEmailPassword(
                                          email: _emailTextController.text,
                                          clg: dropdownvalue,
                                          password:
                                              _passwordTextController.text,
                                        );

                                        setState(() {
                                          _isProcessing = false;
                                        });
                                        final docid = FirebaseFirestore.instance
                                            .collection('userdata')
                                            .doc(user?.uid);

                                        await docid.set({
                                          'email': user?.email,
                                          'college': dropdownvalue,
                                          'type': _isAdmin ? 'Admin' : 'Student'
                                        });
                                        if (user != null) {
                                          Navigator.of(context)
                                              .pushAndRemoveUntil(
                                            MaterialPageRoute(
                                              builder: (context) => Dashboard(
                                                  uid: user.uid,
                                                  college: dropdownvalue),
                                            ),
                                            ModalRoute.withName('/'),
                                          );
                                        }
                                      }
                                    },
                                    child: Container(
                                      height: 40,
                                      child: const Center(
                                        child: Text(
                                          'Sign up',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  refresh() {
    setState(() {});
  }
}

class ChildWidget extends StatefulWidget {
  final Function() notifyParent;

  ChildWidget({Key? key, required this.notifyParent}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

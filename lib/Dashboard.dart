import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:swap/AddComplaint.dart';
import 'package:swap/sign_up_page.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:flutter/services.dart';
import 'login_page.dart';

class Dashboard extends StatefulWidget {
  String? uid, college;
  @override
  Dashboard({required this.uid, required this.college, Key? key})
      : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final Map<String, int> played = {};
  String user = "yTUnv6prp8RwiiLQRUgxuSWDBuy2";
  String usertype = "Admin";
  String college = "Admin";
  String filter = "All";

  //get college => widget.college;
  String? get uid => widget.uid;

  @override
  Widget build(BuildContext context) {
    return getThisAmazingScaffold();
  }

  getThisAmazingScaffold() {
    if (usertype != "Admin") {
      return Scaffold(
        backgroundColor: Colors.white,
        //bottomNavigationBar: getBottomNavbar(),
        drawer: DashboardDrawer(context),
        floatingActionButton: Container(
          height: 75.0,
          width: 75.0,
          child: FittedBox(
            child: FloatingActionButton(
              backgroundColor: const Color.fromRGBO(249, 170, 51, 1),
              onPressed: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const complaints_page())),
              },
              child: const Icon(Icons.add),
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(52, 73, 85, 1),
          title: const Center(
            child: Text(
              'Dashboard',
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
          ),
          actions: [
            PopupMenuButton<String>(
              icon: const Icon(Icons.filter_list),
              onSelected: (String value) {
                setState(() {
                  filter = value;
                });
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: 'All',
                  child: Text('All'),
                ),
                const PopupMenuItem<String>(
                  value: 'Emergency',
                  child: Text('Emergency'),
                ),
                const PopupMenuItem<String>(
                  value: 'Finance',
                  child: Text('Finance'),
                ),
                const PopupMenuItem<String>(
                  value: 'Infrastructure',
                  child: Text('Infrastructure'),
                ),
                const PopupMenuItem<String>(
                  value: 'Extracurricular',
                  child: Text('Extracurricular'),
                ),
                const PopupMenuItem<String>(
                  value: 'Others',
                  child: Text('Others'),
                ),
              ],
            ),
          ],
          toolbarHeight: 60,
        ),
        body: getList(context),
      );
    } else {
      return Scaffold(
        backgroundColor: Colors.white,
        //bottomNavigationBar: getBottomNavbar(),
        drawer: DashboardDrawer(context),
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(52, 73, 85, 1),
          title: const Center(
            child: Text(
              'Dashboard',
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
          ),
          actions: [
            PopupMenuButton<String>(
              icon: const Icon(Icons.filter_list),
              onSelected: (String value) {
                setState(() {
                  filter = value;
                });
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: 'All',
                  child: Text('All'),
                ),
                const PopupMenuItem<String>(
                  value: 'Emergency',
                  child: Text('Emergency'),
                ),
                const PopupMenuItem<String>(
                  value: 'Finance',
                  child: Text('Finance'),
                ),
                const PopupMenuItem<String>(
                  value: 'Infrastructure',
                  child: Text('Infrastructure'),
                ),
                const PopupMenuItem<String>(
                  value: 'Extracurricular',
                  child: Text('Extracurricular'),
                ),
                const PopupMenuItem<String>(
                  value: 'Others',
                  child: Text('Others'),
                ),
              ],
            ),
          ],
          toolbarHeight: 60,
        ),
        body: getList(context),
      );
    }
  }

  Widget DashboardDrawer(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              headerData(context),
              ListTile(
                title: const Text('My Complaints'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => mycomplaint()),
                  );
                },
              ),
              ListTile(
                title: const Text('Settings'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Exit'),
                onTap: () {
                  SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                },
              ),
              ListTile(
                title: const Text('Sign Out'),
                onTap: () async {
                  _signOut();

                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const LoginPage()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<LoginPage> _signOut() async {
    await FirebaseAuth.instance.signOut();
    return const LoginPage();
  }

  Widget headerData(BuildContext context) {
    return DrawerHeader(
      decoration: const BoxDecoration(
        color: Color.fromRGBO(52, 73, 85, 1),
      ),
      child: getType(),
    );
  }

  getType() {
    final CollectionReference userdata =
        FirebaseFirestore.instance.collection('userdata');

    return FutureBuilder<DocumentSnapshot>(
        future: userdata.doc(user).get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text("Error");
          }
          if (snapshot.hasData && !snapshot.data!.exists) {
            return const Text("Missing ID");
          }
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            //college = data['college'];
            if (data['type'] == "user") {
              if (data['subtype'] == "student") {
                return Column(
                  children: const [
                    Icon(Icons.school, size: 80.0),
                    Text("Student",
                        style: TextStyle(color: Colors.white, fontSize: 40))
                  ],
                );
              }
              if (data['subtype'] == "teacher") {
                return Column(
                  children: const [
                    Icon(Icons.support_agent, size: 80.0),
                    Text("Teacher",
                        style: TextStyle(color: Colors.white, fontSize: 40))
                  ],
                );
              }
              if (data['subtype'] == "parent") {
                return Column(
                  children: const [
                    Icon(Icons.supervisor_account, size: 80.0),
                    Text("Parent",
                        style: TextStyle(color: Colors.white, fontSize: 40))
                  ],
                );
              }
            }
            if (data['type'] == "Admin") {
              return Column(
                children: const [
                  Icon(Icons.security, size: 80.0),
                  Text("Admin",
                      style: TextStyle(color: Colors.white, fontSize: 40))
                ],
              );
            }
          }
          return const Text("Logging In");
        });
  }

  getVotes(AsyncSnapshot snapshot, int index) {
    if (snapshot.data!.docs[index]["votes"] == 99999) {
      if (usertype == "Admin") {
        if (played[snapshot.data!.docs[index]["id"]] == null) {
          FlutterRingtonePlayer.play(
            android: AndroidSounds.notification,
            ios: const IosSound(1023),
            looping: false,
            volume: 0.1,
          );
          played[snapshot.data!.docs[index]["id"]] = 1;
        }
      }
      return "SOS";
    } else {
      return snapshot.data!.docs[index]["votes"].toString();
    }
  }

  getBottomNavbar() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.add),
          label: 'Add',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add),
          label: 'Add',
        ),
      ],
    );
  }

  getButtons(BuildContext context,
      AsyncSnapshot<QuerySnapshot<Object?>> snapshot, int index) {
    if (filter == "All" || snapshot.data!.docs[index]["category"] == filter) {
      return Column(
        children: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  //shape: const StadiumBorder(),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  shadowColor: const Color.fromRGBO(100, 100, 100, 255),
                  primary: const Color.fromRGBO(52, 73, 85, 1),
                  side: const BorderSide(width: 3, color: Colors.white),
                  elevation: 3),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) =>
                      complaintDetails(context, snapshot, index),
                );
              },
              child: Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 14.0,
                ),
                constraints: const BoxConstraints(
                  minHeight: 10, //minimum height
                  maxHeight: 60,
                ),
                alignment: Alignment.center,
                child: Row(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          color: Color.fromRGBO(249, 170, 51, 1),
                          borderRadius: BorderRadius.all(Radius.circular(40))),
                      child: SizedBox(
                        width: 90,
                        child: Center(
                          child: Text(getVotes(snapshot, index),
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Text(snapshot.data!.docs[index]["title"],
                          style: const TextStyle(
                              color: Colors.white, fontSize: 20)),
                    ),
                  ],
                ),
              )),
          const SizedBox(
            height: 20,
          ),
        ],
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  getList(BuildContext context) {
    if (usertype == "Admin") {
      return StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("/complaints/Jyothy/data")
              .orderBy('votes', descending: true)
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: Text("No data"));
            }
            return ListView.builder(
                //padding: const EdgeInsets.only(top: 100.0, left: 8.0, right: 8.0),
                padding:
                    const EdgeInsets.only(top: 20.0, left: 8.0, right: 8.0),
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (_, int index) {
                  return Container(
                    child: getButtons(context, snapshot, index),
                  );
                });
          });
    } else {
      return StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("/complaints/$college/data")
              .orderBy('votes', descending: true)
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: Text("No data"));
            }
            return ListView.builder(
                //padding: const EdgeInsets.only(top: 100.0, left: 8.0, right: 8.0),
                padding:
                    const EdgeInsets.only(top: 20.0, left: 8.0, right: 8.0),
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (_, int index) {
                  return Container(
                    child: getButtons(context, snapshot, index),
                  );
                });
          });
    }
  }

  getEditButton(BuildContext context, String complaintid) {
    final CollectionReference userdata =
        FirebaseFirestore.instance.collection('userdata');
    return FutureBuilder<DocumentSnapshot>(
        future: userdata.doc(user).get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text("Error");
          }
          if (snapshot.hasData && !snapshot.data!.exists) {
            return const Text("Missing ID");
          }
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            if (data['complaints'].contains(complaintid)) {
              return TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child:
                    const Text('Edit', style: TextStyle(color: Colors.white)),
              );
            }
          }
          return const SizedBox.shrink();
        });
  }

  Widget complaintDetails(
      BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot, int index) {
    if (usertype == "Admin") {
      return Container(
        //color: const Color.fromRGBO(4, 25, 85, 255),
        child: AlertDialog(
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
              side: BorderSide(color: Colors.black),
              borderRadius: BorderRadius.all(Radius.circular(32.0))),
          title: Text(snapshot.data!.docs[index]["title"],
              style: const TextStyle(color: Colors.black)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Divider(height: 30, thickness: 5, color: Colors.teal),
              Text(snapshot.data!.docs[index]["description"],
                  style: const TextStyle(color: Colors.black)),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                FirebaseFirestore.instance
                    .collection("complaints")
                    .doc("Jyothy")
                    .collection("data")
                    .doc(snapshot.data!.docs[index]["id"])
                    .update({"status": "closed"});
                Navigator.of(context).pop();
              },
              child: const Text('Solve', style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
      );
    } else {
      return Container(
        //color: const Color.fromRGBO(4, 25, 85, 255),
        child: AlertDialog(
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
              side: BorderSide(color: Colors.black),
              borderRadius: BorderRadius.all(Radius.circular(32.0))),
          title: Text(snapshot.data!.docs[index]["title"],
              style: const TextStyle(color: Colors.black)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Divider(height: 30, thickness: 5, color: Colors.teal),
              Text(snapshot.data!.docs[index]["description"],
                  style: const TextStyle(color: Colors.black)),
            ],
          ),
          actions: <Widget>[
            Container(
                child:
                    getEditButton(context, snapshot.data!.docs[index]["id"])),
            TextButton(
              onPressed: () {
                if (snapshot.data!.docs[index]["votes"] != 99999) {
                  FirebaseFirestore.instance
                      .collection("complaints")
                      .doc(college)
                      .collection("data")
                      .doc(snapshot.data!.docs[index]["id"])
                      .update(
                          {"votes": (snapshot.data!.docs[index]["votes"] + 1)});
                }
                Navigator.of(context).pop();
              },
              child: const Text('Vote', style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
      );
    }
  }
}

class mycomplaint extends StatefulWidget {
  @override
  State<mycomplaint> createState() => _mycomplaintState();
}

class _mycomplaintState extends State<mycomplaint> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Complaints"),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.w500,
        ),
        automaticallyImplyLeading: true,
        elevation: 3,
        backgroundColor: const Color.fromRGBO(52, 73, 85, 1),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              color: Color.fromRGBO(52, 73, 85, 1)),
        ),
      ),
      body: _createDataTable1(),
    );
  }
}

_createDataTable1() {
  return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection("/complaints/Jyothy/data")
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: Text("No data"));
        }
        return ListView.builder(
          //padding: const EdgeInsets.only(top: 100.0, left: 8.0, right: 8.0),
          padding: const EdgeInsets.only(top: 20.0, left: 8.0, right: 8.0),
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (_, int index) {
            return getListTile(snapshot, index);
          },
        );
      });
}

getListTile(
  AsyncSnapshot snapshot,
  int index,
) {
  if (snapshot.data!.docs[index]["votes"] != 99999 &&
      snapshot.data!.docs[index]["status"] == "closed") {
    return ListTile(
      leading: Text(snapshot.data!.docs[index]["votes"].toString()),
      trailing: Text(snapshot.data!.docs[index]["title"]),
    );
  } else if (snapshot.data!.docs[index]["votes"] == 99999 &&
      snapshot.data!.docs[index]["status"] == "closed") {
    return ListTile(
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.black, width: 2),
        borderRadius: BorderRadius.circular(5),
      ),
      leading: const Text("SOS"),
      trailing: Text(snapshot.data!.docs[index]["title"]),
    );
  } else {
    return const SizedBox.shrink();
  }
}

class NotificationService {
  static final NotificationService _notificationService =
      NotificationService._internal();

  factory NotificationService() {
    return _notificationService;
  }

  NotificationService._internal();
}

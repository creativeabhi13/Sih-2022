import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'Utils/Complaint.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class complaints_page extends StatefulWidget {
  const complaints_page({Key? key}) : super(key: key);

  @override
  State<complaints_page> createState() => _complaints_pageState();
}

class _complaints_pageState extends State<complaints_page> {
  //List<String> items=['Finance','Infrastructure','Teaching','Extracurricular','Other'];
  //String? selectedItem='Finance';

  List<dynamic> statemasters = [];
  List<dynamic> state = [];
  String selectedvalue = "Emergency";

  String? categoryID;
  String? stateId;
  final titlecontroller = TextEditingController();
  final categoriescontroller = TextEditingController();
  final desccontroller = TextEditingController();

  // @override
  // void dispose(){
  //   titlecontroller.dispose();
  //   categoriescontroller.dispose();
  //   desccontroller.dispose();
  //
  //   super.dispose();
  // }
  // Future addComplaint(String title,String categories,String Description) async {
  //   await FirebaseFirestore.instance.collection('complaints').add({
  //     'Title':title,
  //     'Categories':categories,
  //     'Description':Description,
  //   });
  // }
  // @override
  // void initState()
  // {
  //
  //    super.initState();
  //    this.categories.add({"id":"Emergency","label":"Emergency"});
  //    this.categories.add({"id":"Finance","label":"Finance"});
  //    this.categories.add({"id":"Teaching","label":"Teaching"});
  //    this.categories.add({"id":"Extracurricular","label":"Extracurricular"});
  //    this.categories.add({"id":"Infrastructure","label":"Infrastructure"});
  //   //  this.categories.add({"id":6,"label":"Others"});
  //   //  this.statemasters=[
  //   //    {"ID":1,"Name":"Floods","ParentId":1},
  //   // {"ID":2,"Name":"Fire","ParentId":1},
  //   // {"ID":3,"Name":"Harrassment","ParentId":1},
  //   // {"ID":4,"Name":"Ragging","ParentId":1},
  //   // ];
  //
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromRGBO(52, 73, 85, 1),
        title: const Center(
          child: Text(
            'ADD COMPLAINT',
            style: TextStyle(fontSize: 30, color: Colors.white),
          ),
        ),
        toolbarHeight: 60,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 25),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(190, 190, 190, 1),
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: titlecontroller,
                      style: const TextStyle(fontSize: 15, color: Colors.white),
                      minLines: 1,
                      maxLines: 2,
                      maxLength: 40,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Title',
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(190, 190, 190, 1),
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: DropdownButton(
                          value: selectedvalue,
                          items: const [
                            DropdownMenuItem(
                              value: "Emergency",
                              child: Text("Emergency"),
                            ),
                            DropdownMenuItem(
                              value: "Finance",
                              child: Text("Finance"),
                            ),
                            DropdownMenuItem(
                              value: "Infrastructure",
                              child: Text("Infrastructure"),
                            ),
                            DropdownMenuItem(
                              value: "Extracurricular",
                              child: Text("Extracurricular"),
                            ),
                            DropdownMenuItem(
                                value: "Others", child: Text("Others")),
                          ],
                          onChanged: (value) {
                            setState(() {
                              selectedvalue = value.toString();
                            });
                          }),
                    ),
                  )),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(190, 190, 190, 1),
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: desccontroller,
                      minLines: 1,
                      maxLines: 12,
                      maxLength: 350,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        fillColor: Colors.white,
                        hintText: 'Description',
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  icon: const Icon(Icons.attach_file),
                  onPressed: () {
                    showModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (builder) => bottomsheet());
                  },
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    //color: const Color.fromRGBO(4, 25, 85, 1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        //shape: const StadiumBorder(),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        shadowColor: const Color.fromRGBO(100, 100, 100, 255),
                        primary: const Color.fromRGBO(249, 170, 51, 1),
                        side: const BorderSide(width: 3, color: Colors.teal),
                        elevation: 3),
                    child: const Center(
                        child: Text(
                      'Submit',
                      style: TextStyle(
                        color: Colors.black,
                        //   fontWeight: FontWeight.bold,
                        //   fontSize: 18,
                      ),
                    )),
                    onPressed: () {
                      int vote = 0;
                      if (selectedvalue == "Emergency") {
                        vote = 99999;
                      }
                      if ((desccontroller.text.trim() != "") &&
                          (selectedvalue.trim() != "") &&
                          (titlecontroller.text.trim() != "")) {
                        final newComplaint = Complaint(
                            title: titlecontroller.text,
                            categories: selectedvalue,
                            description: desccontroller.text,
                            votes: vote);
                        createComplaint(newComplaint);

                        Navigator.pop(context);
                      } else {
                        Alert(
                                context: context,
                                title: "Invalid Submission",
                                desc: "Enter all fields")
                            .show();
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomsheet() {
    return Container(
      height: 250,
      width: MediaQuery.of(context).size.width,
      child: Card(
          margin: const EdgeInsets.all(18),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    iconcreation(Icons.insert_photo, Colors.indigo, "Photo"),
                    //    SizedBox(
                    //     width: 40,
                    //   ),
                    //   iconcreation(Icons.camera_alt, Colors.pink, "Camera"),
                    //   const SizedBox(
                    //     width: 40,
                    //   ),
                    //   iconcreation(Icons.insert_photo, Colors.purple, "Gallery"),
                  ],
                ),
              ],
            ),
          )),
    );
  }

  Widget iconcreation(IconData icon, Color color, String text) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          CircleAvatar(
              radius: 30,
              backgroundColor: color,
              child: Icon(
                icon,
                size: 29,
                color: Colors.white,
              )),
          const SizedBox(
            height: 5,
          ),
          Text(text,
              style: const TextStyle(
                fontSize: 12,
              )),
        ],
      ),
    );
  }
}

Future createComplaint(Complaint complaint) async {
  final docComp = FirebaseFirestore.instance
      .collection("complaints")
      .doc("Jyothy")
      .collection("data")
      .doc();
  complaint.id = docComp.id;
  final json = complaint.toJson();
  await docComp.set(json);
}

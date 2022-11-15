import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class mycomplaint extends StatefulWidget {
  const mycomplaint({Key? key}) : super(key: key);

  @override
  State<mycomplaint> createState() => _mycomplaintState();
}

class _mycomplaintState extends State<mycomplaint> {
  int counter=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: const Text("Mycomplaints"),
        titleTextStyle: TextStyle(color:Colors.white,fontSize: 22,fontWeight:FontWeight.w500,),
        automaticallyImplyLeading: true,
        elevation: 3,
        backgroundColor: Color(0xff6251D1),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
              color: Colors.blueAccent),
        ),
      ),

      // Mycomplaint Page

      body:Center(


          child: ToggleSwitch(
            minWidth: 550.0,
            totalSwitches: 2,
            labels: ['Solved', 'Pending'],
            activeBgColors: [[Colors.white],[Colors.white]],
            onToggle: (index) {

              setState(() {

              });

            },

          ),

        ),

    );
  }
  }

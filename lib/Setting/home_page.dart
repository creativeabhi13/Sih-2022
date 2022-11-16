import 'package:flutter/material.dart';


import '../Dashboard.dart';
import 'Setting_page.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed:() {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context)=>SettingPage()
                    ));

                  }, child: Text('Setting')),
                  SizedBox(
                    height: 20,
                  ),
                  // ElevatedButton(onPressed:() {
                  //   Navigator.push(context, MaterialPageRoute(
                  //       builder: (context)=>testPage(),
                  //   ));
                  //
                  // }, child: Text('test')),

                  ElevatedButton(onPressed:() {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context)=>mycomplaint(),
                    ));

                  }, child: Text('Mycomplaint')),
                ],
              )

          ),

      ),
    );


  }
}

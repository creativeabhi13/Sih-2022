import 'package:flutter/material.dart';
import 'package:swaps/pages/Setting_page.dart';
import 'package:swaps/pages/mycomplaint.dart';
import 'package:swaps/pages/test_page.dart';

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
                  ElevatedButton(onPressed:() {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context)=>testPage(),
                    ));

                  }, child: Text('test')),

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

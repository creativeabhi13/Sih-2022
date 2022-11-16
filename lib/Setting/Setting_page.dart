import 'package:flutter/material.dart';


import 'Account_Page.dart';


class SettingPage extends StatefulWidget {
  @override
  State<SettingPage> createState() => _SettingPageState();
}
class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    const IconData settings = IconData(0xe57f, fontFamily: 'MaterialIcons');
    return Scaffold(
      appBar:  AppBar(
        title: const Text(""),
        automaticallyImplyLeading: true,
        elevation: 3,
        backgroundColor: Color(0xff6251D1),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
              color: Colors.blueAccent),
        ),
      ),  body: Container(
        padding: EdgeInsets.only(left:30,top:20,right:25),
        child: ListView(
            children: [
              Text(
                "Settings",
                style: TextStyle( color:Colors.white,fontSize: 33,fontWeight:FontWeight.w500),
              ),
              SizedBox(height: 20,),
              // ********Account***********
              Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                  color: Colors.blue,
                  child:Column(
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.person_rounded, color:Colors.white,size: 50,),
                        title: Text("Accounts",style: TextStyle(fontSize: 30,fontWeight:FontWeight.w500,color: Colors.white),),
                        trailing: Icon(Icons.arrow_forward_ios_outlined,color:Colors.white),
                        onTap:() {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context)=>AccountPage()
                          ));
                        },)
                    ],
                  )
              ),   // **** *****change password************8
              const SizedBox(height: 20,),
              Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
                  color: Colors.lightBlueAccent,
                  child:Column(
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.lock_outline, color:Colors.white,size: 30,),
                        title: Text("Change Password",style: TextStyle(fontSize: 25,fontWeight:FontWeight.w500,color: Colors.white),),
                        trailing: Icon(Icons.arrow_forward_ios_outlined,color:Colors.white),
                        onTap:() {
                          showDialog(context: context, builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Change password"),
                              content: Column(
                                mainAxisSize:MainAxisSize.min,
                                children: [
                                  Text("option 1"),
                                  Text("option 2"),
                                  Text("option 3"),
                                ],),
                              actions: [
                               ElevatedButton(onPressed: (){
                                  Navigator.of(context).pop();
                                }, child: Text("close")),
                              ],
                            );
                          });
                        },
                      )
                    ],
                  )
              ),
  // **** ********Social*************
              const SizedBox(height: 10,),
              Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
                  color: Colors.lightBlueAccent,
                  child:Column(
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.mark_email_read_outlined, color:Colors.white,size: 30,),
                        title: Text("Social",style: TextStyle(fontSize: 25,fontWeight:FontWeight.w500,color: Colors.white),),
                        trailing: Icon(Icons.arrow_forward_ios_outlined,color:Colors.white),
                        onTap:() {
                          showDialog(context: context, builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Social"),
                              content: Column(
                                mainAxisSize:MainAxisSize.min,
                                children: [
                                  Text("option 1"),
                                  Text("option 2"),
                                  Text("option 3"),
                                ],),
                              actions: [
                              ElevatedButton(onPressed: (){
                                  Navigator.of(context).pop();
                                }, child: Text("close")),
                              ],
                            );
                          });
                        },
                      )
                    ],
                  )
              ),    // **** ********Lanuaguages*************
              const SizedBox(height: 10,),
              Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
                  color: Colors.lightBlueAccent,
                  child:Column(
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.language_outlined, color:Colors.white,size: 30,),
                        title: Text("Languages",style: TextStyle(fontSize: 25,fontWeight:FontWeight.w500,color: Colors.white),),
                        trailing: Icon(Icons.arrow_forward_ios_outlined,color:Colors.white),
                        onTap:() {
                          showDialog(context: context, builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Lanaguages"),
                              content: Column(
                                mainAxisSize:MainAxisSize.min,
                                children: [
                                  Text("option 1"),
                                  Text("option 2"),
                                  Text("option 3"),
                                ],),
                              actions: [
                               ElevatedButton(onPressed: (){
                                  Navigator.of(context).pop();
                                }, child: Text("close")),
                              ],
                            );
                          });
                        },
                      )
                    ],
                  )
              ),// **** ********privacy *************
              const SizedBox(height: 10,),
              Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
                  color: Colors.lightBlueAccent,
                  child:Column(
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.security_outlined, color:Colors.white,size: 30,),
                        title: Text("Privacy & Security",style: TextStyle(fontSize: 25,fontWeight:FontWeight.w500,color: Colors.white),),
                        trailing: Icon(Icons.arrow_forward_ios_outlined,color:Colors.white),
                        onTap:() {
                          showDialog(context: context, builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Privacy & Setting"),
                              content: Column(
                                mainAxisSize:MainAxisSize.min,
                                children: [
                                  Text("option 1"),
                                  Text("option 2"),
                                  Text("option 3"),
                                ],),
                              actions: [
                               ElevatedButton(onPressed: (){
                                  Navigator.of(context).pop();
                                }, child: Text("close")),
                              ],
                            );
                          });
                        },
                      )
                    ],
                  )
              ),
              // **** ********privacy *************
              const SizedBox(height: 10,),
              Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
                  color: Colors.lightBlueAccent,
                  child:Column(
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.security_outlined, color:Colors.white,size: 30,),
                        title: Text("Privacy & Security",style: TextStyle(fontSize: 25,fontWeight:FontWeight.w500,color: Colors.white),),
                        trailing: Icon(Icons.arrow_forward_ios_outlined,color:Colors.white),
                        onTap:() {
                          showDialog(context: context, builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Privacy & Setting"),
                              content: Column(
                                mainAxisSize:MainAxisSize.min,
                                children: [
                                  Text("option 1"),
                                  Text("option 2"),
                                  Text("option 3"),
                                ],),
                              actions:
                              [
                               ElevatedButton(onPressed: (){
                                  Navigator.of(context).pop();
                                }, child: Text("close")),
                              ],
                            );
                          });
                        },
                      )
                    ],
                  )
              ),

              //********* Additional Setting*********
      Text("Additional Settings",style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),),
              //********Dark theme*****
              const SizedBox(height: 15,),
              SwitchListTile(
                dense: true,
                value:true,
                activeColor: Colors.yellow,
                contentPadding: const EdgeInsets.all(0),
                title:Text("Dark Theme",style: TextStyle(fontSize: 20,fontWeight:FontWeight.w500,color: Colors.white),),
                onChanged: (val){},
              ),

//******** Recieved Notification*****
              const SizedBox(height: 10,),
              SwitchListTile(
                dense: true,
                value:true,
                activeColor: Colors.yellow,
                contentPadding: const EdgeInsets.all(0),
                title:Text("Recieved Notification",style: TextStyle(fontSize: 20,fontWeight:FontWeight.w500,color: Colors.white),),
                onChanged: (val){},
              ),
//********Auto Update*****
              const SizedBox(height: 10,),
              SwitchListTile(
                dense: true,
                value:true,
                activeColor: Colors.yellow,
                contentPadding: const EdgeInsets.all(0),
                title:Text("Auto Update",style: TextStyle(fontSize: 20,fontWeight:FontWeight.w500,color: Colors.white),),
                onChanged: (val){},
              ),

            ]
        ),
      ),
    );
  }
}




import 'package:flutter/material.dart';


import 'Setting_page.dart';
class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(


      actions: [
        IconButton(
      icon:Icon(
      Icons.settings_outlined,
        color: Colors.white,
      ),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(
            builder: (context)=>SettingPage()

        ));
        },
    ),
],
        elevation: 3,
        backgroundColor: Color(0xff6251D1),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
              color: Colors.blueAccent),

        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left:30,top:20,right:25),
       child:ListView(
         children: [
           Text("Your Profile",
                 style:TextStyle(fontSize: 25,fontWeight: FontWeight.w500,color: Colors.white),
           ),
         SizedBox(
            height: 20,
         ),
         Center(
             child: Stack(
             children: [
               Container(
                 width: 130,
                 height: 130,
                 decoration: BoxDecoration(
                   border: Border.all(
                     width:5,
                     color:Colors.blueAccent
                   ),
                   boxShadow:[ BoxShadow(
                     spreadRadius: 2,blurRadius: 10,
                     color:Colors.black.withOpacity(0.1),
                     offset: Offset(0,10)
                   )
                   ],
                   shape: BoxShape.circle,
                   image: DecorationImage(image:NetworkImage("https://scontent.fblr22-1.fna.fbcdn.net/v/t39.30808-6/291106294_2308169885990227_6606028230601871816_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=730e14&_nc_ohc=9ZzcQeCJHIQAX-sjT_W&_nc_ht=scontent.fblr22-1.fna&oh=00_AT_mcxgkC8B_EX3ih8lsez29HzF6QQ0A7eplCfPRu_z2oA&oe=63094F4C"),
                     fit: BoxFit.cover,
                   )
                 ),
               ),
               Positioned(
                  bottom: 0,
                   right: 0,
                   child: Container(
                 height: 40,
                 width: 40,
                 decoration: BoxDecoration(shape: BoxShape.circle,
                   border: Border.all(
                     width: 5,
                     color: Colors.lightGreenAccent,
                   ),
                   color:Colors.blueGrey,
                 ),
                 child: Icon(Icons.check,color: Colors.white,size: 30,),
               ))
             ],
           )
         ),
           SizedBox(
             height: 25,
           ),// name
              TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(bottom: 5),
                  labelText: "Full Name",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: "Abhishek Kumar",
                  labelStyle:TextStyle(
                    fontSize: 20,fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ), hintStyle:TextStyle(
                    fontSize: 20,fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )

                ),
              ),SizedBox(
             height: 25,
           ),
// email
           TextField(
             decoration: InputDecoration(
                 contentPadding: EdgeInsets.only(bottom: 5),
                 labelText: "Email ",
                 floatingLabelBehavior: FloatingLabelBehavior.always,
                 hintText: "abhxxxxx@gmail.com",
                 labelStyle:TextStyle(
                   fontSize: 20,fontWeight: FontWeight.bold,
                   color: Colors.white,
                 ),
                 hintStyle:TextStyle(
                   fontSize: 20,fontWeight: FontWeight.bold,
                   color: Colors.white,
                 )),
           ),
           SizedBox(
             height: 25,
           ),
// email
           TextField(
             decoration: InputDecoration(
                 contentPadding: EdgeInsets.only(bottom: 5),
                 labelText: "Pasword ",
                 floatingLabelBehavior: FloatingLabelBehavior.always,
                 hintText: "*****",
                 labelStyle:TextStyle(
                   fontSize: 20,fontWeight: FontWeight.bold,
                   color: Colors.white,
                 ),
                 hintStyle:TextStyle(
                   fontSize: 20,fontWeight: FontWeight.bold,
                   color: Colors.white,
                 ),
               ),
           ),
         ],
       ),

      ),
    );
  }
}

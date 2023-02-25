import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:country_list_pick/country_list_pick.dart';
import 'package:newsapp/login.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'news.dart';
 class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
   TextEditingController emailAddress=TextEditingController();
   TextEditingController password=TextEditingController();
    void emailauth() async{
   try {
  final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: emailAddress.text,
    password: password.text,
  );
   VxToast.show(context,msg: "SignUP Successfull",textColor: Vx.green800);
   
   Navigator.push(context,MaterialPageRoute(builder: (context)=>News()));
} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
       VxToast.show(context,msg: e.code, textColor: Vx.red800,);
    print('The password provided is too weak.');
  } else if (e.code == 'email-already-in-use') {
    print('The account already exists for that email.');
      VxToast.show(context,msg: e.code, textColor: Vx.red800,);
  }
} catch (e) {
  print(e);
}
    }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       resizeToAvoidBottomInset: false,
       backgroundColor: Color.fromARGB(255, 139, 140, 142),
       appBar: AppBar(automaticallyImplyLeading: false,
        elevation: 0,title:HStack(["Social".text.gray200.make(),WidthBox(3),"X".text.white.size(30).make()])),
       body: Column(
         children: [
           Container(
            height: 60,
                   width: double.infinity,
                    decoration: BoxDecoration(
                       color:Colors.white,
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(35),bottomRight: Radius.circular(35)),
                        border:Border.all(color: Colors.red)
                    ),
                     child: Row(
                      // mainAxisAlignment:MainAxisAlignment.spaceBetween,
                      
                      children: [
                       InkWell(
                         onTap: (){
                           Navigator.push(context,MaterialPageRoute(builder: (context)=>Login()));
                         },
                         child: Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width * 0.50,
                           decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(35),bottomRight: Radius.circular(35)),
                            // color: Colors.red
                           ),
                            child: "LOGIN".text.gray600.bold.size(15).makeCentered(),
                         ),
                       ),
                        Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width*0.49,
                         decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(35),bottomRight: Radius.circular(35)),
                          // color: Colors.green
                          color: Colors.red
                         ),
                          child: "SIGNUP".text.gray600.bold.size(15).makeCentered(),
                       )
                     ],)
             
           ),
            Expanded(
               flex: 4,
              child: Padding(
                padding: const EdgeInsets.only(top:10.0,bottom: 10),
                child: Container(
                   height: MediaQuery.of(context).size.height,
                    width: double.infinity,
                     decoration: BoxDecoration( color: Colors.white,
                     borderRadius: BorderRadius.circular(40)),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                      
                            "Create an Account".text.red500.bold.size(30).make(),
                            "Name".text.bold.black.size(15).make().p1(),
                           ListTile(
                             title: TextFormField(
                            
                              decoration: InputDecoration(hintText: "Jhon doe"),

                             ),
                              trailing: Icon(Icons.person,color: Colors.red,),
                           ),
                            "Email".text.bold.black.size(15).make().p1(),
                            ListTile(
                             title: TextFormField(
                               controller: emailAddress,
                              decoration: InputDecoration(hintText: "Email@gmail.com"),

                             ),
                              trailing: Icon(Icons.email,color: Colors.red,),
                           ),
                            "Contact No".text.bold.black.size(15).make().p1(),
                            ListTile(
                               leading:  Container(
                                 width: MediaQuery.of(context).size.width*0.4,
                                 height: 30,
                                child: CountryListPick(onChanged: (value) {
                                   setState(() {
                                     
                                   });
                                  
                                },)
                                 
                                ),
                             title: TextFormField(
                              decoration: InputDecoration(hintText: "Jhon doe"),

                             ),
                              trailing: Icon(Icons.call,color: Colors.red,),
                           ),
                            "Passwrd".text.bold.black.size(15).make().p1(),
                            ListTile(
                             title: TextFormField(
                               controller: password,
                              obscureText: true,
                              decoration: InputDecoration(hintText: "Password"),

                             ),
                              trailing: Icon(Icons.lock,color: Colors.red,),
                           )
                          ],
                        ),
                      ),
                      
                          
                ),
              ),
            ),

           Expanded(
             
             child: Align(
               alignment: FractionalOffset.bottomCenter,
               child: InkWell(
                 onTap: () {
                   emailauth();
                    print(emailAddress);
                    print(password);
                 },      
                 
                 child: Container(
                    height: 60,
                     width: double.infinity,
                      decoration: BoxDecoration(
                         color:Color.fromARGB(255, 242, 34, 19),
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(35),topRight: Radius.circular(35))
                      ),
                     
                    child: "REGISTER".text.white.bold.size(20).makeCentered(),
                 ),
               )
             ),
           ),
         ],
       ),
        

    );
  }
}
// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:country_list_pick/country_list_pick.dart';
import 'package:newsapp/signup.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:firebase_auth/firebase_auth.dart';
 import 'package:fluttertoast/fluttertoast.dart';
 import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

 import 'package:google_sign_in/google_sign_in.dart';

import 'news.dart';
 class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Future<UserCredential> signInWithFacebook() async {
  // Trigger the sign-in flow
  final LoginResult loginResult = await FacebookAuth.instance.login();

  // Create a credential from the access token
  final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);

  // Once signed in, return the UserCredential
  return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
}
  Future<UserCredential> signInWithGoogle() async {
 
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
 
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

 
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

   
  return await FirebaseAuth.instance.signInWithCredential(credential);
}
   
   
   TextEditingController emailAddress=TextEditingController();
   TextEditingController password=TextEditingController();
//     void gsignin()async{
//    final FirebaseAuth _auth = FirebaseAuth.instance;
// final GoogleSignIn _googleSignIn = GoogleSignIn();

//     }
    void fetchuser()async{
  try {
  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: emailAddress.text,
    password: password.text
  );
  
  VxToast.show(context,msg: " LogIn Successfull",textColor: Vx.green800);
   
   Navigator.push(context,MaterialPageRoute(builder: (context)=>News()));
} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
      VxToast.show(context,msg: e.code, textColor: Vx.red800,);
    print('No user found for that email.');
  } else if (e.code == 'wrong-password') {
     VxToast.show(context,msg: e.code, textColor: Vx.red800,);
  
    print('Wrong password provided for that user.');
  }
}}
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
                       Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width * 0.50,
                         decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(35),bottomRight: Radius.circular(35)),
                          color: Colors.red
                         ),
                          child: "LOGIN".text.gray600.bold.size(15).makeCentered(),
                       ),
                        InkWell(
                           onTap: (){
                            Navigator.push(context,MaterialPageRoute(builder: (context)=>SignUp()));
                              
                           },
                          child: Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width*0.49,
                           decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(35),bottomRight: Radius.circular(35)),
                            // color: Colors.green
                           ),
                            child: "SIGNUP".text.gray600.bold.size(15).makeCentered(),
                                               ),
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
                      
                            "Sign In into your Account".text.red500.bold.size(30).make(),
                         
                            "Email".text.bold.black.size(15).make().p1(),
                            ListTile(
                             title: TextFormField(
                               controller: emailAddress,
                              decoration: InputDecoration(hintText: "Email@gmail.com"),

                             ),
                              trailing: Icon(Icons.email,color: Colors.red,),
                           ),
                           
                            "Passwrd".text.bold.black.size(15).make().p1(),
                            ListTile(
                             title: TextFormField(
                              controller: password,
                              obscureText: true,
                              decoration: InputDecoration(hintText: "Password"),

                             ),
                              trailing: Icon(Icons.lock,color: Colors.red,),
                           ),
                            "Login with".text.bold.makeCentered().p16(),
                            Align(
                              alignment: Alignment.center,
                              child: Row(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: (){
                                       print("df");
                                   signInWithGoogle();
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>News()));
                                    },
                                    child: VxBox( child: Image.network("https://cdn1.iconfinder.com/data/icons/google-s-logo/150/Google_Icons-09-1024.png")).square(40).red100.makeCentered()),
                                   WidthBox(20),
                                  InkWell(
                                     onTap: (){
                                      signInWithFacebook();

                                     },
                                    child: VxBox(child: Image.network("https://cdn2.iconfinder.com/data/icons/social-media-and-payment/64/-04-128.png")).square(40).red100.makeCentered()),
                                ],
                            
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                 "Don`t have an account ?".text.makeCentered(),
                                 InkWell(
                                   onTap: (){
                                        Navigator.push(context,MaterialPageRoute(builder: (context)=>SignUp()));

                                   },
                                  
                                  child: "SignUp".text.red800.bold.makeCentered())
                            
                              ],
                            ).p16()
                            
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
                 onTap: (){
                  fetchuser();
                 },
                 child: Container(
                    height: 60,
                     width: double.infinity,
                      decoration: BoxDecoration(
                         color:Color.fromARGB(255, 242, 34, 19),
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(35),topRight: Radius.circular(35))
                      ),
                     
                    child: "LOGIN".text.white.bold.size(20).makeCentered(),
                 ),
               )
             ),
           ),
         ],
       ),
        

    );
     
  }
}
 void showtoast(String str){
      Fluttertoast.showToast(msg: str,
      );
     }
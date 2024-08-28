import 'package:chat_app/constants.dart';
import 'package:chat_app/helper/show_snack_bar.dart';
import 'package:chat_app/pages/chat_page.dart';
import 'package:chat_app/widgets/custom_button.dart';
import 'package:chat_app/widgets/custom_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterPage extends StatefulWidget {
  
  const RegisterPage({super.key});

  static String id = 'RegisterPage' ;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String ? email ;

  String ? password ;

  bool isLoading = false ;

  GlobalKey<FormState> globalKey = GlobalKey() ;

  @override
  Widget build(BuildContext context) {
    return  ModalProgressHUD(
      
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Form(
            key: globalKey,
            child: ListView(
              children: [
               const SizedBox(height: 100,) ,
                Image.asset(kLogo, height: 100 , width: 100,),
               const Text("Scholar Chat",
                style:  TextStyle( 
                  color: Colors.white ,
                  fontSize: 32 ,
                ),
                ),
            
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                 children: [
                    Text( "REGISTER" ,
                    style: TextStyle(
                     color: Colors.white ,
                      fontSize: 32 , 
                    ),
                    ),
                 ],
               ),
            
                CustomFormTextField(hintText: "Email" , 
                onChanged: (data) {email = data ; } ,
                ),
                CustomFormTextField(hintText: "Password" ,
                onChanged: (data) { password=data; }  ,
                ),
                CustomButton(
                  name: "Register",
                   onTap: () async { 
                   if (globalKey.currentState!.validate() ){
                    isLoading = true;
                    setState((){});       
                    try {
                await UserRegister();
                Navigator.pushNamed(context, ChatPage.id ) ;
                 }  on FirebaseAuthException catch (e){
                     if (e.code == 'user-not-found') {
                       ShowSnackBar(context , 'No user found for that email.' );
                     } else if (e.code == 'wrong-password') {
                      ShowSnackBar(context , 'Wrong password provided for that user.' );
                        }
                 }
                 catch (e){
                  ShowSnackBar(context , e.toString() ); 
                 }
                 isLoading = false ;
                 setState((){}) ;
                 }
                   }
                 ),
                const SizedBox(height: 10,) ,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   const Text("already have an account?  " , 
                   style: TextStyle(color: Colors.white),
                   ) ,
                    GestureDetector(
                      onTap: () => Navigator.pop(context) ,
                      child: 
                      const Text(
                       "Log In",
                      style: TextStyle(
                        color: Color(0xffC7EDE6),
                      ),
                       )
                      ), 
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ) ;
  }

  

  Future<void> UserRegister() async {
    UserCredential user =  await  FirebaseAuth.instance.createUserWithEmailAndPassword(
          email : email! , 
          password : password! ,
        ) ;
  }
}


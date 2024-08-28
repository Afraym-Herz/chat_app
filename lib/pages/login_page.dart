import 'package:chat_app/constants.dart';
import 'package:chat_app/helper/show_snack_bar.dart';
import 'package:chat_app/pages/chat_page.dart';
import 'package:chat_app/pages/register_page.dart';
import 'package:chat_app/widgets/custom_button.dart';
import 'package:chat_app/widgets/custom_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
   const LoginPage({super.key});

  static String id = 'LoginPage' ;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? email ;

  String? password ;

  bool isLoading = false ;

  GlobalKey<FormState> globalKey = GlobalKey() ;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: kPrimaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Form( 
          key : globalKey ,
          child : ListView(
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
                Text( "LOGIN" ,
                style: TextStyle(
                 color: Colors.white ,
                  fontSize: 32 , 
                ),
                ),
             ],
           ),
        
            CustomFormTextField(hintText: "Email" , 
            onChanged: (data){email=data ;} ,
            ),
            CustomFormTextField(hintText: "Password" , 
            onChanged: (data) {password=data;},
            obsecureText: true,
            ),
            CustomButton(name: "Log In" ,
            onTap : () async {
              
              if (globalKey.currentState!.validate()){
              isLoading = true ;  
              setState((){});
              try {
            await SignIn();
            Navigator.pushNamed(context, ChatPage.id , arguments: email ) ;
              } on FirebaseAuthException catch (e) {
               if (e.code == 'user-not-found') {
                       ShowSnackBar(context , 'No user found for that email.' );
                     } else if (e.code == 'wrong-password') {
                      ShowSnackBar(context , 'Wrong password provided for that user.' );
                        }
                } catch (e){
                  ShowSnackBar(context, e.toString()) ;
                }
                isLoading = false ;
                setState(() {});
            } 
            }
            ),
            const SizedBox(height: 10,) ,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               const Text("Don't have an Account?  " , 
               style: TextStyle(color: Colors.white),
               ) ,
                GestureDetector(
                  onTap: () => Navigator.pushNamed( context , RegisterPage.id ) ,
                  child: 
                  const Text(
                   "REGISTER NOW",
                  style: TextStyle(
                    color: Color(0xffC7EDE6),
                  ),
                   ) 
                  ), 
              ],
            )
          ],
        )
      ),
      ),
    ) ;
  }

  Future<void> SignIn() async {
     UserCredential user = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: email!,
    password: password!,
     ) ;
  }
}
import 'package:chat_app/pages/chat_page.dart';
import 'package:chat_app/pages/login_page.dart';
import 'package:chat_app/pages/register_page.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding().ensureInitializeApp() ;
  await Firebase.InitializeApp(
    options : DeafaultFirebaseOptions.currentPlatform ,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
     routes: {
      LoginPage.id : (context) => const LoginPage() ,
      RegisterPage.id : (context) => const RegisterPage() ,
      ChatPage.id : (context) => const ChatPage() ,
     },
      initialRoute: LoginPage.id ,
    );
  }
}



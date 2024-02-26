import 'package:bisa_app/src/presentation/home_screen/bottom_nav_bar.dart';
import 'package:bisa_app/src/presentation/login_screen/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot){
            if(snapshot.hasData){
              return  const BottomNavBarPage();
            }
            else{
              return  const LoginPage();
            }
          }),
    );
  }
}

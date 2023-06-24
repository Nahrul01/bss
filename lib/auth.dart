import 'package:bss/homepage.dart';
import 'package:bss/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Auth extends StatelessWidget {
  const Auth({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context , snapshot){
          if(snapshot.hasData){
            return const HomePage();
          }
          else{
            return const Login();
          }
        })
      );
  }
}
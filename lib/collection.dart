import 'package:dollar_bill/authHelper.dart';
import 'package:dollar_bill/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class Collection extends StatelessWidget {
  const Collection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          child: Container(
            child: const Text("Log out"),
          ),
          onTap: (){
            AuthHelper().signOut();
            //FirebaseAuth.instance.signOut();//.then((value) => Navigator.push(context, MaterialPageRoute(builder: (context)=>Login())));
          },
        ),
      ),
    );
  }
}
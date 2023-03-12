import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dollar_bill/authHelper.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user;

  void initState(){
    super.initState();
    initUser();
  }

  initUser() {
    user =  _auth.currentUser!;
    setState(() {
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              child: Container(
                child: Text("${user?.email}, Log out"),
              ),
              onTap: () async{
                await AuthHelper().signOut();

              },
            ),
          ]
        ),
      )
    );
  }
}
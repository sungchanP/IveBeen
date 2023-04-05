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
    final screenHeight = MediaQuery.of(context).size.height- MediaQuery.of(context).padding.top;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text("${user?.email}",
              style: TextStyle(
                fontSize: screenHeight*0.025,
                fontFamily: 'IndieFlower'
              ),),
            ),
            InkWell(
              child: Container(
                child: Text("LOG OUT",
                style: TextStyle(
                fontSize: screenHeight*0.025,
                fontFamily: 'IndieFlower'
              ),),
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
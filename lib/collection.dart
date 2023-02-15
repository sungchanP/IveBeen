import 'package:dollar_bill/authHelper.dart';
import 'package:dollar_bill/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class Collection extends StatefulWidget {
  const Collection({super.key});

  @override
  State<Collection> createState() => _CollectionState();
  
}

class _CollectionState extends State<Collection> {

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
        child: InkWell(
          child: Container(
            child: Text("${user?.email}, Log out"),
          ),
          onTap: (){
            Future signOut() async {
              await _auth.signOut().then((value) => 
              Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false)
                // Navigator.push(context, PageRouteBuilder(
                // pageBuilder: (context, animation1, animation2) => Login(),
                // transitionDuration: Duration.zero,
                // reverseTransitionDuration: Duration.zero,))
            );
              print('signout');
            }
            signOut();
            //FirebaseAuth.instance.signOut();//.then((value) => Navigator.push(context, MaterialPageRoute(builder: (context)=>Login())));
          },
        ),
      ),
    );
  }
}


import 'package:dollar_bill/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'authHelper.dart';
import 'dbHelper.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  bool _pwOneVisible = false;
  bool _pwTwoVisible = false;
  bool _loading = false;

  final _emailController = TextEditingController();
  final _pwController = TextEditingController();
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                //decoration: BoxDecoration(border: Border.all(style: BorderStyle.solid)),
                margin: EdgeInsets.only(left: 60, right: 60, bottom: 10, top: 100),
                child: TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: "Email",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty){
                      return "Enter email";
                    }
                    else if (!(value.contains("@"))){
                      return "Invalid email";
                    }
                    return null;
                  },
                ),
              ),
              Container(
                //decoration: BoxDecoration(border: Border.all(style: BorderStyle.solid)),
                margin: EdgeInsets.only(left: 60, right: 60,bottom: 10),
                child: TextFormField(
                  controller: _pwController,
                  obscureText: !_pwOneVisible,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: "Password",
                    suffixIcon: IconButton(
                      icon: Icon(
                        _pwOneVisible? Icons.visibility : Icons.visibility_off
                      ),
                      onPressed: () => setState(() {
                        _pwOneVisible = !_pwOneVisible;
                        }
                      ),
                    )
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty){
                      return "Enter password";
                    }
                    else if(value.length < 6) {
                      return "Password must be at least 6 characters";
                    }
                    return null;
                  },
                ),
              ),
              Container(
                //decoration: BoxDecoration(border: Border.all(style: BorderStyle.solid)),
                margin: EdgeInsets.only(left: 60, right: 60,bottom: 10),
                child: TextFormField(
                  obscureText: !_pwTwoVisible,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: "Re-type password",
                    suffixIcon: IconButton(
                      icon: Icon(
                        _pwTwoVisible? Icons.visibility : Icons.visibility_off
                      ),
                      onPressed: () => setState(() {
                        _pwTwoVisible = !_pwTwoVisible;
                        }
                      ),
                    ),
                  ),
                  validator: (value){
                    if (value == null || value.isEmpty){
                      return "Re-type password";
                    }
                    else if (value != _pwController.text){
                      return "Password doesn't match";
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 40,),
              _loading? CircularProgressIndicator() : InkWell(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      style: BorderStyle.solid,
                      //color: Colors.green,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20),
                    ),
                    //color: Colors.green,
                  ),
                  padding: EdgeInsets.fromLTRB(100, 8, 100, 8),
                  child: Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 20,)// color: Colors.white),
                    ),
                ),
                onTap: () async{
                  if(_formKey.currentState!.validate()){
                    setState(() {
                      _loading = true;
                    });
                    await AuthHelper().signUp(
                      email: _emailController.text, password: _pwController.text
                      ).then((value) {
                        if (value == null){
                          DbHelper().addUserToDB();
                          AuthHelper().signOut();
                          Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
                          // Navigator.push(context, PageRouteBuilder(
                          // pageBuilder: (context, animation1, animation2) => Login(),
                          // transitionDuration: Duration.zero,
                          // reverseTransitionDuration: Duration.zero,));
                        }
                      }
                    );
                    setState(() {
                      _loading = false;
                    });
                  }
                },
              ),
              SizedBox(height: 30,),
              Container(
                padding: EdgeInsets.only(right: 250),
                //decoration: BoxDecoration(border: Border.all(style: BorderStyle.solid)),
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  //style: ButtonStyle(),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                ),
              ),
            ]
          ),
        )
      )
    );
  }
}
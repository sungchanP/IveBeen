
import 'package:dollar_bill/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
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

  // bool emailInUse = false;
  var errorText;


  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height- MediaQuery.of(context).padding.top;
    final screenWidth = MediaQuery.of(context).size.width;
    return MaterialApp(
      home: GestureDetector(
        onTap:() => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          body: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  //decoration: BoxDecoration(border: Border.all(style: BorderStyle.solid)),
                  margin: EdgeInsets.only(left: screenWidth*0.12, right: screenWidth*0.12, top: screenWidth*0.07),
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
                      else{
                        AuthHelper().inUse(email: value).then((value) {
                          if(value){
                            errorText = "Email in use";
                          }
                          else{
                            errorText =  null;
                          }
                        });
                      }
                      return errorText;
                    },
                  ),
                ),
                Container(
                  //decoration: BoxDecoration(border: Border.all(style: BorderStyle.solid)),
                  margin: EdgeInsets.only(left: screenWidth*0.12, right: screenWidth*0.12, top: screenWidth*0.01),
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
                  margin: EdgeInsets.only(left: screenWidth*0.12, right: screenWidth*0.12, top: screenWidth*0.01),
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
                SizedBox(height: screenHeight*0.05,),
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
                    padding: EdgeInsets.fromLTRB(screenWidth*0.29, screenWidth*0.01, screenWidth*0.29, screenWidth*0.01),
                    child: Text(
                      "SIGN UP",
                      style: TextStyle(fontSize: screenHeight*0.019,)// color: Colors.white),
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
                          }
                        }
                      );
                      setState(() {
                        _loading = false;
                      });
                    }
                  },
                ),
                SizedBox(height: screenHeight*0.01,),
                Container(
                  margin: EdgeInsets.only(right: screenWidth*0.65),
                  //decoration: BoxDecoration(border: Border.all(style: BorderStyle.solid)),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                  ),
                ),
              ]
            ),
          )
        ),
      )
    );
  }
}
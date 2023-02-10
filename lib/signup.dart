import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'authHelper.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  bool _pwMatch = false;
  bool _pwOneVisible = false;
  bool _pwTwoVisible = false;
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
              InkWell(
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
                onTap: (){
                  if(_formKey.currentState!.validate()){
                    AuthHelper().signUp(
                      email: _emailController.text, password: _pwController.text
                    );
                  }
                },
              ),
              SizedBox(height: 30,),
              // InkWell(
              //   child: Container(
              //     padding: EdgeInsets.fromLTRB(15,5,15,5),
              //     decoration: BoxDecoration(
              //       border: Border.all(
              //         style: BorderStyle.solid,
              //       ),
              //       borderRadius: BorderRadius.circular(20),
              //     ),
              //     child: Text(
              //       "Go back",
              //     ),
              //   ),
              //   onTap: (){
              //     Navigator.pop(context);
              //   },
              // ),
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
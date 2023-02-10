
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'signup.dart';
import 'authHelper.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  bool _pwvisible = false;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                //decoration: BoxDecoration(border: Border.all(style: BorderStyle.solid)),
                margin: EdgeInsets.only(top: 130),
                child: Text(
                  "Moolah",
                  style: TextStyle(fontSize: 50),
                  ),
              ),
              Container(
                //decoration: BoxDecoration(border: Border.all(style: BorderStyle.solid)),
                margin: EdgeInsets.only(top: 120),
                child: Column(
                  children: [
                    Container(
                      //decoration: BoxDecoration(border: Border.all(style: BorderStyle.solid)),
                      margin: EdgeInsets.only(left: 60, right: 60),
                      child: TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)
                          ),
                          hintText: "Email",
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      //decoration: BoxDecoration(border: Border.all(style: BorderStyle.solid)),
                      margin: EdgeInsets.only(left: 60, right: 60),
                      child: TextField(
                        controller: _passwordController,
                        obscureText: !_pwvisible,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)
                          ),
                          hintText: 'Password',
                          suffixIcon: IconButton(
                            icon: Icon(
                              _pwvisible? Icons.visibility : Icons.visibility_off
                            ),
                            onPressed: () => setState(() {
                              _pwvisible = !_pwvisible;
                              }
                            ),
                          )
                        ),
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
                        padding: EdgeInsets.fromLTRB(110, 8, 110, 8),
                        child: Text(
                          "Log in",
                          style: TextStyle(fontSize: 20,)// color: Colors.white),
                          ),
                      ),
                      onTap: (){
                        //Navigator.push(context, MaterialPageRoute(builder: (context) => const Home()));
                        AuthHelper().signIn(
                          email: _emailController.text, password: _passwordController.text
                          );
                        //signIn();
                        },
                    ),
                    SizedBox(height: 120,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Text(
                            'New User? ',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        InkWell(
                          child: Container(
                            //decoration: BoxDecoration(border: Border.all(style: BorderStyle.solid)),
                            child: Text(
                              'Sign Up',
                              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          ),
                          onTap: (){
                            // create new acc
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUp()));
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    InkWell(
                      child: Container(
                        //alignment: Alignment.topRight,
                        //decoration: BoxDecoration(border: Border.all(style: BorderStyle.solid)),
                        //margin: EdgeInsets.only(top: 10,),//left: 245, right: 65),
                        child: Text(
                          'Forgot Password',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      onTap: (){
                        //functions for finding password
                      },
                    ),
                  ]
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Future signIn() async {
  //   try{
  //     await _auth.signInWithEmailAndPassword(
  //       email: _emailController.text.trim(), 
  //       password: _passwordController.text.trim()
  //     );
  //   } on FirebaseAuthException catch (e){
  //     if(e.code == 'invalid-email'){
  //       print('Invalid email address format');
  //     }
  //     if(e.code == 'user-not-found'){
  //       //Navigator.push(context, MaterialPageRoute(builder: (context)=> const ShakeError()))
  //     }
  //   }
  // }


}

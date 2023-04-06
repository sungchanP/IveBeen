import 'package:shared_preferences/shared_preferences.dart';
import 'package:dollar_bill/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'signup.dart';
import 'authHelper.dart';
import 'forgotPassword.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  bool _pwvisible = false;
  bool _loading = false;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _loginFormKey = GlobalKey<FormState>();

  @override
  void initState(){
    super.initState();
  }

  @override
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height- MediaQuery.of(context).padding.top;
    final screenWidth = MediaQuery.of(context).size.width;
    return MaterialApp(
      home: GestureDetector(
        onTap:() => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          resizeToAvoidBottomInset : false,
          body: SafeArea(
            bottom: false,
            child: SingleChildScrollView(
              child: Form(
                key: _loginFormKey,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        //decoration: BoxDecoration(border: Border.all(style: BorderStyle.solid)),
                        margin: EdgeInsets.only(top: screenHeight*0.2),
                        child: Text(
                          "IveBeen",
                          style: TextStyle(
                            fontSize: screenHeight*0.07,
                            fontFamily: 'IndieFlower'),
                          ),
                      ),
                      SizedBox(height: screenHeight*0.08,),
                      Container(
                        //decoration: BoxDecoration(border: Border.all(style: BorderStyle.solid)),
                        //margin: EdgeInsets.only(top: 115),
                        child: Column(
                          children: [
                            Container(
                              //decoration: BoxDecoration(border: Border.all(style: BorderStyle.solid)),
                              margin: EdgeInsets.only(left: screenWidth*0.12, right:screenWidth*0.12),
                              child: TextFormField(
                                controller: _emailController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)
                                  ),
                                  hintText: "Email",
                                ),
                                validator: (value) {
                                  if(value == null || value.isEmpty){
                                    return "Enter email";
                                  }
                                  else if (!(value.contains("@"))){
                                    return "Invalid email";
                                  }
                                  return null;
                                },
                              ),
                            ),
                            SizedBox(height: screenHeight*0.005),
                            Container(
                              //decoration: BoxDecoration(border: Border.all(style: BorderStyle.solid)),
                              margin: EdgeInsets.only(left: screenWidth*0.12, right:screenWidth*0.12),
                              child: TextFormField(
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
                                validator: (value) {
                                  if(value == null || value.isEmpty){
                                    return "Enter password";
                                  }
                                  return null;
                                },
                              ),
                            ), 
                            SizedBox(height: screenHeight*0.03,),
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
                                padding: EdgeInsets.fromLTRB(screenWidth*0.315, screenWidth*0.01, screenWidth*0.315, screenWidth*0.01),
                                child: Text(
                                  "LOGIN",
                                  style: TextStyle(fontSize: screenHeight*0.025,
                            fontFamily: 'IndieFlower'),
                                  ),
                              ),
                              onTap: () async{
                                if (_loginFormKey.currentState!.validate()){
                                  setState(() {
                                    _loading = true;
                                  });
                                  await AuthHelper().signIn(
                                    email: _emailController.text, password: _passwordController.text
                                  ).then((value) async{
                                    if(value != null){
                                      var snackbar = SnackBar(content: const Text("user not found"),);
                                      ScaffoldMessenger.of(context).showSnackBar(snackbar);
                                    }
                                    else{
                                      SharedPreferences prefs = await SharedPreferences.getInstance();
                                      prefs.setString('email', _emailController.text);
                                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => Home()));
                                    }
                                  });
                                  setState(() {
                                    _loading = false;
                                  });
                                }
                              }
                            ),
                            SizedBox(height: screenHeight*0.15,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: Text(
                                    'New User? ',
                                    style: TextStyle(fontSize: screenHeight*0.018,
                            fontFamily: 'IndieFlower'),
                                  ),
                                ),
                                InkWell(
                                  child: Container(
                                    //decoration: BoxDecoration(border: Border.all(style: BorderStyle.solid)),
                                    child: Text(
                                      'Sign Up',
                                      style: TextStyle(fontSize: screenHeight*0.018, fontWeight: FontWeight.bold,
                            fontFamily: 'IndieFlower'),
                                    ),
                                  ),
                                  onTap: (){
                                    // create new acc
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUp()));
                                  },
                                ),
                              ],
                            ),
                            SizedBox(height: screenHeight*0.008,),
                            InkWell(
                              child: Container(
                                //alignment: Alignment.topRight,
                                //decoration: BoxDecoration(border: Border.all(style: BorderStyle.solid)),
                                //margin: EdgeInsets.only(top: 10,),//left: 245, right: 65),
                                child: Text(
                                  'Forgot Password',
                                  style: TextStyle(fontSize: screenHeight*0.018,
                            fontFamily: 'IndieFlower'),
                                ),
                              ),
                              onTap: (){
                                //functions for finding password
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const ForgotPasswordPage()));
                              },
                            ),
                          ]
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

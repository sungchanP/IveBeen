import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'authHelper.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  void dispose(){
    _emailController.dispose();
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
            child: Form(
              key: _formKey,
              child: Center(
                child: Column(
                  children: [
                    Container(
                      //decoration: BoxDecoration(border: Border.all(style: BorderStyle.solid)),
                      margin: EdgeInsets.only(top: screenHeight*0.3),
                      child: Text(
                        "Enter email",
                        style: TextStyle(fontSize: 25),
                        ),
                    ),
                    SizedBox(height: screenHeight*0.05,),
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
                    SizedBox(height: screenHeight*0.02,),
                    InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            style: BorderStyle.solid,
                            //color: Colors.green,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20),),
                          //color: Colors.green,
                        ),
                        padding: EdgeInsets.fromLTRB(screenWidth*0.23, screenWidth*0.01, screenWidth*0.24, screenWidth*0.01),
                        child: Text(
                          "Reset Password",
                          style: TextStyle(fontSize: screenHeight*0.019,)// color: Colors.white),
                          ),
                      ),
                      onTap: () => {
                        if(_formKey.currentState!.validate()){
                          AuthHelper().verifyEmail(_emailController.text.trim()).then((value) {
                            if(value == null){
                              var snackbar = SnackBar(content: const Text("Email is sent"),);
                              ScaffoldMessenger.of(context).showSnackBar(snackbar);
                              Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
                            }
                          }),
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
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'home.dart';

class Login extends StatelessWidget {
  const Login({super.key});

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
                margin: EdgeInsets.only(top: 60),
                child: Text(
                  "Moolah",
                  style: TextStyle(fontSize: 45),
                  ),
              ),
              Container(
                //decoration: BoxDecoration(border: Border.all(style: BorderStyle.solid)),
                margin: EdgeInsets.only(top: 80),
                child: Column(
                  children: [
                    Container(
                      //decoration: BoxDecoration(border: Border.all(style: BorderStyle.solid)),
                      margin: EdgeInsets.only(left: 70, right: 70),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Email",
                        //  hintText: 'Email',
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      //decoration: BoxDecoration(border: Border.all(style: BorderStyle.solid)),
                      margin: EdgeInsets.only(left: 70, right: 70),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                        ),
                      ),
                    ),
                    InkWell(
                      child: Container(
                        alignment: Alignment.topRight,
                        //decoration: BoxDecoration(border: Border.all(style: BorderStyle.solid)),
                        margin: EdgeInsets.only(top: 10,left: 245, right: 70),
                        child: Text(
                          'Forgot Password',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      onTap: (){
                        //functions for finding password
                      },
                    ),
                    InkWell(
                      child: Container(
                        //height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(
                            style: BorderStyle.solid,
                            color: Colors.green,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20),
                          ),
                          color: Colors.green,
                        ),
                        margin: EdgeInsets.only(top: 40),
                        padding: EdgeInsets.fromLTRB(70, 8, 70, 8),
                        //decoration: BoxDecoration(border: Border.all(style: BorderStyle.solid)),
                        child: Text(
                          "Log in",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                      ),
                      onTap: (){
                         Navigator.push(context, MaterialPageRoute(builder: (context) => const Home()));
                      },
                    ),
                    SizedBox(height: 100,),
                    InkWell(
                      child: Container(
                        //decoration: BoxDecoration(border: Border.all(style: BorderStyle.solid)),
                        child: Text(
                          'Create new account',
                          style: TextStyle(fontSize: 12),
                        )
                      ),
                    )
                  ]
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
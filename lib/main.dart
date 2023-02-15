import 'package:dollar_bill/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'login.dart';
import 'home.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
      initialRoute: '/',
      routes: {
        '/login':(context) => Login(),
        '/home':(context) => Home(),
        '/signup':(context) => SignUp(),

      },
      // onGenerateRoute: (settings) {
      //   if(settings.name == '/signup'){
      //     return PageRouteBuilder(pageBuilder: (context, animation1, animation2) => MyApp(),
      //     transitionDuration: Duration.zero,
      //     reverseTransitionDuration: Duration.zero,
      //     );
      //   }
      // },
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return Home();
          }
          else {
            return Login();
          }
        }
      ),
    );
  }
}


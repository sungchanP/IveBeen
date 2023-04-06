import 'package:dollar_bill/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'login.dart';
import 'home.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  var email = prefs.getString('email');
  //initializer();
  runApp(
    MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'IveBeen',
    theme: ThemeData(
      fontFamily: 'IndieFlower'
    ),
    
    initialRoute: '/',
    routes: {
      '/main':(context) => MainPage(),
      '/login':(context) => Login(),
      '/home':(context) => Home(),
      '/signup':(context) => SignUp(),
    },
    home: email == null ? MainPage() : Home(),
  ));
  // runApp(const MyApp());
}

void initializer(){
  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user == null) {
      //print('User is currently signed out!');
      return;

    } else {
      //print('User is signed in!');
      return;
    }
  });
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

  
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'IveBeen',
//       theme: ThemeData(

//         fontFamily: 'IndieFlower'
//       ),
//       home: const MainPage(),
//       initialRoute: '/',
//       routes: {
//         '/login':(context) => Login(),
//         '/home':(context) => Home(),
//         '/signup':(context) => SignUp(),
//       },
//     );
//   }
// }

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // @override

  @override
  void initState(){
    initializer();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Login(),
    );
        }
}


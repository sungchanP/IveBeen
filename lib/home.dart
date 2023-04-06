import 'package:dollar_bill/getCountryCodeHelper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'collection.dart';
import 'account.dart';
import 'bills.dart';
import 'dbHelper.dart';
import 'flagUrlList.dart' as global;


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => HomeState();
}


class HomeState extends State<Home> {
  int _selectedIndex = 0;
  String _countryCode = '';

  final _dbRef = FirebaseDatabase.instance.ref('users');
  User? user = FirebaseAuth.instance.currentUser;

  String? flagUrl;
  String? billUrl;

  static const List<Widget> _widgetOptions=[
    Bills(),
    Collection(),
    Account(),
  ];

  @override
  void initState() {
    initializer();
    showMsg();
    super.initState();
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

  addFlagUrl() async{
    final flagDbRef = _dbRef.child('${user!.uid}/flags');
    final snapshot = await flagDbRef.get();
    global.collectedFlagList = [];
    if (snapshot.exists){
      Map<dynamic, dynamic> map = snapshot.value as Map<dynamic, dynamic>;
      List<dynamic> list = map.values.toList();
      for(var flag in list){
        global.collectedFlagList.add(flag);
      }
    }
  }


  void showMsg() async{
    await GetCountryCodeHelper().getCountry().then((value) {
      if(value.toString().length != 2){
        showDialog(
          context: context,
          builder: (BuildContext context){
            return AlertDialog(
              title: const Text("Location need to be enabled to use IveBeen"),
              actions: <Widget>[
                InkWell(
                  child: Container(
                    child: Text("Go to Setting"),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Geolocator.openLocationSettings();
                    showMsg();
                  }
                )
              ],
            );
          }
        );
      }
      else{
        setState(() {
          _countryCode = value;
        });
        DbHelper().isFlagCollected(_countryCode).then((value) {
          if(!value) {
            showDialog(
              context: context,
              builder: (BuildContext context){
                return AlertDialog(
                  title: const Text("New Flag is ready to be collected"),
                  content: Text("You can collect $_countryCode flag"),
                  actions: <Widget>[
                    InkWell(
                      child: Container(
                        child: Text("Collect"),
                      ),
                      onTap: () {
                        DbHelper().addFlagToDB(_countryCode);
                        addFlagUrl();
                        Navigator.pop(context);
                      }
                    )
                  ],
                );
              });
            }
            else{
              addFlagUrl();
              showDialog(
              context: context,
              builder: (BuildContext context){
                return AlertDialog(
                  title: Text("Congrat! You've already collected $_countryCode flag!"),
                  actions: <Widget>[
                    InkWell(
                      child: Container(
                        child: Text("OK"),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      }
                    )
                  ],
                );
              });
            }
          });
      }
    });
  }

  void ontapItem(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),  
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.flag_outlined),
            activeIcon: Icon(Icons.flag),
            label: 'Flags',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.collections_outlined),
            activeIcon: Icon(Icons.collections),
            label: 'Collection',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            activeIcon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: ontapItem,
        selectedItemColor: Colors.black,
      ),
    );
  }
}



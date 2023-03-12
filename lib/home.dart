import 'package:dollar_bill/getCountryCodeHelper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
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

  final _storageRef = FirebaseStorage.instance.ref();


  String? flagUrl;
  String? billUrl;

  static const List<Widget> _widgetOptions=[
    Bills(),
    Collection(),
    Account(),
  ];

  @override
  void initState() {
    showMsg();
    addFlagUrl();
    super.initState();
  }


  Future<String> getFlagUrl(String countryCode) async{
    final imageRef = _storageRef.child("flags_collected/$countryCode.png");
    return await imageRef.getDownloadURL();
  }

  addFlagUrl() async{
    final flagDbRef = _dbRef.child('${user!.uid}/flags');
    final snapshot = await flagDbRef.get();
    if (snapshot.exists){
      Map<dynamic, dynamic> map = snapshot.value as Map<dynamic, dynamic>;
      List<dynamic> list = map.values.toList();
      for(var flag in list){
        String url = await getFlagUrl(flag);
        if(!global.flagurlList.contains(url)){
          global.flagurlList.add(url);//Image.network(url, fit: BoxFit.cover,));
        }
      }
    }
  }


  void showMsg() async{
    await GetCountryCodeHelper().getCountry().then((value) {
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
      });
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
            icon: Icon(Icons.attach_money_outlined),
            activeIcon: Icon(Icons.attach_money),
            label: 'Bills',
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



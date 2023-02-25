import 'package:dollar_bill/getCountryCodeHelper.dart';
import 'package:flutter/material.dart';
import 'collection.dart';
import 'account.dart';
import 'bills.dart';
import 'dbHelper.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}


class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  String _countryCode = '';

  //bool isFirst = true;

  static const List<Widget> _widgetOptions=[
    Bills(),
    Collection(),
    Account(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    showMsg();
    super.initState();
  }

  void showMsg() async{
    await GetCountryCodeHelper().getCountry().then((value) {
    setState(() {
      _countryCode = value;
    });
    DbHelper().isBillCollected(_countryCode).then((value) {
      if(!value) {
        showDialog(
          context: context, 
          builder: (BuildContext context){
            return AlertDialog(
              title: const Text("New Bill/Flag is ready to be collected"),
              content: Text("You can collect $_countryCode bill/flag"),
              actions: <Widget>[
                InkWell(
                  child: Container(
                    child: Text("Collect"),
                  ),
                  onTap: () {
                    DbHelper().addBillToDB(_countryCode);
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



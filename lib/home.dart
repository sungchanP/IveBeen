import 'package:flutter/material.dart';
import 'collection.dart';
import 'others.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions=[
    Bills(),
    Collection(),
    Others(),
  ];

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
            icon: Icon(Icons.remove_red_eye_outlined),
            activeIcon: Icon(Icons.remove_red_eye),
            label: 'Others',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: ontapItem,
        selectedItemColor: Colors.black,
      ),
    );
  }
}




class Bills extends StatefulWidget {
  const Bills ({super.key});

  @override
  State<Bills> createState() => _BillsState();
}

class _BillsState extends State<Bills> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          bottom: false,
          child: GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 20.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 1/2,
            ),
            //padding: EdgeInsets.only(top: 60.0),
            children: [
              Image.asset('banknotes/afghan.jpeg'),
                Image.asset('banknotes/albania.jpeg'),
                Image.asset('banknotes/algeria.jpeg'),
                Image.asset('banknotes/angola.jpeg'),
                Image.asset('banknotes/argentina.jpeg'),
                Image.asset('banknotes/armenia.jpeg'),
                Image.asset('banknotes/Aruba.jpeg'),
                Image.asset('banknotes/australia.jpeg'),
                Image.asset('banknotes/Azerbaijan.jpeg'),
                Image.asset('banknotes/Bahamas.jpeg'),
                Image.asset('banknotes/Bahraini.jpeg'),
                Image.asset('banknotes/Bangladeshi.jpeg'),
                Image.asset('banknotes/Barbados.jpeg'),
                Image.asset('banknotes/Belarusian.jpeg'),
                Image.asset('banknotes/Belize.jpeg'),
                Image.asset('banknotes/Bermudian.jpeg'),
                Image.asset('banknotes/Bhutanese.jpeg'),
                Image.asset('banknotes/Bolivia.jpeg'),
                Image.asset('banknotes/Bosnia and Herzegovina.jpeg'),
                Image.asset('banknotes/Botswana.jpeg'),
            ],
          ),
        ),
      ),
    );
  

  }
}
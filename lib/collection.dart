import 'package:dollar_bill/authHelper.dart';
import 'package:dollar_bill/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'dbHelper.dart';
import 'getCountryCodeHelper.dart';

class Collection extends StatefulWidget {
  const Collection({super.key});

  @override
  State<Collection> createState() => _CollectionState();
  
}

class _CollectionState extends State<Collection> {

  String countryCode = '';

  // void extractCountryCode() async{
  //   await GetCountryCodeHelper().getCountry().then((value) => countryCode = GetCountryCodeHelper().getCountryCode());
  // }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(onPressed: () async{
              await GetCountryCodeHelper().getCountry().then((value){
                 setState(() {
                   countryCode = value;
                 });
                 print("yoyoyoyo$countryCode");
                DbHelper().getBillsCollection(countryCode);
              });
  }),
            //Text(placemark.toString()),
            
          ],
        )
        ),
      );
  }
}

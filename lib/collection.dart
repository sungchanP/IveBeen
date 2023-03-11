
import 'package:dollar_bill/home.dart';
import 'package:dollar_bill/storageHelper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'flagUrlList.dart' as global;




class Collection extends StatefulWidget {
  const Collection({super.key});

  @override
  State<Collection> createState() => _CollectionState();

}

enum WidgetMaker {bills, flags}

class _CollectionState extends State<Collection> {

  //final GlobalKey<HomeState> _key = GlobalKey<HomeState>();

  double width = 200.0;
  double height = 35.0;
  double loginAlign = -1;
  double signInAlign = 1;
  Color selectedColor = Colors.white;
  Color normalColor = Color.fromARGB(255, 9, 158, 19);

  double? xAlign;
  Color? moneyColor;
  Color? flagColor;

  WidgetMaker selectedWidgetMaker = WidgetMaker.bills;

  String? flagUrl;
  String? billUrl;
  //final flagUrlList = <Widget>[];

  bool isFlagUrlSet = false;

  final _dbRef = FirebaseDatabase.instance.ref('users');
  User? user = FirebaseAuth.instance.currentUser;

  final _storageRef = FirebaseStorage.instance.ref();

  //List<Widget> flagUrls = HomeState().getFlagUrlList();


  @override
  void initState() {
    //addFlagUrl();
    super.initState();
    xAlign = loginAlign;
    moneyColor = selectedColor;
    flagColor = normalColor;
    //HomeState().getFlagUrlList();
  }

  

  // Future<String> getFlagUrl(String countryCode) async{
  //   final imageRef = _storageRef.child("flags_collected/$countryCode.png");
  //   return await imageRef.getDownloadURL();
  // }


  // void getBillUrl() async {
  //   await StorageHelper().loadBill(_countryCode).then((value) {
  //     setState(() {
  //       billUrl = value;
  //     });
  //   });
  // }

  Widget getWidget() {
    switch(selectedWidgetMaker){
      case WidgetMaker.bills:
      return getBillsWidget();
      case WidgetMaker.flags:
      return getFlagsWidget();
    }
  }

  // final flagUrlList = <Widget>[];

  // addFlagUrl() async{
  //   final flagDbRef = _dbRef.child('${user!.uid}/flags');
  //   final snapshot = await flagDbRef.get();
  //   Map<dynamic, dynamic> map = snapshot.value as Map<dynamic, dynamic>;
  //   List<dynamic> list = map.values.toList();

  //   for(var i=0; i<list.length; i++){
  //     print(list);
  //     getFlagUrl(list[i]).then((value) {
  //       setState(() {
  //         flagUrl = value;
  //       });
  //       flagUrlList.add(Image.network(flagUrl!, fit: BoxFit.cover,));
        
  //     });
  //   }
  // }

  // List<Widget> getFlagUrlList() {
  //   //await addFlagUrl();
  //   print("dfs $flagUrlList");
  //   return flagUrlList;
  // }

  Widget getBillsWidget() {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 4,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        childAspectRatio: 1/2,
        padding: EdgeInsets.only(left: 5.0, right: 5.0),
        children: [
          // Image.asset('banknotes/afghan.jpeg',fit: BoxFit.fill,),
          // Image.asset('banknotes/albania.jpeg',fit: BoxFit.fill,),
          // Image.asset('banknotes/algeria.jpeg',fit: BoxFit.fill),
          // Image.asset('banknotes/angola.jpeg',fit: BoxFit.fill),
          // Image.asset('banknotes/argentina.jpeg',fit: BoxFit.fill),
          // Image.asset('banknotes/armenia.jpeg',fit: BoxFit.fill),
          // Image.asset('banknotes/Aruba.jpeg',fit: BoxFit.fill),
          // Image.asset('banknotes/australia.jpeg',fit: BoxFit.fill),
          // Image.asset('banknotes/Azerbaijan.jpeg',fit: BoxFit.fill),
          // Image.asset('banknotes/Bahamas.jpeg',fit: BoxFit.fill),
          // Image.asset('banknotes/Bahraini.jpeg',fit: BoxFit.fill),
          // Image.asset('banknotes/Bangladeshi.jpeg',fit: BoxFit.fill),
          // Image.asset('banknotes/Barbados.jpeg',fit: BoxFit.fill),
          // Image.asset('banknotes/Belarusian.jpeg',fit: BoxFit.fill),
          // Image.asset('banknotes/Belize.jpeg',fit: BoxFit.fill),
          // Image.asset('banknotes/Bermudian.jpeg',fit: BoxFit.fill),
          // Image.asset('banknotes/Bhutanese.jpeg',fit: BoxFit.fill),
          // Image.asset('banknotes/Bolivia.jpeg',fit: BoxFit.fill),
          // Image.asset('banknotes/Bosnia and Herzegovina.jpeg',fit: BoxFit.fill),
          // Image.asset('banknotes/Botswana.jpeg',fit: BoxFit.fill),
        ],
      ),
    );
  }


  Widget getFlagsWidget() {
    return Expanded(
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 4,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        childAspectRatio: 2/3,
        padding: EdgeInsets.only(left: 5.0, right: 5.0),
        children: global.flagurlList,
        //key: _key,
        // child: FutureBuilder(
        //   future: _dbRef.child('${user!.uid}/flags').once(),
        //   builder: (BuildContext context, AsyncSnapshot<DatabaseEvent> snapshot) {
        //     if(snapshot.hasData){
        //       Map<dynamic, dynamic> map = snapshot.data!.snapshot.value as Map<dynamic, dynamic>;
        //       List<dynamic> list = map.values.toList();
        //       //print(list);

                // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3), 
                // itemCount: list.length,
                // itemBuilder: (BuildContext context, int index){
                //   //isFlagUrlSet = false;
                //   if(!isFlagUrlSet){
                //     getFlagUrl(list[index]).then((value) {
                //       setState(() {
                //         flagUrl = value;
                //       });
                //       isFlagUrlSet = true;
                //     });
                //   }
                //   else{
                //     //isFlagUrlSet = false;
                //     return Container(
                //       child: Image.network(flagUrl!),
                //     );
                    
                    
                //   }
                // });
    //      );}
            // else{
            //   return CircularProgressIndicator();
              
            // }
            
          ));
      }
    //   ),
    // );
  

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //key: _key,
      body: SafeArea(
      bottom: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(50.0),
                  ),
                  //border: Border.all(style: BorderStyle.solid),
                  boxShadow: [BoxShadow(
                    color: Color.fromARGB(248, 33, 150, 33),
                    spreadRadius: 1,
                    blurRadius: 0,
                    offset: Offset(0, 1.5),
                  ),
                  ]
                ),
                child: Stack(
                  children: <Widget>[
                    AnimatedAlign(
                      alignment: Alignment(xAlign!, 0),
                      duration: Duration(milliseconds: 150),
                      child: Container(
                        width: width * 0.5,
                        height: height,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 9, 158, 19),
                          borderRadius: BorderRadius.all(
                            Radius.circular(50.0),
                          ),
                          //border: Border.all(style: BorderStyle.solid)
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          xAlign = loginAlign;
                          moneyColor = selectedColor;
                          flagColor = normalColor;
  
                          selectedWidgetMaker = WidgetMaker.bills;
                        });
                      },
                      child: Align(
                        alignment: Alignment(-1, 0),
                        child: Container(
                          width: width * 0.5,
                          color: Colors.transparent,
                          alignment: Alignment.center,
                          child: Icon(Icons.money_outlined, color: moneyColor),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          xAlign = signInAlign;
                          moneyColor = normalColor;
                          flagColor = selectedColor;
  
                          selectedWidgetMaker = WidgetMaker.flags;
                        });
                      },
                      child: Align(
                        alignment: Alignment(1, 0),
                        child: Container(
                          width: width * 0.5,
                          color: Colors.transparent,
                          alignment: Alignment.center,
                          child: Icon(Icons.flag_outlined, color: flagColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // SizedBox(
              //   width: 30,
              //   height: 30,
              //   child: MyBlinkingButton()
              // )
            ],
          ),
          SizedBox(height: 15,),
          Container(
            child: getWidget(),
          ),
        ],
      ),
    ),
  );
  }
}
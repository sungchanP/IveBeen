import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';


List<String?> _billKeys = [];
List<String?> _flagKeys = [];

class DbHelper{
  final _dbRef = FirebaseDatabase.instance.ref('users');
  User? user = FirebaseAuth.instance.currentUser;
  bool isCollected = false;

  void addUserToDB() async{
    await _dbRef.child(user!.uid).set({
      "email": user!.email,
    });
  }

  void getBillsCollection(String countryCode) async{
    final billDbRef = _dbRef.child('${user!.uid}/bills');
    final snapshot = await billDbRef.get();

    if(!snapshot.exists){                                    //if there is no bill collected at all
      print("add current country bill to collection");
      var newPostKey = billDbRef.push().key;                // add new key (first) to the bill db
      Map<String, String> updates = {};                      // init map (unique key, country code)
      updates['/bills/$newPostKey'] = countryCode;           // map named updates = {unique key: country code}
      await _dbRef.child(user!.uid).update(updates);         // update current user's bill db (successfully collected current country bill)
      _billKeys.add(newPostKey);                             // add unique key to key list (traverse this list to track all bills collected so far and check if current country bill is already collected) 
    }
    else{     
      for(var key in _billKeys){                             //traverse key list to track all bills collected so far and check if current country bill is already collected
        var temp = await billDbRef.child("$key").get();     // get value of that key from bill db
        // print("1.$key");
        // print("2.${temp.value}");
        // print("3.5. $countryCode");
        // print("3.${temp.value == countryCode}");
        if(temp.value == countryCode){                       // currently located country bill is in bill db = already collected 
          print("already collected");
          isCollected = true;
          break;                                             // no need for further check 
        }
      }
      if(!isCollected){                                      // after traverse the entire key list, no mathcing bill is found = current country bill is not collected
        var newPostKey = billDbRef.push().key;              // same process as first addition (should modulize this part)
        Map<String, String> updates = {};
        updates['/bills/$newPostKey'] = countryCode;
        await _dbRef.child(user!.uid).update(updates);
        _billKeys.add(newPostKey);
        print(_billKeys);
        print("now collected $countryCode bill");
      }
    }
  }


  void getFlagsCollection(String flag) async{                // same function as getBillsCollection but for flags
    final flagDbRef = _dbRef.child('${user!.uid}/flags');
    final snapshot = await flagDbRef.get();
    if(!snapshot.exists){
      print("add current country bill to collection");
    }
    else{
      print('this bill is already collected');
    }
  }
}
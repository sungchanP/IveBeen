import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';


class DbHelper{
  final _dbRef = FirebaseDatabase.instance.ref('users');
  final _storageRef = FirebaseStorage.instance.ref();

  User? user = FirebaseAuth.instance.currentUser;
  //bool isCollected = false;

  void addUserToDB() async{
    await _dbRef.child(user!.uid).set({
      "email": user!.email,
    });
  }

  Future<bool> isBillCollected(String countryCode) async{
    final billDbRef = _dbRef.child('${user!.uid}/bills');
    final snapshot = await billDbRef.get();
    bool isCollected = false;

    if(!snapshot.exists){                                    //if there is no bill collected at all
      print("No bill collected for this user");
      return isCollected;                          
    }
    else{
      Map<dynamic, dynamic> countryCodeColleted = snapshot.value as Map<dynamic, dynamic>; // maps all key value to map from Datasnapshot
      for (var value in countryCodeColleted.values){
        if(value == countryCode){                       // currently located country bill is in bill db = already collected 
          print("$countryCode bill is already collected for this user");
          isCollected = true;
          break;                                        // no need for further check 
        }
      }
      return isCollected;
    }
  }

  void addBillToDB(String countryCode) async{
    final billDbRef = _dbRef.child('${user!.uid}/bills');
    
    var newPostKey = billDbRef.push().key;                 // add new key (first) to the bill db
    Map<String, String> updates = {};                      // init map (unique key, country code)
    updates['/bills/$newPostKey'] = countryCode;           // map named updates = {unique key: country code}
    await _dbRef.child(user!.uid).update(updates);         // update current user's bill db (successfully collected current country bill)
  }


  Future<bool> isFlagCollected(String countryCode) async{                // same function as getBillsCollection but for flags
    final flagDbRef = _dbRef.child('${user!.uid}/flags');
    final snapshot = await flagDbRef.get();
    bool isCollected = false;

    if(!snapshot.exists){                                    //if there is no bill collected at all
      print("No flag collected for this user");
      return isCollected;                          
    }
    else{
      Map<dynamic, dynamic> countryCodeColleted = snapshot.value as Map<dynamic, dynamic>; // maps all key value to map from Datasnapshot
      for (var value in countryCodeColleted.values){
        if(value == countryCode){                       // currently located country bill is in bill db = already collected 
          print("$countryCode flag is already collected for this user");
          isCollected = true;
          break;                                        // no need for further check 
        }
      }
      return isCollected;
    }
  }

  void addFlagToDB(String countryCode) async{
    final flagDbRef = _dbRef.child('${user!.uid}/flags');
    //final imageRef = _storageRef.child("flags_collected/$countryCode.png");
    //final gsRef = FirebaseStorage.instance.refFromURL("gs://moolah-12352/flags_collected/US.png");
    
    var newPostKey = flagDbRef.push().key;                 // add new key (first) to the bill db
    Map<String, String> updates = {};                      // init map (unique key, country code)
    updates['/flags/$newPostKey'] = countryCode;//"flags_collected/$countryCode.png";           // map named updates = {unique key: country code}
    await _dbRef.child(user!.uid).update(updates);         // update current user's bill db (successfully collected current country bill)
  }




}
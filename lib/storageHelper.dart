import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';


class StorageHelper{

  final _storageRef = FirebaseStorage.instance.ref();

  Future<String> loadFlag(String countryCode) async{
    final imageRef = _storageRef.child("flags_collected/$countryCode.png");
    var url = await imageRef.getDownloadURL();
    return url;
  }

}
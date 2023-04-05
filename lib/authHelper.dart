
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthHelper {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  get user => _auth.currentUser;

 //SIGN UP METHOD
  Future signUp({required String email, required String password}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      return e.code;
    }
  }

  Future inUse({required String email}) async {
    final lst = await _auth.fetchSignInMethodsForEmail(email);
    if (lst.isNotEmpty){
      return true;
    }
    return false;
  }


  //SIGN IN METHOD
  Future signIn({required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email, password: password
        );
        return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  //SIGN OUT METHOD
  Future signOut() async {
    await _auth.signOut();
  }


  Future verifyEmail(email) async{
    try{
      await _auth.sendPasswordResetEmail(email: email);
      return null;
    }
    on FirebaseAuthException catch (e){
      print(e);
    }
  }

}





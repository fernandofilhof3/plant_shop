import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  
    FirebaseAuth _auth = FirebaseAuth.instance;
    FirebaseUser user;

    AuthResult fireBaseUser;
    Map<String, dynamic> userData = Map();


     Future singIn({@required String email, @required String pass,}) async{
      try {
      var authResult = await _auth.signInWithEmailAndPassword(email: email, password: pass);
      user = authResult.user;
      return true;
      } catch(e) {
        return false;
      }
    }

    Future<Null> _loadCurrentUser() async {
    if(fireBaseUser == null)
      user = await _auth.currentUser();
    if(fireBaseUser != null){
      if(userData['name'] == null){
        DocumentSnapshot docUser =
          await Firestore.instance.collection('users').document(user.uid).get();
          userData = docUser.data;
      }
    }
  }

}
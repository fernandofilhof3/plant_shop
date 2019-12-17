import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:plant_shop/models/users.model.dart';

class AuthService {
  
    FirebaseAuth _auth = FirebaseAuth.instance;
    FirebaseUser user;

    AuthResult fireBaseUser;
    User userData;


     Future singIn({@required String email, @required String pass,}) async{
      try {
      var authResult = await _auth.signInWithEmailAndPassword(email: email, password: pass);
      user = authResult.user;
      _loadCurrentUser();
      return userData;
      } catch(e) {
        return false;
      }
    }

    Future<Null> _loadCurrentUser() async {
    if(user == null)
      user = await _auth.currentUser();
    if(user != null){
      if(userData == null){
        DocumentSnapshot docUser =
          await Firestore.instance.collection('users').document(user.uid).get();
          userData = User.fromDocument(docUser);
      }
    }
  }

}
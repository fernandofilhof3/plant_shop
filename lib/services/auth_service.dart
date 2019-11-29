import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  
    FirebaseAuth _auth = FirebaseAuth.instance;
    FirebaseUser user;
    bool logged;

    AuthResult fireBaseUser;
    Map<String, dynamic> userData = Map();


     Future singIn({@required String email, @required String pass, @required VoidCallback onFail}) async{
      _auth.signInWithEmailAndPassword(email: email, password: pass).then(
        (user) async{
          fireBaseUser = user;
          // await _loadCurrentUser();
          logged = true;
        }
      ).catchError((e){
        onFail();
      });
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

  bool islooged() {
    return logged;
  }

}
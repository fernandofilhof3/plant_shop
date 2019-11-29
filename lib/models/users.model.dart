import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String email;
  String name;
  String image;

  User.fromDocument(DocumentSnapshot snapshot){
    email = snapshot.data['email'];
    name = snapshot.data['name'];
    image = snapshot.data['image'];
  }

}
import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String id;
  String name;
  String image;

  User.fromDocument(DocumentSnapshot snapshot){
    id = snapshot.data['uid'];
    name = snapshot.data['name'];
    image = snapshot.data['image'];
  }

}
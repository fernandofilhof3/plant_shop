import 'package:cloud_firestore/cloud_firestore.dart';

class CartProduct {
  String id;
  String name;
  String image;
  double itemPrice;

  CartProduct({this.id, this.name, this.image, this.itemPrice});

  CartProduct.fromDocument(DocumentSnapshot snapshot){
    id = snapshot.documentID;
    name = snapshot.data['name'];
    image = snapshot.data['image'];
    itemPrice = snapshot.data['itemPrice'].toDouble();
  }

  Map<String, dynamic> toMap(){
    return {
      'id': id,
      'name': name,
      'image': image,
      'itemPrice': itemPrice,
    };
  }

}
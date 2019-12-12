import 'package:cloud_firestore/cloud_firestore.dart';

class CartProduct {
  String id;
  String name;
  String image;
  String category;
  int amount;
  double itemPrice;

  CartProduct({this.id, this.name, this.image, this.itemPrice, this.category});

  CartProduct.fromDocument(DocumentSnapshot snapshot){
    id = snapshot.data['id'];
    name = snapshot.data['name'];
    image = snapshot.data['image'];
    category = snapshot.data['category'];
    amount = snapshot.data['amount'];
    itemPrice = snapshot.data['itemPrice'].toDouble();
  }

  Map<String, dynamic> toMap(){
    return {
      'id': id,
      'name': name,
      'image': image,
      'category': category,
      'amount': amount,
      'itemPrice': itemPrice,
    };
  }

}
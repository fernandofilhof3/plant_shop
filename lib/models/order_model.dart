import 'package:cloud_firestore/cloud_firestore.dart';

class Order {
  String id;
  double price;
  String status;

  Order({this.id, this.price, this.status});

  Order.fromDocument(DocumentSnapshot snapshot){
    id = snapshot.data['id'];
    price = snapshot.data['price'].toDouble();
    status = snapshot.data['status'];
  }

  Map<String, dynamic> toMap(){
    return {
      'id': id,
      'price': price,
      'status': status
    };
  }

}
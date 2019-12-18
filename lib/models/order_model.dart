import 'package:cloud_firestore/cloud_firestore.dart';

class Order {
  String id;
  String date;
  double price;
  String status;

  Order({this.id, this.price, this.status});

  Order.fromDocument(DocumentSnapshot snapshot){
    id = snapshot.documentID;
    price = snapshot.data['price'].toDouble();
    date = snapshot.data['date'];
    status = snapshot.data['status'];
  }

  Map<String, dynamic> toMap(){
    return {
      'id': id,
      'price': price,
      'date': date,
      'status': status
    };
  }

}
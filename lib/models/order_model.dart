import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:plant_shop/models/cart_product_model.dart';

class Order {
  String id;
  String date;
  double price;
  String status;
  List<CartProduct> products;

  Order({this.id, this.price, this.status});

  Order.fromDocument(DocumentSnapshot snapshot){
    id = snapshot.documentID;
    price = snapshot.data['price'].toDouble();
    date = snapshot.data['date'];
    status = snapshot.data['status'];
    products = snapshot.data['product'];
  }

  Map<String, dynamic> toMap(){
    return {
      'id': id,
      'price': price,
      'date': date,
      'status': status,
      'product': products.map((product) => product.toMap()).toList()
    };
  }

}
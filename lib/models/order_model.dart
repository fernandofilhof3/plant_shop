import 'package:plant_shop/models/cart_product_model.dart';

class Order {
  String id;
  String date;
  double price;
  String status;
  List<CartProduct> products;

  Order({this.id, this.price, this.status});

  Order.fromDocument(Map<String, dynamic> data, String documentId){
    id = documentId;
    price = data['price'].toDouble();
    date = data['date'];
    status = data['status'];
    products = [];
    data['product'].forEach((product) => products.add(CartProduct.fromDocument(product)));
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
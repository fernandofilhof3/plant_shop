import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:plant_shop/models/cart_product_model.dart';

class Product {
  String id;
  String category;
  String description;
  String image;
  String name;
  double price;
  String size;
  List requirements;

  Product.fromDocument(DocumentSnapshot snapshot){
    id = snapshot.documentID;
    category = snapshot.data['category'];
    description = snapshot.data['description'];
    image = snapshot.data['image'];
    name = snapshot.data['name'];
    price = snapshot.data['price'].toDouble();
    size = snapshot.data['size'];
    requirements = snapshot.data['requirements'];
  }
}
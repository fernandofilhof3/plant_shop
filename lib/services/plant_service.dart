import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:plant_shop/models/product_model.dart';

class PlantService {
  dynamic products;

  Future getProducts() async {
    QuerySnapshot query = await Firestore.instance.collection('products').getDocuments();
    products = query.documents.map((doc) => Product.fromDocument(doc)).toList();
    return products;
  }
}

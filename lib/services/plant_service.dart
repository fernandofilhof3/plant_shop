import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:plant_shop/models/product_model.dart';

class PlantService {
  List<Product> products;

  Future getProducts(String type) async {
    QuerySnapshot query = await Firestore.instance.collection('products').getDocuments();
    products = query.documents.map((doc) => Product.fromDocument(doc)).toList();
    return products;
  }

  Future getProductsByCategory(String _category) async {
    QuerySnapshot query;
    if (_category.isNotEmpty)
      query = await Firestore.instance.collection('products').where('category', isEqualTo: _category).getDocuments();
    else
      query = await Firestore.instance.collection('products').getDocuments();
    
    products = query.documents.map((doc) => Product.fromDocument(doc)).toList();
    return products;
  }
}


import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:plant_shop/models/cart_product_model.dart';

class CartService {
  CartProduct item;
  List<CartProduct> productList;

  Future getCartList() async {
    QuerySnapshot query = await Firestore.instance.collection('cart').getDocuments();
    productList = query.documents.map((item) => CartProduct.fromDocument(item)).toList();
    log(productList[0].itemPrice.toString());
    return productList;
  }

   Future addItem(CartProduct item) async {
    Firestore.instance.collection('cart').add(item.toMap()).then((doc){
      // NOTIFY?
    });
  }

  void removeItem(CartProduct item){
    Firestore.instance.collection('cart').document(item.id).delete();
    // NOTIFY?
  }

}
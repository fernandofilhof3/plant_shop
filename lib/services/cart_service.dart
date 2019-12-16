import 'dart:developer';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:plant_shop/bloc/auth_bloc.dart';
import 'package:plant_shop/models/cart_product_model.dart';
import 'package:plant_shop/models/users.model.dart';

class CartService {
  CartProduct item;
  List<CartProduct> productList;
  int total = 0;

  User get user => BlocProvider.getBloc<AuthBloc>().getUser;

  Future getCartList() async {
    QuerySnapshot query = await Firestore.instance
        .collection('users')
        .document(user.id)
        .collection('cart')
        .getDocuments();
    productList =
        query.documents.map((item) => CartProduct.fromDocument(item)).toList();
    return productList;
  }

  Future getCartAmount() async {
    QuerySnapshot query = await Firestore.instance
        .collection('users')
        .document(user.id)
        .collection('cart')
        .getDocuments();
    var x = query.documents.map((item) => CartProduct.fromDocument(item)).toList();
    total = 0;
    x.forEach((item) {
      total += item.amount;
    });
    return total;
  }

  Future addItem(CartProduct item) async {
    var additioned = false;
    await getCartList();

    if (productList.length > 0) {
      var product = productList.where((x) => x.id == item.id);
      if (product.length == 0) {
        await addNewItem(item).then((doc) {
        additioned = true;
      });
      } else {
        await incrementItem(item.id, product.first.amount + 1).then((doc) {
          additioned = true;
          return additioned;
        });
      }
    } else {
      await addNewItem(item).then((doc) {
        additioned = true;
      });
    }
    return additioned;
  }

  Future addNewItem(CartProduct item) async {
    await Firestore.instance
            .collection('users')
            .document(user.id)
            .collection('cart')
            .document(item.id)
            .setData(item.toMap())
            .then((doc) {
        });
  }

  Future incrementItem(String productId, int value) async {
    await Firestore.instance
        .collection('users')
        .document(user.id)
        .collection('cart')
        .document(productId)
        .updateData({'amount': value});
  }

  Future decrementItem(String productId, int value) async {
    await Firestore.instance
        .collection('users')
        .document(user.id)
        .collection('cart')
        .document(productId)
        .updateData({'amount': value});
  }

  Future removeItem(CartProduct item) async{
    var success = await Firestore.instance.collection('users').document(user.id).collection('cart').document(item.id).delete().then((doc){return true;});
    return success;
    // NOTIFY?
  }
}

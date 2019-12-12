import 'dart:developer';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:plant_shop/bloc/auth_bloc.dart';
import 'package:plant_shop/models/cart_product_model.dart';
import 'package:plant_shop/models/users.model.dart';

class CartService {
  CartProduct item;
  List<CartProduct> productList;

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

  Future addItem(CartProduct item) async {
    var additioned = false;
    await getCartList();

    if (productList.length > 0) {
      var product = productList.firstWhere((x) => x.id == item.id);
      if (product == null) {
        await addNewItem(item);
      } else {
      log('increment');
        await incrementItem(item.id, product.amount + 1).then((doc) {
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
    log(value.toString());
    await Firestore.instance
        .collection('users')
        .document(user.id)
        .collection('cart')
        .document(productId)
        .updateData({'amount': value});
  }

  void removeItem(CartProduct item) {
    Firestore.instance.collection('cart').document(item.id).delete();
    // NOTIFY?
  }
}

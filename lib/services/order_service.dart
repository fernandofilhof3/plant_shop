import 'dart:developer';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:plant_shop/bloc/auth_bloc.dart';
import 'package:plant_shop/models/order_model.dart';
import 'package:plant_shop/models/users.model.dart';
import 'package:plant_shop/services/cart_service.dart';

class OrderService {
  List orders;
  CartService cartService = CartService();
  
  User get user => BlocProvider.getBloc<AuthBloc>().getUser;
  
  Future getOrders() async {
    try {
      QuerySnapshot query = await Firestore.instance
          .collection('users')
          .document(user.id)
          .collection('orders')
          .getDocuments();
      orders = query.documents
          .map((item) => Order.fromDocument(item.data, item.documentID))
          .toList();
      return orders;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future addNewItem(Order item) async {
    var success = false;
    try {
      await Firestore.instance
          .collection('users')
          .document(user.id)
          .collection('orders')
          .document(item.id)
          .setData(item.toMap())
          .then((doc) {
            success = true;
          });
      await cartService.clearCart();
    } catch (e) {
      success = false;
    }
    return success;
  }
}

import 'dart:async';
import 'dart:developer';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:plant_shop/models/cart_product_model.dart';
import 'package:plant_shop/services/cart_service.dart';

class CartBloc implements BlocBase {
  CartProduct product;
  List<CartProduct> productList;
  CartService cartService;

  final StreamController<List<CartProduct>> _cartController =
      StreamController<List<CartProduct>>.broadcast();
  Stream get cartList => _cartController.stream.asBroadcastStream();

  bool _itemAdditioned = false;

  bool get isAdditioned => _itemAdditioned;

  set isAdditioned(bool value) {
    _itemAdditioned = value;
    notifyListeners();
  }

  CartBloc() {
    cartService = CartService();
  }

  Future addItem(CartProduct item) async {
    _itemAdditioned = false;
    _itemAdditioned = await cartService.addItem(item);
  }

  void removeItem() {}

  getCartItems(text) async {
    _cartController.sink.add(null);
    productList = await cartService.getCartList();
    _cartController.sink.add(productList);
  }

  @override
  void addListener(listener) {
    // TODO: implement addListener
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _cartController.close();
  }

  @override
  // TODO: implement hasListeners
  bool get hasListeners => null;

  @override
  void notifyListeners() {
    // TODO: implement notifyListeners
  }

  @override
  void removeListener(listener) {
    log('removed');
    // TODO: implement removeListener
  }
}

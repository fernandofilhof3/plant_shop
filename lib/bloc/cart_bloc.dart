import 'dart:async';
import 'dart:developer';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:plant_shop/models/cart_product_model.dart';
import 'package:plant_shop/services/cart_service.dart';

class CartBloc implements BlocBase {
  CartProduct product;
  List<CartProduct> productList;
  CartService cartService;
  int _cartAmount = 0;

  final StreamController<List<CartProduct>> _cartController = StreamController<List<CartProduct>>.broadcast();
  Stream get cartList => _cartController.stream.asBroadcastStream();

  bool _itemAdditioned = false;

  bool get isAdditioned => _itemAdditioned;

  set isAdditioned(bool value) {
    _itemAdditioned = value;
    notifyListeners();
  }
  int get cartAmount => _cartAmount;

  bool _itemRemoved= false;

  bool get isRemoved => _itemRemoved;

  set isRemoved(bool value) {
    _itemRemoved = value;
    notifyListeners();
  }

  CartBloc() {
    cartService = CartService();
  }

  Future addItem(CartProduct item) async {
    _itemAdditioned = false;
    _itemAdditioned = await cartService.addItem(item);
    getCartAmount();
  }

  Future removeItem(CartProduct item) async{
     _itemRemoved = await cartService.removeItem(item);
    getCartItems('');
    getCartAmount();
  }

  Future decrementItem(String productId, int amount) async{
     _itemRemoved = await cartService.decrementItem(productId, amount);
     getCartAmount();
  }

  Future getCartAmount() async{
    _cartAmount = await cartService.getCartAmount();
    _cartController.sink.add(productList);
  }

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
    // TODO: implement removeListener
  }
}

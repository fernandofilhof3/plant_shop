import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:plant_shop/models/order_model.dart';
import 'package:plant_shop/services/order_service.dart';

class OrderBloc implements BlocBase {
  OrderService orderService;
  List<Order> order;
  bool success = false;

  OrderBloc() {
    orderService = OrderService();
  }

  final StreamController<List> _cartController = StreamController<List>.broadcast();
  Stream get cartList => _cartController.stream.asBroadcastStream();

  Future getOrders() async {
    _cartController.add(null);
    order = await orderService.getOrders();
    _cartController.add(order);
  }

  Future addOrder(Order order) async{
    success = await orderService.addNewItem(order);
    return success;
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
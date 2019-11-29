import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:plant_shop/models/product_model.dart';
import 'package:plant_shop/services/plant_service.dart';

class ProductBloc implements BlocBase {
  PlantService plantService;

  List<Product> products;

  final StreamController<List<Product>> _productController = StreamController<List<Product>>();
  Stream get getProduct => _productController.stream;

  ProductBloc(){
    plantService = PlantService();

    // _productController.stream.listen(_getProducts);
  }

  void _getProducts() async{
    products = await plantService.getProducts();
    // _productController.sink.add(products);
  }

  @override
  void addListener(listener) {
    // TODO: implement addListener
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _productController.close();
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
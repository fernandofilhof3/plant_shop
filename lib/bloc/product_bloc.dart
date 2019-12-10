import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:plant_shop/models/product_model.dart';
import 'package:plant_shop/services/plant_service.dart';

class ProductBloc implements BlocBase {
  PlantService plantService;

  List<Product> products;

  final StreamController<List<Product>> _productController = StreamController<List<Product>>();
  Stream get getProduct => _productController.stream;
  
  final StreamController<String> _searchController = StreamController<String>();
  Sink get search => _searchController.sink;

  ProductBloc(){
    plantService = PlantService();
    _searchController.stream.listen(_getProductsByCategory);
  }

   _getProducts(type) async{
     if ( type != null) {
       _productController.sink.add([]);
       products = await plantService.getProducts(type);
        _productController.sink.add(products);
     }
  }
   _getProductsByCategory(category) async{
       _productController.sink.add(null);
       products = await plantService.getProductsByCategory(category);
        _productController.sink.add(products);
  }

  @override
  void addListener(listener) {
    // TODO: implement addListener
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _productController.close();
    _searchController.close();
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
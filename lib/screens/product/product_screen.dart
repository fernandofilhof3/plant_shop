import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:plant_shop/models/category_model.dart';
import 'package:plant_shop/screens/product/widgets/category_button.dart';
import 'package:plant_shop/screens/product/widgets/product_card.dart';

class ProductScreen extends StatelessWidget {
  final Category categoryProduct = new Category(id: 1, category: 'Tropical');
  final pvController = PageController(
    viewportFraction: 0.85,
  );
  @override
  Widget build(BuildContext context) {
    double _screenHeight = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.only(top: 15),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 12, bottom: 20),
            alignment: Alignment.centerLeft,
            child: Text(
              'Plant Shop',
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: 32,
            child: CategoryButton( categoryProduct, (categoryId) {
                  log('Id: ${categoryId}');
                }),
          ),
          SizedBox(
            height: _screenHeight - 210,
            child: PageView.builder(
              controller: pvController,
              itemBuilder: (context, position) {
                return ProductCard(position: position);
              },
              itemCount: 4,
              
            ),
          ),
        ],
      ),
    );
  }
}

import 'dart:developer';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:plant_shop/bloc/product_bloc.dart';
import 'package:plant_shop/models/category_model.dart';
import 'package:plant_shop/screens/product/widgets/category_button.dart';
import 'package:plant_shop/screens/product/widgets/product_card.dart';

class ProductScreen extends StatelessWidget {
  final pvController = PageController(
    viewportFraction: 0.85,
    keepPage: true,
  );
  ProductBloc get productBloc => BlocProvider.getBloc<ProductBloc>();

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
          SizedBox(height: 32, child: CategoryButton()),
          SizedBox(
            height: _screenHeight - 210,
            child: StreamBuilder(
              stream: BlocProvider.getBloc<ProductBloc>().getProduct,
              initialData: [],
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return PageView.builder(
                    controller: pvController,
                    itemBuilder: (context, index) {
                      return ProductCard(
                        position: index,
                        product: snapshot.data[index],
                      );
                    },
                    itemCount: snapshot.data.length,
                  );
                } else {
                  return null;
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

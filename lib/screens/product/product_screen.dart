import 'dart:developer';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:plant_shop/bloc/product_bloc.dart';
import 'package:plant_shop/screens/product/widgets/category_button.dart';
import 'package:plant_shop/screens/product/widgets/product_card.dart';
import 'package:plant_shop/shared/empty-view.dart';
import 'package:plant_shop/shared/size_config.dart';

class ProductScreen extends StatelessWidget {
  final pvController = PageController(
    viewportFraction: 0.85,
    keepPage: true,
  );
  ProductBloc get productBloc => BlocProvider.getBloc<ProductBloc>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      width: SizeConfig.safeBlockHorizontal * 100,
      height: SizeConfig.safeBlockVertical * 100,
      margin: EdgeInsets.only(top: 10),
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
          Container(
            width: SizeConfig.safeBlockHorizontal * 100,
            height: SizeConfig.safeBlockVertical * 70,
            child: StreamBuilder(
              stream: BlocProvider.getBloc<ProductBloc>().getProduct,
              initialData: [],
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data.length > 0) {
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
                    log('else');
                    return EmptyView(
                      msg: 'Desculpe, não encontramos nenhum produto para esta cartegoria :(',
                    );
                  }
                } else {
                  return Container(
                      margin: EdgeInsets.fromLTRB(
                          SizeConfig.safeBlockHorizontal * 40,
                          SizeConfig.safeBlockVertical * 29,
                          SizeConfig.safeBlockHorizontal * 40,
                          SizeConfig.safeBlockVertical * 29),
                      child: CircularProgressIndicator(
                        strokeWidth: 3.5,
                      ));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

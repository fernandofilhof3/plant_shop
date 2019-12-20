import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:plant_shop/bloc/product_bloc.dart';
import 'package:plant_shop/screens/product/widgets/category_button.dart';
import 'package:plant_shop/screens/product/widgets/product_card.dart';
import 'package:plant_shop/shared/empty-view.dart';
import 'package:plant_shop/shared/size_config.dart';

class ProductScreen extends StatefulWidget {
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final pvController = PageController(
    viewportFraction: 0.85,
    keepPage: true,
  );

  ProductBloc get productBloc => BlocProvider.getBloc<ProductBloc>();
  @override
  void initState() {
    super.initState();
    productBloc.search.add('');
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      width: SizeConfig.safeBlockHorizontal * 100,
      height: SizeConfig.safeBlockVertical * 90,
      margin: EdgeInsets.only(top: 10),
      child: Column(
        children: <Widget>[
          Container(
            height: SizeConfig.safeBlockVertical * 7,
            padding: EdgeInsets.only(left: 12, bottom: 12),
            alignment: Alignment.centerLeft,
            child: Text(
              'Plant Shop',
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 26,
                letterSpacing: 0.8,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
              height: SizeConfig.safeBlockVertical * 5,
              child: CategoryButton()),
          Container(
            width: SizeConfig.safeBlockHorizontal * 100,
            height: SizeConfig.safeBlockVertical * 73,
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
                    return EmptyView(
                      msg:
                          'Desculpe, não encontramos nenhum produto para esta cartegoria :(',
                    );
                  }
                } else {
                  return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        SizedBox(
                            width: SizeConfig.safeBlockHorizontal * 30,
                            height: SizeConfig.safeBlockHorizontal * 30,
                            child: CircularProgressIndicator(
                              strokeWidth: 3,
                            )),
                      ]);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

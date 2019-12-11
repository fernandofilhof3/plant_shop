import 'dart:developer';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:plant_shop/bloc/cart_bloc.dart';
import 'package:plant_shop/screens/cart/widgets/cart_product_card.dart';
import 'package:plant_shop/shared/empty-view.dart';
import 'package:plant_shop/shared/size_config.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  
 
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    BlocProvider.getBloc<CartBloc>().getCartItems('');

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey[800]),
        title: Text(
          'Carrinho',
          style: TextStyle(
              fontSize: 20, color: Colors.grey[800], letterSpacing: 0.8),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            height: SizeConfig.blockSizeVertical * 78,
            width: SizeConfig.safeBlockHorizontal * 93,
            child: StreamBuilder(
                stream: BlocProvider.getBloc<CartBloc>().cartList,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data.length > 0) {
                      return ListView.builder(
                        itemBuilder: (context, index) {
                          return CartProductCard(
                            product: snapshot.data[index],
                          );
                        },
                        itemCount: snapshot.data.length,
                      );
                    } else {
                      return EmptyView(
                        msg:
                            'Você ainda não adicionou nenhum produto ao seu carrinho.',
                      );
                    }
                  } else {
                    return SizedBox(
                        width: SizeConfig.safeBlockHorizontal * 30,
                        height: SizeConfig.safeBlockHorizontal * 30,
                        child: CircularProgressIndicator(
                          strokeWidth: 3,
                        ));
                  }
                }
                ),
          ),
          Container(
            color: Theme.of(context).accentColor,
            height: SizeConfig.safeBlockVertical * 10,
            width: SizeConfig.safeBlockHorizontal * 100,
            child: Center(
              child: Text(
                'Fechar pedido',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 0.8,
                    fontSize: 22),
              ),
            ),
          )
        ],
      ),
    );
  }
}

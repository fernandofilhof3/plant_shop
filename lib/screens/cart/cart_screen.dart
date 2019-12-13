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
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  CartBloc get cartBloc => BlocProvider.getBloc<CartBloc>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    cartBloc.getCartItems('');

    return Scaffold(
      key: _scaffoldKey,
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
      body: StreamBuilder(
          stream: cartBloc.cartList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data.length > 0) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      height: SizeConfig.blockSizeVertical * 76,
                      width: SizeConfig.safeBlockHorizontal * 93,
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return CartProductCard(
                            product: snapshot.data[index],
                            onSuccess: _onSuccess,
                          );
                        },
                        itemCount: snapshot.data.length,
                      ),
                    ),
                    Container(
                      color: Theme.of(context).accentColor,
                      height: SizeConfig.safeBlockVertical * 11,
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
                );
              } else {
                return EmptyView(
                  msg:
                      'Você ainda não adicionou nenhum produto ao seu carrinho.',
                );
              }
            } else {
              return Center(
                child: SizedBox(
                    width: SizeConfig.safeBlockHorizontal * 30,
                    height: SizeConfig.safeBlockHorizontal * 30,
                    child: CircularProgressIndicator(
                      strokeWidth: 3,
                    )),
              );
            }
          }),
    );
  }

  void _onSuccess() {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Container(
        height: SizeConfig.safeBlockVertical * 8,
        width: SizeConfig.safeBlockHorizontal * 100,
        alignment: AlignmentDirectional.center,
        child: Text(
          'Produto removido do carrinho',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 18,
              letterSpacing: .8,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
      ),
      backgroundColor: Color.fromRGBO(0, 146, 245, 1),
      duration: Duration(milliseconds: 1500),
    ));
  }
}
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:plant_shop/bloc/cart_bloc.dart';
import 'package:plant_shop/models/cart_product_model.dart';
import 'package:plant_shop/screens/cart/widgets/cart_app_bar.dart';
import 'package:plant_shop/screens/cart/widgets/cart_product_card.dart';
import 'package:plant_shop/screens/cart/widgets/confirm_order.dart';
import 'package:plant_shop/shared/empty-view.dart';
import 'package:plant_shop/shared/size_config.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen>
    with SingleTickerProviderStateMixin {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _scrollController = ScrollController();
  bool _hideAppbar = false;

  CartBloc get cartBloc => BlocProvider.getBloc<CartBloc>();
  List<CartProduct> _products = List<CartProduct>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    cartBloc.getCartItems('');

    return Scaffold(
      key: _scaffoldKey,
      appBar: CartAppBar(
        startDecrease: _hideAppbar,
      ),
      body: StreamBuilder(
          stream: cartBloc.cartList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data.length > 0) {
                return ListView(
                  controller: _scrollController,
                  physics: NeverScrollableScrollPhysics(),
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          height: SizeConfig.blockSizeVertical * 76,
                          width: SizeConfig.safeBlockHorizontal * 93,
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              _products.add(snapshot.data[index]);
                              return CartProductCard(
                                product: snapshot.data[index],
                                onSuccess: _onSuccess,
                              );
                            },
                            itemCount: snapshot.data.length,
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                        onTap: () {
                          if (!_hideAppbar) {
                            setState(() {
                              _hideAppbar = true;
                            });
                            _scrollController.animateTo(
                                SizeConfig.safeBlockVertical * 100,
                                duration: Duration(milliseconds: 800),
                                curve: Curves.easeIn);
                          }
                        },
                        child: Container(
                            color: Theme.of(context).accentColor,
                            child: ConfirmOrder(
                              animateBack: _animateBack,
                              cartPrice: cartBloc.cartPrice,
                              shippingPrice: 7.99,
                              product: _products,
                            )))
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

  void _animateBack() {
    _scrollController.animateTo(SizeConfig.safeBlockVertical * 0,
        duration: Duration(milliseconds: 800), curve: Curves.easeIn);
    setState(() {
      _hideAppbar = false;
    });
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

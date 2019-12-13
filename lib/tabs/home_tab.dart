import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plant_shop/bloc/cart_bloc.dart';
import 'package:plant_shop/screens/cart/cart_screen.dart';
import 'package:plant_shop/screens/product/product_screen.dart';

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  CartBloc get cartBloc => BlocProvider.getBloc<CartBloc>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
            drawer: Drawer(),
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              leading: Container(
                margin: EdgeInsets.only(top: 8),
                child: MaterialButton(
                    padding: EdgeInsets.all(1),
                    shape: CircleBorder(
                        side: BorderSide(color: Colors.transparent)),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    child: SvgPicture.asset(
                      'images/menu.svg',
                      color: Colors.grey[600],
                      width: 28,
                      height: 28,
                    )),
              ),
              actions: <Widget>[
                Stack(children: <Widget>[
                  Container(
                    width: 48,
                    height: 48,
                    margin: EdgeInsets.only(right: 8, top: 8),
                    alignment: AlignmentDirectional.center,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.grey[100]),
                    child: MaterialButton(
                        height: 48,
                        padding: EdgeInsets.all(1),
                        shape: CircleBorder(
                            side: BorderSide(color: Colors.transparent)),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => CartScreen()));
                        },
                        child: SvgPicture.asset(
                          'images/cart-icon.svg',
                          color: Colors.black87,
                          width: 25,
                          height: 25,
                        )),
                  ),
                  Positioned(
                    top: 1,
                    right: 4,
                    child: StreamBuilder(
                        stream: cartBloc.cartList,
                        builder: (context, snapshot) {
                          return cartBloc.cartAmount > 0
                              ? Container(
                                  width: 26,
                                  height: 26,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color:Theme.of(context).accentColor),
                                  child: Text(
                                    cartBloc.cartAmount.toString(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              : Container();
                        })
                  )
                ]),
              ],
            ),
            body: ProductScreen()),
      ],
    );
  }
}

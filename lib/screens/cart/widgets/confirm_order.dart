import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plant_shop/models/cart_product_model.dart';
import 'package:plant_shop/models/order_model.dart';
import 'package:plant_shop/screens/cart/widgets/confirm_button.dart';
import 'package:plant_shop/shared/size_config.dart';
import 'package:plant_shop/shared/text_row.dart';

class ConfirmOrder extends StatefulWidget {
  final Function animateBack;
  final double cartPrice;
  final double shippingPrice;
  final List<CartProduct> product;

  ConfirmOrder({this.animateBack, this.cartPrice, this.shippingPrice, this.product});

  @override
  _ConfirmOrderState createState() => _ConfirmOrderState();
}

class _ConfirmOrderState extends State<ConfirmOrder> with SingleTickerProviderStateMixin{
  AnimationController _controller;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Order> _order;

@override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1800));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      children: <Widget>[
        Container(
            color: Theme.of(context).accentColor,
            height: SizeConfig.safeBlockVertical * 70,
            width: SizeConfig.safeBlockHorizontal * 100,
            padding: EdgeInsets.only(top: SizeConfig.safeBlockVertical * 5),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Fechar pedido',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 0.8,
                          fontSize: 22),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(18, 30, 18, 0),
                  alignment: AlignmentDirectional.bottomStart,
                  child: Column(
                    children: <Widget>[
                      TextRow(
                        icon: 'images/home.svg',
                        title: 'Endereço de entrega',
                        subtitle: 'Rua carajás, 384 - Tabajarás',
                      ),
                      SizedBox(
                        height: SizeConfig.safeBlockVertical * 5,
                      ),
                      TextRow(
                        icon: 'images/credit-card.svg',
                        title: 'Forma de pagamento',
                        subtitle: '5168 **** **** 0339 ',
                      ),
                      SizedBox(
                        height: SizeConfig.safeBlockVertical * 5,
                      ),
                      TextRow(
                        icon: 'images/cart-icon.svg',
                        title: 'Valor do carrinho',
                        subtitle: 'R\$ ' + widget.cartPrice.toStringAsFixed(2),
                      ),
                      SizedBox(
                        height: SizeConfig.safeBlockVertical * 5,
                      ),
                      TextRow(
                        icon: 'images/shipped.svg',
                        title: 'Frete',
                        subtitle: 'R\$ ' + widget.shippingPrice.toStringAsFixed(2),
                      ),
                      SizedBox(
                        height: SizeConfig.safeBlockVertical * 6,
                      ),
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        onPressed: (){
                          widget.animateBack();
                        },
                        child: Text(
                          'Revisar Pedido',
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                )
              ],
            )),
        Container(
          height: SizeConfig.safeBlockVertical * 30,
          width: SizeConfig.safeBlockHorizontal * 100,
          alignment: AlignmentDirectional.topCenter,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25))),
          child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 30),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Total:',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.grey[850],
                          letterSpacing: 0.8,
                        ),
                      ),
                      Text(
                        'R\$ ${(widget.cartPrice + widget.shippingPrice).toStringAsFixed(2)}',
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.grey[850],
                            letterSpacing: 0.8,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                        height: SizeConfig.safeBlockVertical * 8,
                      ),
                  ConfirmButton(
                    controller: _controller.view,
                    onError: _onError,
                    order: createOrder(),
                  )
                ],
              )),
        )
      ],
    );
  }

  Order createOrder() {
    final date = DateTime.now();
    Order item = Order();
    item.price = widget.cartPrice +  widget.shippingPrice;
    item.products = widget.product;
    item.status = 'PENDING';
    item.date = date.day.toString() + '/' + date.month.toString() + '/' + date.year.toString();
    return item;
  }

   void _onError() {
     log('Error');
    // _scaffoldKey.currentState.showSnackBar(SnackBar(
    //   content: Text(
    //     'Ocorreu um problema.',
    //     textAlign: TextAlign.center,
    //     style: TextStyle(
    //         fontSize: 18, letterSpacing: .8, fontWeight: FontWeight.bold),
    //   ),
    //   backgroundColor: Colors.redAccent,
    //   duration: Duration(milliseconds: 2200),
    // ));
  }
}

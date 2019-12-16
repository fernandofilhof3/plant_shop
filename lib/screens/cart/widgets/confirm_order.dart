import 'package:flutter/material.dart';
import 'package:plant_shop/shared/size_config.dart';
import 'package:plant_shop/shared/text_row.dart';

class ConfirmOrder extends StatelessWidget {
  final Function animateBack;

  ConfirmOrder({this.animateBack});
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
                  // crossAxisAlignment: CrossAxisAlignment.center,
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
                  // width: SizeConfig.safeBlockHorizontal * 100,
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
                        subtitle: 'R\$ 370.00',
                      ),
                      SizedBox(
                        height: SizeConfig.safeBlockVertical * 5,
                      ),
                      TextRow(
                        icon: 'images/shipped.svg',
                        title: 'Frete',
                        subtitle: 'R\$ 4.99',
                      ),
                      SizedBox(
                        height: SizeConfig.safeBlockVertical * 6,
                      ),
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        onPressed: (){
                          animateBack();
                        },
                        child: Text(
                          'Revisar Pedido',
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                      // Card(
                      //   elevation: 1,

                      //   shape: RoundedRectangleBorder(
                      //       borderRadius:
                      //           BorderRadius.all(Radius.circular(20))),
                      //   color: Colors.white,
                      //   child: Container(
                      //     width: SizeConfig.safeBlockHorizontal * 30,
                      //     height: SizeConfig.safeBlockVertical * 25,
                      //   ),
                      // )
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
                        'R\$ 374.99',
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.grey[850],
                            letterSpacing: 0.8,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Container(
                    margin:
                        EdgeInsets.only(top: SizeConfig.safeBlockVertical * 8),
                    width: SizeConfig.safeBlockVertical * 50,
                    height: 60,
                    decoration: BoxDecoration(
                        color: Colors.grey[900],
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: Center(
                        child: Text(
                      'Comprar',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    )),
                  )
                ],
              )),
        )
      ],
    );
  }
}

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:plant_shop/models/cart_product_model.dart';
import 'package:plant_shop/models/order_model.dart';
import 'package:plant_shop/screens/orders/order_details.dart';
import 'package:plant_shop/shared/size_config.dart';

class OrderCards extends StatelessWidget {
  final double totalValue;
  final String id;
  final String date;
  final String status;
  final Order order;
  final List<CartProduct> products;
  int amount = 0;

  OrderCards({this.totalValue, this.date, this.id, this.status, this.products, this.order});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    products.forEach((item) => amount += item.amount);
    return  Container(
        margin: EdgeInsets.only(bottom: 8),
        width: SizeConfig.safeBlockHorizontal * 75,
        height: SizeConfig.safeBlockVertical * 25,
        child: Card(
          elevation: 2.4,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
            child: MaterialButton(
              onPressed: (){
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => 
                    OrderDetails(
                  products: products,
                  order: order
                )
                  )
                );
              },
              child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                   Row(
                    children: <Widget>[
                      Container(
                        child: Text(
                          'Código: ',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[850]),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Expanded(
                        child: 
                      Container(
                        child: Text(
                          id,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[850]),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      )
                    ],
                  ),
                  // SizedBox(height: 5,),
                  Row(
                    children: <Widget>[
                      Text(
                          'Data: ',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[850]),
                          overflow: TextOverflow.ellipsis,
                        ),
                      Text(
                          date,
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[850]),
                          overflow: TextOverflow.ellipsis,
                        ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                          'Qantidade de itens: ',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[850]),
                          overflow: TextOverflow.ellipsis,
                        ),
                      Text(
                          amount.toString(),
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[850]),
                          overflow: TextOverflow.ellipsis,
                        ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                          'Valor: ',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[850]),
                          overflow: TextOverflow.ellipsis,
                        ),
                      Text(
                          'R\$ ' + totalValue.toStringAsFixed(2),
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).accentColor),
                          overflow: TextOverflow.ellipsis,
                        ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                          'Status: ',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[850]),
                          overflow: TextOverflow.ellipsis,
                        ),
                      Text(
                          status,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).accentColor),
                          overflow: TextOverflow.ellipsis,
                        ),
                    ],
                  )
              ],
            ),
            )
        ),
    );
  }
}

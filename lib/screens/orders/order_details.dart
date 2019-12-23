import 'package:flutter/material.dart';
import 'package:plant_shop/models/cart_product_model.dart';
import 'package:plant_shop/models/order_model.dart';
import 'package:plant_shop/screens/orders/widgets/order_details_card.dart';
import 'package:plant_shop/shared/size_config.dart';

class OrderDetails extends StatelessWidget {
  final List<CartProduct> products;
  final Order order;
  OrderDetails({this.products, this.order});
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detalhe dos pedidos',
          style: TextStyle(color: Colors.grey[850]),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.grey[850]),
      ),
      body: Container(
        width: SizeConfig.safeBlockHorizontal * 100,
        height: SizeConfig.safeBlockVertical * 100,
        child: Column(
          children: <Widget>[

            Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return OrderDetailsCard(product: products[index]);
                  },
                  itemCount: products.length,
                ),
            ),
            Container(
              padding: EdgeInsets.all(12),
              height: SizeConfig.safeBlockVertical * 22,
              width: SizeConfig.safeBlockHorizontal * 100,
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.only(
                  topLeft:Radius.circular(25),
                  topRight:Radius.circular(25),
                )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Código: ',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          letterSpacing: 0.8
                        ),
                      ),
                      Text(
                        order.id,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          letterSpacing: 0.8
                        ),
                      )
                    ],
                  ),
                  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Data do pedido: ',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          letterSpacing: 0.8
                        ),
                      ),
                      Text(
                        order.date,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          letterSpacing: 0.8
                        ),
                      )
                    ],
                  ),
                  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Total: ',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          letterSpacing: 0.8
                        ),
                      ),
                      Text(
                        'R\$ ' + order.price.toStringAsFixed(2),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          letterSpacing: 0.8
                        ),
                      )
                    ],
                  ),
                  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Status: ',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          letterSpacing: 0.8
                        ),
                      ),
                      Text(
                        order.status,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          letterSpacing: 0.8
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

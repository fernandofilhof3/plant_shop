
import 'package:flutter/material.dart';
import 'package:plant_shop/models/cart_product_model.dart';
import 'package:plant_shop/shared/size_config.dart';
import 'package:transparent_image/transparent_image.dart';

class CartProductCard extends StatelessWidget {
  final int qtd = 0;
  final CartProduct product;

  const CartProductCard({this.product});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      margin: EdgeInsets.only(top: 12),
      width: SizeConfig.safeBlockHorizontal * 92,
      height: SizeConfig.safeBlockVertical * 17,
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Card(
        elevation: 2.4,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: FadeInImage.memoryNetwork(
                        image:
                            product.image,
                        height: 76,
                        width: 76,
                        placeholder: kTransparentImage,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          product.name,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[800]),
                        ),
                        Text(
                          'Tropical',
                          style:
                              TextStyle(fontSize: 15, color: Colors.grey[800]),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 15),
                          child: Text(
                            'R\$ ${product.itemPrice.toStringAsFixed(2)}',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).accentColor),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        IconButton(
                          onPressed: qtd > 1
                              ? () {
                                }
                              : null,
                          color: Theme.of(context).accentColor,
                          icon: Icon(Icons.remove, size: 26,),
                        ),
                        Text(
                          qtd.toString(),
                          style: TextStyle(
                              color: Colors.grey[800],
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        IconButton(
                          onPressed: () {
                          },
                          color: Theme.of(context).accentColor,
                          icon: Icon(Icons.add, size: 26,),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(right: 4,top: 2),
                    child: Icon(
                      Icons.close,
                      size: 25,
                      color: Colors.grey[500],
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}

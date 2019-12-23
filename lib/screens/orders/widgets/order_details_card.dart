import 'package:flutter/material.dart';
import 'package:plant_shop/models/cart_product_model.dart';
import 'package:plant_shop/shared/size_config.dart';
import 'package:transparent_image/transparent_image.dart';

class OrderDetailsCard extends StatelessWidget {
  final CartProduct product;
  OrderDetailsCard({this.product});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      padding: EdgeInsets.only(left: 12, right: 12),
      width: SizeConfig.safeBlockHorizontal * 100,
      height: SizeConfig.safeBlockVertical * 20,
      child: Card(
        elevation: 2.4,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          child: FadeInImage.memoryNetwork(
                            image: product.image,
                            height: 90,
                            width: 90,
                            placeholder: kTransparentImage,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: SizeConfig.safeBlockHorizontal * 60,
                          child: Text(
                            product.name,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[800]),
                          ),
                        ),
                        Container(
                          width: SizeConfig.safeBlockHorizontal * 60,
                          child: Text(
                           'Quantidade de itens: ' + product.amount.toString(),
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey[800]),
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                           'Preço unitário: ',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey[800]),
                          ),
                            Text(
                           'R\$: ' + product.itemPrice.toStringAsFixed(2),
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).accentColor),
                          ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

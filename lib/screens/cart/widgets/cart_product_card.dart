import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:plant_shop/bloc/cart_bloc.dart';
import 'package:plant_shop/models/cart_product_model.dart';
import 'package:plant_shop/shared/size_config.dart';
import 'package:transparent_image/transparent_image.dart';

class CartProductCard extends StatelessWidget {
  final int qtd = 0;
  final CartProduct product = CartProduct();
  CartBloc get cartBloc => BlocProvider.getBloc<CartBloc>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      margin: EdgeInsets.only(top: 12),
      width: SizeConfig.safeBlockHorizontal * 90,
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
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: FadeInImage.memoryNetwork(
                        image:
                            'https://cdn.pixabay.com/photo/2017/04/04/18/59/bonsai-2202769_960_720.png',
                        height: 80,
                        width: 80,
                        placeholder: kTransparentImage,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Bonsai',
                          style: TextStyle(
                              fontSize: 20,
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
                            'R\$ 30.00',
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
                                  cartBloc.removeItem();
                                }
                              : null,
                          color: Theme.of(context).accentColor,
                          icon: Icon(Icons.remove, size: 28,),
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
                            cartBloc.addItem(product);
                          },
                          color: Theme.of(context).accentColor,
                          icon: Icon(Icons.add, size: 28,),
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
                  padding: EdgeInsets.only(right: 5,top: 4),
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

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:plant_shop/bloc/cart_bloc.dart';
import 'package:plant_shop/models/cart_product_model.dart';
import 'package:plant_shop/shared/size_config.dart';
import 'package:transparent_image/transparent_image.dart';

class CartProductCard extends StatefulWidget {
  final CartProduct product;
  final Function onSuccess;

  const CartProductCard({this.product, this.onSuccess});

  @override
  _CartProductCardState createState() =>
      _CartProductCardState(product, onSuccess);
}

class _CartProductCardState extends State<CartProductCard> {
  CartBloc get cartBloc => BlocProvider.getBloc<CartBloc>();
  final CartProduct _product;
  final Function _onSuccess;

  _CartProductCardState(this._product, this._onSuccess);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      margin: EdgeInsets.only(top: 12),
      height: SizeConfig.safeBlockVertical * 20,
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Card(
        elevation: 2.4,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Row(
            children: <Widget>[
              Container(
                width: SizeConfig.safeBlockHorizontal * 17,
                child: Container(
                  padding: EdgeInsets.only(left: 4),
                  child: FadeInImage.memoryNetwork(
                    image: _product.image,
                    height: 80,
                    width: 80,
                    fit: BoxFit.fitHeight,
                    placeholder: kTransparentImage,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(top: 6, left: 4),
                              width: SizeConfig.safeBlockHorizontal * 60,
                              child: Text(
                                _product.name,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey[800]),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 4, left: 4),
                              child: Text(
                                _product.category,
                                style: TextStyle(
                                    fontSize: 15, color: Colors.grey[800]),
                              ),
                            ),
                          ],
                        ),
                        Container(
                            width: 38,
                            height: 38,
                            margin: EdgeInsets.only(bottom: 8),
                            child: IconButton(
                              onPressed: () async {
                                await cartBloc.removeItem(_product);
                                if (cartBloc.isRemoved) {
                                  _onSuccess();
                                }
                              },
                              icon: Icon(Icons.delete_outline),
                              color: Colors.grey[500],
                            ))
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockVertical * 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(top: 4, left: 4),
                          child: Text(
                            'R\$ ${widget.product.itemPrice.toStringAsFixed(2)}',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).accentColor),
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            IconButton(
                              onPressed: _product.amount > 1
                                  ? () async {
                                      await cartBloc
                                          .decrementItem(
                                              _product.id, _product.amount - 1)
                                          .then((doc) {
                                        setState(() {
                                          _product.amount = _product.amount - 1;
                                        });
                                      });
                                    }
                                  : null,
                              color: Theme.of(context).accentColor,
                              icon: Icon(
                                Icons.remove,
                                size: 24,
                              ),
                            ),
                            Text(
                              _product.amount.toString(),
                              style: TextStyle(
                                  color: Colors.grey[800],
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            ),
                            IconButton(
                              onPressed: () async {
                                await cartBloc.addItem(_product).then((doc) {
                                  setState(() {
                                    _product.amount++;
                                  });
                                });
                              },
                              color: Theme.of(context).accentColor,
                              icon: Icon(
                                Icons.add,
                                size: 24,
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

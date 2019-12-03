import 'package:flutter/material.dart';
import 'package:plant_shop/models/product_model.dart';
import 'package:plant_shop/screens/product/widgets/cart_button.dart';
import 'package:plant_shop/shared/cart_info_button.dart';
import 'package:transparent_image/transparent_image.dart';

class DetailsScreen extends StatefulWidget {
  final String heroTag;
  final Product product;

  DetailsScreen({this.heroTag, this.product});

  @override
  _DetailsScreenState createState() => _DetailsScreenState(heroTag, product);
}

class _DetailsScreenState extends State<DetailsScreen> {
  final String _heroTag;
  final Product _product;

  _DetailsScreenState(this._heroTag, this._product);

  @override
  Widget build(BuildContext context) {
    double _screenHeight = MediaQuery.of(context).size.height;
    double _screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[CartInfoButton()],
          elevation: 0,
          backgroundColor: Theme.of(context).accentColor,
        ),
        backgroundColor: Theme.of(context).accentColor,
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints:
                    BoxConstraints(minHeight: viewportConstraints.maxHeight),
                child: IntrinsicHeight(
                    child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                            height: _screenHeight * 0.5,
                            width: _screenWidth,
                            padding: EdgeInsets.only(left: 20, right: 20),
                            color: Theme.of(context).accentColor,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'TROPICAL',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white),
                                ),
                                Text(
                                  _product.name,
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                SizedBox(
                                  height: 35,
                                ),
                                Text(
                                  'PREÇO',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white),
                                ),
                                Text(
                                  'R\$ ${_product.price.toStringAsFixed(2)}',
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                Text(
                                  'TAMANHO',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white),
                                ),
                                Text(
                                  _product.size,
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                                SizedBox(
                                  height: 35,
                                ),
                                CartButton(
                                  color: Colors.grey[900],
                                  height: 60,
                                  width: 60,
                                  iconColor: Colors.white,
                                  image: 'images/cart-add.svg',
                                )
                              ],
                            )),
                        Flexible(
                          fit: FlexFit.loose,
                          child: Container(
                              width: _screenWidth,
                              padding:
                                  EdgeInsets.only(left: 20, right: 20, top: 45),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(25),
                                    topRight: Radius.circular(25),
                                  )),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Conheça mais...',
                                    style: TextStyle(
                                        fontSize: 20,
                                        letterSpacing: 0.8,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    _product.description,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontSize: 16, letterSpacing: 0.8),
                                  ),
                                ],
                              )),
                        )
                      ],
                    ),
                    Positioned(
                        top: 80,
                        right: 5,
                        child: Hero(
                          tag: _heroTag,
                          child: FadeInImage.memoryNetwork(
                            fadeInDuration: Duration(milliseconds: 700),
                            height: 320,
                            image: _product.image,
                            placeholder: kTransparentImage,
                          ),
                        )),
                  ],
                )),
              ),
            );
          },
        ));
  }
}

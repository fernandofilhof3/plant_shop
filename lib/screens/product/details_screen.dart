import 'package:flutter/material.dart';
import 'package:plant_shop/models/product_model.dart';
import 'package:plant_shop/screens/cart/cart_screen.dart';
import 'package:plant_shop/screens/product/widgets/cart_button.dart';
import 'package:plant_shop/shared/cart_info_button.dart';
import 'package:plant_shop/shared/size_config.dart';
import 'package:transparent_image/transparent_image.dart';

class DetailsScreen extends StatefulWidget {
  final String heroTag;
  final Product product;
  final double heroHeight;
  final double heroWidth;

  DetailsScreen({this.heroTag, this.product, this.heroHeight, this.heroWidth});

  @override
  _DetailsScreenState createState() =>
      _DetailsScreenState(heroTag, product, heroHeight, heroWidth);
}

class _DetailsScreenState extends State<DetailsScreen> {
  final String _heroTag;
  final Product _product;
  final double _heroHeight;
  final double _heroWidth;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  _DetailsScreenState(
      this._heroTag, this._product, this._heroHeight, this._heroWidth);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
        key: _scaffoldKey,
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
                            height: SizeConfig.safeBlockVertical * 50,
                            width: SizeConfig.safeBlockHorizontal * 100,
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
                                Padding(
                                  padding: const EdgeInsets.only(left: 12),
                                  child: CartButton(
                                    color: Colors.grey[900],
                                    height: SizeConfig.safeBlockHorizontal * 18,
                                    width: SizeConfig.safeBlockHorizontal * 18,
                                    iconColor: Colors.white,
                                    image: 'images/cart-add.svg',
                                    product: _product,
                                    onSuccess: _onSuccess,
                                  ),
                                )
                              ],
                            )),
                        Flexible(
                          fit: FlexFit.loose,
                          child: Container(
                              width: SizeConfig.safeBlockHorizontal * 100,
                              height: SizeConfig.safeBlockVertical * 65,
                              padding:
                                  EdgeInsets.only(left: 20, right: 20, top: 50),
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
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 0),
                                    child: Text(
                                      _product.description,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 16, letterSpacing: 0.8),
                                    ),
                                  )
                                ],
                              )),
                        )
                      ],
                    ),
                    Positioned(
                        top: 45,
                        right: 0,
                        child: Hero(
                            tag: _heroTag,
                            child: Container(
                              alignment: AlignmentDirectional.bottomCenter,
                              height: _heroHeight,
                              width: _heroWidth,
                              child: FadeInImage.memoryNetwork(
                                fadeInDuration: Duration(milliseconds: 500),
                                image: _product.image,
                                placeholder: kTransparentImage,
                              ),
                            ))),
                  ],
                )),
              ),
            );
          },
        ));
  }

  void _onSuccess() {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: InkWell(
        onTap: () {
          Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => CartScreen()));
        },
        child: Container(
          height: SizeConfig.safeBlockVertical * 5,
          width: SizeConfig.safeBlockHorizontal * 100,
          alignment: AlignmentDirectional.center,
          child: Text(
            'Produto adicionado ao carrinho',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 18,
                letterSpacing: .8,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ),
      ),
      backgroundColor: Color.fromRGBO(0, 146, 245, 1),
      duration: Duration(milliseconds: 1200),
    ));
  }
}

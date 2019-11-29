import 'package:flutter/material.dart';
import 'package:plant_shop/screens/product/widgets/cart_button.dart';
import 'package:plant_shop/shared/cart_info_button.dart';
import 'package:transparent_image/transparent_image.dart';

class DetailsScreen extends StatefulWidget {
  final String heroTag;

  DetailsScreen({this.heroTag});

  @override
  _DetailsScreenState createState() => _DetailsScreenState(heroTag);
}

class _DetailsScreenState extends State<DetailsScreen> {
  final String _heroTag;

  _DetailsScreenState(this._heroTag);

  @override
  Widget build(BuildContext context) {
    double _screenHeight = MediaQuery.of(context).size.height;
    double _screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          
          actions: <Widget>[
            CartInfoButton()
          ],
          elevation: 0,
          backgroundColor: Theme.of(context).accentColor,
        ),
        backgroundColor: Theme.of(context).accentColor,
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                    height: _screenHeight * 0.5,
                    width: _screenWidth,
                    padding: EdgeInsets.only(left: 20, right: 20),
                    color: Theme.of(context).accentColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('TROPICAL',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white
                        ),
                        ),
                        Text('Bananeira',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                        ),
                        SizedBox(height: 35,),
                        Text('PREÇO',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white
                        ),
                        ),
                        Text('R\$ 25',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: Colors.white
                        ),
                        ),
                        SizedBox(height: 25,),
                        Text('TAMANHO',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white
                        ),
                        ),
                        Text('Média',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: Colors.white
                        ),
                        ),
                        SizedBox(height: 35,),
                        CartButton(
                          color: Colors.grey[900],
                          height: 60,
                          width: 60,
                          iconColor: Colors.white,
                          image: 'images/cart-add.svg',
                        )
                      ],
                    )),
                Expanded(
                  child: Container(
                      width: _screenWidth,
                      padding: EdgeInsets.only(left: 20, right: 20, top: 45),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25),
                          )),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Conheça mais...',
                          style: TextStyle(
                            fontSize: 20,
                            letterSpacing: 0.8,
                            fontWeight: FontWeight.w500
                          ),
                          ),
                          SizedBox(height: 20,),
                          Text('Foi uma peleja sem tamanho para fazer esta tela, mas no final as coisas começaram a dar certo. Ta bonito pq o design foi outra pessoa que fez.',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 16,
                            letterSpacing: 0.8
                          ),
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
                  image: 'https://www.pngix.com/pngfile/big/274-2741335_indoors-tropical-plant-png-png-download-tropical-plant.png',
                  placeholder: kTransparentImage,
                ),
              )
            ),
          ],
        ));
  }
}

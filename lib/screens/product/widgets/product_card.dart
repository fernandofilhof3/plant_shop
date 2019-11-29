import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:plant_shop/screens/product/details_screen.dart';
import 'package:plant_shop/shared/plant_status.dart';
import 'package:transparent_image/transparent_image.dart';

class ProductCard extends StatelessWidget {
  final int position;

  ProductCard({@required this.position});

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Card(
            margin: EdgeInsets.only(top: 12),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => DetailsScreen(heroTag: 'expand' + position.toString(),)));
              },
              child: Container(
                  height: _screenHeight - 210,
                  width: _screenWidth - 90,
                  decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 15),
                    child: Column(
                      children: <Widget>[
                        Container(
                            alignment: AlignmentDirectional.centerEnd,
                            child: Column(
                              children: <Widget>[
                                Text(
                                  'R\$',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white),
                                ),
                                Text(
                                  '25',
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                              ],
                            )),
                        Hero(
                          tag: 'expand' + position.toString(),
                          child: Container(
                            // margin: EdgeInsets.only(top: 10),
                            child: FadeInImage.memoryNetwork(
                              fadeInDuration: Duration(milliseconds: 500),
                              height: 280,
                              image:
                                  'https://www.pngix.com/pngfile/big/274-2741335_indoors-tropical-plant-png-png-download-tropical-plant.png',
                              placeholder: kTransparentImage,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 5),
                          alignment: AlignmentDirectional.centerStart,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Outdoor',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                                textAlign: TextAlign.left,
                              ),
                              Text(
                                'Tropical Plant',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              PlantStatus(),
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
            ))
      ],
    );
  }
}

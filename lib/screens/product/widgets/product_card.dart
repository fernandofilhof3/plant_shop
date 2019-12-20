import 'package:flutter/material.dart';
import 'package:plant_shop/models/product_model.dart';
import 'package:plant_shop/screens/product/details_screen.dart';
import 'package:plant_shop/shared/plant_status.dart';
import 'package:plant_shop/shared/size_config.dart';
import 'package:transparent_image/transparent_image.dart';

class ProductCard extends StatelessWidget {
  final int position;
  final Product product;

  ProductCard({@required this.position, this.product});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
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
                    MaterialPageRoute(builder: (context) => DetailsScreen(
                      heroTag: 'expand' + position.toString(),
                      product: product,
                      heroHeight: SizeConfig.safeBlockVertical * 50,
                      heroWidth: SizeConfig.safeBlockHorizontal * 68,
                    )));
              },
              child: Container(
                  height: SizeConfig.safeBlockVertical * 75,
                  width: SizeConfig.safeBlockHorizontal * 80,
                  decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  product.price.toStringAsFixed(2),
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                              ],
                            )),
                        Hero(
                          tag: 'expand' + position.toString(),
                          child: SizedBox(
                            height: SizeConfig.safeBlockVertical * 41,
                            child: FadeInImage.memoryNetwork(
                              fadeInDuration: Duration(milliseconds: 500),
                              image: product.image,
                              height: 280,
                              placeholder: kTransparentImage,
                            ),
                          ),
                        ),
                        Container(
                          width: SizeConfig.safeBlockHorizontal * 75,
                          height: SizeConfig.safeBlockVertical * 15,
                          padding: EdgeInsets.only(top: 5),
                          alignment: AlignmentDirectional.centerStart,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                product.category,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                                textAlign: TextAlign.left,
                              ),
                              Text(
                                product.name,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                width: SizeConfig.safeBlockHorizontal * 70,
                                height: SizeConfig.safeBlockVertical * 7,
                                child: ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return PlantStatus(status: product.requirements[index],);
                                  },
                                  itemCount: product.requirements.length,
                                ),
                              )
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

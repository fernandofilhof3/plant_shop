import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plant_shop/screens/product/product_screen.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
            drawer: Drawer(),
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              leading: IconButton(
                padding: EdgeInsets.only(left: 25, top: 5),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: SvgPicture.asset(
                  'images/menu.svg',
                  height: 28,
                  color: Colors.grey,
                ),
              ),
              actions: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: 25, top: 16, bottom: 0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.grey[200]),
                  child: IconButton(
                    onPressed: () {
                    },
                    icon: SvgPicture.asset(
                      'images/cart-icon.svg',
                      height: 24,
                      color: Colors.black87,
                    ),
                  ),
                )
              ],
            ),
            body: ProductScreen()
            ),
      ],
    );
  }
}

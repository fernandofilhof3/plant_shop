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
              leading: Container(
                margin: EdgeInsets.only(top: 8),
                child: MaterialButton(
                    padding: EdgeInsets.all(1),
                    shape: CircleBorder(side: BorderSide(
                      color: Colors.transparent
                    )
                    ),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    child: SvgPicture.asset(
                      'images/menu.svg',
                      color: Colors.grey[600],
                      width: 28,
                      height: 28,
                      )
                  ),
              ),
              actions: <Widget>[
                Container(
                  width: 48,
                  height: 48,
                  margin: EdgeInsets.only(right: 8, top: 8),
                  alignment: AlignmentDirectional.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[100]
                  ),
                  child: MaterialButton(
                    padding: EdgeInsets.all(1),
                    shape: CircleBorder(side: BorderSide(
                      color: Colors.transparent
                    )
                    ),
                    onPressed: () {},
                    child: SvgPicture.asset(
                      'images/cart-icon.svg',
                      color: Colors.black87,
                      width: 25,
                      height: 25,
                      )
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

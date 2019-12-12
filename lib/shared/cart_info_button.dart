import 'package:flutter/material.dart';
import 'package:plant_shop/screens/cart/cart_screen.dart';
import 'package:plant_shop/screens/product/widgets/cart_button.dart';

class CartInfoButton extends StatefulWidget {
  @override
  _CartInfoButtonState createState() => _CartInfoButtonState();
}

class _CartInfoButtonState extends State<CartInfoButton> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: <Widget>[
        InkWell(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => CartScreen()));
          },
          child: Container(
            margin: EdgeInsets.only(top: 14, right: 15),
            child: CartButton(
              color: Color.fromRGBO(130, 191, 136, 1),
              height: 50,
              width: 50,
              iconColor: Colors.white,
              image: 'images/cart-icon.svg',
            ),
          ),
        ),
        Positioned(
          top: 4,
          right: 15,
          child: Container(
            width: 24,
            height: 24,
            alignment: Alignment.center,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.white),
            child: Text(
              '2',
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';

class CartAppBar extends StatelessWidget implements PreferredSizeWidget{
  CartAppBar({@required this.startDecrease});

  final bool startDecrease;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedContainer(
          duration: Duration(milliseconds: 800),
          height: !startDecrease ? 80 : 0,
          child: AppBar(
            iconTheme: IconThemeData(color: Colors.grey[800]),
            title: Text(
              'Carrinho',
              style: TextStyle(
                  fontSize: 20, color: Colors.grey[800], letterSpacing: 0.8),
            ),
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 0,
          ),
        )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(80);
}

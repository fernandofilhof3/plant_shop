import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plant_shop/bloc/cart_bloc.dart';
import 'package:plant_shop/models/cart_product_model.dart';
import 'package:plant_shop/models/product_model.dart';

class CartButton extends StatelessWidget {
  final double width;
  final double height;
  final String image;
  final Color color;
  final Color iconColor;

  final Product product;
  

  const CartButton({this.width, this.height, this.image, this.color, this.iconColor, this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        padding: EdgeInsets.all(10),
        alignment: AlignmentDirectional.bottomStart,
        decoration:
            BoxDecoration(color: color, shape: BoxShape.circle),
        child: InkWell(
          onTap: () {
            BlocProvider.getBloc<CartBloc>().addItem(
              productToCartProduct()
            );

          },
          child: SvgPicture.asset(
            image,
            color: iconColor,
          ),
        )
        );
  }

  CartProduct productToCartProduct(){
    CartProduct item = CartProduct();
    item.image = product.image;
    item.name = product.name;
    item.itemPrice = product.price;
    return item;
  }
}

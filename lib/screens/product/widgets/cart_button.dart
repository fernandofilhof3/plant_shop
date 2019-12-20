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
  final Function onSuccess;

  final Product product;

  const CartButton(
      {this.width,
      this.height,
      this.image,
      this.color,
      this.iconColor,
      this.product,
      this.onSuccess});
  CartBloc get cartBloc => BlocProvider.getBloc<CartBloc>();

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        alignment: AlignmentDirectional.bottomStart,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        child: Center(
          child: MaterialButton(
            shape: CircleBorder(
              side: BorderSide(color: Colors.transparent)
            ),
            onPressed: product != null
                ? () async {
                    await cartBloc.addItem(productToCartProduct());
                    if (cartBloc.isAdditioned) {
                      onSuccess();
                    }
                  }
                : null,
            child: SvgPicture.asset(
              image,
              color: iconColor,
            ),
          ),
        ));
  }

  CartProduct productToCartProduct() {
    CartProduct item = CartProduct();
    item.id = product.id;
    item.image = product.image;
    item.name = product.name;
    item.amount = 1;
    item.category = product.category;
    item.itemPrice = product.price;
    return item;
  }
}

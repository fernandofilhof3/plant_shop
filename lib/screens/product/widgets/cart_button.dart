import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartButton extends StatelessWidget {
  final double width;
  final double height;
  final String image;
  final Color color;
  final Color iconColor;

  const CartButton({this.width, this.height, this.image, this.color, this.iconColor});

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
          onTap: () {},
          child: SvgPicture.asset(
            image,
            color: iconColor,
          ),
        )
        );
  }
}

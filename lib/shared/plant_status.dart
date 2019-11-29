import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PlantStatus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 8, right: 20),
          height: 40,
          width: 40,
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: Colors.white, width: 1.1)),
          child: SvgPicture.asset(
            'images/status/water.svg',
            color: Colors.white,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 8),
          height: 40,
          width: 40,
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: Colors.white, width: 1.1)),
          child: SvgPicture.asset(
            'images/status/sun.svg',
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

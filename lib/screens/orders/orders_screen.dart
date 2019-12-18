import 'package:flutter/material.dart';
import 'package:plant_shop/shared/size_config.dart';

class OrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      width: SizeConfig.safeBlockHorizontal * 100,
      height: SizeConfig.safeBlockVertical * 100,
      color: Colors.deepOrangeAccent[400],
    );
  }
}
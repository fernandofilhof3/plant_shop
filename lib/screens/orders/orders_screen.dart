import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plant_shop/shared/size_config.dart';

class OrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Text('Pedidos', style: TextStyle(color: Colors.grey[850]),),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Container(
          margin: EdgeInsets.only(top: 8),
          child: MaterialButton(
              padding: EdgeInsets.all(1),
              shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              child: SvgPicture.asset(
                'images/menu.svg',
                color: Colors.grey[600],
                width: 28,
                height: 28,
              )),
        ),
      ),
      body: Container(
        width: SizeConfig.safeBlockHorizontal * 100,
        height: SizeConfig.safeBlockVertical * 100,
        color: Colors.purple,
      ),
    );
  }
}

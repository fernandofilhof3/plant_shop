import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plant_shop/shared/size_config.dart';

class EmptyView extends StatelessWidget {
  final String msg;

  const EmptyView({@required this.msg});
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      width: SizeConfig.safeBlockHorizontal * 100,
      height: SizeConfig.safeBlockVertical * 50,
      padding: EdgeInsets.only(left: 25, right: 25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset('images/empty.svg',
          height: SizeConfig.safeBlockVertical * 18,
          color: Colors.grey[400],),
          SizedBox(height: 25,),
          Text(msg, textAlign: TextAlign.center ,style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.8,
            color: Colors.grey
          ),
          )
        ],
      ),
    );
  }
}
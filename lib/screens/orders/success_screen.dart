import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plant_shop/screens/home/home_screen.dart';
import 'package:plant_shop/shared/size_config.dart';

class SuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Material(
          child: Container(
        color: Theme.of(context).accentColor,
        width: SizeConfig.safeBlockHorizontal * 100,
        height: SizeConfig.safeBlockVertical * 100,
        padding: EdgeInsets.all(14),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                      width: SizeConfig.safeBlockHorizontal * 35,
                      height: SizeConfig.safeBlockVertical * 35,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                      child: Center(
                        child: SvgPicture.asset(
                          'images/success-cactus.svg',
                          color: Theme.of(context).primaryColor,
                          width: SizeConfig.safeBlockHorizontal * 15,
                          height: SizeConfig.safeBlockVertical * 15,
                        ),
                      )),
                  Text(
                    'Pedido realizado!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.8),
                  ),
                  SizedBox(height: 8,),
                  Text(
                    'Seu pedido foi realizado com sucesso!\nPara mais informações, acompanhe o\nstatus de entrega no menu de pedidos.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.8),
                  ),
                ],
              ),
            ),
            SizedBox(height: SizeConfig.safeBlockVertical * 10,),
            InkWell(
              onTap: () {
                Navigator.popUntil(context, ModalRoute.withName('/home'));
              },
              child: 
            Container(
              width: SizeConfig.safeBlockHorizontal * 80,
              height: 60,
              decoration: BoxDecoration(

              color: Colors.white,
                borderRadius: BorderRadius.all(
                Radius.circular(30)
                )
              ),
              child: Center(
                child: Text(
                  'Voltar ao menu',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: Colors.grey[850]),
                ),
              ),
            ),
            )
          ],
        ),
      ),
    );
  }
}

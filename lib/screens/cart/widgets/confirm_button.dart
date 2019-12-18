import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:plant_shop/bloc/orders_bloc.dart';
import 'package:plant_shop/models/order_model.dart';
import 'package:plant_shop/screens/orders/success_screen.dart';
import 'package:plant_shop/shared/size_config.dart';

class ConfirmButton extends StatelessWidget {
  final AnimationController controller;
  final Function onError;
  final Order order;

  OrderBloc get orderBloc => BlocProvider.getBloc<OrderBloc>();

  ConfirmButton({this.controller, this.onError, this.order})
      : buttonSqueed =
            Tween(begin: SizeConfig.safeBlockHorizontal * 80, end: 60.0)
                .animate(CurvedAnimation(
                    parent: controller, curve: Interval(0.0, 0.150)));

  final Animation<double> buttonSqueed;

  Widget _buildAnimation(BuildContext context, Widget child) {
    SizeConfig().init(context);
    return Padding(
      padding: EdgeInsets.only(bottom: 0),
      child: InkWell(
        onTap: () async {
          controller.forward();
          var result = await orderBloc.addOrder(order);
          if (result) {
            controller.forward();
            controller.addStatusListener((status) {
              if (status == AnimationStatus.completed) {
                Navigator.of(context).pushNamed('/success-screen');
              }
            });
          } else {
            controller.reverse(from: .2);
            onError();
          }
        },
        child: Container(
            width: buttonSqueed.value,
            height: 60,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.grey[850],
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
            ),
            child: _buildInside(context)),
      ),
    );
  }

  Widget _buildInside(BuildContext context) {
    if (buttonSqueed.value > 80) {
      return Text(
        'Comprar',
        style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.3),
      );
    } else {
      if (!orderBloc.success && controller.status != AnimationStatus.reverse) {
        controller.stop();
      }
      return CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        strokeWidth: 2.2,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: controller,
    );
  }
}

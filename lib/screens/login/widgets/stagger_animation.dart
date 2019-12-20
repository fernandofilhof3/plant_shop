import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:plant_shop/bloc/auth_bloc.dart';
import 'package:plant_shop/screens/home/home_screen.dart';
import 'package:plant_shop/shared/size_config.dart';

class StaggerAnimation extends StatelessWidget {
  final AnimationController controller;
  final Function onSubmited;
  final Function onError;

  AuthBloc get authBloc => BlocProvider.getBloc<AuthBloc>();

  StaggerAnimation({this.controller, this.onSubmited, this.onError})
      : buttonSqueed = Tween(begin: SizeConfig.safeBlockHorizontal * 80, end: 60.0).animate(
            CurvedAnimation(parent: controller, curve: Interval(0.0, 0.150))),
        buttonZoomOut = Tween(begin: 60.0, end: 1000.0).animate(CurvedAnimation(
          parent: controller,
          curve: Interval(0.5, 1, curve: Curves.bounceOut),
        ));

  final Animation<double> buttonSqueed;
  final Animation<double> buttonZoomOut;

  Widget _buildAnimation(BuildContext context, Widget child) {
    SizeConfig().init(context);
    return InkWell(
          onTap: () async {
            controller.forward();
            await onSubmited();
            if (authBloc.getUser != null) {
              controller.forward();
              controller.addStatusListener((status) {
                if (status == AnimationStatus.completed) {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        settings: RouteSettings(name: "/home"),
                        builder: (context) => HomeScreen()));
                }
              });
            } else {
              controller.reverse(from: .2);
              onError();
            }
          },
          child: Hero(
            tag: 'fade',
            child: buttonZoomOut.value <= 70
                ? Container(
                    width: buttonSqueed.value,
                    height: 60,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    ),
                    child: _buildInside(context))
                : Container(
                    width: buttonZoomOut.value,
                    height: buttonZoomOut.value,
                    decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      shape: buttonZoomOut.value < 500
                          ? BoxShape.circle
                          : BoxShape.rectangle,
                    )),
          ));
    // );
  }

  Widget _buildInside(BuildContext context) {
    if (buttonSqueed.value > 75) {
      return Text(
        'Login',
        style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.3),
      );
    } else {
      if (!authBloc.isLogged && controller.status != AnimationStatus.reverse) {
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

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:plant_shop/bloc/auth_bloc.dart';

class StaggerAnimation extends StatelessWidget {
  final AnimationController controller;
  final Function onSubmited;

  StaggerAnimation({this.controller, this.onSubmited})
      : buttonSqueed = Tween(begin: 320.0, end: 60.0).animate(
            CurvedAnimation(parent: controller, curve: Interval(0.0, 0.150))),
        buttonZoomOut = Tween(begin: 60.0, end: 1000.0).animate(CurvedAnimation(
          parent: controller,
          curve: Interval(0.5, 1, curve: Curves.bounceOut),
        ));

  final Animation<double> buttonSqueed;
  final Animation<double> buttonZoomOut;

  Widget _buildAnimation(BuildContext context, Widget child) {
    return StreamBuilder(
      stream: BlocProvider.getBloc<AuthBloc>().logged,
      builder: (context, snapshot) {
        return Padding(
          padding: EdgeInsets.only(bottom: 40),
          child: InkWell(
              onTap: () {
                onSubmited();
                // if (onSubmited()) {
                //   controller.forward();
                // }
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
              )),
        );
      },
    );
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

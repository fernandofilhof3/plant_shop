import 'package:flutter/material.dart';
import 'package:plant_shop/screens/home/widgets/fade_container.dart';
import 'package:plant_shop/screens/home/widgets/home_body.dart';

class StaggerAnimation extends StatelessWidget {
  final AnimationController controller;
  final Animation<Color> fadeAnimation;

  StaggerAnimation({
    @required this.controller,
  }) : fadeAnimation = ColorTween(
                begin: Color.fromRGBO(40, 156, 67, 1),
                end: Color.fromRGBO(40, 156, 67, 0))
            .animate(
                CurvedAnimation(parent: controller, curve: Curves.easeInSine));

  Widget _buildAnimation(BuildContext context, Widget child) {
    return Stack(
      children: <Widget>[
        HomeBody(),
        IgnorePointer(
          child: FadeContainer(
            fadeAnimation: fadeAnimation,
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: AnimatedBuilder(
          animation: controller,
          builder: _buildAnimation,
        ),
      ),
    );
  }
}

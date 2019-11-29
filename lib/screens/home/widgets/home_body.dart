import 'package:flutter/material.dart';
import 'package:plant_shop/shared/custom_drawer.dart';
import 'package:plant_shop/tabs/home_tab.dart';

class HomeBody extends StatelessWidget {
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: PageView(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            Scaffold(
              body: HomeTab(),
              drawer: CustomDrawer(
                pageController: _pageController,
                userName: 'Lissandra',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

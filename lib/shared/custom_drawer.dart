import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:plant_shop/tiles/drawer_tile.dart';

class CustomDrawer extends StatelessWidget {
  final PageController pageController;
  final String userName;

  CustomDrawer({@required this.pageController, this.userName});

  @override
  Widget build(BuildContext context) {
    Widget _buildDrawerBack() => Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Color(0xFF00A5B5).withOpacity(0.6),
            Color(0xFFa5cdd1).withOpacity(0.1)
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        );
    return Drawer(
      child: Stack(
        children: <Widget>[
          // _buildDrawerBack(),
          ListView(
            padding: EdgeInsets.only(top: 15),
            children: <Widget>[
              Column(
                children: <Widget>[
                  CachedNetworkImage(
                    imageUrl: 'https://cdn.dribbble.com/users/877246/screenshots/5902366/girl_2x.png',
                    imageBuilder: (context, imageProvider) {
                      return Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          border: Border.all(color: Theme.of(context).accentColor, width: 1.6),
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover
                          )
                        ),
                      );
                    },
                    placeholder: (context, url) => Center(child: CircularProgressIndicator(strokeWidth: 3,),),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Olá, ',
                        style: TextStyle(
                            fontSize: 20, color: Theme.of(context).accentColor),
                      ),
                      Text(
                        userName + '.',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).accentColor),
                      )
                    ],
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, right: 30, bottom: 10),
                child: Divider(color: Theme.of(context).primaryColor),
              ),
              DrawerTile(
                controller: pageController,
                page: 0,
                text: 'Inicio',
                image: 'images/home.svg',
              ),
              DrawerTile(
                controller: pageController,
                icon: Icons.shopping_basket,
                page: 1,
                text: 'Pedidos',
                image: 'images/shipped.svg',
              ),
            ],
          )
        ],
      ),
    );
  }
}

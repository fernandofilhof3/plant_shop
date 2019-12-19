import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:plant_shop/bloc/auth_bloc.dart';
import 'package:plant_shop/models/users.model.dart';
import 'package:plant_shop/tiles/drawer_tile.dart';

class CustomDrawer extends StatelessWidget {
  final PageController pageController;

  final User user = BlocProvider.getBloc<AuthBloc>().getUser;


  CustomDrawer({@required this.pageController});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: <Widget>[
          ListView(
            padding: EdgeInsets.only(top: 15),
            children: <Widget>[
              Column(
                children: <Widget>[
                  CachedNetworkImage(
                    imageUrl: user.image,
                    imageBuilder: (context, imageProvider) {
                      return Container(
                        height: 120,
                        width: 120,
                        margin: EdgeInsets.only(bottom: 8),
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
                        user.name + '.',
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

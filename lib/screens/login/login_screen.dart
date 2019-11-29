import 'dart:developer';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plant_shop/bloc/auth_bloc.dart';
import 'package:plant_shop/screens/home/home_screen.dart';
import 'package:plant_shop/screens/login/widgets/form_container.dart';
import 'package:plant_shop/screens/login/widgets/signup_button.dart';
import 'package:plant_shop/screens/login/widgets/stagger_animation.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
   String user;
   String password;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomeScreen()));
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white70,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(top: 70, bottom: 15),
                        child: SvgPicture.asset(
                          'images/leaves.svg',
                          semanticsLabel: 'Botanicah',
                          width: 120,
                          height: 120,
                        )),
                    Text(
                      'Plant Shop',
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).accentColor),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 60),
                      child: Column(
                        children: <Widget>[
                          FormContainer(
                            getCredentials: getEmailAndPassword,
                          ),
                          SignUpButton(),
                        ],
                      ),
                    )
                  ],
                ),
                StaggerAnimation(
                  controller: _controller.view,
                  onSubmited: singIn,
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void getEmailAndPassword(String email, String pass) {
   user = email;
   password = pass;
  }

  singIn() {
    if (user != null && password != null) {
      BlocProvider.getBloc<AuthBloc>().logInn.add({'email': user, 'password': password});
    }
  }

}

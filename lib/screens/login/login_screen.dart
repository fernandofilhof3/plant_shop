import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plant_shop/bloc/auth_bloc.dart';
import 'package:plant_shop/bloc/product_bloc.dart';
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
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  
  AuthBloc get authBloc => BlocProvider.getBloc<AuthBloc>();

  String user;
  String password;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1800));
        BlocProvider.getBloc<ProductBloc>().search.add('');
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
                  onError: _onError,
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

  void singIn() async{
    if (user != null && password != null) {
      await authBloc.doLogin(
        password: password,
        email: user
      );
    }
  }

  void _onError() {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(
        'Usuário ou senha inválidos',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 18, letterSpacing: .8, fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.redAccent,
      duration: Duration(milliseconds: 2200),
    ));
  }
}

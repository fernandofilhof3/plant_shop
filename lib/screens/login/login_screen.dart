import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plant_shop/bloc/auth_bloc.dart';
import 'package:plant_shop/screens/login/widgets/form_container.dart';
import 'package:plant_shop/screens/login/widgets/signup_button.dart';
import 'package:plant_shop/screens/login/widgets/stagger_animation.dart';
import 'package:plant_shop/shared/size_config.dart';

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
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return SafeArea(
        child: Scaffold(
      key: _scaffoldKey,
      body: Container(
        width: SizeConfig.safeBlockHorizontal * 100,
        height: SizeConfig.safeBlockVertical * 100,
        child: ListView(
          children: <Widget>[
            Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                            padding: EdgeInsets.only(left: 4),
                            width: SizeConfig.safeBlockHorizontal * 33,
                            height: SizeConfig.safeBlockVertical * 33,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Theme.of(context).accentColor,
                            ),
                            child: Center(
                              child: SvgPicture.asset(
                                'images/plant-logo.svg',
                                color: Colors.white,
                                width: SizeConfig.safeBlockHorizontal * 14,
                                height: SizeConfig.safeBlockVertical * 14,
                              ),
                            )),
                        Text(
                          'Plant Shop',
                          style: TextStyle(
                              fontSize: 38,
                              letterSpacing: 0.8,
                              color: Colors.grey[850]),
                        ),
                      ],
                    ),
                    FormContainer(
                      getCredentials: getEmailAndPassword,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: SizeConfig.safeBlockVertical * 9),
                      child: SignUpButton(),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: SizeConfig.safeBlockVertical * 8),
                  child: StaggerAnimation(
                    controller: _controller.view,
                    onSubmited: singIn,
                    onError: _onError,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }

  void getEmailAndPassword(String email, String pass) {
    user = email;
    password = pass;
  }

  void singIn() async {
    if (user != null && password != null) {
      await authBloc.doLogin(password: password, email: user);
    }
  }

  void _onError() {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(
        'Usuário ou senha inválidos',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 18, letterSpacing: .8, fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.redAccent,
      duration: Duration(milliseconds: 2200),
    ));
  }
}

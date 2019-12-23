import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:plant_shop/bloc/auth_bloc.dart';
import 'package:plant_shop/screens/home/widgets/stagger_animation.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2200));
    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  Future<bool> _onWillPop() {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      content: Text('Deseja sair da aplicação?',
      style: TextStyle(fontSize: 16, letterSpacing: 0.8),),
      actions: <Widget>[
        FlatButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text('Não'),
        ),
        FlatButton(
          onPressed: () async{
            var result = await BlocProvider.getBloc<AuthBloc>().logout();
            if(result){
              Navigator.of(context).pop(true);
            }
          },
          child: Text('Sim'),
        ),
      ],
    )
  ) ?? false;
}

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: StaggerAnimation(
      controller: _controller.view,
    ),
    );
  }
}


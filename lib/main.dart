import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:plant_shop/bloc/auth_bloc.dart';
import 'package:plant_shop/bloc/cart_bloc.dart';
import 'package:plant_shop/bloc/orders_bloc.dart';
import 'package:plant_shop/bloc/product_bloc.dart';
import 'package:plant_shop/screens/home/home_screen.dart';
import 'package:plant_shop/screens/login/login_screen.dart';
import 'package:plant_shop/screens/orders/success_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      blocs: [Bloc((b) => ProductBloc()),
       Bloc((b)=> AuthBloc()),
       Bloc((b)=> CartBloc()),
       Bloc((b)=> OrderBloc()),
       ],
      child: MaterialApp(
        home: LoginScreen(),
        debugShowCheckedModeBanner: false,
        title: 'Plant Shop',
        routes: <String, WidgetBuilder> {
          '/home': (BuildContext context) => HomeScreen(),
          '/success-screen': (BuildContext context) => SuccessScreen(),
        },
        theme: ThemeData(
          fontFamily: 'Montserrat',
          primaryColor: Color.fromRGBO(34, 135, 77, 1),
          accentColor: Color.fromRGBO(40, 156, 67, 1),
          primaryColorDark: Color.fromRGBO(27, 108, 62, 1)
          ),
      ),
    );
  }
}


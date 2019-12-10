import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Carrinho',
          style: TextStyle(fontSize: 18, color: Colors.white, letterSpacing: 0.8),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).accentColor,
        elevation: 0,
      ),
      body: Container(
        color: Theme.of(context).accentColor,
        child: Column(
          children: <Widget>[
            ListView.builder(
              itemBuilder: (context, index) {

              },
              itemCount: 1
            )
          ],
        ),
      ),
    );
  }
}
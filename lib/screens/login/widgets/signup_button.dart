import 'package:flutter/material.dart';

class SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {},
      child: Text(
        'Não possui uma conta? Cadastre-se',
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 14,
          color: Colors.grey[900],
          letterSpacing: 0.5,
          fontWeight: FontWeight.w300
        ),
      ),
    );
  }
}
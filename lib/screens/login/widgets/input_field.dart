import 'package:flutter/material.dart';

class InputField extends StatelessWidget {

  final String hint;
  final bool obscure;
  final IconData icon;

  InputField({this.hint, this.icon, this.obscure});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.circular(100),
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).accentColor,
          )
        )
      ),
      child: TextFormField(
        obscureText: obscure,
        style: TextStyle(
          color: Theme.of(context).primaryColor,
          fontWeight: FontWeight.w500
        ),
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: Theme.of(context).accentColor,
          ),
          border: InputBorder.none,
          hintText: hint,
          hintStyle: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 18,
            fontWeight: FontWeight.w500
          ),
          contentPadding: EdgeInsets.only(top: 20, right: 20, bottom: 20, left: 5)
        ),
      ),
    );
  }
}
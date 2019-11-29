
import 'package:flutter/material.dart';

class FormContainer extends StatelessWidget {
  final _formkey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final Function getCredentials;
  final Function getPassword;

  FormContainer({this.getCredentials, this.getPassword});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40),
      child: Form(
        key: _formkey,
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(hintText: 'E-mail'),
              keyboardType: TextInputType.emailAddress,
              validator: (text) {
                if (text.isEmpty || !text.contains('@'))
                  return 'Email inválido';
              },
              onFieldSubmitted: (email){
                getCredentials(_emailController.text, _passwordController.text);
              },

            ),
            SizedBox(
              height: 25,
            ),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                hintText: 'Senha',
                
                ),
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
              validator: (text) {
                if (text.isEmpty)
                  return 'Campo obrigatorio';
              },
              onFieldSubmitted: (password){
                getCredentials(_emailController.text, _passwordController.text);
              },
            ),
          ],
        ),
      ),
    );
  }
}

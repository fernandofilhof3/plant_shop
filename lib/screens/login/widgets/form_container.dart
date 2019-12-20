import 'package:flutter/material.dart';
import 'package:plant_shop/shared/size_config.dart';

class FormContainer extends StatefulWidget {
  final Function getCredentials;
  final Function getPassword;

  FormContainer({this.getCredentials, this.getPassword});

  @override
  _FormContainerState createState() => _FormContainerState();
}

class _FormContainerState extends State<FormContainer> {
  final _formkey = GlobalKey<FormState>();

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  bool _invalidEmail = false;

  bool _invalidPassword = false;

  @override
  Widget build(BuildContext context) {
  SizeConfig().init(context);

    return Container(
      width: SizeConfig.safeBlockHorizontal * 80,
      height: SizeConfig.safeBlockVertical * 42,
      alignment: AlignmentDirectional.center,
      child: Form(
        key: _formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              controller: _emailController,
              style: TextStyle(
                  color: Theme.of(context).primaryColorDark,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25)),
                hintText: 'E-mail',
                hintStyle: TextStyle(color: Theme.of(context).primaryColor),
                prefixIcon: Icon(
                  Icons.person_outline,
                  size: 26,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              keyboardType: TextInputType.emailAddress,
              validator: (text) {
                if (text.isEmpty || !text.contains('@')) {
                  _invalidEmail = true;
                  return 'Email inválido';
                } else {
                  _invalidEmail = false;
                }
              },
              onFieldSubmitted: (email) {
                if (_formkey.currentState.validate())
                  widget.getCredentials(
                      _emailController.text, _passwordController.text);
              },
            ),
            SizedBox(height: SizeConfig.safeBlockVertical * 3,),
            TextFormField(
              controller: _passwordController,
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
              decoration: InputDecoration(
                hintText: 'Senha',
                hintStyle: TextStyle(color: Theme.of(context).primaryColor),
                prefixIcon: Icon(
                  Icons.lock_outline,
                  size: 26,
                  color: Theme.of(context).primaryColor,
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25)),
              ),
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
              validator: (text) {
                if (text.isEmpty){
                  _invalidPassword = true;
                  return 'Campo obrigatorio';
                }
                else if (text.length < 6){
                  _invalidPassword = true;
                  return 'A senha deve conter no minimo 6 digitos';
                } else {
                  _invalidPassword = false;
                }
              },
              onFieldSubmitted: (password) {
                if (_formkey.currentState.validate())
                  widget.getCredentials(
                      _emailController.text, _passwordController.text);
              },
            ),
          ],
        ),
      ),
    );
  }
}

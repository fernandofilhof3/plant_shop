import 'dart:async';
import 'dart:developer';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:plant_shop/models/users.model.dart';
import 'package:plant_shop/services/auth_service.dart';

class AuthBloc implements BlocBase{

  AuthService authService;

User _user;

  final StreamController<Map<String, dynamic>> _authController = StreamController<Map<String, dynamic>>();
  Sink get logInn => _authController.sink;

  bool _isLogged = false;
  
  bool get isLogged => _isLogged;

  User get getUser => _user;

  set isLogged(bool value){
    _isLogged = value;
    notifyListeners();
  }


  AuthBloc(){
      authService = AuthService();
    // _authController.stream.listen(_logInn);
  }

  Future doLogin({String email, String password}) async {
    if (email != null && password != null) {
     _user =  await authService.singIn(
        email: email,
        pass: password
      );
      log(_user.toString());
      _isLogged =  _user != null ? true : false;
      // _loginController.add(authService.islooged());
    }
  }

  Future<bool> logout() async{
    return await authService.logout();
  }

  @override
  void addListener(listener) {
    // TODO: implement addListener
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _authController.close();
  }

  @override
  // TODO: implement hasListeners
  bool get hasListeners => null;

  @override
  void notifyListeners() {
    // TODO: implement notifyListeners
  }

  @override
  void removeListener(listener) {
    // TODO: implement removeListener
  }

}
import 'dart:async';
import 'dart:developer';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:plant_shop/services/auth_service.dart';

class AuthBloc implements BlocBase{

  AuthService authService;

  final StreamController<Map<String, dynamic>> _authController = StreamController<Map<String, dynamic>>();
  Sink get logInn => _authController.sink;

  final StreamController<bool> _loginController = StreamController<bool>.broadcast();
  Stream get logged => _authController.stream;

  AuthBloc(){
      authService = AuthService();
    _authController.stream.listen(_logInn);
  }

   _logInn(Map<String, dynamic> credentials) async {
    if (credentials != null) {
      await authService.singIn(
        email: credentials['email'],
        pass: credentials['password'],
        onFail: (){
          log('Erro ao logar');
          // return false;
          }
      );
      notifyListeners();
    }
  }

  _setLogin() {
    _loginController.sink.add(authService.islooged());
  }

  @override
  void addListener(listener) {
    // TODO: implement addListener
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _authController.close();
    _loginController.close();
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
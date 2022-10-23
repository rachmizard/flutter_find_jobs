import 'package:flutter/material.dart';

import 'package:find_jobs/models/user_model.dart';
import 'package:find_jobs/services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  AuthService authService = AuthService();

  bool _isLogin = false;

  bool get isLogin => _isLogin;

  set isLogin(bool isLogin) {
    _isLogin = isLogin;
    notifyListeners();
  }

  Future<UserModel?> signIn(String email, String password) async {
    try {
      UserModel? response = await authService.signIn(email, password);

      if (response != null) {
        isLogin = true;
        return response;
      }

      return null;
    } catch (e) {
      return null;
    }
  }

  Future<UserModel?> signUp(
      String email, String password, String name, String goal) async {
    try {
      UserModel? response =
          await authService.signUp(email, password, name, goal);

      if (response != null) {
        isLogin = true;

        return response;
      }

      return null;
    } catch (e) {
      return null;
    }
  }
}

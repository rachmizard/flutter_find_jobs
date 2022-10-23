import 'dart:convert';

import 'package:find_jobs/models/user_model.dart';
import 'package:find_jobs/services/request_adapter_service.dart';

class AuthService extends RequestAdapterService {
  Future<UserModel?> signIn(String email, String password) async {
    try {
      Map<String, dynamic> body = {
        "email": email,
        "password": password,
      };

      final response = await sendPostRequest(
        "/login",
        body,
      );

      if (response.statusCode == 200) {
        return UserModel.fromJson(jsonDecode(response.body));
      }

      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<UserModel?> signUp(
      String email, String password, String name, String goal) async {
    try {
      Map<String, dynamic> body = {
        "email": email,
        "password": password,
        "name": name,
        "goal": goal
      };

      final response = await sendPostRequest(
        "/register",
        body,
      );

      if (response.statusCode == 200) {
        return UserModel.fromJson(jsonDecode(response.body));
      }

      return null;
    } catch (e) {
      return null;
    }
  }
}

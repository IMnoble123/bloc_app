import 'dart:convert';
import 'dart:io';
import 'package:ryt_life_cs/domain/interfaces/auth_repo.dart';
import 'package:http/http.dart' as http;
import 'package:ryt_life_cs/models/sign_up_model.dart';
import 'package:ryt_life_cs/utils/api_error.dart';
import 'package:ryt_life_cs/utils/app_api.dart';

class AuthImpl extends AuthRepo {
  @override
  Future signIn({required String mobileNo, required String password}) async {
    try {
      final reqBody = {
        "newUser": {
          "mobileNo": mobileNo,
          "password": password,
        }
      };
      final response = await http.post(Uri.parse(AppApi.LOGIN), body: reqBody);
      if (response.statusCode == 200) {
        return SignUpModel.fromJson(jsonDecode(response.body));
      } else {
        throw jsonDecode(response.body)['message'];
      }
    } on HttpException catch (e) {
      throw ApiExceptions.handle(e.message);
    }
  }

  @override
  Future<SignUpModel> signUp({
    required String emailId,
    required String mobileNo,
    required String firstName,
    required String lastName,
    required String dob,
    required String gender,
    required String password,
  }) async {
    try {
      final reqBody = {
        "newUser": {
          "emailId": emailId,
          "mobileNo": mobileNo,
          "first_name": firstName,
          "last_name": lastName,
          "dob": dob,
          "gender": gender,
          "password": password,
          "confirmPassword": password,
        }
      };
      final response = await http.post(Uri.parse(AppApi.CREATE_USER_PROFILE), body: reqBody);
      if (response.statusCode == 200) {
        return SignUpModel.fromJson(jsonDecode(response.body));
      } else {
        throw jsonDecode(response.body)['message'];
      }
    } on HttpException catch (e) {
      throw ApiExceptions.handle(e.message);
    }
  }
}

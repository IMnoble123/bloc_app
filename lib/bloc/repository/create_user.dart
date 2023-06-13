import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:ryt_life_cs/models/theripiest_model.dart';
import 'package:ryt_life_cs/models/user_model.dart';
import 'package:ryt_life_cs/utils/app_api.dart';
import 'package:ryt_life_cs/utils/app_strings.dart';
import 'package:ryt_life_cs/utils/preferences.dart';

class CreateUserRepository {
  Future<UserModel?> createNewUser(
      {required String firstName,
      required String lastName,
      required String mobileNo,
      required String dob,
      required String gender,
      required String emailId}) async {
    String _token = Preferences.prefs?.getString(AppString.token) ?? '';
    final dynamic _body = json.encode({
      "newUser": {
        "first_name": firstName,
        "last_name": lastName,
        "mobileNo": mobileNo,
        "dob": dob, //"05-08-2000"
        "gender": gender,
        "emailId": emailId,
        "role": "User",
        "blocked": false,
        "password": null,
        "confirmPassword": null
      }
    });
    try {
      // var base64Code = window.btoa('$email:$password');
      Response response = await post(Uri.parse(AppApi.CREATE_USER_PROFILE),
          headers: {"Authorization": _token}, body: json.encode(_body));
      print('${AppApi.LOGIN}  ||{"Content-Type": "application/json", "Authorization": $_token} $_body');
      // print('createNewUser::===> ${response.body}');
      log(response.body, name: 'createNewUser:: body');
      final userModel = userModelFromJson(response.body);
      return userModel;
    } catch (e) {
      log('$e', name: 'createNewUser');

      return null;
    }
  }

  Future<void> assignTheripiestToUser({
    required String theripiestId,
    required String userId,
  }) async {
    print('im hereiubkjb=>>');
    String _token = Preferences.prefs?.getString(AppString.token) ?? '';
    final dynamic _body = json.encode({"userId": userId, "therapistId": theripiestId});
    try {
      Response response = await post(Uri.parse(AppApi.ASSIGN_THERAPIEST_TO_USER),
          headers: {"Authorization": _token}, body: json.encode(_body));
      print(
          '${AppApi.ASSIGN_THERAPIEST_TO_USER}  ||{"Content-Type": "application/json", "Authorization": $_token} $_body');
      log(response.body, name: 'assignTheripiestToUser:: body');
      // final userModel = userModelFromJson(response.body);
      // return userModel;
    } catch (e) {
      log('$e', name: 'assignTheripiestToUser');
      rethrow;
      // return null;
    }
  }
}

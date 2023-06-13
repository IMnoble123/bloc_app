import 'dart:convert';
import 'dart:developer';
import 'dart:html';
import 'package:http/http.dart';
import 'package:ryt_life_cs/utils/app_api.dart';

class LoginRepository {
  Future<Map?> authenticate({required String email, required String password}) async {
    try {
      var base64Code = window.btoa('$email:$password');
      Response response = await post(Uri.parse(AppApi.LOGIN),
          headers: {"Content-Type": "application/json", "Authorization": "Bearer $base64Code"});
      // print('${AppApi.LOGIN}  ||{"Content-Type": "application/json", "Authorization": "Bearer $base64Code"} ');
      // print(response.body);
      return jsonDecode(response.body);
    } catch (e) {
      log("$e", name: 'authenticate');
      return null;
    }
  }

  Future<Map?> sendResetEmail({required String email}) async {
    Map requestBody = {};

    requestBody['emailId'] = email;
    try {
      Response response = await put(Uri.parse(AppApi.FORGOT_PASSWORD),
          headers: {"Content-Type": "application/json"}, body: jsonEncode(requestBody));
      return jsonDecode(response.body);
    } catch (e) {
      print("sendResetEmail $e");
      return null;
    }
  }

  Future<Map?> resetPassword({required String email, required String password}) async {
    Map body = {};
    body = {"emailId": email, "newPassword": password};
    try {
      var base64Code = window.btoa("$email:$password");
      Response response = await put(Uri.parse(AppApi.RESET_PASSWORD),
          headers: {"Content-Type": "application/json"}, body: jsonEncode(body));
      return jsonDecode(response.body);
    } catch (e) {
      print("resetPassword $e");
      return null;
    }
  }
}

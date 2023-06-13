import 'dart:convert';
import 'dart:developer';
import 'dart:html';
import 'package:http/http.dart';
import 'package:ryt_life_cs/models/notification_model.dart';
import 'package:ryt_life_cs/utils/app_api.dart';
import 'package:ryt_life_cs/utils/app_strings.dart';
import 'package:ryt_life_cs/utils/preferences.dart';

class NotificationRepository {
  Future<NotificationModel?> getCsNotification() async {
    String _token = Preferences.prefs?.getString(AppString.token) ?? '';

    try {
      // var base64Code = window.btoa('$email:$password');
      Response response =
          await get(Uri.parse(AppApi.All_CS), headers: {"Content-Type": "application/json", "Authorization": _token});
      // print('${AppApi.LOGIN}  ||{"Content-Type": "application/json", "Authorization": $_token} ');
      // print(response.body);
      final notificationModel = notificationModelFromJson(response.body);
      return notificationModel;
    } catch (e) {
      log('$e', name: 'getCsNotification');
      return null;
    }
  }

  Future<NotificationModel?> updateCsNotification(
      {required String csId, required bool iscompleted, required String updatedbyId, required bool unavailable}) async {
    String _token = Preferences.prefs?.getString(AppString.token) ?? '';
    final body = json.encode({
      "csId": csId,
      "iscompleted": iscompleted,
      "updatedbyId": updatedbyId,
      "unavailable": unavailable,
    });
    try {
      Response response = await post(
        Uri.parse(AppApi.UPDATE_CS_NOTIFICATION),
        headers: {"Content-Type": "application/json", "Authorization": _token},
        body: body,
      );
      print(
          '${AppApi.UPDATE_CS_NOTIFICATION}  ||{"Content-Type": "application/json", "Authorization": $_token} ||body $body');
      print(response.body);
      final notificationModel = notificationModelFromJson(response.body);
      return notificationModel;
    } catch (e) {
      log('$e', name: 'updateCsNotification');
      return null;
    }
  }

  // Future<Map?> sendResetEmail({required String email}) async {
  //   Map requestBody = {};

  //   requestBody['emailId'] = email;
  //   try {
  //     Response response = await put(Uri.parse(AppApi.FORGOT_PASSWORD),
  //         headers: {"Content-Type": "application/json"}, body: jsonEncode(requestBody));
  //     return jsonDecode(response.body);
  //   } catch (e) {
  //     print("sendResetEmail $e");
  //     return null;
  //   }
  // }

  // Future<Map?> resetPassword({required String email, required String password}) async {
  //   Map body = {};
  //   body = {"emailId": email, "newPassword": password};
  //   try {
  //     var base64Code = window.btoa("$email:$password");
  //     Response response = await put(Uri.parse(AppApi.RESET_PASSWORD),
  //         headers: {"Content-Type": "application/json"}, body: jsonEncode(body));
  //     return jsonDecode(response.body);
  //   } catch (e) {
  //     print("resetPassword $e");
  //     return null;
  //   }
  // }
}

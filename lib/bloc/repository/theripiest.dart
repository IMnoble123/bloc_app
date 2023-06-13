import 'dart:convert';
import 'dart:developer';
import 'dart:html';
import 'package:http/http.dart';
import 'package:ryt_life_cs/models/notification_model.dart';
import 'package:ryt_life_cs/models/therapiest_calender_model.dart';
import 'package:ryt_life_cs/models/theripiest_model.dart';
import 'package:ryt_life_cs/utils/app_api.dart';
import 'package:ryt_life_cs/utils/app_strings.dart';
import 'package:ryt_life_cs/utils/preferences.dart';

class TheripiestRepository {
  Future<TheripiestModel?> getTheripiestData() async {
    String _token = Preferences.prefs?.getString(AppString.token) ?? '';

    try {
      // var base64Code = window.btoa('$email:$password');
      Response response = await get(Uri.parse(AppApi.GET_THERIPIEST),
          headers: {"Content-Type": "application/json", "Authorization": _token});
      // print('${AppApi.LOGIN}  ||{"Content-Type": "application/json", "Authorization": $_token} ');
      // print(response.body);
      final theripiestModel = theripiestModelFromJson(response.body);
      return theripiestModel;
    } catch (e) {
      log('$e', name: 'getCsNotification');
      return null;
    }
  }

  Future<TherapiestCalendarModel?> getTherapiestCalendarById({required String id}) async {
    String _token = Preferences.prefs?.getString(AppString.token) ?? '';
// var id= 644d36d212d89b3bf8708edc;
    try {
      Response response = await get(Uri.parse('${AppApi.GET_THERAPIEST_CALENDAR_BY_ID}?therapistId=$id'),
          headers: {"Content-Type": "application/json", "Authorization": _token});
      print(
          '${AppApi.GET_THERAPIEST_CALENDAR_BY_ID}?therapistId=$id  ||{"Content-Type": "application/json", "Authorization": $_token} ');
      print(response.body);
      final therapiestCalendarModel = therapiestCalendarModelFromJson(response.body);
      return therapiestCalendarModel;
    } catch (e) {
      log('$e', name: 'getTherapiestCalendarById');
      return null;
    }
  }
  Future<TheripiestModel?> getTherapiestById({required String id}) async {
    String _token = Preferences.prefs?.getString(AppString.token) ?? '';
// var id= 644d36d212d89b3bf8708edc;
    try {
      Response response = await get(Uri.parse('${AppApi.GET_THERAPIEST_BY_ID}?therapistId=$id'),
          headers: {"Content-Type": "application/json", "Authorization": _token});
      print(
          '${AppApi.GET_THERAPIEST_BY_ID}?therapistId=$id  ||{"Content-Type": "application/json", "Authorization": $_token} ');
      print(response.body);
      final therapiestCalendarModel = theripiestModelFromJson(response.body);
      return therapiestCalendarModel;
    } catch (e) {
      log('$e', name: 'getTherapiestCalendarById');
      return null;
    }
  }
}

import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:ryt_life_cs/models/booking_api_model.dart';
import 'package:ryt_life_cs/utils/app_api.dart';
import 'package:ryt_life_cs/utils/app_strings.dart';
import 'package:ryt_life_cs/utils/preferences.dart';

class BookingRepository {
//* booking API with RazerPay
  Future<BookingApiModel?> createOrderWithRazerPay(
      {required String therapistId,
      required String userId,
      required String fee,
      required String date,
      required String day,
      required String from,
      required String to}) async {
    String token = Preferences.prefs?.getString(AppString.token) ?? '';
    final dynamic body = json.encode({
      "therapistId": therapistId, //"6447d4d057ca76787b1c3440",
      "userId": userId, //"60c03f6b4f79957236ce906f",
      "payment": {"fee": fee, "currency": "INR"},
      "bookedslots": {
        "date": date, //"05/05/2023",
        "day": day, //"friday",
        "slots": [
          {
            "from": from, //"03:30 PM",
            "to": to //"04:00 PM"
          }
        ]
      }
    });
    try {
      // var base64Code = window.btoa('$email:$password');
      Response response = await post(Uri.parse(AppApi.CREAT_BOOKING_WITH_RAZER_PAY),
          headers: {"Content-Type": "application/json", "Authorization": token}, body: json.encode(body));
      print('${AppApi.LOGIN}  ||{"Content-Type": "application/json", "Authorization": $token} $body');
      print('createOrderWithRazerPay=> response.body::::>> ${response.body}');
      final bookingApiModel = bookingApiModelFromJson(response.body);
      return bookingApiModel;
    } catch (e) {
      log('$e', name: 'createOrderWithRazerPay');

      return null;
    }
  }

//* booking API with cash
  Future<BookingApiModel?> createOrderWithCash(
      {required String therapistId,
      required String userId,
      required String fee,
      required String date,
      required String day,
      required String from,
      required String to}) async {
    String token = Preferences.prefs?.getString(AppString.token) ?? '';
    final dynamic body = json.encode({
      "therapistId": therapistId, //"6447d4d057ca76787b1c3440",
      "userId": userId, //"60c03f6b4f79957236ce906f",
      "payment": {"fee": fee, "currency": "INR"},
      "bookedslots": {
        "date": date, //"05/05/2023",
        "day": day, //"friday",
        "slots": [
          {
            "from": from, //"03:30 PM",
            "to": to //"04:00 PM"
          }
        ]
      }
    });
    try {
      // var base64Code = window.btoa('$email:$password');
      Response response = await post(Uri.parse(AppApi.CREAT_BOOKING_WITH_CASH),
          headers: {"Content-Type": "application/json", "Authorization": token}, body: json.encode(body));
      print('${AppApi.LOGIN}  ||{"Content-Type": "application/json", "Authorization": $token} $body');
      print('createOrderWithCash=> response.body::::>> ${response.body}');
      final bookingApiModel = bookingApiModelFromJson(response.body);
      return bookingApiModel;
    } catch (e) {
      log('$e', name: 'createOrderWithCash');

      return null;
    }
  }
}

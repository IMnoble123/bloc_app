import 'package:flutter_flavor/flutter_flavor.dart';

class AppApi {
  // ignore: non_constant_identifier_names
  static String BASE_URL = FlavorConfig.instance.variables["baseUrl"];

  // ignore: non_constant_identifier_names
  static String LOGIN = '${BASE_URL}authenticate/cs-login';
  
  // ignore: non_constant_identifier_names
  static String CREATE_USER_PROFILE = '${BASE_URL}cs/creating-Userprofile';

  // ignore: non_constant_identifier_names
  static String All_CS = '${BASE_URL}admin/allCs';

  // ignore: non_constant_identifier_names
  static String FORGOT_PASSWORD = '${BASE_URL}authenticate/adminForgotPass';

  // ignore: non_constant_identifier_names
  static String RESET_PASSWORD = '${BASE_URL}authenticate/adminUpdatePassword';

  // ignore: non_constant_identifier_names
  static String GET_THERIPIEST = '${BASE_URL}admin/alltherapists';

  // ignore: non_constant_identifier_names
  static String SIGNUP = '${BASE_URL}authenticate/csSignup';

  // ignore: non_constant_identifier_names
  static String ASSIGN_THERAPIEST_TO_USER = '${BASE_URL}user/add-therapist-to-user';

  // ignore: non_constant_identifier_names
  static String GET_THERAPIEST_CALENDAR_BY_ID = '${BASE_URL}admin/getCalenderBytherapistId';

  // ignore: non_constant_identifier_names
  static String GET_THERAPIEST_BY_ID = '${BASE_URL}admin/gettherapistById';

  // ignore: non_constant_identifier_names
  static String CREAT_BOOKING_WITH_CASH = '${BASE_URL}admin/createBooking';

  // ignore: non_constant_identifier_names
  static String CREAT_BOOKING_WITH_RAZER_PAY = '${BASE_URL}cs/createBooking';

  // ignore: non_constant_identifier_names
  static String UPDATE_CS_NOTIFICATION = '${BASE_URL}authenticate/update_CsNotification';
}

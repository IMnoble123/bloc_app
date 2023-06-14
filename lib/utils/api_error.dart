import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class ApiExceptions {
  static handle(String error) async {
    if (error.contains('SocketException')) {
      if (await InternetConnection().hasInternetAccess) {
        return 'Server went wrong ! Please try again later ';
      } else {
        return 'Please make sure about your connection !';
      }
    }
    return 'Something went wrong ! Please try again later ';
  }
}

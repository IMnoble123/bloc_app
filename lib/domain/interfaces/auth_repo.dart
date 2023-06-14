import 'package:ryt_life_cs/models/sign_up_model.dart';

abstract class AuthRepo {
  Future signIn({required String mobileNo, required String password});
  Future<SignUpModel> signUp({
    required String emailId,
    required String mobileNo,
    required String firstName,
    required String lastName,
    required String dob,
    required String gender,
    required String password,
  });
}

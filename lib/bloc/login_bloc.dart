// ignore_for_file: constant_identifier_names

import 'package:bloc/bloc.dart';
import 'package:ryt_life_cs/bloc/event/login_event.dart';
import 'package:ryt_life_cs/bloc/state/login_state.dart';
import 'package:ryt_life_cs/bloc/repository/login_repository.dart';
import 'package:ryt_life_cs/utils/app_strings.dart';
import 'package:fluttertoast/fluttertoast_web.dart';
import 'package:ryt_life_cs/utils/app_utils.dart';
import 'package:ryt_life_cs/utils/preferences.dart';

enum LoginStatus {
  LOADING,
  SIGN_IN_PAGE,
  FORGOT_PASSWORD_PAGE,
  RESET_PASSWORD_PAGE,
}

enum ErrorStatus { NONE, PASSWORD, EMAIL, CONFIRM_PASSWORD }

enum UserStatus { uninitialized, loading, authenticated, unauthenticated }

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository loginRepository;

  LoginBloc({required this.loginRepository})
      : super(const LoginState(
            userStatus: UserStatus.uninitialized,
            loginStatus: LoginStatus.SIGN_IN_PAGE,
            errorMsg: '',
            errorStatus: ErrorStatus.NONE,
            resetEmailID: ''));

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is NavigateToLogin) {
      yield state.copyWith(loginStatus: LoginStatus.SIGN_IN_PAGE);
    }

    if (event is NavigateToResetPassword) {
      yield state.copyWith(loginStatus: LoginStatus.RESET_PASSWORD_PAGE, resetEmailID: event.email);
    }

    if (event is OnLogin) {
      // String message = 'Something went wrong';
      if (event.email.isEmpty || !Utils().validateEmail(event.email)) {
        yield state.copyWith(errorStatus: ErrorStatus.EMAIL);
      } else if (event.password.isEmpty || event.password.length < 8) {
        yield state.copyWith(errorStatus: ErrorStatus.PASSWORD);
      } else {
        yield state.copyWith(
            loginStatus: LoginStatus.LOADING, userStatus: UserStatus.loading, errorStatus: ErrorStatus.NONE);
        print('State: $state \n Email: ${event.email} Password ${event.password} ');
        var response = await loginRepository.authenticate(email: event.email, password: event.password);
        print('Response: $response');
        if (response != null && response['success']) {
          Preferences.prefs?.setString(AppString.token, response['result']['token'] ?? '');
          
          yield state.copyWith(userStatus: UserStatus.authenticated);
        } else {
          showToast(response?['message']);

          yield state.copyWith(
            loginStatus: LoginStatus.SIGN_IN_PAGE,
            userStatus: UserStatus.unauthenticated,
            // errorMsg: response['message'] ?? '',
          );
        }
      }
    }

    if (event is OnLogout) {
      Preferences.prefs?.clear();
      yield state.copyWith(userStatus: UserStatus.uninitialized);
    }

    if (event is NavigateToForgotPassword) {
      yield state.copyWith(loginStatus: LoginStatus.FORGOT_PASSWORD_PAGE);
    }

    if (event is OnForgotPasswordSubmit) {
      if (event.email.isEmpty || !Utils().validateEmail(event.email)) {
        yield state.copyWith(errorStatus: ErrorStatus.EMAIL);
      } else {
        yield state.copyWith(loginStatus: LoginStatus.LOADING);
        //call api
        var response = await loginRepository.sendResetEmail(email: event.email);
        if (response != null) {
          //display toast
          showToast(response['message']);
          yield state.copyWith(loginStatus: LoginStatus.SIGN_IN_PAGE, errorStatus: ErrorStatus.NONE);
        }
      }
    }

    if (event is OnResetPasswordSubmit) {
      if (event.password.length < 8) {
        yield state.copyWith(errorStatus: ErrorStatus.PASSWORD);
      } else if (event.confirmPassword.length < 8) {
        yield state.copyWith(errorStatus: ErrorStatus.CONFIRM_PASSWORD);
      } else if (event.password.isNotEmpty && event.confirmPassword.isNotEmpty) {
        //password not empty
        if (!Utils().passwordRegex.hasMatch(event.password)) {
          //check alphanumeric for password
          yield state.copyWith(
            errorStatus: ErrorStatus.PASSWORD,
          );
        } else if (!Utils().passwordRegex.hasMatch(event.confirmPassword)) {
          //check alphanumeric for confirm password
          yield state.copyWith(
            errorStatus: ErrorStatus.CONFIRM_PASSWORD,
          );
        } else if (event.confirmPassword != event.password) {
          //is passwords the same
          yield state.copyWith(errorStatus: ErrorStatus.CONFIRM_PASSWORD);
        } else {
          yield state.copyWith(loginStatus: LoginStatus.LOADING);
          //call api and show success page
          var response = await loginRepository.resetPassword(password: event.password, email: state.resetEmailID);
          if (response != null) {
            if (response['success']) {
              showToast(response['message']);
              yield state.copyWith(errorStatus: ErrorStatus.NONE, loginStatus: LoginStatus.SIGN_IN_PAGE);
            } else {
              showToast(response['message']);
              yield state.copyWith(errorStatus: ErrorStatus.NONE, loginStatus: LoginStatus.RESET_PASSWORD_PAGE);
            }
          } else {
            showToast("Something went wrong");
            yield state.copyWith(errorStatus: ErrorStatus.NONE, loginStatus: LoginStatus.SIGN_IN_PAGE);
          }
        }
      }
    }
  }
}

showToast(dynamic message) {
  FluttertoastWebPlugin().addHtmlToast(
    bgcolor: "linear-gradient(to right, #FFBA00, #FFBA00)",
    msg: message ?? "Something went wrong",
    gravity: 'center',
    position: 'center',
    time: 5000,
  );
}

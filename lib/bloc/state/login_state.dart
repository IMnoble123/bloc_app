import 'package:equatable/equatable.dart';
import 'package:ryt_life_cs/bloc/login_bloc.dart';

class LoginState extends Equatable {
  final LoginStatus loginStatus;
  final UserStatus userStatus;
  final String errorMsg;
  final ErrorStatus errorStatus;
  final String resetEmailID;

  const LoginState({
    required this.userStatus,
    required this.loginStatus,
    required this.errorMsg,
    required this.errorStatus,
    required this.resetEmailID,
  });

  LoginState copyWith({
    UserStatus? userStatus,
    LoginStatus? loginStatus,
    String? errorMsg,
    ErrorStatus? errorStatus,
    String? resetEmailID,
  }) {
    return LoginState(
        userStatus: userStatus ?? this.userStatus,
        loginStatus: loginStatus ?? this.loginStatus,
        errorMsg: errorMsg ?? this.errorMsg,
        errorStatus: errorStatus ?? this.errorStatus,
        resetEmailID: resetEmailID ?? this.resetEmailID);
  }

  @override
  List<Object> get props => [userStatus, loginStatus, errorMsg, errorStatus, resetEmailID];
}

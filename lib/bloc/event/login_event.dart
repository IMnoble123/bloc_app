import 'package:equatable/equatable.dart';



abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class OnLogin extends LoginEvent {
  final String email;
  final String password;

  const OnLogin({required this.email,required this.password});

  @override
  List<Object> get props => [email, password];
}

class NavigateToLogin extends LoginEvent {}

class NavigateToResetPassword extends LoginEvent {
  final String email;

  const NavigateToResetPassword(this.email);

  @override
  List<Object> get props => [email];
}

class OnForgotPasswordSubmit extends LoginEvent {
  final String email;

  const OnForgotPasswordSubmit(this.email);

  @override
  List<Object> get props => [email];
}

class OnLogout extends LoginEvent {
  @override
  List<Object> get props => [];
}

class NavigateToForgotPassword extends LoginEvent {
  @override
  List<Object> get props => [];
}

class OnResetPasswordSubmit extends LoginEvent {
  final String password;
  final String confirmPassword;

  const OnResetPasswordSubmit(this.password, this.confirmPassword);

  @override
  List<Object> get props => [password, confirmPassword];
}

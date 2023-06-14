part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class SignUp extends AuthEvent {
  final String emailId;
  final String mobileNo;
  final String firstName;
  final String lastName;
  final String dob;
  final String gender;
  final String password;
  const SignUp({
    required this.emailId,
    required this.mobileNo,
    required this.firstName,
    required this.lastName,
    required this.dob,
    required this.gender,
    required this.password,
  });

  @override
  List<Object> get props => [emailId, mobileNo, firstName, lastName, dob, gender, password];
}

class SignIn extends AuthEvent {
  final String mobileNo;
  final String password;
  const SignIn({
    required this.mobileNo,
    required this.password,
  });
  @override
  List<Object> get props => [mobileNo, password];
}

class CreateUserProfiel extends AuthEvent {
  final String mobileNo;
  final String firstName;
  const CreateUserProfiel({
    required this.mobileNo,
    required this.firstName,
  });
  @override
  List<Object> get props => [mobileNo, firstName];
}

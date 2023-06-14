part of 'auth_bloc.dart';

@immutable
class AuthState extends Equatable {
  final bool isLoading;
  final SignUpModel? signUpModel;
  final String? error;

  const AuthState.initial({this.signUpModel, this.error}) : isLoading = false;
  const AuthState.loading({this.signUpModel, this.error}) : isLoading = true;
  const AuthState.loaded({required this.signUpModel, this.error}) : isLoading = false;
  const AuthState.error({required this.error, this.signUpModel}) : isLoading = false;

  @override
  List<Object?> get props => [isLoading, signUpModel, error];
}

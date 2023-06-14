import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:ryt_life_cs/domain/interfaces/auth_repo.dart';
import 'package:ryt_life_cs/models/sign_up_model.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepo authRepo;
  AuthBloc(this.authRepo) : super(const AuthState.initial()) {
    on<SignIn>((event, emit) async {
      emit(const AuthState.loading());
      try {
        final res = await authRepo.signIn(
          mobileNo: event.mobileNo,
          password: event.password,
        );
        emit(AuthState.loaded(signUpModel: res));
      } catch (e) {
        emit(AuthState.error(error: e.toString()));
      }
    });
    on<SignUp>((event, emit) async {
      emit(const AuthState.loading());
      try {
        final res = await authRepo.signUp(
          emailId: event.emailId,
          mobileNo: event.mobileNo,
          firstName: event.firstName,
          lastName: event.lastName,
          dob: event.dob,
          gender: event.gender,
          password: event.password,
        );
        emit(AuthState.loaded(signUpModel: res));
      } catch (e) {
        emit(AuthState.error(error: e.toString()));
      }
    });

    on<CreateUserProfiel>((event, emit) async {
      emit(const AuthState.loading());
      try {
        final res = await authRepo.createUserProfile(
          mobileNo: event.mobileNo,
          firstName: event.firstName,
        );
        emit(AuthState.loaded(signUpModel: res));
      } catch (e) {
        emit(AuthState.error(error: e.toString()));
      }
    });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ryt_life_cs/bloc/login_bloc.dart';
import 'package:ryt_life_cs/bloc/state/login_state.dart';
import 'package:ryt_life_cs/screens/forgot_password_screen.dart';
import 'package:ryt_life_cs/screens/login_screen.dart';
import 'package:ryt_life_cs/screens/reset_password_screen.dart';
import 'package:ryt_life_cs/utils/app_loader.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
            margin: EdgeInsets.zero,
            child: BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                if (state.loginStatus == LoginStatus.SIGN_IN_PAGE) return const LoginScreen();
                if (state.loginStatus == LoginStatus.FORGOT_PASSWORD_PAGE) {
                  return const ForgotPasswordScreen();
                }
                if (state.loginStatus == LoginStatus.RESET_PASSWORD_PAGE) {
                  return const ResetPasswordScreen();
                }
                if (state.loginStatus == LoginStatus.LOADING) return const Center(child: AppLoader());

                return const Text('Undefined Page');
              },
            )),
      ),
    );
  }
}

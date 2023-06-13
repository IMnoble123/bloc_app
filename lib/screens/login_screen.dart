import 'package:flutter/material.dart';
import 'package:ryt_life_cs/bloc/event/login_event.dart';
import 'package:ryt_life_cs/bloc/login_bloc.dart';
import 'package:ryt_life_cs/bloc/state/login_state.dart';
import 'package:ryt_life_cs/utils/app_colors.dart';
import 'package:ryt_life_cs/utils/app_icons.dart';
import 'package:ryt_life_cs/utils/app_text_style.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ryt_life_cs/widgets/login_text_field.dart';
import 'package:ryt_life_cs/widgets/ontro_slider.dart';

class LoginScreen extends StatefulWidget {
  static const route = "/loginScreen";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: AppColors.gray16,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 87.64, bottom: 146.89),
                  child: Image.asset(
                    AppIcons.logo,
                    height: 60,
                    width: 162.63,
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 87.64, bottom: 49.69),
                            child: Text(
                              "Login",
                              style: AppTextStyle.Poppins.copyWith(
                                  fontSize: 48, fontWeight: FontWeight.w600, color: AppColors.black90),
                            ),
                          ),
                          BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 87.64),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 33.5),
                                  loginFields(
                                    isError: state.errorStatus == ErrorStatus.EMAIL,
                                    text: 'example@example.com',
                                    title: 'E-mail',
                                    controller: emailController,
                                  ),
                                  const SizedBox(height: 24),
                                  loginFields(
                                    isError: state.errorStatus == ErrorStatus.PASSWORD,
                                    text: 'Your password',
                                    title: 'Password',
                                    controller: passwordController,
                                    obscureText: true,
                                  ),
                                  // const SizedBox(height: 30),
                                  // SizedBox(
                                  //   width: 480,
                                  //   child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                                  //     TextButton(
                                  //       onPressed: () {
                                  //         context.read<LoginBloc>().add(NavigateToForgotPassword());
                                  //       },
                                  //       child: Text(
                                  //         "Forgot Password",
                                  //         style: AppTextStyle.Poppins.copyWith(
                                  //             fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.gray120),
                                  //       ),
                                  //     ),
                                  //   ]),
                                  // ),
                                  const SizedBox(height: 30),
                                  SizedBox(
                                    width: 480,
                                    height: 56,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(14),
                                      child: Stack(
                                        children: <Widget>[
                                          Positioned.fill(
                                            child: Container(
                                              decoration: const BoxDecoration(gradient: AppColors.appGradient_LR),
                                            ),
                                          ),
                                          TextButton(
                                            style: TextButton.styleFrom(
                                              foregroundColor: Colors.white,
                                              padding: const EdgeInsets.all(16.0),
                                              textStyle: const TextStyle(fontSize: 20),
                                            ),
                                            onPressed: () {
                                              context.read<LoginBloc>().add(
                                                    OnLogin(
                                                        email: emailController.text, password: passwordController.text),
                                                  );
                                            },
                                            child: Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 5),
                                                child: Center(
                                                  child: Text(
                                                    'Login',
                                                    style: AppTextStyle.Poppins.copyWith(
                                                        color: AppColors.black,
                                                        fontSize: 22,
                                                        fontWeight: FontWeight.w600),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                )),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 25),
                                ],
                              ),
                            );
                          })
                        ]),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: 1031.43,
              child: const ImageSlider(
                imageUrls: [
                  "https://images.pexels.com/photos/1291123/pexels-photo-1291123.jpeg",
                  "https://images.pexels.com/photos/258109/pexels-photo-258109.jpeg",
                  "https://images.pexels.com/photos/3612931/pexels-photo-3612931.jpeg",
                  "https://images.pexels.com/photos/20787/pexels-photo.jpg",
                  "https://images.pexels.com/photos/33109/fall-autumn-red-season.jpg",
                  "https://images.pexels.com/photos/278933/pexels-photo-278933.jpeg",
                ],
              ),
            )
          ]),
    ));
  }
}

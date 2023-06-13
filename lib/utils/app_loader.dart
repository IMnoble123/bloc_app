import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:ryt_life_cs/utils/app_icons.dart';

class AppLoader extends StatelessWidget {
  const AppLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 100,
      child: Lottie.asset(AppIcons.loader),
    );
  }
}

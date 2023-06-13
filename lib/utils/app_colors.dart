// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFFFFBA00);
  static const Color app_dark_sky_blue = Color(0xFF1E4B59);
  static const Color app_dark_black = Color(0xFF090C16);
  static const Color app_blue = Color(0xFF363D57);
  static const Color red = Color(0xFFFF0000);
  static const Color activeBlack = Color(0xFF181E4B);
  static const Color dividerBlack = Color(0xFF282D56);
  static const Color appGrey = Color(0xFFC4C4C4);
  static const Color lightGrey = Color(0xFFF1F1F1);
  static const Color ratingColor = Color(0xFFFFBA00);
  static const Color searchBgColor = Color(0xFFF8FCFF);
  static const Color borderColor = Color(0xFFE7EAFF);
  static const Color borderBlue = Color(0xFF939FFF);
  static const blue100 = Color(0xFF3384FF);

  static const Color lightGreay = Color(0xFF8B8FA5);
  static const Color lightYellow = Color(0xFFFFEEBF);
  static const Color lightPurple = Color(0xFFD7DCFF);

  static const Color shadowGrey = Color(0xFF848484);

  static Color slotColor = Colors.green.shade100;
  //New Colors
  static const appGradient_LR = LinearGradient(
      begin: Alignment.topLeft, end: Alignment.bottomRight, colors: <Color>[Color(0xFFFFD600), Color(0xFFFF9900)]);
  static final Shader appGradientLinearGradient =
      const LinearGradient(colors: <Color>[Color(0xFFFFD600), Color(0xFFFF9900)])
          .createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
  static final Shader appGradientLinearGradient50 =
      const LinearGradient(colors: <Color>[Color(0xFFFFD600), Color(0xFFFF9900)])
          .createShader(const Rect.fromLTWH(0.0, 0.0, 20.0, 70.0));

  static const white = Color(0xFFFFFFFF);
  static const black = Color(0xFF000000);
  static const black90 = Color(0xFF1E1E1E);
  static const black300 = Color(0xFF343434);
  static const gray16 = Color(0xFFFAF8F7);
  static const gray500 = Color(0xFFA5A5A5);
  static const gray400 = Color(0xFFBFBFBF);
  static const gray40 = Color(0xFF747070);
  static const gray120 = Color(0xFF646464);
  static const gray190 = Color(0xFFE9ECF2);
  static const gray140 = Color(0xFFEAEAEA);
  static const gray80 = Color(0xFF8A8A8A);
  static const gray90 = Color(0xFFB9B9B9);
  static const gray200 = Color(0xFFA6A6A6);
  static const gray70 = Color(0xFFDFDFDF);
  static const appcolor1 = Color(0xFFFF9900);
  static const lightblue = Color(0xFFF0FEFF);
  static const lightPink = Color(0xFFFFFCFC);
  static const liteOrange = Color(0xFFFFF3E0);
  static const lightGreen = Color(0xFFEAFFD0);
  static const lightPink16 = Color(0xFFFFEFF7);
  static const green = Color(0xFF60D437);
  static const green50 = Color(0xFFE7FFE9);
  static const blue = Color(0xFF3384FF);
  static const blue200 = Color(0xFF278BFF);
  static const xFFF62727 = Color(0xFFF62727);
  static const xFF929292 = Color(0xFF929292);
  static const xFF848484 = Color(0xFF848484);
}

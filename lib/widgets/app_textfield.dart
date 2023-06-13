import 'package:flutter/material.dart';
import 'package:ryt_life_cs/utils/app_colors.dart';
import 'package:ryt_life_cs/utils/app_text_style.dart';

Widget appTextField(
    {String? title,
    String? text,
    bool enabled = true,
    Color fillColor = AppColors.white,
    bool isFilled = true,
    Function(String)? onChange,
    bool obscureText = false,
    TextEditingController? controller,
    FocusNode? focusNode,
    int? maxLength,
    TextInputType keyboardType = TextInputType.none}) {
  return SizedBox(
    height: maxLength != null || maxLength != 1 ? 102 : 91,
    width: 380,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Text(
            title,
            style: AppTextStyle.Poppins.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppColors.black,
            ),
          ),
        if (title != null) const SizedBox(height: 7),
        SizedBox(
          width: 380,
          height: 60, //47, //maxLength != null || maxLength != 1 ? 71 : 30,
          child: Card(
            elevation: 30,
            margin: EdgeInsets.zero,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
            child: Center(
              child: TextField(
                cursorColor: AppColors.gray40,
                style: AppTextStyle.Poppins.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                  color: AppColors.gray40,
                ),
                controller: controller,
                onChanged: onChange,
                focusNode: focusNode,
                obscureText: obscureText,
                maxLength: maxLength,
                keyboardType: keyboardType,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(right: 10, left: 20, top: 20, bottom: 15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: const BorderSide(width: 0, color: AppColors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: const BorderSide(width: 0, color: AppColors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: const BorderSide(width: 0, color: AppColors.white),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: const BorderSide(width: 0, color: AppColors.white),
                  ),
                  hoverColor: Colors.transparent,
                  enabled: enabled,
                  fillColor: fillColor,
                  filled: isFilled,
                  hintText: text,
                  hintStyle: AppTextStyle.Poppins.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    color: AppColors.gray40,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    ),
  );
}

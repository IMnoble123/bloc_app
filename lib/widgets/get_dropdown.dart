import 'package:flutter/material.dart';
import 'package:ryt_life_cs/utils/app_colors.dart';
import 'package:ryt_life_cs/utils/app_text_style.dart';

Widget getDroupdown(
    {required Function(String?) onChange, required List<String> therapistName, required String? selectedValue}) {
  return SizedBox(
    height: 60,
    width: 185.36,
    child: Card(
      elevation: 30,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: DropdownButton<String>(
            value: selectedValue,
            underline: const SizedBox(), // remove the underline

            isExpanded: true,
            icon: const Icon(
              Icons.keyboard_arrow_down,
              color: AppColors.gray500,
              size: 40,
            ),
            iconSize: 24,
            elevation: 16,
            hint: Text(
              "Select",
              style: AppTextStyle.Poppins.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 18,
                color: AppColors.gray40,
              ),
            ),
            style: AppTextStyle.Poppins.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 18,
              color: AppColors.gray40,
            ),

            onChanged: onChange,

            borderRadius: BorderRadius.circular(14),
            items: therapistName.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: AppTextStyle.Poppins.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    color: AppColors.gray40,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    ),
  );
}
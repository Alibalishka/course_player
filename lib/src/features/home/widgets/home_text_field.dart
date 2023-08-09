import 'package:course_player/src/core/resources/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeTextField extends StatelessWidget {
  final TextEditingController controller;
  const HomeTextField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      controller: controller,
      placeholder: 'https://...',
      padding: const EdgeInsets.all(14),
      cursorColor: AppColors.blacColor,
      placeholderStyle: Theme.of(context)
          .textTheme
          .titleSmall
          ?.copyWith(color: AppColors.gray2Color, fontWeight: FontWeight.w500),
      style: Theme.of(context)
          .textTheme
          .titleSmall
          ?.copyWith(color: AppColors.blacColor, fontWeight: FontWeight.w500),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        border: Border.all(color: AppColors.blacColor),
      ),
    );
  }
}

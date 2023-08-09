import 'package:course_player/src/core/resources/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function()? onPressed;
  const CustomButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      color: AppColors.blacBrownColor,
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Text(
          'Начать урок',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: AppColors.whiteColor, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

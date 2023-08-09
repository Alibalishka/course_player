import 'package:course_player/src/core/resources/app_colors.dart';
import 'package:course_player/src/features/lesson/pages/lesson.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LessonButton extends StatelessWidget {
  final Function()? onPressed;
  final int index;
  final LessonScreen widget;
  const LessonButton({
    super.key,
    required this.onPressed,
    required this.index,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      color: AppColors.blacBrownColor,
      onPressed:
          widget.courseData.messages[index].source == 'bot' ? null : onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0),
        child: Text(
          widget.courseData.messages[index].source == 'bot'
              ? ''
              : widget.courseData.messages[index].text,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: AppColors.whiteColor, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

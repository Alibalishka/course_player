import 'package:course_player/src/core/resources/app_colors.dart';
import 'package:course_player/src/core/widgets/row_spacer.dart';
import 'package:course_player/src/features/home/logic/model/model_course.dart';
import 'package:course_player/src/core/base/view_model_lesson.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatefulWidget {
  const QuizWidget({
    super.key,
    required this.courseData,
    required this.lessonViewModel,
    required this.index,
  });

  final CourseModel courseData;
  final LeesonViewModel lessonViewModel;
  final int index;

  @override
  State<QuizWidget> createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  bool variantA = false;
  bool variantB = false;
  void addQuestion() async =>
      await Future.delayed(const Duration(seconds: 1), () {
        widget.lessonViewModel.saveChatData(
            widget.courseData.messages[widget.lessonViewModel.stepCurrentIndex],
            false);
      });

  @override
  void initState() {
    addQuestion();
    super.initState();
  }

  void onTapFunction(BuildContext context, int index) {
    if (widget.courseData.messages[widget.lessonViewModel.stepCurrentIndex]
            .answers?[index].correct?.isNotEmpty ??
        false) {
      widget.lessonViewModel.saveChatData(
          widget.courseData.messages[widget.lessonViewModel.stepCurrentIndex],
          true);
      widget.lessonViewModel
          .saveStepCurrentIndex(widget.lessonViewModel.stepCurrentIndex + 1);
    } else {
      setState(() => index == 0 ? variantA = true : null);
      setState(() => index == 1 ? variantB = true : null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ChooseButton(
          text: widget.courseData.messages[widget.index].answers![0].text,
          error: variantA,
          onTap: () => onTapFunction(context, 0),
        ),
        const RowSpacer(1),
        ChooseButton(
          text: widget.courseData.messages[widget.index].answers![1].text,
          error: variantB,
          onTap: () => onTapFunction(context, 1),
        ),
      ],
    );
  }
}

class ChooseButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  final bool error;
  const ChooseButton({
    super.key,
    required this.onTap,
    required this.text,
    required this.error,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              color: error ? AppColors.redColor : AppColors.blacBrownColor,
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: AppColors.whiteColor, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: depend_on_referenced_packages
import 'package:course_player/src/core/widgets/column_spacer.dart';
import 'package:course_player/src/features/home/logic/model/model_course.dart';
import 'package:course_player/src/core/base/view_model_lesson.dart';
import 'package:course_player/src/features/lesson/widgets/lesson_button.dart';
import 'package:course_player/src/features/lesson/widgets/lesson_chat.dart';
import 'package:course_player/src/features/lesson/widgets/lesson_quiz.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LessonScreen extends StatefulWidget {
  final CourseModel courseData;
  const LessonScreen({super.key, required this.courseData});

  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  late final lessonViewModel = context.read<LeesonViewModel>();
  bool isOnTap = false;
  bool answear = false;

  void addStep(BuildContext context) async {
    if (lessonViewModel.stepCurrentIndex <= lessonViewModel.stepTotalIndex - 1) {
      if (widget.courseData.messages[lessonViewModel.stepCurrentIndex].source == 'bot' && !isOnTap) {
        lessonViewModel.stepCurrentIndex == 0
            ? null
            : await Future.delayed(const Duration(seconds: 1));
        lessonViewModel.saveChatData(
          widget.courseData.messages[lessonViewModel.stepCurrentIndex],
          answear,
        );
        lessonViewModel.saveStepCurrentIndex(lessonViewModel.stepCurrentIndex + 1);
      } else if (widget.courseData.messages[lessonViewModel.stepCurrentIndex].source == 'user' && isOnTap) {
        isOnTap = false;
        lessonViewModel.saveChatData(
            widget.courseData.messages[lessonViewModel.stepCurrentIndex],
            answear,
        );
        lessonViewModel.saveStepCurrentIndex(lessonViewModel.stepCurrentIndex + 1);
      }
    }
  }

  @override
  void initState() {
    lessonViewModel.clearChatData();
    lessonViewModel.saveStepCurrentIndex(0);
    lessonViewModel.saveStepTotalIndex(widget.courseData.messages.length);
    addStep(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<LeesonViewModel>(
          builder: (context, value, child) {
            value.nextStep &&
                    lessonViewModel.stepCurrentIndex < widget.courseData.messages.length &&
                    widget.courseData.messages[value.stepCurrentIndex].type != 'quiz'
                ? addStep(context)
                : null;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ChatWidget(data: value.chat),
                value.stepCurrentIndex == widget.courseData.messages.length
                    ? Container()
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35),
                        child: widget.courseData .messages[value.stepCurrentIndex].type == 'quiz'
                            ? QuizWidget(
                                courseData: widget.courseData,
                                lessonViewModel: lessonViewModel,
                                index: lessonViewModel.stepCurrentIndex,
                              )
                            : LessonButton(
                                widget: widget,
                                index: value.stepCurrentIndex,
                                onPressed: () {
                                  isOnTap = true;
                                  lessonViewModel.saveNextStep(true);
                                },
                              ),
                      ),
                const ColumnSpacer(1)
              ],
            );
          },
        ),
      ),
    );
  }
}

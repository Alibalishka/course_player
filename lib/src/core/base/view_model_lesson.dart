import 'package:course_player/src/features/home/logic/model/model_course.dart';
import 'package:flutter/material.dart';

class LeesonViewModel extends ChangeNotifier {
  List<ChatModel> chat = [];
  int stepCurrentIndex = 0;
  int stepTotalIndex = 0;
  bool nextStep = false;

  void clearChatData() async {
    chat.clear();
    await Future.delayed(const Duration(milliseconds: 100), () {});
    notifyListeners();
  }

  void saveChatData(Message data, bool answear) async {
    answear
        ? chat.insert(
            0,
            ChatModel(
              source: 'user',
              type: data.type,
              text: data.answers![0].text,
              answear: answear,
            ))
        : chat.insert(
            0,
            ChatModel(
              source: data.source,
              type: data.type,
              text: data.text,
              answear: answear,
            ));
    await Future.delayed(const Duration(milliseconds: 100), () {});
    notifyListeners();
  }

  void saveNextStep(bool nextStep) async {
    this.nextStep = nextStep;
    await Future.delayed(const Duration(milliseconds: 100), () {});
    notifyListeners();
  }

  void saveStepCurrentIndex(int stepCurrentIndex) async {
    this.stepCurrentIndex = stepCurrentIndex;
    await Future.delayed(const Duration(milliseconds: 100), () {});
    notifyListeners();
  }

  void saveStepTotalIndex(int stepTotalIndex) async {
    this.stepTotalIndex = stepTotalIndex;
    await Future.delayed(const Duration(milliseconds: 100), () {});
    notifyListeners();
  }
}

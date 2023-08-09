import 'package:json_annotation/json_annotation.dart';

part 'model_course.g.dart';

@JsonSerializable()
class CourseModel {
  final List<Message> messages;

  CourseModel({required this.messages});

  factory CourseModel.fromJson(Map<String, dynamic> json) =>
      _$CourseModelFromJson(json);
  Map<String, dynamic> toJson() => _$CourseModelToJson(this);
}

@JsonSerializable()
class Message {
  final String source;
  final String type;
  final String text;
  final List<Answer>? answers;

  Message({
    required this.source,
    required this.type,
    required this.text,
    this.answers,
  });

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
  Map<String, dynamic> toJson() => _$MessageToJson(this);
}

@JsonSerializable()
class Answer {
  final String text;
  final String? correct;

  Answer({
    required this.text,
    this.correct,
  });

  factory Answer.fromJson(Map<String, dynamic> json) => _$AnswerFromJson(json);
  Map<String, dynamic> toJson() => _$AnswerToJson(this);
}

class ChatModel {
  final String source;
  final String type;
  final String text;
  final bool answear;

  ChatModel({
    required this.source,
    required this.type,
    required this.text,
    required this.answear,
  });
}

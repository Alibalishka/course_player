part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

// [STATE EVENT]
final class SendUrlLoading extends HomeState {}

final class SendUrlSuccess extends HomeState {
  final CourseModel courseData;

  SendUrlSuccess({required this.courseData});
}

final class SendUrlFailed extends HomeState {
  final String message;

  SendUrlFailed({required this.message});
}

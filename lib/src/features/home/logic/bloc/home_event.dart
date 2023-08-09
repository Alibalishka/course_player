part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

// [EVENT]
class SendUrl extends HomeEvent {
  final String url;

  SendUrl({required this.url});
}

// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:course_player/src/features/home/logic/model/model_course.dart';
import 'package:course_player/src/features/home/logic/repository/home_repository.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository homeRepository;
  HomeBloc({required this.homeRepository}) : super(HomeInitial()) {
    on<SendUrl>((event, emit) async {
      emit(SendUrlLoading());
      try {
        emit(SendUrlSuccess(courseData: await homeRepository.sendUrl(event.url)));
      } on DioError catch (e) {
        emit(SendUrlFailed(message: e.message));
      }
    });
  }
}

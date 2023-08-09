import 'package:auto_route/auto_route.dart';
import 'package:course_player/src/features/home/logic/model/model_course.dart';
import 'package:course_player/src/features/home/pages/home.dart';
import 'package:course_player/src/features/lesson/pages/lesson.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route,Screen,Provider',
  routes: [
    AutoRoute(page: HomeScreen, path: '/'),
    AutoRoute(page: LessonScreen, path: 'lesson'),
  ],
)
class AppRouter extends _$AppRouter {}

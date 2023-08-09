import 'package:course_player/src/core/resources/app_colors.dart';
import 'package:course_player/src/features/app/router/app_router.dart';
import 'package:course_player/src/features/app/widgets/app_scope.dart';
import 'package:flutter/material.dart';

class CoursePlayerApp extends StatelessWidget {
  const CoursePlayerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppScope(child: AppConfiguration());
  }
}

class AppConfiguration extends StatefulWidget {
  const AppConfiguration({super.key});

  @override
  State<AppConfiguration> createState() => _CoursePlayerAppState();
}

class _CoursePlayerAppState extends State<AppConfiguration> {
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Course Player',
      debugShowCheckedModeBanner: false,
      routeInformationParser: _appRouter.defaultRouteParser(),
      routerDelegate: _appRouter.delegate(),
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.grayColor,
      ),
    );
  }
}

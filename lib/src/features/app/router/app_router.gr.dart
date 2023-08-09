// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeScreenRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    LessonScreenRoute.name: (routeData) {
      final args = routeData.argsAs<LessonScreenRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: LessonScreen(
          key: args.key,
          courseData: args.courseData,
        ),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          HomeScreenRoute.name,
          path: '/',
        ),
        RouteConfig(
          LessonScreenRoute.name,
          path: 'lesson',
        ),
      ];
}

/// generated route for
/// [HomeScreen]
class HomeScreenRoute extends PageRouteInfo<void> {
  const HomeScreenRoute()
      : super(
          HomeScreenRoute.name,
          path: '/',
        );

  static const String name = 'HomeScreenRoute';
}

/// generated route for
/// [LessonScreen]
class LessonScreenRoute extends PageRouteInfo<LessonScreenRouteArgs> {
  LessonScreenRoute({
    Key? key,
    required CourseModel courseData,
  }) : super(
          LessonScreenRoute.name,
          path: 'lesson',
          args: LessonScreenRouteArgs(
            key: key,
            courseData: courseData,
          ),
        );

  static const String name = 'LessonScreenRoute';
}

class LessonScreenRouteArgs {
  const LessonScreenRouteArgs({
    this.key,
    required this.courseData,
  });

  final Key? key;

  final CourseModel courseData;

  @override
  String toString() {
    return 'LessonScreenRouteArgs{key: $key, courseData: $courseData}';
  }
}

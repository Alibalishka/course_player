import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:course_player/src/features/app/widgets/app_configuration.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const CoursePlayerApp());
}

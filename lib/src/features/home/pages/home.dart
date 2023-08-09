import 'package:auto_route/auto_route.dart';
import 'package:course_player/src/core/widgets/alert.dart';
import 'package:course_player/src/core/widgets/column_spacer.dart';
import 'package:course_player/src/core/widgets/custom_button.dart';
import 'package:course_player/src/features/app/router/app_router.dart';
import 'package:course_player/src/features/home/logic/bloc/home_bloc.dart';
import 'package:course_player/src/features/home/widgets/home_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController urlController = TextEditingController()
    ..text = 'https://lunappstudio.com/hr/test_spanish_numerals.json';

  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            HomeTextField(controller: urlController),
            const ColumnSpacer(2.6),
            BlocConsumer<HomeBloc, HomeState>(
              listener: (context, state) {
                state is SendUrlSuccess
                    ? context.router
                        .push(LessonScreenRoute(courseData: state.courseData))
                    : null;
                state is SendUrlFailed
                    ? AppAlertWidgets.customAlert(context)
                    : null;
              },
              builder: (context, state) {
                return CustomButton(
                    onPressed: state is SendUrlLoading
                        ? null
                        : () => context
                            .read<HomeBloc>()
                            .add(SendUrl(url: urlController.text)));
              },
            ),
          ],
        ),
      ),
    );
  }
}

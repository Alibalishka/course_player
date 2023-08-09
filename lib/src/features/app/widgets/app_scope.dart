// ignore_for_file: depend_on_referenced_packages

import 'package:course_player/src/features/home/logic/bloc/home_bloc.dart';
import 'package:course_player/src/features/home/logic/repository/home_repository.dart';
import 'package:course_player/src/core/base/view_model_lesson.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

@immutable
class AppScope extends StatefulWidget {
  final Widget child;

  const AppScope({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  State<AppScope> createState() => _AppScopeState();
}

class _AppScopeState extends State<AppScope> {
  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider<HomeBloc>(
            create: (_) => HomeBloc(homeRepository: HomeRepository()),
          ),
        ],
        child: MultiProvider(
          providers: [ChangeNotifierProvider(create: (_) => LeesonViewModel())],
          child: widget.child,
        ),
      );
}

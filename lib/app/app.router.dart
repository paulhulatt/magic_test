// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i5;
import 'package:flutter/material.dart';
import 'package:magic_test/models/workout.dart' as _i6;
import 'package:magic_test/screens/workout/workout_set_view.dart' as _i4;
import 'package:magic_test/screens/workout/workout_view.dart' as _i3;
import 'package:magic_test/screens/workout_list/workout_list_view.dart' as _i2;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i7;

class Routes {
  static const workoutListView = '/';

  static const workoutView = '/workout-view';

  static const workoutSetView = '/workout-set-view';

  static const all = <String>{
    workoutListView,
    workoutView,
    workoutSetView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.workoutListView,
      page: _i2.WorkoutListView,
    ),
    _i1.RouteDef(
      Routes.workoutView,
      page: _i3.WorkoutView,
    ),
    _i1.RouteDef(
      Routes.workoutSetView,
      page: _i4.WorkoutSetView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.WorkoutListView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.WorkoutListView(),
        settings: data,
      );
    },
    _i3.WorkoutView: (data) {
      final args = data.getArgs<WorkoutViewArguments>(
        orElse: () => const WorkoutViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i3.WorkoutView(key: args.key, workout: args.workout),
        settings: data,
      );
    },
    _i4.WorkoutSetView: (data) {
      final args = data.getArgs<WorkoutSetViewArguments>(
        orElse: () => const WorkoutSetViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i4.WorkoutSetView(key: args.key, workoutSet: args.workoutSet),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;
  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class WorkoutViewArguments {
  const WorkoutViewArguments({
    this.key,
    this.workout,
  });

  final _i5.Key? key;

  final _i6.Workout? workout;
}

class WorkoutSetViewArguments {
  const WorkoutSetViewArguments({
    this.key,
    this.workoutSet,
  });

  final _i5.Key? key;

  final _i6.WorkoutSet? workoutSet;
}

extension NavigatorStateExtension on _i7.NavigationService {
  Future<dynamic> navigateToWorkoutListView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.workoutListView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToWorkoutView({
    _i5.Key? key,
    _i6.Workout? workout,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.workoutView,
        arguments: WorkoutViewArguments(key: key, workout: workout),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToWorkoutSetView({
    _i5.Key? key,
    _i6.WorkoutSet? workoutSet,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.workoutSetView,
        arguments: WorkoutSetViewArguments(key: key, workoutSet: workoutSet),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i4;
import 'package:flutter/material.dart';
import 'package:magic_test/screens/workout/workout_view.dart' as _i3;
import 'package:magic_test/screens/workout_list/workout_list_view.dart' as _i2;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i5;

class Routes {
  static const workoutListView = '/';

  static const workoutView = '/workout-view';

  static const all = <String>{
    workoutListView,
    workoutView,
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
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.WorkoutListView: (data) {
      final args = data.getArgs<WorkoutListViewArguments>(
        orElse: () => const WorkoutListViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i2.WorkoutListView(key: args.key),
        settings: data,
      );
    },
    _i3.WorkoutView: (data) {
      final args = data.getArgs<WorkoutViewArguments>(
        orElse: () => const WorkoutViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i3.WorkoutView(key: args.key),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;
  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class WorkoutListViewArguments {
  const WorkoutListViewArguments({this.key});

  final _i4.Key? key;
}

class WorkoutViewArguments {
  const WorkoutViewArguments({this.key});

  final _i4.Key? key;
}

extension NavigatorStateExtension on _i5.NavigationService {
  Future<dynamic> navigateToWorkoutListView({
    _i4.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.workoutListView,
        arguments: WorkoutListViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToWorkoutView({
    _i4.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.workoutView,
        arguments: WorkoutViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}

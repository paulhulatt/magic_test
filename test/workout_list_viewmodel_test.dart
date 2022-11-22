import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:magic_test/screens/workout_list/workout_list_viewmodel.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'helpers/test_helpers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.setMockInitialValues({});

  group('WorkoutListViewModelTest -', () {
    setUp(() => registerServices());
    tearDown(() => unregisterServices());

    group('initialise -', () {
      test('When called should check Exercises and Workouts have been loaded',
          () async {
        var magicService = getAndRegisterMagicServiceMock();
        var model = WorkoutListViewModel();
        await model.handleStartup();

        verify(magicService.exercises);
      });
    });
  });
}

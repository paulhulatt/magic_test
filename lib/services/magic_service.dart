import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:magic_test/models/exercise.dart';
import 'package:magic_test/models/workout.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class MagicService {
  static MagicService? _instance;
  static SharedPreferences? sharedPreferences;
  var uuid = Uuid();

  // Setup default exercises - In a live situation these would come from a database for ease of management
  List<Exercise> exercises = [
    Exercise('b44304b6-5510-4f37-bab9-c7d56ea67956', 'Barbell row'),
    Exercise('b38dbbed-b5d9-4615-a330-6aa3d91e8597', 'Bench press'),
    Exercise('d5e67ef0-20d8-4d90-a1e5-178eb2c68ad4', 'Shoulder press'),
    Exercise('577722f3-8444-4238-93b7-a365db3ac984', 'Deadlift'),
    Exercise('1a6e92a6-634b-40fa-b575-76f69de93aee', 'Squat'),
  ];

  List<Workout>? workouts;

  bool initialised = false;

  static Future<MagicService> init() async {
    _instance ??= MagicService();
    sharedPreferences = await SharedPreferences.getInstance();

    return Future.value(_instance);
  }

  // For ease & speed the following are included in this service but in the wild additional services would exist for Workout local management and database interface

  /// Retrieve the users list of Workouts - In this case we'll pull them from SharedPrefs
  ///
  Future getWorkouts() async {
    List<String>? data = sharedPreferences!.getStringList('workouts') ?? [];
    workouts =
        data.map((workout) => Workout.fromJson(jsonDecode(workout))).toList();
  }

  /// Add this Workout to the Users list and then update
  ///
  saveWorkout(Workout workout) async {
    if (workout.id == null) {
      workout.id = uuid.v4();
      workout.date = DateTime.now();
    } else {
      workouts!.removeWhere((_) => _.id == workout.id);
    }
    workouts!.add(workout);

    await saveWorkouts();
  }

  /// Permanently remove the passed Workout from the Users list and update
  ///
  /// Depending on the use-case you may only mark as deleted
  ///
  removeWorkout(Workout workout) async {
    workouts!.removeWhere((_) => _.id == workout.id);

    await saveWorkouts();
  }

  /// Save the users list of Workouts
  ///
  saveWorkouts() async {
    List<String> data =
        workouts!.map((workout) => jsonEncode(workout.toJson())).toList();
    await sharedPreferences!.setStringList('workouts', data);
  }
}

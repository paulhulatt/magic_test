import 'package:flutter/material.dart';
import 'package:magic_test/app/app.locator.dart';
import 'package:magic_test/models/workout.dart';
import 'package:magic_test/services/magic_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class WorkoutSetViewModel extends BaseViewModel {
  WorkoutSet? workoutSet;
  BuildContext context;

  WorkoutSetViewModel(this.context, this.workoutSet);

  final NavigationService _navService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();
  final MagicService magicService = locator<MagicService>();

  WorkoutSet? editedWorkoutSet;
  bool saved = false;

  /// Actions performed upon initialisation of the View Model
  ///
  handleStartup() async {
    workoutSet ??= WorkoutSet();

    if (workoutSet != null && editedWorkoutSet == null) {
      editedWorkoutSet = WorkoutSet.fromMap(workoutSet!.toMap());
    }

    setInitialised(true);
    notifyListeners();
  }

  /// Update the Weight value by the supplied amount
  ///
  updateWeight(int value) {
    editedWorkoutSet!.weight = (editedWorkoutSet!.weight ?? 0) + value;

    notifyListeners();
  }

  /// Update the Reps value by the supplied amount
  ///
  updateReps(int value) {
    editedWorkoutSet!.reps = (editedWorkoutSet!.reps ?? 0) + value;

    notifyListeners();
  }

  /// Validate the View to ensure all required fields have been completed before allowing the user to Save
  ///
  validateForm() {
    return (editedWorkoutSet!.exercise != null &&
        editedWorkoutSet!.weight != null &&
        editedWorkoutSet!.reps != null);
  }

  /// Display a message to the user if the form fails validation
  ///
  formIncomplete() {
    _dialogService.showDialog(
        title: 'Set incomplete',
        description:
            'Please make sure you have selected an Exercise and set the Weight & number of Reps first.');
  }

  /// Save the Set to the current Workout
  ///
  saveWorkoutSet() async {
    _navService.back(result: editedWorkoutSet);
  }
}

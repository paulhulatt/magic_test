import 'package:flutter/material.dart';
import 'package:magic_test/app/app.locator.dart';
import 'package:magic_test/app/app.router.dart';
import 'package:magic_test/models/workout.dart';
import 'package:magic_test/services/magic_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:uuid/uuid.dart';

class WorkoutViewModel extends BaseViewModel {
  Workout? workout;
  BuildContext context;

  WorkoutViewModel(this.context, this.workout);

  final NavigationService _navService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();
  final MagicService magicService = locator<MagicService>();

  //TextEditingController workoutNameController = TextEditingController();
  bool editMode = false;

  bool saved = false;

  Workout? editedWorkout;

  var uuid = const Uuid();

  /// Actions performed upon initialisation of the View Model
  ///
  handleStartup() async {
    workout ??= Workout(sets: []);
    //if (workout!.id != null && editedWorkout == null) {
    editedWorkout = workout!.copyWith();
    //}

    setInitialised(true);
    notifyListeners();
  }

  /// Validate the View to ensure all required fields have been completed before allowing the user to Save
  ///
  validateForm() {
    return (editedWorkout!.name ?? '').length >= 4 &&
        (editedWorkout!.sets ?? []).isNotEmpty;
  }

  /// Display a message to the user if the form fails validation
  ///
  formIncomplete() {
    _dialogService.showDialog(
        title: 'Workout incomplete',
        description:
            'Please make sure you have entered a name for this Workout and added at least one Set first.');
  }

  /// Navigate to the WorkoutSet View and create a new item
  ///
  addSet() async {
    WorkoutSet? workoutSet = await _navService.navigateToWorkoutSetView();

    if (workoutSet != null) {
      workoutSet.id = uuid.v4();
      editedWorkout!.sets!.add(workoutSet);
    }

    notifyListeners();
  }

  /// Navigate to the WorkoutSet View and edit the selected item
  editSet(WorkoutSet workoutSet) async {
    WorkoutSet? workoutSetResult = await _navService.navigateToWorkoutSetView(
        workoutSet: workoutSet.copyWith());

    if (workoutSetResult != null) {
      workoutSet.exercise = workoutSetResult.exercise;
      workoutSet.weight = workoutSetResult.weight;
      workoutSet.reps = workoutSetResult.reps;
    }

    notifyListeners();
  }

  /// Permanently remove the selected WorkoutSet.  Request user confirmation before the operation is completed
  ///
  removeSet(WorkoutSet workoutSet) async {
    var res = await _dialogService.showConfirmationDialog(
        title: 'Delete?',
        description: 'Are you sure you want to delete this set?',
        confirmationTitle: 'Yes');

    if (res != null && res.confirmed) {
      editedWorkout!.sets!.removeWhere((element) => element == workoutSet);

      notifyListeners();
    }
  }

  /// Save the Workout to the Users list
  ///
  saveWorkout() async {
    magicService.saveWorkout(editedWorkout!);

    saved = true;

    _navService.back();
  }
}

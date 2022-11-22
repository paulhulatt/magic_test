import 'package:magic_test/app/app.locator.dart';
import 'package:magic_test/app/app.router.dart';
import 'package:magic_test/models/workout.dart';
import 'package:magic_test/services/magic_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class WorkoutListViewModel extends BaseViewModel {
  final NavigationService _navService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();
  final MagicService _magicService = locator<MagicService>();

  List<Workout>? get workouts => _magicService.workouts;

  /// Actions performed upon initialisation of the View Model
  ///
  handleStartup() async {
    // Retrieve the users list of Workouts
    if (_magicService.workouts == null) await _magicService.getWorkouts();

    setInitialised(true);
    notifyListeners();
  }

  /// Add a New Workout and navigate to the Workout View to setup
  ///
  Future addNewWorkout() async {
    await _navService.navigateTo(Routes.workoutView);

    notifyListeners();
  }

  /// Edit a selected Workout and navigate to the Workout View
  ///
  Future editWorkout(Workout workout) async {
    await _navService.navigateToWorkoutView(workout: workout.copyWith());

    notifyListeners();
  }

  /// Permanently remove the selected Workout.  The user will be asked for confirmation before this operation is completed
  ///
  removeWorkout(Workout workout) async {
    var res = await _dialogService.showConfirmationDialog(
        title: 'Delete ${workout.name}?',
        description: 'Are you sure you want to delete this workout?',
        confirmationTitle: 'Yes');

    if (res != null && res.confirmed) {
      _magicService.removeWorkout(workout);

      notifyListeners();
    }
  }
}

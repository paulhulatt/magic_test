import 'package:magic_test/app/app.locator.dart';
import 'package:magic_test/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class WorkoutListViewModel extends BaseViewModel {
  final NavigationService _navService = locator<NavigationService>();

  Future addNewWorkout() async {
    await _navService.navigateTo(Routes.workoutView);
  }
}

import 'package:magic_test/screens/workout/workout_view.dart';
import 'package:magic_test/screens/workout_list/workout_list_view.dart';
import 'package:magic_test/services/magic_service.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(routes: [
  MaterialRoute(page: WorkoutListView, initial: true),
  MaterialRoute(page: WorkoutView),
], dependencies: [
  Singleton(classType: NavigationService),
  Singleton(classType: DialogService),
  Presolve(
    classType: MagicService,
    presolveUsing: MagicService.init,
  ),
])
class App {
  /** This class has no puporse besides housing the annotation that generates the required functionality **/
}

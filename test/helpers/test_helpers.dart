import 'package:magic_test/app/app.locator.dart';
import 'package:magic_test/models/exercise.dart';
import 'package:magic_test/models/workout.dart';
import 'package:magic_test/services/magic_service.dart';
import 'package:mockito/mockito.dart';
import 'package:stacked_services/stacked_services.dart';

class MagicServiceMock extends Mock implements MagicService {}

class NavigationServiceMock extends Mock implements NavigationService {}

class DialogServiceMock extends Mock implements DialogService {}

MagicService getAndRegisterMagicServiceMock() {
  _removeRegistrationIfExists<MagicService>();
  var service = MagicServiceMock();

  when(service.exercises).thenReturn([
    Exercise('1', 'Barbell row'),
    Exercise('2', 'Bench press'),
  ]);

  when(service.workouts).thenReturn([
    Workout(
        id: '1',
        name: 'Workout 1',
        sets: [WorkoutSet(id: '1', exercise: '1', weight: 100, reps: 10)],
        date: DateTime.now())
  ]);

  locator.registerSingleton<MagicService>(service);
  return service;
}

NavigationService getAndRegisterNavigationServiceMock() {
  _removeRegistrationIfExists<NavigationService>();
  var service = NavigationServiceMock();
  locator.registerSingleton<NavigationService>(service);
  return service;
}

DialogService getAndRegisterDialogServiceMock() {
  _removeRegistrationIfExists<DialogService>();
  var service = DialogServiceMock();
  locator.registerSingleton<DialogService>(service);
  return service;
}

void registerServices() {
  getAndRegisterNavigationServiceMock();
  getAndRegisterDialogServiceMock();
  getAndRegisterMagicServiceMock();
}

void unregisterServices() {
  locator.unregister<MagicService>();
  locator.unregister<NavigationService>();
  locator.unregister<DialogService>();
}

void _removeRegistrationIfExists<T extends Object>() {
  if (locator.isRegistered<T>()) {
    locator.unregister<T>();
  }
}

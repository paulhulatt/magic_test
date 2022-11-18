import 'package:flutter/material.dart';
import 'package:magic_test/app/app.locator.dart';
import 'package:magic_test/screens/workout/workout_view.dart';
import 'package:magic_test/shared/colors.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'workout_list_viewmodel.dart';

class WorkoutListView extends StatelessWidget {
  WorkoutListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WorkoutListViewModel>.reactive(
      viewModelBuilder: () => WorkoutListViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: AppBar(
          backgroundColor: kBackgroundColor,
        ),
        body: SafeArea(child: Center(child: Text('Workout List'))),
        floatingActionButton: FloatingActionButton(
          backgroundColor: kLightBlueColor,
          child: Icon(Icons.plus_one, color: kBlackColor),
          onPressed: () async => await model.addNewWorkout(),
        ),
      ),
    );
  }
}

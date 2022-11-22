import 'package:flutter/material.dart';
import 'package:magic_test/shared/colors.dart';
import 'package:magic_test/shared/ui_helpers.dart';
import 'package:stacked/stacked.dart';

import 'workout_list_viewmodel.dart';

class WorkoutListView extends StatelessWidget {
  const WorkoutListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WorkoutListViewModel>.reactive(
      viewModelBuilder: () => WorkoutListViewModel(),
      onModelReady: (model) => model.handleStartup(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: AppBar(
          backgroundColor: kBackgroundColor,
        ),
        body: SafeArea(
            child: Padding(
          padding: defaultPadding(context),
          child: (model.initialised && !model.isBusy)
              ? (((model.workouts ?? []).isNotEmpty)
                  ? ListView(
                      children: model.workouts!
                          .map((workout) => InkWell(
                                onTap: () => model.editWorkout(workout),
                                child: ListTile(
                                    contentPadding: EdgeInsets.zero,
                                    title: Text(
                                      workout.name!,
                                      style: const TextStyle(
                                          color: kLightBlueColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    subtitle: Text(formatDate(workout.date!)),
                                    trailing: IconButton(
                                      onPressed: () =>
                                          model.removeWorkout(workout),
                                      icon: const Icon(Icons.delete),
                                    )),
                              ))
                          .toList(),
                    )
                  : Center(
                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text('No workouts', style: subStyle),
                        Text('Tap the add button below to create a Workout',
                            textAlign: TextAlign.center, style: bodyStyle)
                      ],
                    )))
              : const Center(
                  child: CircularProgressIndicator(
                    color: kLightBlueColor,
                  ),
                ),
        )),
        floatingActionButton: FloatingActionButton(
          backgroundColor: kLightBlueColor,
          child: const Icon(Icons.plus_one, color: kBlackColor),
          onPressed: () async => await model.addNewWorkout(),
        ),
      ),
    );
  }
}

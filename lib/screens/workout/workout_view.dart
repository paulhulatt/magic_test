import 'package:flutter/material.dart';
import 'package:magic_test/models/workout.dart';
import 'package:magic_test/shared/colors.dart';
import 'package:magic_test/shared/ui_helpers.dart';
import 'package:magic_test/widgets/custom_button.dart';
import 'package:stacked/stacked.dart';

import 'workout_viewmodel.dart';

class WorkoutView extends StatelessWidget {
  final Workout? workout;
  const WorkoutView({Key? key, this.workout}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WorkoutViewModel>.reactive(
      viewModelBuilder: () => WorkoutViewModel(context, workout),
      onModelReady: (model) => model.handleStartup(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: AppBar(
          iconTheme: Theme.of(context).primaryIconTheme,
          backgroundColor: kBackgroundColor,
        ),
        body: SafeArea(
            child: Padding(
          padding: defaultPadding(context),
          child: Column(
            children: [
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (workout == null || !model.editMode)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              '${(workout == null) ? 'New Workout' : workout!.name}',
                              style: headStyle),
                          if (workout != null && !model.editMode)
                            IconButton(
                                onPressed: () {
                                  model.editMode = true;
                                  model.notifyListeners();
                                },
                                icon: const Icon(Icons.edit))
                        ],
                      ),
                    if (workout == null) verticalSpaceMedium,
                    if (workout == null)
                      const Text('Workout Name', style: labelStyle),
                    if (workout == null) verticalSpaceTiny,
                    if (workout == null || model.editMode)
                      TextFormField(
                          autofocus: true,
                          initialValue: model.editedWorkout!.name,
                          onChanged: (value) =>
                              model.editedWorkout!.name = value,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 2, color: kLightBlueColor)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 2, color: kLightBlueColor)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 2, color: kLightBlueColor)))),
                    verticalSpaceMedium,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Sets', style: labelStyle),
                        IconButton(
                            onPressed: () => model.addSet(),
                            icon: const Icon(Icons.add_circle))
                      ],
                    ),
                    verticalSpaceTiny,
                    ListView(
                      shrinkWrap: true,
                      children: (model.editedWorkout!.sets ?? [])
                          .map((workoutSet) => InkWell(
                                onTap: () => model.editSet(workoutSet),
                                child: ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  title: Text(model.magicService.exercises
                                      .firstWhere((element) =>
                                          element.id == workoutSet.exercise)
                                      .name),
                                  subtitle: Text(
                                      'Weight: ${workoutSet.weight}kg - Reps: ${workoutSet.reps}'),
                                  trailing: IconButton(
                                    onPressed: () =>
                                        model.removeSet(workoutSet),
                                    icon: const Icon(Icons.delete),
                                  ),
                                ),
                              ))
                          .toList(),
                    )
                  ],
                ),
              )),
              CustomButton('Save', context,
                  onPressed: (model.validateForm())
                      ? () => model.saveWorkout()
                      : (() => model.formIncomplete())),
            ],
          ),
        )),
      ),
    );
  }
}

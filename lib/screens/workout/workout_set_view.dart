import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:magic_test/models/workout.dart';
import 'package:magic_test/shared/colors.dart';
import 'package:magic_test/shared/ui_helpers.dart';
import 'package:magic_test/widgets/custom_button.dart';
import 'package:stacked/stacked.dart';

import 'workout_set_viewmodel.dart';

class WorkoutSetView extends StatelessWidget {
  final WorkoutSet? workoutSet;
  WorkoutSetView({Key? key, this.workoutSet}) : super(key: key);

  TextEditingController weightController = TextEditingController();
  TextEditingController repsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WorkoutSetViewModel>.reactive(
      viewModelBuilder: () => WorkoutSetViewModel(context, workoutSet),
      onModelReady: (model) => model.handleStartup(),
      builder: (context, model, child) {
        if (model.editedWorkoutSet != null &&
            model.editedWorkoutSet!.weight != null &&
            weightController.text.isEmpty) {
          weightController.text = model.editedWorkoutSet!.weight!.toString();
        }
        if (model.editedWorkoutSet != null &&
            model.editedWorkoutSet!.reps != null &&
            repsController.text.isEmpty) {
          repsController.text = model.editedWorkoutSet!.reps!.toString();
        }

        return Scaffold(
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
                      Text((workoutSet == null) ? 'New Set' : 'Edit Set',
                          style: headStyle),
                      verticalSpaceMedium,
                      const Text('Exercise', style: labelStyle),
                      verticalSpaceTiny,
                      Container(
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: kLightBlueColor, width: 2)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DropdownButton(
                            items: model.magicService.exercises
                                .map((exercise) => DropdownMenuItem(
                                    value: exercise.id,
                                    child: Text(exercise.name,
                                        style: const TextStyle(
                                            color: kWhiteColor))))
                                .toList(),
                            onChanged: (val) {
                              debugPrint(val);
                              model.editedWorkoutSet!.exercise = val;
                              model.notifyListeners();
                            },
                            underline: Container(),
                            isExpanded: true,
                            dropdownColor: kBlackColor,
                            value: model.editedWorkoutSet!.exercise,
                          ),
                        ),
                      ),
                      verticalSpaceMedium,
                      Column(
                        children: [
                          const Text('Weight', style: labelStyle),
                          verticalSpaceTiny,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                  onPressed: (() {
                                    model.updateWeight(-1);
                                    weightController.text = model
                                        .editedWorkoutSet!.weight!
                                        .toString();
                                  }),
                                  icon: const Icon(
                                      Icons.remove_circle_outline_outlined)),
                              SizedBox(
                                width: 100,
                                child: TextFormField(
                                    controller: weightController,
                                    onChanged: (value) => model
                                        .editedWorkoutSet!
                                        .weight = int.tryParse(value),
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    decoration: const InputDecoration(
                                        suffixText: 'kg',
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 2,
                                                color: kLightBlueColor)),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 2,
                                                color: kLightBlueColor)),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 2,
                                                color: kLightBlueColor)))),
                              ),
                              IconButton(
                                  onPressed: (() {
                                    model.updateWeight(1);
                                    weightController.text = model
                                        .editedWorkoutSet!.weight!
                                        .toString();
                                  }),
                                  icon: const Icon(
                                      Icons.add_circle_outline_outlined)),
                            ],
                          ),
                        ],
                      ),
                      verticalSpaceMedium,
                      Column(
                        children: [
                          const Text('Reps', style: labelStyle),
                          verticalSpaceTiny,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                  onPressed: (() {
                                    model.updateReps(-1);
                                    repsController.text = model
                                        .editedWorkoutSet!.reps!
                                        .toString();
                                  }),
                                  icon: const Icon(
                                      Icons.remove_circle_outline_outlined)),
                              SizedBox(
                                width: 100,
                                child: TextFormField(
                                    controller: repsController,
                                    onChanged: (value) => model
                                        .editedWorkoutSet!
                                        .reps = int.tryParse(value),
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    decoration: const InputDecoration(
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 2,
                                                color: kLightBlueColor)),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 2,
                                                color: kLightBlueColor)),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 2,
                                                color: kLightBlueColor)))),
                              ),
                              IconButton(
                                  onPressed: (() {
                                    model.updateReps(1);
                                    repsController.text = model
                                        .editedWorkoutSet!.reps!
                                        .toString();
                                  }),
                                  icon: const Icon(
                                      Icons.add_circle_outline_outlined)),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                )),
                CustomButton('Save', context,
                    onPressed: (model.validateForm())
                        ? () => model.saveWorkoutSet()
                        : (() => model.formIncomplete())),
              ],
            ),
          )),
        );
      },
    );
  }
}

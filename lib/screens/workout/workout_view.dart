import 'package:flutter/material.dart';
import 'package:magic_test/shared/colors.dart';
import 'package:magic_test/widgets/custom_button.dart';
import 'package:stacked/stacked.dart';

import 'workout_viewmodel.dart';

class WorkoutView extends StatelessWidget {
  WorkoutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WorkoutViewModel>.reactive(
      viewModelBuilder: () => WorkoutViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: AppBar(
          iconTheme: Theme.of(context).primaryIconTheme,
          backgroundColor: kBackgroundColor,
        ),
        body: SafeArea(
            child: Column(
          children: [
            Expanded(child: Center(child: Text('Workout Screen'))),
            CustomButton('Save', context),
          ],
        )),
      ),
    );
  }
}

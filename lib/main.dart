import 'package:flutter/material.dart';
import 'package:magic_test/shared/colors.dart';
import 'package:stacked_services/stacked_services.dart';

import 'app/app.locator.dart';
import 'app/app.router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MAGIC Tech Test',
      theme: ThemeData(
          brightness: Brightness.dark,
          backgroundColor: kBackgroundColor,
          primaryColor: kPrimaryColor,
          primaryIconTheme: IconThemeData(color: kLightBlueColor)),
      debugShowCheckedModeBanner: false,
      navigatorKey: StackedService.navigatorKey,
      // Construct the StackedRouter and set the onGenerateRoute function
      onGenerateRoute: StackedRouter().onGenerateRoute,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:ptut_2/ui/home.dart';

import '../theme/main_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Musi K'store",
      theme: MainTheme.darkTheme,
      home: const HomePage(title: "Musi K'store"),
    );
  }
}
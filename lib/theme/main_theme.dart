import 'package:flutter/material.dart';

import 'colors.dart';

class MainTheme {
  static ThemeData get darkTheme {
    return ThemeData(
        scaffoldBackgroundColor: CustomColors.black,
        fontFamily: 'Poppins',
        textTheme: ThemeData.dark().textTheme,
        buttonTheme: ButtonThemeData(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
          buttonColor: CustomColors.blue,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: CustomColors.red,
        )
    );
  }
}
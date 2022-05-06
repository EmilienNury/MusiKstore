import 'dart:io';
import 'package:flutter/material.dart';
import 'package:ptut_2/app/app.dart';
import 'package:flutter/services.dart';
import 'package:ptut_2/theme/colors.dart';

void main() {

  if (Platform.isAndroid) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: CustomColors.grey,
    ));
  }

  runApp(const MyApp());
}

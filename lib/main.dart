import 'dart:io';
import 'package:flutter/material.dart';
import 'package:ptut_2/app/app.dart';
import 'package:flutter/services.dart';
import 'package:ptut_2/theme/colors.dart';

import 'core/manager/database_manager.dart';

void main() async {

  if (Platform.isAndroid) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: CustomColors.grey,
    ));
  }
  WidgetsFlutterBinding.ensureInitialized();
  await DataBaseManager().init();
  runApp(const MyApp());
}

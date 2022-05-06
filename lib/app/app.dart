import 'package:flutter/material.dart';
import 'package:ptut_2/core/model/Songs/song.dart';
import 'package:ptut_2/ui/musikstore.dart';
import 'package:ptut_2/ui/player.dart';

import '../theme/main_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Musi K'store",
      theme: MainTheme.darkTheme,
        home: const MusiKstoreApp(title: "Musi K'store"),
      onGenerateRoute: (RouteSettings settings){
        var arguments = settings.arguments;
        switch(settings.name){
          case PlayerPage.route:
            if(arguments != null && arguments is PlayerPageArguments){
              Song song = arguments.music;
              return MaterialPageRoute(builder: (_) => PlayerPage(music: song,));
            }else{
              throw Exception(
                "Cette route doit avoir un son"
              );
            }
          default:
            return unknownRoute();
        }
      }

    );
  }

  MaterialPageRoute unknownRoute() {
    return MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Center(child: Text("Route inconnue")),
        ));
  }
}
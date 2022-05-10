import 'package:flutter/material.dart';
import 'package:ptut_2/core/model/Songs/song.dart';
import 'package:ptut_2/core/navigation_service.dart';
import 'package:ptut_2/ui/musikstore.dart';
import 'package:ptut_2/ui/parameters.dart';
import 'package:ptut_2/ui/player.dart';
import 'package:ptut_2/ui/subscribe.dart';
import 'package:ptut_2/ui/playlist_category.dart';

import '../theme/main_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Musi K'store",
      theme: MainTheme.darkTheme,
        navigatorKey: NavigationService.navigatorKey,
        home: const MusiKstoreApp(title: "Musi K'store"),
      onGenerateRoute: (RouteSettings settings){
        var arguments = settings.arguments;
        switch(settings.name){
          case SubscribePage.route:
            return MaterialPageRoute(builder: (_) => const SubscribePage());
          case ParametersPage.route:
            return MaterialPageRoute(builder: (_) => const ParametersPage());
          case PlayerPage.route:
            if(arguments != null && arguments is PlayerPageArguments){
              Song song = arguments.music;
              return MaterialPageRoute(builder: (_) => PlayerPage(music: song,));
            }else{
              throw Exception(
                "Cette route doit avoir un son"
              );
            }
          case PlaylistCategoryPage.route:
            if(arguments != null && arguments is PlaylistCategoryPageArguments){
              String? playlistName = arguments.playlistName;
              String? categoryName = arguments.categoryName;
              return MaterialPageRoute(builder: (_) => PlaylistCategoryPage(playlistName: playlistName, categoryName: categoryName,));
            }else{
              throw Exception(
                  "Cette route doit avoir soit un non de playlist soit un nom de catégorie"
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
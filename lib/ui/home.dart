import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ptut_2/core/model/Songs/feed.dart';
import 'package:ptut_2/core/model/Songs/songs.dart';
import 'package:ptut_2/ui/components/custom_app_bar.dart';
import 'package:ptut_2/core/manager/lyrics_songs_manager.dart';
import 'package:ptut_2/core/model/Lyrics/message.dart';
import 'package:ptut_2/core/model/Lyrics/musicxmatch.dart';
import 'package:ptut_2/ui/player.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Songs? test;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
        future: Future.wait([
          LyricsSongManager().getMostPopularSong(),
        ]
        ),
        builder: (context, snapshot){
          if(snapshot.hasData){
            test = snapshot.data?[0];
          }
          return Column(
            children:  [
               Text("test"),
              TextButton(
                  onPressed: () async => await Navigator.of(context).pushNamed(PlayerPage.route, arguments: PlayerPageArguments(music: test!.feed.results!.first)) ,
                  child: Text("test music")
              )
            ],
          );
        }
    );
  }


}
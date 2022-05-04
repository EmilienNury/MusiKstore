import 'package:flutter/material.dart';
import 'package:ptut_2/core/manager/lyrics_manager.dart';
import 'package:ptut_2/core/model/Lyrics/message.dart';
import 'package:ptut_2/core/model/Lyrics/musicxmatch.dart';

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
  Musicxmatch? testLyrics;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
        future: Future.wait([
          LyricsManager().getLyrics("10074988"),
        ]
        ),
        builder: (context, snapshot){
          if(snapshot.hasData){
            testLyrics = snapshot.data?[0];
            print(testLyrics?.message.body.lyrics.pixel_tracking_url);
          }
          return Column(
            children:  [
               Image(
                image: NetworkImage(testLyrics?.message.body.lyrics.pixel_tracking_url ?? ""),
              )
            ],
          );
        }
    );
  }
}
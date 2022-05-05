import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ptut_2/core/model/Songs/song.dart';

class PlayerPageArguments{
  Song music;

  PlayerPageArguments({required this.music});
}

class PlayerPage extends StatefulWidget{
  static const route = "/player";

  const PlayerPage({Key? key, required this.music}): super(key: key);

  final Song music;

  @override
  State<StatefulWidget> createState() => _PlayerPageState();

}

class _PlayerPageState extends State<PlayerPage>{
  late Song music;
  int maxduration = 0;
  int currentpos =0;
  String currentpostlabel = "00:00";

  AudioPlayer audioPlayer = AudioPlayer();
  playLocal() async {
    String audioasset = "assets/audio/Timal_Gazo_Filtré_Clip_Officiel.mp3";
    ByteData bytes = await rootBundle.load(audioasset); //load audio from assets
    Uint8List audiobytes = bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
    int result = await audioPlayer.playBytes(audiobytes);
  }

  @override
  void initState(){
    music = widget.music;
    super.initState();
    /*audioPlayer.onDurationChanged.listen((Duration d) { //get the duration of audio
      maxduration = d.inMilliseconds;
      setState(() {
      });
    });

    audioPlayer.onAudioPositionChanged.listen((Duration  p){
      currentpos = p.inMilliseconds; //get the current position of playing audio

      //generating the duration label
      int shours = Duration(milliseconds:currentpos).inHours;
      int sminutes = Duration(milliseconds:currentpos).inMinutes;
      int sseconds = Duration(milliseconds:currentpos).inSeconds;

      int rhours = shours;
      int rminutes = sminutes - (shours * 60);
      int rseconds = sseconds - (sminutes * 60 + shours * 60 * 60);

      currentpostlabel = "$rhours:$rminutes:$rseconds";

      setState(() {
        //refresh the UI
      });
    });*/

  }



  @override
  Widget build(BuildContext context) {

    return FutureBuilder<List<dynamic>>(
        future: Future.wait([
          playLocal(),
        ]
        ),
        builder: (context, snapshot){
          if(snapshot.hasData){
          }
          return Scaffold(
            body: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    Text(
                        "${music.name} - ${music.artistName}"
                    ),
                    Image(
                        image: NetworkImage(music.artworkUrl100 ?? "")
                    ),
                    Container(
                      child: Text(currentpostlabel, style: const TextStyle(fontSize: 25),),
                    ),
                  ],
                ),
              )
            ),
          );
        }
    );
  }
  
}
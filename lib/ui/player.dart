import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ptut_2/core/model/Songs/song.dart';
import 'package:ptut_2/theme/colors.dart';

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
  int maxduration = 100;
  int currentpos =0;
  String currentpostlabel = "00:00";
  String maxpostlabel = "00:00";
  String audioasset = "assets/audio/Timal_Gazo_Filtré_Clip_Officiel.mp3";
  bool isplaying = false;
  bool audioPlayed = false;

  AudioPlayer audioPlayer = AudioPlayer();

  @override
  void initState(){
    music = widget.music;
    Future.delayed(Duration.zero, () async{
      if(!audioPlayed){
        ByteData bytes = await rootBundle.load(audioasset); //load audio from assets
        Uint8List audiobytes = bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
        int result = await audioPlayer.playBytes(audiobytes);
        isplaying = true;
        audioPlayed = true;
      }

      audioPlayer.onDurationChanged.listen((Duration d) { //get the duration of audio
        maxduration = d.inMilliseconds;
        //generating the duration label
        int shours = Duration(milliseconds:maxduration).inHours;
        int sminutes = Duration(milliseconds:maxduration).inMinutes;
        int sseconds = Duration(milliseconds:maxduration).inSeconds;

        int rminutes = sminutes - (shours * 60);
        int rseconds = sseconds - (sminutes * 60 + shours * 60 * 60);

        maxpostlabel = "$rminutes:$rseconds";

        setState(() {
          //refresh the UI
        });

      });

      audioPlayer.onAudioPositionChanged.listen((Duration  p){
        currentpos = p.inMilliseconds; //get the current position of playing audio

        //generating the duration label
        int shours = Duration(milliseconds:currentpos).inHours;
        int sminutes = Duration(milliseconds:currentpos).inMinutes;
        int sseconds = Duration(milliseconds:currentpos).inSeconds;

        int rminutes = sminutes - (shours * 60);
        int rseconds = sseconds - (sminutes * 60 + shours * 60 * 60);

        currentpostlabel = "$rminutes:$rseconds";

        setState(() {
          //refresh the UI
        });
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: CustomColors.black,
          title: Text(
            "${music.name} - ${music.artistName}",
            style: const TextStyle(fontSize: 25),
          ),
        ),
        body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  const TabBar(
                    indicatorColor: Color.fromRGBO(212, 72, 79, 100),
                    labelColor: Color.fromRGBO(212, 72, 79, 100) ,
                    unselectedLabelColor: Colors.white,
                    tabs: [
                      Tab(icon: Text(
                        "Lecture",
                        style: TextStyle(fontSize: 12),
                        ),
                      ),
                      Tab(icon: Text(
                        "Karaoke",
                        style: TextStyle(fontSize: 12),
                        ),
                      ),
                      Tab(icon: Text(
                        "Enregistrement",
                        style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height - 150,
                    child: TabBarView(
                      children: [
                        Column(
                          children: [
                            const SizedBox(
                              height: 16,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width - 50,
                              height: 400,
                              child: Image.network(
                                music.artworkUrl100 ?? "",
                                fit: BoxFit.cover,
                              ),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () async {
                                    int result = await audioPlayer.seek(const Duration(milliseconds: 0));
                                    if(result == 1){ //seek successful
                                      currentpos = 0;}
                                    else {
                                      print("Seek unsuccessful.");
                                    }
                                    },
                                  icon: const Icon(Icons.skip_previous),
                                  color: Colors.white,
                                  iconSize: 80,
                                ),
                                IconButton(
                                  onPressed: () async{
                                    if(isplaying){
                                      int result = await audioPlayer.pause();
                                      if(result == 1){
                                        setState(() {
                                          isplaying = false;
                                        });
                                      }else{
                                        print("Error on pause audio.");
                                      }
                                    }else{
                                      int result = await audioPlayer.resume();
                                      if(result == 1){
                                        setState(() {
                                          isplaying = true;
                                        });
                                      }else{
                                        print("Error on resume audio.");
                                      }
                                    }
                                    },
                                  icon: Icon(isplaying?Icons.pause:Icons.play_arrow),
                                  color: Colors.white,
                                  iconSize: 120,
                                ),
                                IconButton(
                                  onPressed: () => "",
                                  icon: const Icon(Icons.skip_next),
                                  color: Colors.white,
                                  iconSize: 80,
                                ),
                              ],
                              mainAxisAlignment: MainAxisAlignment.center,
                            ),
                            Slider(
                              activeColor: Colors.white,
                              inactiveColor: Colors.white,
                              value: double.parse(currentpos.toString()),
                              min: 0,
                              max: double.parse(maxduration.toString()),
                              divisions: maxduration,
                              label: currentpostlabel,
                              onChanged: (double value) async {
                                int seekval = value.round();
                                if(seekval != maxduration){
                                  int result = await audioPlayer.seek(Duration(milliseconds: seekval));
                                  if(result == 1){ //seek successful
                                    currentpos = seekval;
                                  }else{
                                    print("Seek unsuccessful.");
                                  }
                                }else{
                                  int result = await audioPlayer.seek(Duration(milliseconds: 0));
                                  if(result == 1){ //seek successful
                                    currentpos = 0;
                                  }else{
                                    print("Seek unsuccessful.");
                                  }
                                }
                                },
                            ),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  currentpostlabel,
                                  style: const TextStyle(fontSize: 25),
                                  textAlign: TextAlign.right,
                                ),
                                const SizedBox(
                                  width: 300,
                                ),
                                Text(
                                  maxpostlabel,
                                  style: const TextStyle(fontSize: 25),
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Tab(icon: Icon(Icons.directions_car)),
                        Tab(icon: Icon(Icons.directions_transit)),
                      ],
                    ),
                  ),
                ],
              ),
            )
        ),
      )
    );
  }
}
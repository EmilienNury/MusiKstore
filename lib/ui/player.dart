import 'dart:async';
import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ptut_2/core/manager/lyrics_songs_manager.dart';
import 'package:ptut_2/core/model/Songs/song.dart';
import 'package:ptut_2/core/model/Videos/list_search.dart';
import 'package:ptut_2/theme/colors.dart';
import 'package:sound_stream/sound_stream.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


class PlayerPageArguments{
  Song music;

  PlayerPageArguments({required this.music});
}

class PlayerPage extends StatefulWidget{
  static const route = "/player";

  const PlayerPage({Key? key, required this.music}): super(key: key);

  final Song music;

  @override
  _PlayerPageState createState() => _PlayerPageState();

}

class _PlayerPageState extends State<PlayerPage>{
  late Song music;
  late ListSearch search;
  int maxduration = 100;
  int currentpos =0;
  String currentpostlabel = "00:00";
  String maxpostlabel = "00:00";
  String audioasset = "assets/audio/Timal.mp3";
  bool isplaying = false;
  bool isRecording = false;

  late YoutubePlayerController _controller;

  RecorderStream _recorder = RecorderStream();

  List<Uint8List> _micChunks = [];
  bool _isRecording = false;

  late StreamSubscription _recorderStatus;
  late StreamSubscription _audioStream;

  AudioPlayer audioPlayer = AudioPlayer();

  @override
  void dispose() {
    _recorderStatus.cancel();
    _audioStream.cancel();
    super.dispose();
  }

  @override
  void initState(){
    music = widget.music;
    Future.delayed(Duration.zero, () async{
      ByteData bytes = await rootBundle.load(audioasset); //load audio from assets
      Uint8List audiobytes = bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
      int result = await audioPlayer.playBytes(audiobytes);
      isplaying = true;

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
    initPlugin();
    super.initState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlugin() async {
    _recorderStatus = _recorder.status.listen((status) {
      if (mounted) {
        setState(() {
          _isRecording = status == SoundStreamStatus.Playing;
        });
      }
    });

    _audioStream = _recorder.audioStream.listen((data) {
      _micChunks.add(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        int result = await audioPlayer.stop();
        if(result == 1){ //seek successful
          currentpos = 0;
          return true;
        }
        else {
          print("Seek unsuccessful.");
          return false;
        }
      },
      child: FutureBuilder<List<dynamic>>(
        future: Future.wait([
          LyricsSongManager().getSearch("${music.artistName} ${music.name}"),
        ]),
        builder: (context, snapshot){
          if(snapshot.hasData){
            search = snapshot.data?[0];
            _controller = YoutubePlayerController(
                initialVideoId: search.items?.first.id.videoId ?? "",
                flags: const YoutubePlayerFlags(
                  autoPlay: true,
                  mute: false,
                ),
            );
          }
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
                          TabBar(
                            indicatorColor: const Color.fromRGBO(212, 72, 79, 100),
                            labelColor: const Color.fromRGBO(212, 72, 79, 100) ,
                            unselectedLabelColor: Colors.white,
                            physics: const NeverScrollableScrollPhysics(),
                            tabs: const [
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
                            onTap: (int index) async {
                              int result = await audioPlayer.stop();
                              if(result == 1){
                                setState(() {
                                  isplaying = false;
                                });
                              }
                            },
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height - 150,
                            child: TabBarView(
                              physics: const NeverScrollableScrollPhysics(),
                              children: [
                                //Lecture
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
                                //Karaoke
                                Column(
                                  children: [
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    YoutubePlayer(
                                        controller: _controller,
                                        showVideoProgressIndicator: false,
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
                                //Enregistrement
                                Column(
                                  children: [
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    SizedBox(
                                        width: MediaQuery.of(context).size.width - 50,
                                        height: 400,
                                        child: DecoratedBox(
                                          decoration: BoxDecoration(
                                            border:  Border.all(
                                              color: Colors.white,
                                              width: 5,
                                            ),
                                          ),
                                        )
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
                                          icon: Icon(_isRecording?Icons.fiber_manual_record_rounded:Icons.fiber_manual_record_outlined),
                                          color: Colors.red,
                                          iconSize: 120,
                                          onPressed: _isRecording ? _recorder.stop : _recorder.start,
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
      )
    );
  }
}
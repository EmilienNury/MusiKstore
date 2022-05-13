import 'dart:async';
import 'dart:typed_data';

import 'package:audio_session/audio_session.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart'show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:ptut_2/core/manager/lyrics_songs_manager.dart';
import 'package:ptut_2/core/model/Songs/song.dart';
import 'package:ptut_2/core/model/Videos/list_search.dart';
import 'package:ptut_2/theme/colors.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter_sound_platform_interface/flutter_sound_recorder_platform_interface.dart';

typedef _Fn = void Function();


const theSource = AudioSource.microphone;


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

  int maxduration = 100;
  int currentpos =0;
  String currentpostlabel = "00:00";
  String maxpostlabel = "00:00";
  String audioasset = "assets/audio/";
  bool isplaying = false;
  bool callAPi = false;

  Codec _codec = Codec.pcm16WAV;
  String _mPath = 'tau_file.mp4';
  FlutterSoundPlayer? _mPlayer = FlutterSoundPlayer();
  FlutterSoundRecorder? _mRecorder = FlutterSoundRecorder();
  bool _mPlayerIsInited = false;
  bool _mRecorderIsInited = false;
  bool _mplaybackReady = false;

  AudioPlayer audioPlayer = AudioPlayer();

  var files;

  @override
  void dispose() {
    _mPlayer!.closePlayer();
    _mPlayer = null;

    _mRecorder!.closeRecorder();
    _mRecorder = null;
    super.dispose();
  }

  @override
  void initState(){
    music = widget.music;
    Future.delayed(Duration.zero, () async{
      switch(music.name){
        case "CELINE 3X":
          audioasset+="CELINE.mp3";
          break;
        case "Filtré":
          audioasset+="Timal.mp3";
          break;
        case "Si j'savais":
          audioasset+="Si_jsavais.mp3";
          break;
        case "Dégaine (feat. Damso)":
          audioasset+="Dégaine.mp3";
          break;
        case "Sans effet":
          audioasset+="Sans_Effet.mp3";
      }
      ByteData bytes = await rootBundle.load(audioasset); //load audio from assets
      Uint8List audiobytes = bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
      await audioPlayer.playBytes(audiobytes);
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

    _mPlayer!.openPlayer().then((value) {
      setState(() {
        _mPlayerIsInited = true;
      });
    });

    openTheRecorder().then((value) {
      setState(() {
        _mRecorderIsInited = true;
      });
    });
    super.initState();
  }

  Future<void> openTheRecorder() async {
    if (!kIsWeb) {
      var status = await Permission.microphone.request();
      if (status != PermissionStatus.granted) {
        throw RecordingPermissionException('Microphone permission not granted');
      }
    }
    await _mRecorder!.openRecorder();
    if (!await _mRecorder!.isEncoderSupported(_codec) && kIsWeb) {
      _codec = Codec.opusWebM;
      _mPath = 'tau_file.webm';
      if (!await _mRecorder!.isEncoderSupported(_codec) && kIsWeb) {
        _mRecorderIsInited = true;
        return;
      }
    }
    final session = await AudioSession.instance;
    await session.configure(AudioSessionConfiguration(
      avAudioSessionCategory: AVAudioSessionCategory.playAndRecord,
      avAudioSessionCategoryOptions:
      AVAudioSessionCategoryOptions.allowBluetooth |
      AVAudioSessionCategoryOptions.defaultToSpeaker,
      avAudioSessionMode: AVAudioSessionMode.spokenAudio,
      avAudioSessionRouteSharingPolicy:
      AVAudioSessionRouteSharingPolicy.defaultPolicy,
      avAudioSessionSetActiveOptions: AVAudioSessionSetActiveOptions.none,
      androidAudioAttributes: const AndroidAudioAttributes(
        contentType: AndroidAudioContentType.speech,
        flags: AndroidAudioFlags.none,
        usage: AndroidAudioUsage.voiceCommunication,
      ),
      androidAudioFocusGainType: AndroidAudioFocusGainType.gain,
      androidWillPauseWhenDucked: true,
    ));

    _mRecorderIsInited = true;
  }

  void record() {
    _mRecorder!
        .startRecorder(
      toFile:'/storage/emulated/0/Download/${music.artistName}_${music.name}_Karaoke.wav',
      codec: _codec,
      audioSource: theSource,
    )
        .then((value) {
      setState(() {});
    });
  }


  void stopRecorder() async {
    await _mRecorder!.stopRecorder().then((value) {
      setState(() {
        //var url = value;
      });
      setState(() {
      });
    });
  }

  void play() {
    assert(_mPlayerIsInited &&
        _mplaybackReady &&
        _mRecorder!.isStopped &&
        _mPlayer!.isStopped);
    _mPlayer!
        .startPlayer(
        fromURI: _mPath,
        //codec: kIsWeb ? Codec.opusWebM : Codec.aacADTS,
        whenFinished: () {
          setState(() {});
        })
        .then((value) {
      setState(() {});
    });
  }

  void stopPlayer() {
    _mPlayer!.stopPlayer().then((value) {
      setState(() {});
    });
  }

  _Fn? getPlaybackFn() {
    if (!_mPlayerIsInited || !_mplaybackReady || !_mRecorder!.isStopped) {
      return null;
    }
    return _mPlayer!.isStopped ? play : stopPlayer;
  }

  _Fn? getRecorderFn() {
    if (!_mRecorderIsInited) {
      return null;
    }
    return _mRecorder!.isStopped ? record : stopRecorder;
  }


      @override
  Widget build(BuildContext context) {
    ListSearch? search;
    YoutubePlayerController? _controller;
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
          LyricsSongManager().getSearch("${music.artistName} ${music.name} lyrics"),
        ]),
        builder: (context, snapshot){
          if(snapshot.hasData){
            search = snapshot.data?[0];
          }
          _controller = YoutubePlayerController(
            initialVideoId: search?.items?.first.id.videoId ?? "",
            flags: const YoutubePlayerFlags(
              autoPlay: true,
              mute: false,
              disableDragSeek: true,
              loop: false,
              isLive: false,
              forceHD: false,
              enableCaption: false,
            ),
          );
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
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                          child: Text(
                                            currentpostlabel,
                                            style: const TextStyle(fontSize: 25),
                                            textAlign: TextAlign.right,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                          child: Text(
                                            maxpostlabel,
                                            style: const TextStyle(fontSize: 25),
                                            textAlign: TextAlign.left,
                                          ),
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
                                        controller: _controller!,
                                        showVideoProgressIndicator: false,
                                    ),
                                  ],
                                ),
                                //Enregistrement
                                Column(
                                  children: [
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    YoutubePlayer(
                                      controller: _controller!,
                                      showVideoProgressIndicator: false,
                                    ),
                                    IconButton(
                                      icon: Icon(_mRecorder!.isRecording?Icons.fiber_manual_record_rounded:Icons.fiber_manual_record_outlined),
                                      color: Colors.red,
                                      iconSize: 120,
                                      onPressed: getRecorderFn(),
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
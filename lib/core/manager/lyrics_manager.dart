import 'package:flutter/cupertino.dart';
import 'package:ptut_2/core/manager/api_manager_lyrics.dart';
import 'package:ptut_2/core/model/Lyrics/message.dart';
import 'package:ptut_2/core/model/Lyrics/musicxmatch.dart';

class LyricsManager{
  static final LyricsManager _instance = LyricsManager._internal();

  factory LyricsManager() => _instance;

  LyricsManager._internal();

  Future<Musicxmatch?> getLyrics(String track) async{
    Musicxmatch? message;
    try{
      message = await ApiManagerLyrics().getOneLyrics(track);
    }catch(e){
      debugPrint("Error: $e");
    }
    return message;
  }

}
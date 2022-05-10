import 'package:flutter/cupertino.dart';
import 'package:ptut_2/core/manager/api_manager.dart';
import 'package:ptut_2/core/model/Lyrics/message.dart';
import 'package:ptut_2/core/model/Lyrics/musicxmatch.dart';
import 'package:ptut_2/core/model/Songs/feed.dart';
import 'package:ptut_2/core/model/Songs/songs.dart';
import 'package:ptut_2/core/model/Videos/list_search.dart';

class LyricsSongManager{
  static final LyricsSongManager _instance = LyricsSongManager._internal();

  factory LyricsSongManager() => _instance;

  LyricsSongManager._internal();

  Future<Musicxmatch?> getLyrics(String track) async{
    Musicxmatch? message;
    try{
      message = await ApiManager().getOneLyrics(track);
    }catch(e){
      debugPrint("Error: $e");
    }
    return message;
  }

  Future<Songs?> getMostPopularSong() async{
    Songs? feed;
    try{
      feed = await ApiManager().getMostPopularSong();
    }catch(e){
      debugPrint("Error: $e");
    }
    return feed;
  }

  Future<ListSearch?> getSearch(String search) async{
    ListSearch? listSearch;
    try{
      listSearch = await ApiManager().getSearch(search);
    }catch(e){
      debugPrint("Error: $e");
    }
    return listSearch;
  }

}
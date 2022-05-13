import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:ptut_2/core/model/Lyrics/musicxmatch.dart';
import 'package:ptut_2/core/model/Songs/feed.dart';
import 'package:ptut_2/core/model/Songs/songs.dart';
import 'package:ptut_2/core/model/Videos/list_search.dart';

class ApiManager{
  static final ApiManager _instance = ApiManager._internal();

  factory ApiManager() => _instance;

  late Dio dioLyrics;
  late Dio dioSongs;
  late Dio dioVideos;

  ApiManager._internal() {
    dioLyrics = Dio();
    dioLyrics.options.baseUrl = "https://api.musixmatch.com/ws/1.1";

    dioSongs = Dio();
    dioSongs.options.baseUrl = "https://rss.applemarketingtools.com/api/v2/fr/music/";

    dioVideos = Dio();
    dioVideos.options.baseUrl = "https://youtube.googleapis.com/youtube/v3/";
  }

  ListSearch? parseSearch(dynamic json){
    if(json == null){
      return null;
    }
    return ListSearch.fromJson(json);
  }

  Musicxmatch? parseMessage(dynamic json){
    if(json == null){
      return null;
    }
    var valueMap = jsonDecode(json);

    try{
      return Musicxmatch.fromJson(valueMap);
    }catch(e){
      print("Error parasage: $e");
    }
  }

  Songs? parsePopularSong(dynamic json){
    if(json == null){
      return null;
    }
    return Songs.fromJson(json);
  }

  Future<ListSearch?> getSearch(String search) async{
    try{
      return await dioVideos.get("search",
          queryParameters: {"q" : search, "key": "AIzaSyBP_yoNeH6880N5lX7xTti56cF9dAf4hJ0"}
      ).then((response) => parseSearch(response.data));
    }catch(e){
      print("Error for videos: $e");
    }
  }

  Future<Musicxmatch?> getOneLyrics(String track) async {
    try{

      return await dioLyrics.get("/track.lyrics.get",
          queryParameters: {"commontrack_id": track, "apikey": "55a16120b18b87b1d01164fd7b60506f" },
          options: Options(
              contentType: Headers.jsonContentType,
              responseType: ResponseType.json
          )).then((response) => parseMessage(response.data));

    }catch(e){
      print("Error for lyrics: $e");
    }
  }

  Future<Songs?> getMostPopularSong() async{
    try{
      return await dioSongs.get("most-played/50/songs.json").then((response) => parsePopularSong(response.data));
    }catch(e){
      print("Error for songs: $e");
    }
  }

}
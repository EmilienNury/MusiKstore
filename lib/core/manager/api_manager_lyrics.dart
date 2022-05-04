import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:ptut_2/core/model/Lyrics/musicxmatch.dart';

class ApiManagerLyrics{
  static final ApiManagerLyrics _instance = ApiManagerLyrics._internal();

  factory ApiManagerLyrics() => _instance;

  late Dio dio;

  ApiManagerLyrics._internal() {
    dio = Dio();
    dio.options.baseUrl =
    "https://api.musixmatch.com/ws/1.1";
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

  Future<Musicxmatch?> getOneLyrics(String track) async {
    try{

      return await dio.get("/track.lyrics.get",
          queryParameters: {"commontrack_id": track, "apikey": "55a16120b18b87b1d01164fd7b60506f" },
          options: Options(
              contentType: Headers.jsonContentType,
              responseType: ResponseType.json
          )).then((response) => parseMessage(response.data));

    }catch(e){
      print("Error for lyrics: $e");
    }
  }


}
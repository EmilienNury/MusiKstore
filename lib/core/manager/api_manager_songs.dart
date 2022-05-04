import 'package:dio/dio.dart';

class ApiManagerSongs{
  static final ApiManagerSongs _instance = ApiManagerSongs._internal();

  factory ApiManagerSongs() => _instance;

  late Dio dio;

  ApiManagerSongs._internal(){
    dio = Dio();
    dio.options.baseUrl = "https://rss.applemarketingtools.com/api/v2/fr/music/";
  }
}
import 'package:dio/dio.dart';

class ApiManager{
  static final ApiManager _instance = ApiManager._internal();

  factory ApiManager() => _instance;

  late Dio dio;

  ApiManager._internal() {
    dio = Dio();
    dio.options.baseUrl =
    "https://api.musixmatch.com/ws/1.1/";
  }
}

import 'package:dio/dio.dart';

final dio = Dio(
  BaseOptions(
    connectTimeout: Duration(seconds: 15),
    // baseUrl: "https://api.themoviedb.org"
  ),
);
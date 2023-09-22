import 'package:dio/dio.dart';
import 'package:wallet_paper_main/dio_service/dioservice.dart';

class ApiService {


  static Future<Response> get(String url) async {
    try {
        final response = await dio.get(url);
        return response;
    } catch (e){
      throw Exception( 'API resquest error: $e');
    }
  }

}
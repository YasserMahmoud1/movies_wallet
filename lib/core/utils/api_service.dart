import 'package:dio/dio.dart';

class ApiService {
  final _baseUrl = 'https://api.themoviedb.org/3/';
  final _apiKey = '2f8f8d6f2068c7fe7832805515f2cdbb';
  
  final Dio _dio;
  ApiService(this._dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get('$_baseUrl${endPoint}api_key=$_apiKey');
    return response.data;
  }
}

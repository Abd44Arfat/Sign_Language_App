import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;

  final String baseUrl = "http://10.0.2.2:3000";
  final String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NmVkYzJjYTA0NGY5YjFhYjgzNDQ0OWMiLCJuYW1lIjoiYW55dGhpbmciLCJpYXQiOjE3MjY4NTgyODF9.kJGXhbpxleF4KWFBY_eRL1ITDa2KzxpsumLquCzeeHk";

  ApiService(this._dio) {
    // Set the default headers
    _dio.options.headers["token"] = token; // Set the token key
  }

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    try {
      var response = await _dio.get('$baseUrl$endPoint');
      return response.data;
    } on DioException catch (e) {
      // Handle errors here
      print('Error: ${e.response?.statusCode} - ${e.message}');
      throw e; // Optionally re-throw the exception
    }
  }
}

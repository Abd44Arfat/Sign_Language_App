// import 'package:dio/dio.dart';
// import 'package:sign_lang_app/core/utils/interceptors.dart';

// class ApiService {
//   final Dio _dio;

//   final String baseUrl = "http://10.0.2.2:3000";
//   final String token =
//       "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NmVkYzJjYTA0NGY5YjFhYjgzNDQ0OWMiLCJuYW1lIjoiYW55dGhpbmciLCJpYXQiOjE3MjY4NTgyODF9.kJGXhbpxleF4KWFBY_eRL1ITDa2KzxpsumLquCzeeHk";

//   ApiService(this._dio) {
//     // Set the default headers
//     _dio.options.headers["token"] = token; // Set the token key
//   }

//   Future<Map<String, dynamic>> get({required String endPoint}) async {
//     try {
//       var response = await _dio.get('$baseUrl$endPoint');
//       return response.data;
//     } on DioException catch (e) {
//       // Handle errors here
//       print('Error: ${e.response?.statusCode} - ${e.message}');
//       throw e; // Optionally re-throw the exception
//     }
//   }
// }





import 'package:dio/dio.dart';
import 'package:sign_lang_app/core/utils/interceptors.dart';

class DioClient {
  
  late final Dio _dio;
  DioClient(): _dio = Dio(
    BaseOptions(
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'token':'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NmYyYzFmNDU4Y2RmMmI1NTk0NDg4N2EiLCJuYW1lIjoiYWJkZWxyYWhtYW4iLCJpYXQiOjE3MjcxOTE0NDB9.HzPrFbYBxCZFwL0LAO_49xdUaNVhgcdAGNTlJ4OZcIA'
      },
      responseType: ResponseType.json,
      sendTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10)
    ),
  )..interceptors.addAll([LoggerInterceptor()]);

  // GET METHOD
  Future < Response > get(
    String url, {
      Map < String,
      dynamic > ? queryParameters,
      Options ? options,
      CancelToken ? cancelToken,
      ProgressCallback ? onReceiveProgress,
    }) async {
    try {
      final Response response = await _dio.get(
        url,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    }
    on DioException {
      rethrow;
    }
  }

  // POST METHOD
  Future < Response > post(
    String url, {
      data,
      Map < String,
      dynamic > ? queryParameters,
      Options ? options,
      ProgressCallback ? onSendProgress,
      ProgressCallback ? onReceiveProgress,
    }) async {
    try {
      final Response response = await _dio.post(
        url,
        data: data,
        options: options,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // PUT METHOD
  Future < Response > put(
    String url, {
      dynamic data,
      Map < String,
      dynamic > ? queryParameters,
      Options ? options,
      CancelToken ? cancelToken,
      ProgressCallback ? onSendProgress,
      ProgressCallback ? onReceiveProgress,
    }) async {
    try {
      final Response response = await _dio.put(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // DELETE METHOD
  Future < dynamic > delete(
    String url, {
      data,
      Map < String,
      dynamic > ? queryParameters,
      Options ? options,
      CancelToken ? cancelToken,
    }) async {
    try {
      final Response response = await _dio.delete(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
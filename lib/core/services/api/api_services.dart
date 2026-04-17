// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/core/errors/failur_request.dart';
import 'package:flutter_project/core/services/api/api_link.dart';
import 'package:flutter_project/core/services/services.dart';
// ignore: unused_import
import 'package:shared_preferences/shared_preferences.dart';

class ApiServices {
  final Dio _dio =
      Dio(
          BaseOptions(
            baseUrl: ApiLink.baseUrl,
            connectTimeout: const Duration(seconds: 30),
            receiveTimeout: const Duration(seconds: 30),
            sendTimeout: const Duration(seconds: 30),
            headers: {
              'Accept': 'application/json',
              'Content-Type': 'application/json',
            },
          ),
        )
        ..interceptors.add(
          InterceptorsWrapper(
            onRequest: (options, handler) async {
              print(
                "[${options.method}][${options.uri}] headers: ${options.headers}",
              );
              // ignore: unused_local_variable
              final service = SharedPreferencesService();

              final token = await service.getAccessToken();

              // ignore: unnecessary_null_comparison
              if (token != null && token.isNotEmpty) {
                options.headers['Authorization'] = 'Bearer $token';
              }
              handler.next(options);
            },
            onResponse: (response, handler) {
              // print("${response.data}");
              handler.next(response);
            },
            onError: (error, handler) {
              print("DIO ERROR: ${error.response?.data}");
              print("STATUS CODE: ${error.response?.statusCode}");
              handler.next(error);
            },
          ),
        );

  /// GET
  Future getData({
    required String url,
    Map<String, String>? headers,
    // String? token,
    BuildContext? context,
  }) async {
    try {
      final finalHeaders = {...?headers};

      // // 🔥 إصلاح التوكن هنا
      // if (token != null && token.isNotEmpty) {
      //   finalHeaders['Authorization'] = 'Bearer $token';
      // }

      final response = await _dio.get(
        url,
        options: Options(headers: finalHeaders),
      );

      if ([200, 201, 204].contains(response.statusCode)) {
        return response.data;
      } else {
        throw ServerFailure.fromResponse(response.statusCode, response.data);
      }
    } on DioException catch (e) {
      throw ServerFailure.fromDioError(e);
    }
  }

  /// POST
  Future postData({
    required String url,
    Map<String, dynamic>? body,
    Map<String, String>? headers,
    // String? token,
  }) async {
    try {
      final finalHeaders = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        ...?headers,
      };

      // // 🔥 إصلاح التوكن هنا أيضًا
      // if (token != null && token.isNotEmpty) {
      //   finalHeaders['Authorization'] = 'Bearer $token';
      // }

      final response = await _dio.post(
        url,
        data: body,
        options: Options(headers: finalHeaders),
      );

      if ([200, 201, 204].contains(response.statusCode)) {
        return response.data;
      } else {
        throw ServerFailure.fromResponse(response.statusCode, response.data);
      }
    } on DioException catch (e) {
      throw ServerFailure.fromDioError(e);
    }
  }

  /// POST FORM-DATA (Multipart)
  Future postFormData({
    required String url,
    required FormData data,
    Map<String, String>? headers,
  }) async {
    try {
      final finalHeaders = {
        'Accept': 'application/json',
        'Content-Type': 'multipart/form-data',
        ...?headers,
      };

      final response = await _dio.post(
        url,
        data: data,
        options: Options(headers: finalHeaders),
      );

      if ([200, 201, 204].contains(response.statusCode)) {
        return response.data;
      } else {
        throw ServerFailure.fromResponse(response.statusCode, response.data);
      }
    } on DioException catch (e) {
      throw ServerFailure.fromDioError(e);
    }
  }

  /// PUT
  Future putData({
    required String url,
    Map<String, dynamic>? body,
    Map<String, String>? headers,
    // String? token,
    BuildContext? context,
  }) async {
    try {
      final finalHeaders = {...?headers};

      // // 🔥 هذا كان سبب الـ 401 — تم إصلاحه
      // if (token != null && token.isNotEmpty) {
      //   finalHeaders['Authorization'] = 'Bearer $token';
      // }

      final response = await _dio.patch(
        url,
        data: body,
        options: Options(headers: finalHeaders),
      );

      if ([200, 201, 204].contains(response.statusCode)) {
        return response.data;
      } else {
        throw ServerFailure.fromResponse(response.statusCode, response.data);
      }
    } on DioException catch (e) {
      throw ServerFailure.fromDioError(e);
    }
  }
}

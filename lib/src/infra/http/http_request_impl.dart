import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:guide_app/src/domain/services/entities/response_error_entity.dart';
import 'package:guide_app/src/domain/services/service_response.dart';
import 'package:guide_app/src/domain/services/service_response_error.dart';
import 'package:guide_app/src/domain/services/service_response_success.dart';
import 'package:guide_app/src/infra/http/http_request.dart';

class HttpRequestImpl implements HttpRequest {
  late final Dio _dio;

  HttpRequestImpl() {
    _dio = Dio(BaseOptions(
      baseUrl: 'https://query2.finance.yahoo.com/',
      connectTimeout: REQUEST_TIMEOUT_MILLIS,
      receiveTimeout: REQUEST_TIMEOUT_MILLIS,
      contentType: 'application/json',
      headers: {'Cache-Control': 'no-cache'},
    ));
    _dio.interceptors.add(
      LogInterceptor(
        responseBody: true,
        requestHeader: true,
        error: true,
        request: true,
        requestBody: true,
        responseHeader: true,
      ),
    );
  }

  bool _isSuccess(int? statusCode) {
    if (statusCode == null) return false;
    if (statusCode >= 200 && statusCode <= 299) return true;
    return false;
  }

  @override
  Future<ServiceResponse<R>> request<R>(
      {required HttpMethod method,
      required String path,
      required String version,
      R Function(Map<String, dynamic> json)? fromJson,
      Map<String, dynamic>? queryParams,
      Map<String, dynamic>? body}) async {
    try {
      Response? response;

      switch (method) {
        case HttpMethod.get:
          response = await _dio.get(
            version + path,
            queryParameters: queryParams,
          );
          break;
        default:
      }

      if (_isSuccess(response?.statusCode)) {
        return ServiceResponseSuccess(
          response: fromJson?.call(response?.data),
        );
      }

      return ServiceResponseError(
        responseError: ResponseError(
            message: 'Ops! Tivemos algum problema, tente novamente.'),
      );
    } catch (exception) {
      log('ERROR', error: exception);
      final responseError = ResponseError(
          message: 'Ops! Tivemos algum problema, tente novamente.');
      return ServiceResponseError(responseError: responseError);
    }
  }
}

const int REQUEST_TIMEOUT_MILLIS = 30000;

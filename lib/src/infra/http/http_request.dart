import 'package:guide_app/src/domain/services/service_response.dart';

abstract class HttpRequest {
  Future<ServiceResponse<R>> request<R>({
    required HttpMethod method,
    required String path,
    required String version,
    R Function(Map<String, dynamic> json)? fromJson,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? body,
  });
}

enum HttpMethod { get, post, put, delete, patch }

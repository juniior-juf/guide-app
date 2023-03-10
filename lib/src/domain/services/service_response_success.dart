import 'package:guide_app/src/domain/services/entities/response_error_entity.dart';
import 'package:guide_app/src/domain/services/service_response.dart';
import 'package:guide_app/src/domain/use_cases/use_case_response.dart';
import 'package:guide_app/src/domain/use_cases/use_case_response_error.dart';
import 'package:guide_app/src/domain/use_cases/use_case_response_success.dart';

class ServiceResponseSuccess<T> implements ServiceResponse<T> {
  final T? response;

  ServiceResponseSuccess({required this.response});

  @override
  get data => response;

  @override
  ResponseError? get error => null;

  @override
  UseCaseResponse<R> getResult<R>({
    UseCaseResponseSuccess<R> Function(T? data)? onSuccess,
    UseCaseResponseError<ResponseError> Function(ResponseError error)? onError,
  }) {
    return onSuccess!(response);
  }
}

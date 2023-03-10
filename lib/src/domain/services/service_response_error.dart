import 'package:guide_app/src/domain/services/entities/response_error_entity.dart';
import 'package:guide_app/src/domain/services/service_response.dart';
import 'package:guide_app/src/domain/use_cases/use_case_response.dart';
import 'package:guide_app/src/domain/use_cases/use_case_response_error.dart';
import 'package:guide_app/src/domain/use_cases/use_case_response_success.dart';

class ServiceResponseError<T> extends ServiceResponse<T> {
  ResponseError responseError;

  ServiceResponseError({required this.responseError});

  @override
  get data => null;

  @override
  ResponseError? get error => responseError;

  @override
  UseCaseResponse<R> getResult<R>({
    UseCaseResponseSuccess<R> Function(T data)? onSuccess,
    UseCaseResponseError<ResponseError> Function(ResponseError error)? onError,
  }) {
    if (onError != null) onError(responseError);
    return UseCaseResponseError(error: responseError);
  }
}

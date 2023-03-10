import 'package:guide_app/src/domain/services/entities/response_error_entity.dart';
import 'package:guide_app/src/domain/use_cases/use_case_response.dart';
import 'package:guide_app/src/domain/use_cases/use_case_response_error.dart';
import 'package:guide_app/src/domain/use_cases/use_case_response_success.dart';

abstract class ServiceResponse<T> {
  UseCaseResponse<R> getResult<R>({
    UseCaseResponseSuccess<R> Function(T? data) onSuccess,
    UseCaseResponseError<ResponseError> Function(ResponseError error) onError,
  });

  T? get data;
  ResponseError? get error;
}

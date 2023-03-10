import 'package:guide_app/src/domain/services/entities/response_error_entity.dart';
import 'package:guide_app/src/domain/use_cases/use_case_response.dart';

class UseCaseResponseError<R> implements UseCaseResponse<R> {
  ResponseError error;

  UseCaseResponseError({required this.error});

  @override
  void getResult({
    Function(R)? onSuccess,
    Function(ResponseError)? onError,
  }) {
    onError?.call(error);
  }

  @override
  R? get data => null;
}

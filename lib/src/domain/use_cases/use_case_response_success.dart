import 'package:guide_app/src/domain/services/entities/response_error_entity.dart';
import 'package:guide_app/src/domain/use_cases/use_case_response.dart';

class UseCaseResponseSuccess<R> implements UseCaseResponse<R> {
  final R? response;

  UseCaseResponseSuccess({this.response});

  @override
  void getResult({
    Function(R? data)? onSuccess,
    Function(ResponseError error)? onError,
  }) {
    onSuccess?.call(response);
  }

  @override
  R? get data => response;
}

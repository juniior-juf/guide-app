import 'package:guide_app/src/domain/services/entities/response_error_entity.dart';

abstract class UseCaseResponse<R> {
  void getResult({
    void Function(R? data)? onSuccess,
    void Function(ResponseError error)? onError,
  });

  R? get data;
}

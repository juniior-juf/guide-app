import 'package:guide_app/src/domain/use_cases/use_case_response.dart';

abstract class UseCase<Result, Params> {
  Future<UseCaseResponse<Result?>> call(Params? params);
}

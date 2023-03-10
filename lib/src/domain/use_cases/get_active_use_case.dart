import 'package:guide_app/src/domain/entities/active_entity.dart';
import 'package:guide_app/src/domain/use_cases/use_case.dart';
import 'package:guide_app/src/domain/use_cases/use_case_response.dart';

abstract class GetActiveUseCase extends UseCase<ActiveEntity, String> {
  @override
  Future<UseCaseResponse<ActiveEntity?>> call(String? param);
}

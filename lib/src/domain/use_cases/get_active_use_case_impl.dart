import 'package:guide_app/src/data/repositories/active/active_repository.dart';
import 'package:guide_app/src/domain/entities/active_entity.dart';
import 'package:guide_app/src/domain/use_cases/get_active_use_case.dart';
import 'package:guide_app/src/domain/use_cases/use_case_response.dart';
import 'package:guide_app/src/domain/use_cases/use_case_response_error.dart';
import 'package:guide_app/src/domain/use_cases/use_case_response_success.dart';

class GetActiveUseCaseImpl extends GetActiveUseCase {
  final ActiveRepository _repository;

  GetActiveUseCaseImpl(this._repository);

  @override
  Future<UseCaseResponse<ActiveEntity?>> call(String? param) async {
    final res = await _repository.getActive(name: param!);
    return res.getResult(
      onSuccess: (data) {
        return UseCaseResponseSuccess(response: data);
      },
      onError: (error) {
        return UseCaseResponseError(error: error);
      },
    );
  }
}

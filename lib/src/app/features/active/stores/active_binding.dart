import 'package:get/get.dart';
import 'package:guide_app/src/app/features/active/controllers/active_controller.dart';
import 'package:guide_app/src/data/repositories/active/active_repository.dart';
import 'package:guide_app/src/data/repositories/active/active_repository_remote_impl.dart';
import 'package:guide_app/src/data/services.dart/active/active_service.dart';
import 'package:guide_app/src/data/services.dart/active/active_service_impl.dart';
import 'package:guide_app/src/domain/use_cases/get_active_use_case.dart';
import 'package:guide_app/src/domain/use_cases/get_active_use_case_impl.dart';
import 'package:guide_app/src/infra/http/http_request.dart';
import 'package:guide_app/src/infra/http/http_request_impl.dart';

class ActiveBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<HttpRequest>(HttpRequestImpl());
    Get.put<ActiveService>(ActiveServiceImpl(Get.find<HttpRequest>()));
    Get.put<ActiveRepository>(
        ActiveRepositoryRemoteImpl(Get.find<ActiveService>()));
    Get.put<GetActiveUseCase>(
        GetActiveUseCaseImpl(Get.find<ActiveRepository>()));
    Get.put(ActiveController(getActiveUseCase: Get.find<GetActiveUseCase>()));
  }
}

import 'package:guide_app/src/data/repositories/active/active_repository.dart';
import 'package:guide_app/src/data/services.dart/active/active_service.dart';
import 'package:guide_app/src/domain/services/service_response.dart';
import 'package:guide_app/src/domain/entities/active_entity.dart';

class ActiveRepositoryRemoteImpl extends ActiveRepository {
  final ActiveService _service;

  ActiveRepositoryRemoteImpl(this._service);

  @override
  Future<ServiceResponse<ActiveEntity>> getActive({required String name}) {
    return _service.getActive(name: name);
  }
}

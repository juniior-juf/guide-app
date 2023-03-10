import 'package:guide_app/src/domain/entities/active_entity.dart';
import 'package:guide_app/src/domain/services/service_response.dart';

abstract class ActiveRepository {
  Future<ServiceResponse<ActiveEntity>> getActive({required String name});
}

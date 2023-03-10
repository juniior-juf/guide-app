import 'package:guide_app/src/data/models/active_model.dart';
import 'package:guide_app/src/domain/services/service_response.dart';

abstract class ActiveService {
  Future<ServiceResponse<ActiveModel>> getActive({required String name});
}

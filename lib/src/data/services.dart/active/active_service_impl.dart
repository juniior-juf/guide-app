import 'package:guide_app/src/data/models/active_model.dart';
import 'package:guide_app/src/data/services.dart/active/active_service.dart';
import 'package:guide_app/src/domain/services/service_response.dart';
import 'package:guide_app/src/infra/http/http_request.dart';

class ActiveServiceImpl extends ActiveService {
  final HttpRequest _httpRequest;

  ActiveServiceImpl(this._httpRequest);

  @override
  Future<ServiceResponse<ActiveModel>> getActive({required String name}) async {
    return await _httpRequest.request(
      method: HttpMethod.get,
      path: '/finance/chart/$name',
      version: '/v8',
      fromJson: (json) => ActiveModel.fromJson(json),
    );
  }
}

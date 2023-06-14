import 'package:donor_darah/base/base_config.dart';
import 'package:http/http.dart';

import '../../../../domain/model/request/register/register_request.dart';

class RegisterRemoteService {
  Client client = Client();

  Future<Response> userRegister(RegisterRequest request) async {
    final url = Uri.http(
        BaseConfig.baseDomain, BaseConfig.basePath + BaseConfig.fetcRegister);

    return client.post(
      url,
      body: {request.toJson()},
    );
  }

  Future<Response> fetchJob(RegisterRequest request) async {
    final url = Uri.http(
        BaseConfig.baseDomain, BaseConfig.basePath + BaseConfig.fetchJob);

    return client.post(
      url,
      body: {request.toJson()},
    );
  }

  Future<Response> fetchUnit(RegisterRequest request) async {
    final url = Uri.http(
        BaseConfig.baseDomain, BaseConfig.basePath + BaseConfig.fetchUnit);

    return client.post(
      url,
      body: {request.toJson()},
    );
  }
}

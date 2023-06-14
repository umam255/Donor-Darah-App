import 'package:http/http.dart';
import '../../../../base/base_config.dart';
import '../../../../domain/base/auth_header_req.dart';

class ProfileRemoteService {
  Client client = Client();

  Future<Response> fetchProfile(AuthenticationHeaderRequest header) async {
    final urI = Uri.http(
        BaseConfig.baseDomain, BaseConfig.basePath + BaseConfig.fetcProfile);
    return client.get(urI);
  }
}

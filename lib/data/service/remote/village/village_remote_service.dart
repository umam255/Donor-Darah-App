import 'package:donor_darah/domain/base/auth_header_req.dart';
import 'package:http/http.dart';
import '../../../../base/base_config.dart';

class VillageRemoteService {
  Client client = Client();
  Future<Response> fetchVillage(AuthenticationHeaderRequest header) async {
    final urI = Uri.http(
        BaseConfig.baseDomain, BaseConfig.basePath + BaseConfig.fetchVillage);
    return client.get(urI);
  }
}

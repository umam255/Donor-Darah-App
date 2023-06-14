import 'package:donor_darah/base/base_config.dart';
import 'package:http/http.dart';

class DistrictRemoteService {
  Client client = Client();

  Future<Response> fetchDistrict() async {
    final urI = Uri.http(
        BaseConfig.baseDomain, BaseConfig.basePath + BaseConfig.fetchDistrict);
    return client.get(urI);
  }
}

import 'package:donor_darah/domain/model/request/update_profil/update_profile-request.dart';
import 'package:http/http.dart';
import '../../../../base/base_config.dart';

class UpdateProfileRemoteService {
  Client client = Client();

  Future<Response> updateRequest(UpdateProfileRequest request) async {
    final urI = Uri.http(BaseConfig.baseDomain,
        BaseConfig.basePath + BaseConfig.fetcUpdateProfile);
    return client.get(urI);
  }
}

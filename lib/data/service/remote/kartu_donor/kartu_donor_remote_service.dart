// ignore_for_file: non_constant_identifier_names

import 'package:donor_darah/domain/base/auth_header_req.dart';
import 'package:http/http.dart';

import '../../../../base/base_config.dart';

class KartuDonorRemoteService {
  Client client = Client();

  Future<Response> fetchKartuDonor(AuthenticationHeaderRequest header) async {
    final UrI = Uri.http(BaseConfig.baseDomain, BaseConfig.fetchKartuDonor);
    return client.get(UrI);
  }
}

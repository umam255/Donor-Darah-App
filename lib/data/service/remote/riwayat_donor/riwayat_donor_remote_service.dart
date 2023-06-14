import 'package:donor_darah/base/base_config.dart';
import 'package:donor_darah/domain/base/auth_header_req.dart';
import 'package:http/http.dart';

class RiwayatDonorRemoteService {
  Client client = Client();

  Future<Response> fetchRiwayatDonor(AuthenticationHeaderRequest header) async {
    final urI = Uri.http(BaseConfig.baseDomain, BaseConfig.fetchRiwayatDonor);
    return client.get(urI);
  }
}

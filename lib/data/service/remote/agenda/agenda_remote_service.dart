// ignore_for_file: unused_local_variable

import 'package:donor_darah/domain/base/auth_header_req.dart';
import 'package:http/http.dart';

import '../../../../base/base_config.dart';

class AgendaRemoteService {
  Client client = Client();

  Future<Response> fetchAgenda(AuthenticationHeaderRequest header) async {
    final url = Uri.http(BaseConfig.baseDomain, BaseConfig.fetchAgenda);
    return client.get(url);
  }

  Future<Response> fetchDetailAgenda(
      AuthenticationHeaderRequest header, int id) async {
    final url = Uri.http(BaseConfig.baseDomain, 'agenda/$id');
    return client.get(url);
  }
}

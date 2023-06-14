// ignore_for_file: avoid_print

import 'package:donor_darah/base/base_config.dart';
import 'package:http/http.dart';

import '../../../../domain/base/auth_header_req.dart';

class NotifikasiRemoteService {
  Client client = Client();

  Future<Response> fetchNotifikasi(AuthenticationHeaderRequest header) async {
    final url = Uri.https(BaseConfig.baseDomain, BaseConfig.fetchNotifikasi);

    return client.get(url);
  }

  Future<Response> fetchDetailNotifikasi(
      AuthenticationHeaderRequest header, int id) async {
    final url = Uri.http(BaseConfig.baseDomain, 'notifikasi/$id');

    return client.get(
      url,
    );
  }
}

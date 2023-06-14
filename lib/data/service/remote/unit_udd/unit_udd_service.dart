import 'package:donor_darah/base/base_config/base_config.dart';
import 'package:donor_darah/domain/base/authentication_headers_request.dart';
import 'package:http/http.dart';

class UnitUddService {
  Client client = Client();

  Future<Response> fetchUnitUdd(AuthenticationHeadersRequest header) async {
    final url = Uri.https(
      BaseConfig.BASE_DOMAIN,
      BaseConfig.BASE_PATH + BaseConfig.UNIT,
    );

    print("URL : ${url.toString()}");

    return client.get(url, headers: header.toHeader());
  }
}

import 'package:donor_darah/base/base_config/base_config.dart';
import 'package:http/http.dart';

class ForgotPassService {
  Client client = Client();

  Future<Response> postForgotPass(String email) async {
    final url = Uri.https(
      BaseConfig.BASE_DOMAIN,
      BaseConfig.BASE_PATH + BaseConfig.FORGOT_PASS,
    );

    print("URL : ${url.toString()}");
    print("URL : ${email}");

    return client.post(url, body: {
      "email": email,
    });
  }
}

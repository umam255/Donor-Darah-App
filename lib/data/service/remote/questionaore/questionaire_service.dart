import 'package:donor_darah/base/base_config/base_config.dart';
import 'package:donor_darah/domain/model/request/questionaire/questionaire_request.dart';
import 'package:http/http.dart';

class QuestionaireService {
  Client client = Client();

  Future<Response> postQuestionaire(QuestionaireRequest request) async {
    print("Jawaban Service : ${request.toJson()}");
    final url = Uri.https(
      BaseConfig.BASE_DOMAIN,
      BaseConfig.BASE_PATH + BaseConfig.FORGOT_PASS,
    );

    print("URL : ${url.toString()}");

    return client.post(url, body: request.toJson());
  }
}

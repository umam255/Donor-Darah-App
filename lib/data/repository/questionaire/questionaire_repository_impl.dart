import 'dart:convert';
import 'package:donor_darah/base/result_entity/result_entity.dart';
import 'package:donor_darah/data/base/base_remote_response.dart';
import 'package:donor_darah/data/service/remote/questionaore/questionaire_service.dart';
import 'package:donor_darah/domain/model/request/questionaire/questionaire_request.dart';
import 'package:donor_darah/domain/repository/questionaire/questionaire_repository.dart';

class QuestionaireRepositoryImpl implements QuestionaireRepository {
  final questionaireService = QuestionaireService();

  @override
  Future<ResultEntity> submitQuestionaire(QuestionaireRequest request) async {
    try {
      final response = await questionaireService.postQuestionaire(request);

      print("STATUS CODE: ${response.statusCode}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        BaseRemoteResponse baseResponse = BaseRemoteResponse.fromJson(
            jsonDecode(response.body), (json) => null);

        if (baseResponse.status == null) {
          return ResultError();
        } else if (baseResponse.status?.code != 0) {
          return ResultError(message: baseResponse.status?.message);
        } else {
          return ResultSuccess(baseResponse.data);
        }
      } else {
        return ResultError(message: "");
      }
    } catch (e) {
      return ResultError(message: "");
    }
  }
}

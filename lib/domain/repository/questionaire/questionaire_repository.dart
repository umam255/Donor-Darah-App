import 'package:donor_darah/base/result_entity/result_entity.dart';
import 'package:donor_darah/domain/model/request/questionaire/questionaire_request.dart';

abstract class QuestionaireRepository {
  Future<ResultEntity> submitQuestionaire(QuestionaireRequest request);
}

import 'package:donor_darah/base/result_entity/result_entity.dart';

abstract class ForgotPassRepository {
  Future<ResultEntity> submitForgotPass(String email);
}

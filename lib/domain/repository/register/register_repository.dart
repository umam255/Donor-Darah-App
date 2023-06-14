import 'package:donor_darah/base/result_entity.dart';

import '../../model/register/register_data.dart';
import '../../model/request/register/register_request.dart';

abstract class RegisterRepository {
  Future<ResultEntity<RegisterData>> registerUser(RegisterRequest request);
}

import 'package:donor_darah/base/result_entity.dart';
import 'package:donor_darah/domain/model/job/job_data.dart';
import 'package:donor_darah/domain/model/request/register/register_request.dart';

abstract class JobRepository {
  Future<ResultEntity<List<JobData>>> fetchJob(RegisterRequest request);
}

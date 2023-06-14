import 'dart:convert';
import 'package:donor_darah/domain/model/request/register/register_request.dart';
import '../../../base/result_entity.dart';
import '../../../domain/model/job/job_data.dart';
import '../../../domain/repository/job/job_repository.dart';
import '../../base/base_remote_response.dart';
import '../../model/job/job_remote_response.dart';
import '../../service/remote/register/register_remote_service.dart';

class JobRepositoryImpl implements JobRepository {
  final jobRemoteService = RegisterRemoteService();

  @override
  Future<ResultEntity<List<JobData>>> fetchJob(RegisterRequest request) async {
    try {
      final response = await jobRemoteService.fetchJob(request);

      if (response.statusCode == 200) {
        BaseRemoteResponse<List<JobRemoteResponse>> baseResponseArray =
            BaseRemoteResponse<List<JobRemoteResponse>>.fromJson(
                jsonDecode(response.body),
                (json) => (json as List)
                    .map((e) =>
                        JobRemoteResponse.fromJson(e as Map<String, dynamic>))
                    .toList());
        if (baseResponseArray.status == null) {
          return ResultError(message: baseResponseArray.status?.message);
        } else if (baseResponseArray.status?.code != 0) {
          return ResultError(message: baseResponseArray.status?.message);
        } else {
          return ResultSucces(
              baseResponseArray.data?.map((e) => e.toJobData()).toList() ??
                  List.empty());
        }
      } else {
        return ResultError<List<JobData>>(message: "");
      }
    } catch (e) {
      return ResultError(message: "");
    }
  }
}

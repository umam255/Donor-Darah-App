import 'dart:convert';

import '../../../base/result_entity.dart';
import '../../../domain/base/auth_header_req.dart';
import '../../../domain/model/profile/profile_data.dart';
import '../../../domain/repository/profile/profile_repository.dart';
import '../../base/base_remote_response.dart';
import '../../model/profile/profile_remote_response.dart';
import '../../service/remote/profile/profile_remote_service.dart';

class ProfileRemoteRepositoryImpl implements ProfileRepository {
  final profileRemoteService = ProfileRemoteService();

  @override
  Future<ResultEntity<ProfileData>> fetchProfile(
      AuthenticationHeaderRequest header) async {
    try {
      final response = await profileRemoteService.fetchProfile(header);
      if (response.statusCode == 200) {
        BaseRemoteResponse<ProfileRemoteResponse> baseStatusResponse =
            BaseRemoteResponse<ProfileRemoteResponse>.fromJson(
                jsonDecode(response.body),
                (json) => ProfileRemoteResponse.fromJson(
                    json as Map<String, dynamic>));

        if (baseStatusResponse.status == null) {
          return ResultError(message: baseStatusResponse.status?.message);
        } else if (baseStatusResponse.status?.code != 0) {
          return ResultError(message: baseStatusResponse.status?.message);
        } else {
          return ResultSucces(baseStatusResponse.data!.toProfileData());
        }
      } else {
        return ResultError<ProfileData>();
      }
    } catch (e) {
      return ResultError(message: "Data Not Found");
    }
  }
}

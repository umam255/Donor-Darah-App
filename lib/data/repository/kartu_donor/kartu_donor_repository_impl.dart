import 'dart:convert';
import 'package:donor_darah/base/result_entity.dart';
import 'package:donor_darah/data/model/kartu_donor/kartu_donor_remote_response.dart';
import 'package:donor_darah/domain/base/auth_header_req.dart';
import 'package:donor_darah/domain/model/kartu_donor/kartu_donor_data.dart';
import '../../../domain/repository/kartu_donor/kartu_donor_repository.dart';
import '../../base/base_remote_response.dart';
import '../../service/remote/kartu_donor/kartu_donor_remote_service.dart';

class KartuDonorRemoteRepositoryImpl implements KartuDonorRepository {
  final kartuDonorRemoteService = KartuDonorRemoteService();

  @override
  Future<ResultEntity<KartuDonorData>> fetchKartuDonor(
      AuthenticationHeaderRequest header) async {
    try {
      final response = await kartuDonorRemoteService.fetchKartuDonor(header);
      if (response.statusCode == 200) {
        BaseRemoteResponse<KartuDonorRemoteResponse> baseStatusResponse =
            BaseRemoteResponse<KartuDonorRemoteResponse>.fromJson(
                jsonDecode(response.body),
                (json) => KartuDonorRemoteResponse.fromJson(
                    json as Map<String, dynamic>));

        if (baseStatusResponse.status == null) {
          return ResultError(message: baseStatusResponse.status?.message);
        } else if (baseStatusResponse.status?.code != 0) {
          return ResultError(message: baseStatusResponse.status?.message);
        } else {
          return ResultSucces(baseStatusResponse.data!.toKartuDonorData());
        }
      } else {
        return ResultError<KartuDonorData>();
      }
    } catch (e) {
      return ResultError(message: "Data Not Found");
    }
  }
}

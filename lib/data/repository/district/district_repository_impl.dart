import 'dart:convert';

import 'package:donor_darah/base/result_entity.dart';
import 'package:donor_darah/data/base/base_remote_response.dart';
import 'package:donor_darah/data/model/district/district_remote_response.dart';
import 'package:donor_darah/data/service/remote/district/district_remote_service.dart';
import 'package:donor_darah/domain/repository/district/district_repository.dart';
import '../../../domain/model/district/district.dart';

class DistrictRepositoryImpl implements DistrictRepository {
  final districtRemoteService = DistrictRemoteService();

  @override
  Future<ResultEntity<List<DistrictData>>> fetchDistrict() async {
    try {
      final response = await districtRemoteService.fetchDistrict();

      if (response.statusCode == 200) {
        BaseRemoteResponse<List<DistrictRemoteResponse>> baseResponseArray =
            BaseRemoteResponse<List<DistrictRemoteResponse>>.fromJson(
                jsonDecode(response.body),
                (json) => (json as List)
                    .map((e) => DistrictRemoteResponse.fromJson(
                        e as Map<String, dynamic>))
                    .toList());
        if (baseResponseArray.status == null) {
          return ResultError(message: baseResponseArray.status?.message);
        } else if (baseResponseArray.status?.code != 0) {
          return ResultError(message: baseResponseArray.status?.message);
        } else {
          return ResultSucces(
              baseResponseArray.data?.map((e) => e.toDistrictData()).toList() ??
                  List.empty());
        }
      } else {
        return ResultError<List<DistrictData>>(message: "");
      }
    } catch (e) {
      return ResultError(message: "");
    }
  }
}

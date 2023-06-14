import 'dart:convert';

import 'package:donor_darah/base/result_entity.dart';

import 'package:donor_darah/data/service/remote/riwayat_donor/riwayat_donor_remote_service.dart';
import 'package:donor_darah/domain/base/auth_header_req.dart';
import 'package:donor_darah/domain/model/riwayat_donor/riwayat_donor_data.dart';
import 'package:donor_darah/domain/repository/riwayat_donor/riwayat_donor_repository.dart';

import '../../model/riwayat_donor/riwayat_donor_collection_remote_response.dart';

class RiwayatDonorRemoteRepositoryImpl implements RiwayatDonorRepository {
  final riwayatDonorRemoteService = RiwayatDonorRemoteService();

  @override
  Future<ResultEntity<List<RiwayatDonorData>>> fetchRiwayatDonor(
      AuthenticationHeaderRequest header) async {
    try {
      final response =
          await riwayatDonorRemoteService.fetchRiwayatDonor(header);
      if (response.statusCode == 200) {
        var json = RiwayatDonorCollectionRemoteResponse.fromJson(
                    jsonEncode(response.body) as Map<String, dynamic>)
                .data
                ?.map((e) => e.toRiwayatDonorData())
                .toList() ??
            List.empty();
        return ResultSucces<List<RiwayatDonorData>>(json);
      } else {
        return ResultError<List<RiwayatDonorData>>();
      }
    } catch (e) {
      return ResultError(message: "Data Not Found");
    }
  }
}

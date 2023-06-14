import 'dart:convert';

import 'package:donor_darah/base/result_entity.dart';

import 'package:donor_darah/data/model/agenda/agenda_remote_response.dart';
import 'package:donor_darah/domain/base/auth_header_req.dart';
import 'package:donor_darah/domain/model/agenda/agenda_data.dart';

import '../../../domain/model/agenda/agenda_detail_data.dart';
import '../../../domain/model/agenda/unit_data.dart';
import '../../../domain/model/agenda/user_data.dart';
import '../../../domain/repository/agenda/agenda_repository.dart';
import '../../base/base_remote_response.dart';
import '../../model/agenda/agenda_detail_remote_response.dart';
import '../../model/agenda/unit_data_remote_response.dart';
import '../../model/agenda/user_data_remote_response.dart';
import '../../service/remote/agenda/agenda_remote_service.dart';

class AgendaRemoteRepositoryImpl implements AgendaRepository {
  final agendaRemoteService = AgendaRemoteService();

  @override
  Future<ResultEntity<List<AgendaData>>> fetchAgenda(
      AuthenticationHeaderRequest header) async {
    try {
      final response = await agendaRemoteService.fetchAgenda(header);

      if (response.statusCode == 200) {
        BaseRemoteResponse<List<AgendaRemoteResponse>> baseResponseArray =
            BaseRemoteResponse<List<AgendaRemoteResponse>>.fromJson(
                jsonDecode(response.body),
                (json) => (json as List)
                    .map((e) => AgendaRemoteResponse.fromJson(
                        e as Map<String, dynamic>))
                    .toList());
        if (baseResponseArray.status == null) {
          return ResultError(message: baseResponseArray.status?.message);
        } else if (baseResponseArray.status?.code != 0) {
          return ResultError(message: baseResponseArray.status?.message);
        } else {
          return ResultSucces(
              baseResponseArray.data?.map((e) => e.toAgendaData()).toList() ??
                  List.empty());
        }
      } else {
        return ResultError<List<AgendaData>>(message: "");
      }
    } catch (e) {
      return ResultError(message: "");
    }
  }

  @override
  Future<ResultEntity<UserData>> fetchDetailUserAgenda(
      AuthenticationHeaderRequest header) async {
    try {
      final response = await agendaRemoteService.fetchAgenda(header);

      if (response.statusCode == 200) {
        BaseRemoteResponse<UserDataRemoteResponse> baseStatusResponse =
            BaseRemoteResponse<UserDataRemoteResponse>.fromJson(
                jsonDecode(response.body),
                (json) => UserDataRemoteResponse.fromJson(
                    json as Map<String, dynamic>));

        if (baseStatusResponse.status == null) {
          return ResultError(message: baseStatusResponse.status?.message);
        } else if (baseStatusResponse.status?.code != 0) {
          return ResultError(message: baseStatusResponse.status?.message);
        } else {
          return ResultSucces(baseStatusResponse.data!.toUserData());
        }
      } else {
        return ResultError<UserData>(message: "");
      }
    } catch (e) {
      return ResultError(message: "");
    }
  }

  @override
  Future<ResultEntity<UnitData>> fetchDetailUnitAgenda(
      AuthenticationHeaderRequest header) async {
    try {
      final response = await agendaRemoteService.fetchAgenda(header);

      if (response.statusCode == 200) {
        BaseRemoteResponse<UnitDataRemoteResponse> baseStatusResponse =
            BaseRemoteResponse<UnitDataRemoteResponse>.fromJson(
                jsonDecode(response.body),
                (json) => UnitDataRemoteResponse.fromJson(
                    json as Map<String, dynamic>));

        if (baseStatusResponse.status == null) {
          return ResultError(message: baseStatusResponse.status?.message);
        } else if (baseStatusResponse.status?.code != 0) {
          return ResultError(message: baseStatusResponse.status?.message);
        } else {
          return ResultSucces(baseStatusResponse.data!.toUnitData());
        }
      } else {
        return ResultError<UnitData>(message: "");
      }
    } catch (e) {
      return ResultError(message: "");
    }
  }

  @override
  Future<ResultEntity<AgendaDetailData>> fetchDetailAgenda(
      AuthenticationHeaderRequest header, int id) async {
    try {
      final response = await agendaRemoteService.fetchDetailAgenda(header, id);

      if (response.statusCode == 200) {
        BaseRemoteResponse<AgendaDetailRemoteResponse> baseStatusResponse =
            BaseRemoteResponse<AgendaDetailRemoteResponse>.fromJson(
                jsonDecode(response.body),
                (json) => AgendaDetailRemoteResponse.fromJson(
                    json as Map<String, dynamic>));

        if (baseStatusResponse.status == null) {
          return ResultError(message: baseStatusResponse.status?.message);
        } else if (baseStatusResponse.status?.code != 0) {
          return ResultError(message: baseStatusResponse.status?.message);
        } else {
          return ResultSucces(baseStatusResponse.data!.toAgendaDetailData());
        }
      } else {
        return ResultError<AgendaDetailData>(message: "");
      }
    } catch (e) {
      return ResultError(message: "");
    }
  }
}

// ignore_for_file: avoid_print, override_on_non_overriding_member

import 'dart:convert';

import 'package:donor_darah/base/result_entity.dart';
import 'package:donor_darah/data/base/base_remote_response.dart';
import 'package:donor_darah/data/model/register/register_remote_respon.dart';

import '../../../domain/model/register/register_data.dart';

import '../../../domain/model/request/register/register_request.dart';
import '../../../domain/repository/register/register_repository.dart';
import '../../service/remote/register/register_remote_service.dart';

class RegisterRemoteRepositoryImpl implements RegisterRepository {
  final registerRemoteService = RegisterRemoteService();

  @override
  Future<ResultEntity<RegisterData>> registerUser(
      RegisterRequest request) async {
    try {
      final response = await registerRemoteService.userRegister(request);
      if (response.statusCode == 200) {
        BaseRemoteResponse<RegisterRemoteResponse> baseStatusResponse =
            BaseRemoteResponse<RegisterRemoteResponse>.fromJson(
                jsonDecode(response.body),
                (json) => RegisterRemoteResponse.fromJson(
                    json as Map<String, dynamic>));
        if (baseStatusResponse.status == null) {
          return ResultError(message: baseStatusResponse.status?.message);
        } else if (baseStatusResponse.status?.code != 0) {
          return ResultError(message: baseStatusResponse.status?.message);
        } else {
          return ResultSucces(baseStatusResponse.data!.toRegisterData());
        }
      } else {
        return ResultError<RegisterData>(message: response.body);
      }
    } catch (e) {
      return ResultError(message: "Registrasi Gagal");
    }
  }
}

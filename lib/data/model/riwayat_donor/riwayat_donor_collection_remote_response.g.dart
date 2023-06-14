// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'riwayat_donor_collection_remote_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RiwayatDonorCollectionRemoteResponse
    _$RiwayatDonorCollectionRemoteResponseFromJson(Map<String, dynamic> json) =>
        RiwayatDonorCollectionRemoteResponse(
          status: json['status'] as String?,
          data: json['data'] == null
              ? null
              : RiwayatDonorRemoteResponse.fromJson(
                  json['data'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$RiwayatDonorCollectionRemoteResponseToJson(
        RiwayatDonorCollectionRemoteResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'village_remote_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VillageRemoteResponse _$VillageRemoteResponseFromJson(
        Map<String, dynamic> json) =>
    VillageRemoteResponse(
      id: json['id'] as int?,
      name: json['name'] as String?,
      code: json['code'] as int?,
      subDistrict: json['subDistrict'] as int?,
    );

Map<String, dynamic> _$VillageRemoteResponseToJson(
        VillageRemoteResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'subDistrict': instance.subDistrict,
      'code': instance.code,
      'name': instance.name,
    };

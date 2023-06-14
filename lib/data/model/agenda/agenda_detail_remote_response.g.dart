// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agenda_detail_remote_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AgendaDetailRemoteResponse _$AgendaDetailRemoteResponseFromJson(
        Map<String, dynamic> json) =>
    AgendaDetailRemoteResponse(
      json['id'] as int?,
      json['address'] as String?,
      json['date'] as String?,
      json['name'] as String?,
      json['timeEnd'] as String?,
      json['timeStart'] as String?,
      json['code'] as String?,
      (json['unit'] as List<dynamic>?)
          ?.map(
              (e) => UnitDataRemoteResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['user'] as List<dynamic>?)
          ?.map(
              (e) => UserDataRemoteResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AgendaDetailRemoteResponseToJson(
        AgendaDetailRemoteResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'date': instance.date,
      'timeStart': instance.timeStart,
      'timeEnd': instance.timeEnd,
      'address': instance.address,
      'code': instance.code,
      'unit': instance.unit,
      'user': instance.user,
    };

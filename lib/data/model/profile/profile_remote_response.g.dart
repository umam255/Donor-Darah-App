// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_remote_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileRemoteResponse _$ProfileRemoteResponseFromJson(
        Map<String, dynamic> json) =>
    ProfileRemoteResponse(
      memberCode: json['memberCode'] as String?,
      name: json['name'] as String?,
      urlImage: json['urlImage'] as String?,
      nextDonor: json['nextDonor'] as String?,
      lastDonor: json['lastDonor'] as String?,
      totalDonor: json['totalDonor'] as int?,
    );

Map<String, dynamic> _$ProfileRemoteResponseToJson(
        ProfileRemoteResponse instance) =>
    <String, dynamic>{
      'memberCode': instance.memberCode,
      'name': instance.name,
      'urlImage': instance.urlImage,
      'nextDonor': instance.nextDonor,
      'lastDonor': instance.lastDonor,
      'totalDonor': instance.totalDonor,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterRequest _$RegisterRequestFromJson(Map<String, dynamic> json) =>
    RegisterRequest(
      json['email'] as String?,
      json['villageId'] as int?,
      json['userName'] as String?,
      json['unitId'] as int?,
      json['subDistrictId'] as int?,
      json['postalCode'] as String?,
      json['phone'] as String?,
      json['passConfirm'] as String?,
      json['pass'] as String?,
      json['jobId'] as int?,
      json['gender'] as String?,
      json['dateOfBirth'] as String?,
      json['adrress'] as String?,
      json['placeOfBirth'] as String?,
    );

Map<String, dynamic> _$RegisterRequestToJson(RegisterRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'pass': instance.pass,
      'userName': instance.userName,
      'dateOfBirth': instance.dateOfBirth,
      'gender': instance.gender,
      'jobId': instance.jobId,
      'unitId': instance.unitId,
      'phone': instance.phone,
      'adrress': instance.adrress,
      'subDistrictId': instance.subDistrictId,
      'villageId': instance.villageId,
      'postalCode': instance.postalCode,
      'passConfirm': instance.passConfirm,
      'placeOfBirth': instance.placeOfBirth,
    };

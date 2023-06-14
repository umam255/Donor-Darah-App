import 'package:json_annotation/json_annotation.dart';

part 'register_request.g.dart';

@JsonSerializable()
class RegisterRequest {
  String? email;
  String? pass;
  String? userName;
  String? dateOfBirth;
  String? gender;
  int? jobId;
  int? unitId;
  String? phone;
  String? adrress;
  int? subDistrictId;
  int? villageId;
  String? postalCode;
  String? passConfirm;
  String? placeOfBirth;
  RegisterRequest(
      this.email,
      this.villageId,
      this.userName,
      this.unitId,
      this.subDistrictId,
      this.postalCode,
      this.phone,
      this.passConfirm,
      this.pass,
      this.jobId,
      this.gender,
      this.dateOfBirth,
      this.adrress,
      this.placeOfBirth);

  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestFromJson(json);

  Map<String, dynamic> toJson() {
    return _$RegisterRequestToJson(this);
  }
}

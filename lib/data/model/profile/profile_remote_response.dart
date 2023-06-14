import 'package:json_annotation/json_annotation.dart';
import '../../../domain/model/profile/profile_data.dart';

part 'profile_remote_response.g.dart';

@JsonSerializable()
class ProfileRemoteResponse implements ProfileRemoteResponseMapper {
  String? memberCode;
  String? name;
  String? urlImage;
  String? nextDonor;
  String? lastDonor;
  int? totalDonor;
  ProfileRemoteResponse(
      {this.memberCode,
      this.name,
      this.urlImage,
      this.nextDonor,
      this.lastDonor,
      this.totalDonor});

  factory ProfileRemoteResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileRemoteResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileRemoteResponseToJson(this);

  @override
  ProfileData toProfileData() {
    return ProfileData();
  }
}

abstract class ProfileRemoteResponseMapper {
  ProfileData toProfileData();
}

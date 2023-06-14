import 'package:donor_darah/domain/model/village/village_data.dart';
import 'package:json_annotation/json_annotation.dart';
part 'village_remote_response.g.dart';

abstract class VillageRemoteResponseMapper {
  VillageData toVillageData();
}

@JsonSerializable()
class VillageRemoteResponse implements VillageRemoteResponseMapper {
  int? id;
  int? subDistrict;
  int? code;
  String? name;
  VillageRemoteResponse({this.id, this.name, this.code, this.subDistrict});
  factory VillageRemoteResponse.fromJson(Map<String, dynamic> json) =>
      _$VillageRemoteResponseFromJson(json);
  Map<String, dynamic> toJson() => _$VillageRemoteResponseToJson(this);
  @override
  VillageData toVillageData() {
    return VillageData(
      id: id,
      subDistrict: subDistrict,
      code: code,
      name: "",
    );
  }
}

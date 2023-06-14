import 'package:donor_darah/data/model/agenda/unit_data_remote_response.dart';
import 'package:donor_darah/data/model/agenda/user_data_remote_response.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../domain/model/agenda/agenda_detail_data.dart';

part 'agenda_detail_remote_response.g.dart';

abstract class AgendaDetailRemoteResponseMapper {
  AgendaDetailData toAgendaDetailData();
}

@JsonSerializable()
class AgendaDetailRemoteResponse implements AgendaDetailRemoteResponseMapper {
  int? id;
  String? name;
  String? date;
  String? timeStart;
  String? timeEnd;
  String? address;
  String? code;
  List<UnitDataRemoteResponse>? unit;
  List<UserDataRemoteResponse>? user;
  AgendaDetailRemoteResponse(
      [this.id,
      this.address,
      this.date,
      this.name,
      this.timeEnd,
      this.timeStart,
      this.code,
      this.unit,
      this.user]);
  factory AgendaDetailRemoteResponse.fromJson(Map<String, dynamic> json) =>
      _$AgendaDetailRemoteResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AgendaDetailRemoteResponseToJson(this);

  @override
  AgendaDetailData toAgendaDetailData() {
    return AgendaDetailData(
        id: id,
        date: "",
        timeEnd: "",
        timeStart: "",
        address: "",
        name: "",
        code: "",
        unit: "",
        user: "");
  }
}

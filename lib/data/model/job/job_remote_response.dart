import 'package:donor_darah/domain/model/job/job_data.dart';
import 'package:json_annotation/json_annotation.dart';
part 'job_remote_response.g.dart';

abstract class JobRemoteResponseMapper {
  JobData toJobData();
}

@JsonSerializable()
class JobRemoteResponse implements JobRemoteResponseMapper {
  int? id;
  String? name;
  JobRemoteResponse({this.id, this.name});

  factory JobRemoteResponse.fromJson(Map<String, dynamic> json) =>
      _$JobRemoteResponseFromJson(json);
  Map<String, dynamic> toJson() => _$JobRemoteResponseToJson(this);
  @override
  JobData toJobData() {
    return JobData(id: id, name: "");
  }
}

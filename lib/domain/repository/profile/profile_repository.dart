import 'package:donor_darah/base/result_entity.dart';
import 'package:donor_darah/domain/base/auth_header_req.dart';
import 'package:donor_darah/domain/model/profile/profile_data.dart';

abstract class ProfileRepository {
  Future<ResultEntity<ProfileData>> fetchProfile(
      AuthenticationHeaderRequest header);
}

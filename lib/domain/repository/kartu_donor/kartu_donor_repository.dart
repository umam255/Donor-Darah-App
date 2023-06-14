import 'package:donor_darah/base/result_entity.dart';
import 'package:donor_darah/domain/base/auth_header_req.dart';
import 'package:donor_darah/domain/model/kartu_donor/kartu_donor_data.dart';

abstract class KartuDonorRepository {
  Future<ResultEntity<KartuDonorData>> fetchKartuDonor(
      AuthenticationHeaderRequest header);
}

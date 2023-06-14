import 'package:donor_darah/base/result_entity.dart';
import 'package:donor_darah/domain/base/auth_header_req.dart';
import '../../model/village/village_data.dart';

abstract class VillageRepository {
  Future<ResultEntity<List<VillageData>>> fetchVillage(
      AuthenticationHeaderRequest header);
}

import '../../../base/result_entity.dart';
import '../../model/district/district.dart';

abstract class DistrictRepository {
  Future<ResultEntity<List<DistrictData>>> fetchDistrict();
}

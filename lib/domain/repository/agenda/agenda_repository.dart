import 'package:donor_darah/base/result_entity.dart';
import 'package:donor_darah/domain/base/auth_header_req.dart';

import '../../model/agenda/agenda_data.dart';
import '../../model/agenda/agenda_detail_data.dart';
import '../../model/agenda/unit_data.dart';
import '../../model/agenda/user_data.dart';

abstract class AgendaRepository {
  Future<ResultEntity<List<AgendaData>>> fetchAgenda(
      AuthenticationHeaderRequest header);
  Future<ResultEntity<UnitData>> fetchDetailUnitAgenda(
      AuthenticationHeaderRequest header);
  Future<ResultEntity<UserData>> fetchDetailUserAgenda(
      AuthenticationHeaderRequest header);
  Future<ResultEntity<AgendaDetailData>> fetchDetailAgenda(
      AuthenticationHeaderRequest header, int id);
}

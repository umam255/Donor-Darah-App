import 'package:donor_darah/base/result_entity.dart';
import 'package:donor_darah/domain/model/Notifikasi/notifikasi_data.dart';

import '../../base/auth_header_req.dart';

abstract class NotifikasiRepository {
  Future<ResultEntity<List<NotifikasiData>>> fetchNotifikasi(
      AuthenticationHeaderRequest header);
  Future<ResultEntity<NotifikasiData>> fetchDetailNotifikasi(
      AuthenticationHeaderRequest header, int id);
}

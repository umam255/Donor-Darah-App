import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../base/result_entity.dart';
import '../../../../../domain/base/auth_header_req.dart';
import '../../../../../domain/model/Notifikasi/notifikasi_detail_data.dart';
import '../../../../../domain/repository/notifikasi/notifikasi_repository.dart';
part 'notifikasi_detail_state.dart';

class NotifikasiDetailCubit extends Cubit<NotifikasiDetailState> {
  final NotifikasiRepository repository;
  NotifikasiDetailCubit(this.repository) : super(const NotifikasiDetailState());

  Future<void> fetchNotifikasiDetail(
      AuthenticationHeaderRequest header, int id) async {
    print("Fetch Notifikasi Detail");

    final response = await repository.fetchDetailNotifikasi(header, id);
    if (response is ResultSucces) {
      emit(NotifikasiDetailIsSucces(data: (response as ResultSucces).data));
    } else {
      emit(NotifikasiDetailIsFailed(message: "Data Not Found"));
    }
  }
}

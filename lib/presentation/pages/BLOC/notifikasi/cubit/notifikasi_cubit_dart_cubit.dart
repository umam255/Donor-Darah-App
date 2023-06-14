// ignore_for_file: avoid_print

import 'package:donor_darah/base/result_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../domain/base/auth_header_req.dart';
import '../../../../../domain/repository/notifikasi/notifikasi_repository.dart';
import 'notifikasi_cubit_dart_state.dart';

class NotifikasiCubit extends Cubit<NotifikasiState> {
  final NotifikasiRepository repository;
  NotifikasiCubit(this.repository) : super(const NotifikasiState());

  Future<void> fetchNotifikasi(AuthenticationHeaderRequest header) async {
    print("Fetch Notifikasi");

    final response = await repository.fetchNotifikasi(header);
    if (response is ResultSucces) {
      emit(NotifikasiIsSucces(data: (response as ResultSucces).data));
    } else {
      emit(NotifikasiIsFailed(message: "Data Not Found"));
    }
  }
}

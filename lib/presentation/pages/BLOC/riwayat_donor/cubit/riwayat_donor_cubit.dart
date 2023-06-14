import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../base/result_entity.dart';
import '../../../../../domain/base/auth_header_req.dart';
import '../../../../../domain/model/riwayat_donor/riwayat_donor_data.dart';
import '../../../../../domain/repository/riwayat_donor/riwayat_donor_repository.dart';
part 'riwayat_donor_state.dart';

class RiwayatDonorCubit extends Cubit<RiwayatDonorState> {
  final RiwayatDonorRepository repository;
  RiwayatDonorCubit(this.repository) : super(const RiwayatDonorState());

  Future<void> fetchRiwayatDonor(AuthenticationHeaderRequest header) async {
    print("Fetch RiwayatDonor");

    final response = await repository.fetchRiwayatDonor(header);
    if (response is ResultSucces) {
      emit(RiwayatDonorIsSucces(data: (response as ResultSucces).data));
    } else {
      emit(RiwayatDonorIsFailed(message: "Data Not Found"));
    }
  }
}

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../base/result_entity.dart';
import '../../../../../domain/base/auth_header_req.dart';
import '../../../../../domain/model/kartu_donor/kartu_donor_data.dart';
import '../../../../../domain/repository/kartu_donor/kartu_donor_repository.dart';

part 'kartu_donor_state.dart';

class KartuDonorCubit extends Cubit<KartuDonorState> {
  final KartuDonorRepository repository;
  KartuDonorCubit(this.repository) : super(const KartuDonorState());

  Future<void> fetchKartuDonor(AuthenticationHeaderRequest header) async {
    print("Fetch KartuDonor");

    final response = await repository.fetchKartuDonor(header);
    if (response is ResultSucces) {
      emit(KartuDonorIsSucces(data: (response as ResultSucces).data));
    } else {
      emit(KartuDonorIsFailed(message: "Data Not Found"));
    }
  }
}

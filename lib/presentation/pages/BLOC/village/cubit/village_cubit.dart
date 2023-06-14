// ignore_for_file: avoid_print
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../base/result_entity.dart';
import '../../../../../domain/base/auth_header_req.dart';
import '../../../../../domain/model/village/village_data.dart';
import '../../../../../domain/repository/village/village_repository.dart';
part 'village_state.dart';

class VillageCubit extends Cubit<VillageState> {
  final VillageRepository repository;
  VillageCubit(this.repository) : super(const VillageState());

  Future<void> fetchNotifikasi(AuthenticationHeaderRequest header) async {
    print("Fetch Village");

    final response = await repository.fetchVillage(header);
    if (response is ResultSucces) {
      emit(VillageIsSucces(data: (response as ResultSucces).data));
    } else {
      emit(VillageIsFailed(message: "Data Not Found"));
    }
  }
}

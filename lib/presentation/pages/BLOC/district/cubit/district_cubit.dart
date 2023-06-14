import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../base/result_entity.dart';
import '../../../../../domain/model/district/district.dart';
import '../../../../../domain/repository/district/district_repository.dart';
part 'district_state.dart';

class DistrictCubit extends Cubit<DistrictState> {
  final DistrictRepository repository;
  DistrictCubit(this.repository) : super(const DistrictState());

  Future<void> fetchDistrict() async {
    print("Fetch District");

    final response = await repository.fetchDistrict();
    if (response is ResultSucces) {
      emit(DistrictIsSucces(data: (response as ResultSucces).data));
    } else {
      emit(DistrictIsFailed(message: "Data Not Found"));
    }
  }
}

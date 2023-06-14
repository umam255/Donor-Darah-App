import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../base/result_entity.dart';
import '../../../../../domain/base/auth_header_req.dart';
import '../../../../../domain/model/profile/profile_data.dart';
import '../../../../../domain/repository/profile/profile_repository.dart';
part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepository repository;
  ProfileCubit(this.repository) : super(const ProfileState());

  Future<void> fetchProfile(AuthenticationHeaderRequest header) async {
    print("Fetch Profile");

    final response = await repository.fetchProfile(header);
    if (response is ResultSucces) {
      emit(ProfileIsSucces(data: (response as ResultSucces).data));
    } else {
      emit(ProfileIsFailed(message: "Data Not Found"));
    }
  }
}

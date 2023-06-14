// ignore_for_file: avoid_print
import 'package:donor_darah/domain/model/request/register/register_request.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../base/result_entity.dart';
import '../../../../../domain/model/job/job_data.dart';
import '../../../../../domain/repository/job/job_repository.dart';
part 'job_state.dart';

class JobCubit extends Cubit<JobState> {
  final JobRepository repository;
  JobCubit(this.repository) : super(const JobState());

  Future<void> fetchJob(RegisterRequest request) async {
    print("Fetch Job");

    final response = await repository.fetchJob(request);
    if (response is ResultSucces) {
      emit(JobIsSucces(data: (response as ResultSucces).data));
    } else {
      emit(JobIsFailed(message: "Data Not Found"));
    }
  }
}

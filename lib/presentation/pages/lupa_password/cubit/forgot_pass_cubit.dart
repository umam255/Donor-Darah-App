import 'package:bloc/bloc.dart';
import 'package:donor_darah/base/result_entity/result_entity.dart';
import 'package:donor_darah/domain/repository/forgot_password/forgot_pass_repository.dart';
import 'package:equatable/equatable.dart';

part 'forgot_pass_state.dart';

class ForgotPassCubit extends Cubit<ForgotPassState> {
  final ForgotPassRepository repository;

  ForgotPassCubit(this.repository) : super(ForgotPassInitial());
  Future<void> btnForgotPass(String email) async {
    emit(ForgotPassIsLoading());
    final response = await repository.submitForgotPass(email);
    if (response is ResultSuccess) {
      emit(
        ForgotPassIsSuccess(message: "Berhasil"),
      );
    } else {
      emit(ForgotPassIsError(message: (response as ResultError).message));
    }
  }
}

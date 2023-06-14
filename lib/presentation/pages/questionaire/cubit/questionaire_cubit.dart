import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:donor_darah/base/result_entity/result_entity.dart';
import 'package:donor_darah/domain/model/request/questionaire/questionaire_answer_request.dart';
import 'package:donor_darah/domain/model/request/questionaire/questionaire_request.dart';
import 'package:donor_darah/domain/repository/questionaire/questionaire_repository.dart';
import 'package:equatable/equatable.dart';

part 'questionaire_state.dart';

class QuestionaireCubit extends Cubit<QuestionaireState> {
  final QuestionaireRepository repository;

  QuestionaireCubit(this.repository) : super(QuestionaireInitial());
  Future btnQuestionaire(int scheduleId, Map<String, dynamic> answers) async {
    List<QuestionaireAnswerRequest> answerRequests = [];
    answers.forEach((key, value) {
      answerRequests.add(QuestionaireAnswerRequest(key, value));
    });

    QuestionaireRequest request = QuestionaireRequest(
      scheduleId,
      answerRequests,
    );

    emit(QuestionaireIsLoading());
    final response = await repository.submitQuestionaire(request);

    print("Jawaban Cubit : ${jsonEncode(request.toJson())}");

    if (response is ResultSuccess) {
      if (response.data == null) {
        emit(QuestionaireIsSuccess(message: "Berhasil"));
      }
    } else {
      emit(QuestionaireIsError(message: ""));
    }
  }
}

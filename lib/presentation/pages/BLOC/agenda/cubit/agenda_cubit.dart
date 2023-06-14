import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../base/result_entity.dart';
import '../../../../../domain/base/auth_header_req.dart';
import '../../../../../domain/model/agenda/agenda_data.dart';
import '../../../../../domain/repository/agenda/agenda_repository.dart';

part 'agenda_state.dart';

class AgendaCubit extends Cubit<AgendaState> {
  final AgendaRepository repository;
  AgendaCubit(this.repository) : super(const AgendaState());

  Future<void> fetchAgenda(AuthenticationHeaderRequest header) async {
    print("Fetch Agenda");

    final response = await repository.fetchAgenda(header);
    if (response is ResultSucces) {
      emit(AgendaIsSucces(data: (response as ResultSucces).data));
    } else {
      emit(AgendaIsFailed(message: "Data Not Found"));
    }
  }
}

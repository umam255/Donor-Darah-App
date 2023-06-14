import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../base/result_entity.dart';
import '../../../../../domain/base/auth_header_req.dart';
import '../../../../../domain/model/agenda/agenda_detail_data.dart';
import '../../../../../domain/repository/agenda/agenda_repository.dart';
part 'agenda_detail_state.dart';

class AgendaDetailCubit extends Cubit<AgendaDetailState> {
  final AgendaRepository repository;
  AgendaDetailCubit(this.repository) : super(const AgendaDetailState());

  Future<void> fetchAgendaDetail(
      AuthenticationHeaderRequest header, int id) async {
    print("Fetch Agenda Detail");

    final response = await repository.fetchDetailAgenda(header, id);
    if (response is ResultSucces) {
      emit(AgendaDetailIsSucces(data: (response as ResultSucces).data));
    } else {
      emit(AgendaDetailIsFailed(message: "Data Not Found"));
    }
  }
}

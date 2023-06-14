// ignore_for_file: avoid_print

import 'package:donor_darah/base/result_entity.dart';

import 'package:donor_darah/domain/repository/info_berita/info_berita_repository.dart';

import 'package:donor_darah/presentation/pages/BLOC/info_berita/info_berita_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InfoBeritaCubit extends Cubit<InfoBeritaState> {
  final InfoBeritaRepository repository;
  InfoBeritaCubit(this.repository) : super(InfoBeritaInitState());

  Future<void> fetchArticle(
      String page, String limit, String categoryId) async {
    print("Fetch Article");

    final response = await repository.beritaInfo(page, limit, categoryId);
    if (response is ResultSucces) {
      emit(InfoBeritaLoaded((response as ResultSucces).data));
    } else {
      emit(const InfoBeritaIsEmpty(message: "Data Is Empty"));
    }
  }
}

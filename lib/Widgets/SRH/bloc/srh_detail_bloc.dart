// ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:bertucanfrontend/Data/article.dart';
import 'package:bertucanfrontend/Repositories/srh_repository.dart';
import 'package:bertucanfrontend/Widgets/SRH/bloc/srh_detail_event.dart';
import 'package:bertucanfrontend/Widgets/SRH/bloc/srh_detail_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SRHDetailBloc extends Bloc<SRHDetailEvent, SRHDetailState> {
  SRHRepository srhRepository = SRHRepository();
  SRHDetailBloc({required this.srhRepository})
      : super(SRHDetailState(
            isLoading: true, exceptionError: '', articleData: ArticleData())) {
    // ignore: avoid_print
    print("not here yet");
    on<InitializeSRHDetailEvent>((event, emit) async {
      // ignore: avoid_print
      print("here");
      emit(SRHDetailState(
          isLoading: true, exceptionError: '', articleData: ArticleData()));
      final response = await srhRepository.getSRHArticleDetail(event.id);

      // ignore: avoid_print
      print(response);
      if (response.id != null) {
        emit(SRHDetailState(
            isLoading: false, articleData: response, exceptionError: ''));
      }
      emit(SRHDetailState(
          isLoading: false,
          articleData: response,
          exceptionError: response.toString()));
    });
  }
}

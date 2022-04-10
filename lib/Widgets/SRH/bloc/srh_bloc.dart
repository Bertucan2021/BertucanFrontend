// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:bertucanfrontend/Data/article.dart';
import 'package:bertucanfrontend/Repositories/srh_repository.dart';
import 'package:bertucanfrontend/Widgets/SRH/bloc/srh_event.dart';
import 'package:bertucanfrontend/Widgets/SRH/bloc/srh_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SRHBloc extends Bloc<SRHEvent, SRHState> {
  List<ArticleData> response = [];
  SRHRepository srhRepository = SRHRepository();
  SRHBloc({required this.srhRepository})
      : super(const SRHState(
            isLoading: true, articleData: [], exceptionError: '')) {
    // ignore: avoid_print
    on<InitializeSRH>((event, emit) async {
      // ignore: avoid_print
     emit(const SRHState(
        isLoading: true,
        articleData: [],
        exceptionError: '',
      ));
      response = await srhRepository.getSRHArticles();
      if (response.isNotEmpty) {
        emit(SRHState(
          isLoading: false,
          articleData: response,
          exceptionError: '',
        ));
      }
      emit(SRHState(
        isLoading: false,
        articleData: response,
        exceptionError: response.toString(),
      ));
    });

    on<SearchIconPressed>((event, emit) async {
      emit(SRHState(
        articleData: response,
        exceptionError: '',
        isLoading: false,
      ));

      if (event.searchTag.isNotEmpty) {
        if (response.isNotEmpty) {
          List<ArticleData> article = response
              .where((e) =>
                  e.title!
                      .toLowerCase()
                      .contains(event.searchTag.toString().toLowerCase()) &&
                  e.title!
                      .toLowerCase()
                      .startsWith(event.searchTag.toString().toLowerCase()))
              .toList();
          if (article.isNotEmpty) {
            emit(SRHState(
              articleData: article,
              exceptionError: '',
              isLoading: false,
            ));
          } else {
            emit(SRHState(
              articleData: article,
              exceptionError: "There are no articles found",
              isLoading: false,
            ));
          }
        } else {
          emit(SRHState(
            articleData: response,
            exceptionError: "There are no articles found",
            isLoading: false,
          ));
        }
      }
    });
  }
}

import 'package:bertucanfrontend/Data/article.dart';
import 'package:equatable/equatable.dart';

class SRHState extends Equatable {
  const SRHState(
      {required this.exceptionError,
      required this.isLoading,
      required this.articleData});

  final bool isLoading;
  final String exceptionError;
  final List<ArticleData> articleData;

  @override
  List<Object> get props => [isLoading, exceptionError, articleData];

  SRHState copyWith(
      {bool? isLoading,
      String? exceptionError,
      bool? isSearching,
      List<ArticleData>? articleData,
      bool? isSearchCompleted,
      ArticleData? searchedArticle}) {
    return SRHState(
      isLoading: isLoading ?? this.isLoading,
      exceptionError: exceptionError ?? this.exceptionError,
      articleData: articleData ?? this.articleData,
    );
  }
}

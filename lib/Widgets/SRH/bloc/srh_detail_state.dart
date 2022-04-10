import 'package:bertucanfrontend/Data/article.dart';
import 'package:equatable/equatable.dart';

class SRHDetailState extends Equatable {
  const SRHDetailState(
      {required this.exceptionError,
      required this.isLoading,
      required this.articleData});

  final bool isLoading;
  final String exceptionError;
  final ArticleData articleData;
  final String imageUrl = "https://bertucan.com/public/";

  @override
  List<Object> get props => [isLoading, exceptionError, articleData];

  SRHDetailState copyWith(
      {bool? isLoading, String? exceptionError, ArticleData? articleData}) {
    return SRHDetailState(
        isLoading: isLoading ?? this.isLoading,
        exceptionError: exceptionError ?? this.exceptionError,
        articleData: articleData ?? this.articleData);
  }
}

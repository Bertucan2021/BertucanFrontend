import 'package:bertucanfrontend/Data/article.dart';
import 'package:bertucanfrontend/Service/http_calls.dart';

class SRHRepository {
  final HttpCalls _httpCalls = HttpCalls();
  Future<List<ArticleData>> getSRHArticles() => _httpCalls.getSRHArticles();
  Future<ArticleData> getSRHArticleDetail(int id) =>
      _httpCalls.getSRHArticleDetail(id);
}

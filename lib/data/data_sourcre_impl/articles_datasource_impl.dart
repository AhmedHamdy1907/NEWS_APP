import 'package:news_apps/data/api/api_manger/ApiManger.dart';
import 'package:news_apps/data/data_source_contract/articles_datasource.dart';
import 'package:news_apps/data/model/articels_response/Articles.dart';
import 'package:news_apps/result.dart';

class ArticlesApiDataSourceImpl extends ArticlesDataSource {
  ApiManger apiManger;

  ArticlesApiDataSourceImpl({required this.apiManger});

  @override
  Future<Result<List<Articles>>> getArticles(String sourceId) async
  {
    Result<List<Articles>> result = await apiManger.getArticels(sourceId);
    switch (result) {
      case Success<List<Articles>>():
        return Success(data: result.data);
      case ServerError<List<Articles>>():
        return ServerError(code: result.code, massage: result.massage);
      case Error<List<Articles>>():
        return Error(exception: result.exception);
    }
  }


}
import 'package:news_apps/base/base_state/base_state.dart';
import 'package:news_apps/data/model/articels_response/Articles.dart';

import 'package:news_apps/result.dart';

import '../../domain/entity/Articles_entity.dart';
import '../../domain/repository_contract/articles_repository_contract.dart';
import '../data_source_contract/articles_datasource.dart';

class ArticlesRepositoryImpl extends ArticlesRepository 
{
  ArticlesDataSource articlesDataSource;
  ArticlesRepositoryImpl({required this.articlesDataSource});
  @override
 Future<Result<List<ArticlesEntity>>>getArticles(String sourceID)async
  {
   var result= await articlesDataSource.getArticles(sourceID);
   switch(result)
       {
   case Success<List<Articles>>():{
       List<ArticlesEntity> articles=result.data.map((articles)=>articles.toArticlesEntity()).toList();
       return Success(data: articles);
     }
     case ServerError<List<Articles>>():
       return ServerError(code: result.code,massage: result.massage);
     case Error<List<Articles>>():
     return  Error(exception: result.exception);
   }

  }
 
  
}

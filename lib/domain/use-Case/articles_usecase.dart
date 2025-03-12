import 'package:news_apps/domain/entity/Articles_entity.dart';
import 'package:news_apps/domain/repository_contract/articles_repository_contract.dart';

import '../../result.dart';

class GetArticlesUseCase
{
 ArticlesRepository repository;
 GetArticlesUseCase({required this.repository});
 Future<Result<List<ArticlesEntity>>> execute(String sourceID)
 {
   return repository.getArticles(sourceID);
 }
 
}
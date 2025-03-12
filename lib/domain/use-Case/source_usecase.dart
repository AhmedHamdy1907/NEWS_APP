import 'package:news_apps/data/data_source_contract/sources_datasource.dart';
import 'package:news_apps/domain/repository_contract/sources_repository_contract.dart';

import '../../result.dart';
import '../entity/Source_entity.dart';

class GetSourceUseCse
{
  SourcesRepository sourcesRepository;
  GetSourceUseCse({required this.sourcesRepository});
  Future<Result<List<SourceEntity>>> execute(String categoryId)
 {
   return  sourcesRepository.getSources(categoryId);
 }

}
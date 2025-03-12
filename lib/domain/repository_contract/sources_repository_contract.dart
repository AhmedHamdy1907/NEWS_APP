import 'package:news_apps/domain/entity/Source_entity.dart';
import '../../result.dart';
abstract class SourcesRepository{
  Future<Result<List<SourceEntity>>> getSources(String categoryId) ;
}
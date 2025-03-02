import '../data/model/SourcesResponse/Sources.dart';
import '../result.dart';
abstract class SourcesRepository{
  Future<Result<List<Source>>> getSources(String categoryId) ;
}
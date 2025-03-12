import 'package:news_apps/domain/entity/Source_entity.dart';

class ArticlesEntity
{
  SourceEntity? source;
String?title;
String?url;
String? urlToImage;
String? description;
String? publishedAt;
  String? content;

ArticlesEntity({this.title,this.description,this.source,this.url,this.publishedAt,this.urlToImage,this.content});



}
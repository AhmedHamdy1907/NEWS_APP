import 'package:flutter/material.dart';

import '../../../../../data/api/api_manger/ApiManger.dart';
import '../../../../../data/model/articels_response/Articles.dart';
import '../../Taps/articles/widget/articleWidget.dart';
// typedef MyListArticles = void Function(List<Articles>?articles);
class SearchResult extends StatelessWidget {
  String text;
  // MyListArticles articlesList;
   SearchResult({super.key,required this.text});
  @override
  Widget build(BuildContext context) {
    return   FutureBuilder(
        future: ApiManger.Searchresult(text),
        builder: (context, snapshot)
        {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.data?.status == "error" || snapshot.hasError) {
            return Text(
                snapshot.data?.message ?? "Check Enternet Connection");
// كده بقوله لو وصلت لي ال server  بس ال dat اللي جايه غلط اعرض ال massage
// طيب لو ال massage بي null معني ذللك انه موصلش لي ال server فبقوله اعرض سبب الايرور اللي موجود في ال snapshot
          }
          List<Articles> articles = snapshot.data!.articles!;
          return Expanded(
            child: ListView.builder(itemBuilder: (context, index) =>
                ArticleWidget(article: articles[index]),
              itemCount: articles.length,),
          );
        });
  }
}



import 'package:flutter/material.dart';
import 'package:news_apps/base/base_state/base_state.dart';
import 'package:news_apps/data/api/api_manger/ApiManger.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/utils/di.dart';
import '../../../../../../data/data_sourcre_impl/articles_datasource_impl.dart';
import '../../../../../../data/model/SourcesResponse/Sources.dart';
import '../../../../../../data/model/articels_response/Articles.dart';
import '../../../../../../data/repository_impl/articles_repository_impl.dart';
import '../../../../../common/error_state_widget.dart';
import '../../../../../common/loading_state_widgt.dart';
import '../viewModel/articelsViewModel.dart';
import '../widget/articleWidget.dart';

class ArticelsView extends StatefulWidget {
  ArticelsView({super.key, required this.source});

  Source source;

  @override
  State<ArticelsView> createState() => _ArticelsViewState();
}

class _ArticelsViewState extends State<ArticelsView> {
  ArticlesViewModel viewModel =ArticlesViewModel(articlesRepository:getArticlesRepository() );


  // ArticlesViewModel viewModel = ArticlesViewModel(
  //     articlesRepository: ArticlesRepositoryImpl(
  //         articlesDataSource:
  //             ArticlesApiDataSourceImpl(apiManger: ApiManger())));

  @override
  void initState() {
    super.initState();
    viewModel.getArticlesBySourceId(widget.source.id ?? "");
  }

  @override
  void didUpdateWidget(covariant ArticelsView oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    if (oldWidget.source.id != widget.source.id) {
      viewModel.getArticlesBySourceId(widget.source.id ?? "");
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: viewModel,
      child: Consumer<ArticlesViewModel>(
        builder: (context, viewModel, child) {
          BaseState state = viewModel.state;
          switch (state) {
            case SuccessState():
              return Expanded(
                  child: ListView.builder(
                itemBuilder: (context, index) =>
                    ArticleWidget(article: state.data[index]),
                itemCount: state.data.length,
              ));
            case LoadingState():
              return const LoadingStateWidget(
                loadingMessage: "plz wait....",
              );
            case ErrorState():
              //Todo
              return ErrorStateWidget(
                error: state.error,
                serverError: state.serverError,
                retryText: "retry",
                retryButtonAction: () {
                  viewModel.getArticlesBySourceId(widget.source.id ?? "");
                },
              );
          }
        },
      ),
    );
  }
}
// FutureBuilder(
// future: ApiManger.getArticels(source.id!),
// builder: (context, snapshot) {
// if (snapshot.connectionState == ConnectionState.waiting) {
// return const Center(
// child: CircularProgressIndicator(),
// );
// }
// if (snapshot.data?.status == "error" || snapshot.hasError) {
// return Text(
// snapshot.data?.message ?? "Check Enternet Connection");
// // كده بقوله لو وصلت لي ال server  بس ال dat اللي جايه غلط اعرض ال massage
// // طيب لو ال massage بي null معني ذللك انه موصلش لي ال server فبقوله اعرض سبب الايرور اللي موجود في ال snapshot
// }
// List<Articles> articles = snapshot.data!.articles!;
// return Expanded(
// child: ListView.builder(itemBuilder: (context, index) =>
// ArticleItem(article: articles[index]),
// itemCount: articles.length,),
// );
// })

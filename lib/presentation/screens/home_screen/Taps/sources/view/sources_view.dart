import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../../base/base_state/base_state.dart';
import '../../../../../../data_model/category_dataModel/category_data_model.dart';
import '../../../../../common/error_state_widget.dart';
import '../../../../../common/loading_state_widgt.dart';
import '../viewModel/Sources_viewModel.dart';
import '../widget/sourcesTabs.dart';

class sourcesView extends StatefulWidget {
  CategoryDM categoryDM;

  sourcesView({super.key, required this.categoryDM});

  @override
  State<sourcesView> createState() => _sourcesViewState();
}

class _sourcesViewState extends State<sourcesView> {
  SourcesViewModel viewModel = SourcesViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.getSourcesByCategoryId(widget.categoryDM.id);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: viewModel,
      child: Consumer<SourcesViewModel>(
        builder: (context, viewModel, child) {
          {
            BaseState state = viewModel.state;
            switch (state) {
              case SuccessState():
                return SourcesTabs(
                  sources: state.data,
                );
              case LoadingState():
                return const LoadingStateWidget(
                  loadingMessage: "plz wait....",
                );
              case ErrorState():
                return ErrorStateWidget(
                  error: state.error,
                  serverError: state.serverError,
                  retryText: "retry",
                  retryButtonAction: () {
                    viewModel.getSourcesByCategoryId(widget.categoryDM.id);
                  },
                );
            }
          }
        },
      ),
    );
  }
}
// return FutureBuilder(
//     future: ApiManger.getSources(categoryDM.id),
//     builder: (context, snapshot) {
//       if (snapshot.connectionState == ConnectionState.waiting) {
//         return const Center(
//           child: CircularProgressIndicator(),
//         );
//       }
//       if (snapshot.data?.status == "error" || snapshot.hasError) {
//         return Text(snapshot.data?.message ?? "Check Enter net Connection");
//        // كده بقوله لو وصلت لي ال server  بس ال data اللي جايه غلط اعرض ال massage//
//        // طيب لو ال massage بي null معني ذللك انه موصلش لي ال server فبقوله اعرض سبب الايرور اللي موجود في ال snapshot
//       }
//       List<Source>sources = snapshot.data?.sources??[];
//       return SourcesWidget(sources: sources,);
//     });

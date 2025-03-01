import 'package:flutter/material.dart';
import '../../../../../../data_model/category_dataModel/category_data_model.dart';
import '../../sources/view/sources_view.dart';
import '../../sources/viewModel/Sources_viewModel.dart';

class categoryDetails extends StatelessWidget {
  CategoryDM categoryDM;

  categoryDetails({super.key, required this.categoryDM});

  SourcesViewModel viewModel = SourcesViewModel();

  @override
  Widget build(BuildContext context) {
    return sourcesView( categoryDM: categoryDM);
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

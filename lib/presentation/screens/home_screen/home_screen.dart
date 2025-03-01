import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_apps/core/utils/assets_manger/assets_manger.dart';
import 'package:news_apps/presentation/screens/home_screen/Taps/category_details/view/category_details.dart';
import 'package:news_apps/presentation/screens/home_screen/Taps/settings/settings_taps.dart';
import 'package:news_apps/presentation/screens/home_screen/search/custom_search.dart';
import '../../../data_model/category_dataModel/category_data_model.dart';
import 'Taps/categoris/category.dart';
import 'home_drawer/home_drawer.dart';
class HomeScreen extends StatefulWidget {
   const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
     late Widget selectedWidget=CategorisTaps(onCategoryItemClciked: onCategoryClicked);
  String title="News App";
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(image: AssetImage(AssetsManager.routeImage))
      ),
      child: Scaffold(
        appBar: AppBar(
          title:  Text(title) ,
          actions:  [
            IconButton(
              onPressed:()
              {
                showSearch(context: context, delegate: customSearch());
              }
              ,
              icon: const Icon(Icons.search_rounded),),
           SizedBox(width: 20.w,)
          ],
        ),
        drawer:HomeDrawer(onDrawerItemClciked:onDrawerItemClciked),
          body: selectedWidget,
      ),

    );
  }
void onCategoryClicked( CategoryDM category)
{
  title=category.title;
  selectedWidget=categoryDetails(categoryDM: category,);
  setState(() {
  });
}
void onDrawerItemClciked(MenuItem item)
{
  switch(item)
      {
    case MenuItem.catgories:{selectedWidget=CategorisTaps(onCategoryItemClciked: onCategoryClicked,);}
    case MenuItem.settings:{selectedWidget=const SettingsTaps();}
  }
  setState(() {
  });
}
   // void _showSearchDialog(BuildContext context) {
   //   TextEditingController searchController = TextEditingController();
   //   showDialog(
   //     context: context,
   //     builder: (context) {
   //       return AlertDialog(
   //         title: Text('Search'),
   //         content: TextField(
   //           controller: searchController,
   //           decoration: InputDecoration(hintText: 'Enter search term'),
   //         ),
   //         actions: [
   //           TextButton(
   //             onPressed: () {
   //               Navigator.pop(context); // Close the dialog
   //             },
   //             child: Text('Cancel'),
   //           ),
   //           TextButton(
   //             onPressed: () {
   //               String searchTerm = searchController.text;
   //               // Do something with the search term, like searching in a list
   //               print('Search term: $searchTerm');
   //               Navigator.pop(context); // Close the dialog
   //             },
   //             child: Text('Search'),
   //           ),
   //         ],
   //       );
   //     },
   //   );
   // }

}



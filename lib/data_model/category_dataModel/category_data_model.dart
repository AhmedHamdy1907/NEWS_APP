import 'package:flutter/material.dart';
import 'package:news_apps/core/utils/colors_manger/colors_manger.dart';
import '../../core/utils/assets_manger/assets_manger.dart';
import '../../core/utils/constants_manger/constants_manger.dart';
import '../../core/utils/strings_manger/strings_manger.dart';

class CategoryDM
{
  String id;
  String title;
  Color bgColor;
  String imagePath;
  CategoryDM({required this.id,required this.title,required this.imagePath,required this.bgColor});
  static List<CategoryDM>getAllCategories=[
    CategoryDM(
        id:ConstantsManger.sportsBackEngId,
        title:StringsManger.sports,
        imagePath: AssetsManager.sports,
        bgColor: ColorsManger.red),
    CategoryDM(
        id:ConstantsManger.generalBackEngId,
        title:StringsManger.general,
        imagePath: AssetsManager.general,
        bgColor: Colors.grey),
    CategoryDM(
        id:ConstantsManger.healthsBackEngId,
        title:StringsManger.health,
        imagePath: AssetsManager.health,
        bgColor: ColorsManger.pink),
    CategoryDM(
        id:ConstantsManger.businessBackEngId,
        title:StringsManger.business,
        imagePath: AssetsManager.business,
        bgColor: ColorsManger.brown),
    CategoryDM(
        id:ConstantsManger.scienceBackEngId,
        title:StringsManger.science,
        imagePath: AssetsManager.science,
        bgColor: ColorsManger.yallow),
    CategoryDM(
        id:ConstantsManger.entertainmentBackEngId,
        title:StringsManger.entertainment,
        imagePath: AssetsManager.entertainment,
        bgColor: ColorsManger.blue),
    CategoryDM(
        id:ConstantsManger.technologyBackEngId,
        title:StringsManger.technology,
        imagePath: AssetsManager.technology,
        bgColor: ColorsManger.green),
  ];
}
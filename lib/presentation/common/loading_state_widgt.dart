import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_apps/core/utils/colors_manger/colors_manger.dart';

class LoadingStateWidget extends StatelessWidget {
  final String ?loadingMessage;
  const LoadingStateWidget({super.key,this.loadingMessage});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if(loadingMessage!=null)
            Text(loadingMessage!),
          SizedBox(width: 8.w,),
          const CircularProgressIndicator(color: ColorsManger.green,)
        ],
      ),
    );
  }
}

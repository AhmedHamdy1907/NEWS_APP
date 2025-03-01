import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_apps/result.dart';

class ErrorStateWidget extends StatelessWidget {
  ServerError? serverError;
  Error? error;
  String? retryText;
  VoidCallback ?retryButtonAction;
   ErrorStateWidget({super.key, this.serverError, this.error, this.retryButtonAction,this.retryText});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(extractError(),textAlign: TextAlign.center,),
          SizedBox(height: 4.h,),
          if(retryText!=null)
          ElevatedButton(onPressed: () {
            retryButtonAction?.call();
          }, child: Text(retryText!))
        ],
      ),
    );
  }
  String extractError ()
  {
    String message="Something wnt wrong";
    if (serverError?.massage!=null)
      {
        message=serverError!.massage;
        return message;
      }
    else if (error?.exception!=null)
    {
      Exception ex=error!.exception;
      switch(ex)
          {
        case SocketException():
          message="No Internet connection";
        case FormatException():
          message="Bad response format";
        case HttpException():
          message="Couldn't find the post";
      }
      return message;
    }
    return message;
  }
}

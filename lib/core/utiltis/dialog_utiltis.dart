
import 'package:flutter/material.dart';

class DialogUtils {
  static void showLoadingDialog({required BuildContext context}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
          content: Row(
        children: [
          CircularProgressIndicator(),
          SizedBox(
            width: 20,
          ),
          Text("Loading")
        ],
      )),
    );
  }
  static void hideDialog(context){
    Navigator.pop(context);

  }
  static void showMessageDialog({required BuildContext context,
    required String message,
    String? postiveTitle,
    void Function()? postiveClick,
    String? negativeTitle,
    void Function()? negativeClick

  }){
    showDialog(context: context, builder: (context)=>AlertDialog(
      content: Text(message) ,
      actions: [
         if(postiveTitle!=null)
        TextButton(onPressed: (){postiveClick!() ;}, child: Text(postiveTitle??"")),
        if(negativeTitle!=null)
        TextButton(onPressed: (){negativeClick !() ;}, child: Text(negativeTitle??"")),




      ],
    ));
  }
}

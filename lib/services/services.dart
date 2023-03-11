import 'package:chat_gpt/constant/constant.dart';

import 'package:chat_gpt/screens/widgets/textwidget.dart';
import 'package:flutter/material.dart';

class Services {
  static void showBottomSheet({required BuildContext context}) async {
    await showModalBottomSheet(
        shape:const  RoundedRectangleBorder(
             borderRadius:  BorderRadius.vertical(top: Radius.circular(10))),
        backgroundColor: scaffoldBackground,
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                  label: "Choose Model",
                  color: Colors.white,
                ),
               
              ],
            ),
          );
        });
  }
}

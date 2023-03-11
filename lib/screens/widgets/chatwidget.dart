// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chat_gpt/constant/constant.dart';
import 'package:flutter/material.dart';

import 'package:chat_gpt/screens/widgets/textwidget.dart';

// ignore: must_be_immutable
class ChatWidget extends StatelessWidget {
  int index;
  String text;
  ChatWidget({
    Key? key,
    required this.index,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: index == 0 ? cardColor : scaffoldBackground,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              index == 0
                  ? 'assets/images/user.jpg'
                  : 'assets/images/chatgpt.png',
              width: 30,
              height: 30,
            ),

            const SizedBox(
              width: 10,
            ),
            Flexible(
              child: index == 0
                  ? TextWidget(label: text, color: Colors.white)
                  : DefaultTextStyle(
                      style:const  TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                      child: AnimatedTextKit(
                        repeatForever: false,
                        displayFullTextOnTap: true,
                        isRepeatingAnimation: false,
                        totalRepeatCount: 0,
                        animatedTexts: [TyperAnimatedText(text.trim())],
                      ),
                    ),
            ),
            // index == 0
            //     ? SizedBox.shrink()
            //     : Row(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         mainAxisAlignment: MainAxisAlignment.end,
            //         // mainAxisSize: MainAxisSize.min,

            //         children: [
            //           IconButton(
            //               onPressed: () {},
            //               icon: Icon(Icons.thumb_up_alt_outlined)),
            //           IconButton(
            //               onPressed: () {},
            //               icon: Icon(Icons.thumb_down_alt_outlined))
            //         ],
            //       )
          ],
        ),
      ),
    );
  }
}

// ignore: file_names

import 'package:chat_gpt/constant/constant.dart';
import 'package:chat_gpt/models/chatModel.dart';
import 'package:chat_gpt/provider/chatProvider.dart';

import 'package:chat_gpt/screens/widgets/chatwidget.dart';
import 'package:chat_gpt/screens/widgets/textwidget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../services/services.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  FocusNode focusNode = FocusNode();
  final ScrollController _scrollController = ScrollController();
  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
    focusNode.dispose();
    _controller.dispose();
  }

  bool isTyping = false;
  List<ChatModel> chatList = [];

  setChatList( String query,
      ChatProvier chatProvider) async {
    setState(
      () {
        if (isTyping) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: TextWidget(
            label: "Don't allow multiple request",
            color: Colors.red,
          )));
          return;
        }
        if (_controller.text.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: TextWidget(
            label: "Please enter the message",
            color: Colors.red,
          )));
          return;
        }
        isTyping = true;
        // chatList.add(ChatModel(msg: _controller.text, chatIndex: 0));
        chatProvider.addUserMessage(msg: query);
        focusNode.unfocus();
        _controller.clear();
      },
    );
    await chatProvider.askQuetion(
        msg: query,);

    setState(
      () {
        isTyping = false;
      },
    );
    setScrollToEnd();
  }

  setScrollToEnd() {
    _scrollController.animateTo(_scrollController.position.maxScrollExtent,
        duration: const Duration(microseconds: 500), curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
   
    final chatProvier = Provider.of<ChatProvier>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ChatGPT",
          style: TextStyle(color: Colors.white),
        ),
        leading: Padding(
            padding: const EdgeInsets.all(8),
            child: Image.asset(
              "assets/images/chatgpt.png",
              height: 30,
              width: 30,
            )),
        actions: [
          IconButton(
              onPressed: () {
                chatProvier.clearChat();
                setState(() {
                  
                });
              },
              icon: const Icon(Icons.clear))
        ],
      ),
      body: SafeArea(
        child: Column(children: [
          Flexible(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: chatProvier.getChatList.length,
              itemBuilder: (context, index) {
                return ChatWidget(
                  index: chatProvier.getChatList[index]
                      .chatIndex, //chatList[index].chatIndex,
                  text: chatProvier.getChatList[index].msg,
                ); //chatList[index].msg);
              },
            ),
          ),
          if (isTyping) ...[
            const SpinKitThreeBounce(
              color: Colors.white,
              size: 18,
            ),
            const SizedBox(
              height: 10,
            ),
          ],
          Material(
            color: cardColor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      focusNode: focusNode,
                      style: const TextStyle(color: Colors.white),
                      controller: _controller,
                      decoration: const InputDecoration.collapsed(
                          hintText: "How can I help you?",
                          hintStyle: TextStyle(color: Colors.white)),
                    ),
                  ),
                  IconButton(
                    onPressed: () => setChatList(
                         _controller.text, chatProvier),
                    icon: const Icon(
                      Icons.send,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

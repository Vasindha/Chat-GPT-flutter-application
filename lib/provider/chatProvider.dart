import 'package:chat_gpt/models/chatModel.dart';
import 'package:chat_gpt/services/api_service.dart';
import 'package:flutter/material.dart';

class ChatProvier with ChangeNotifier {
  List<ChatModel> _chatList = [];
  List<ChatModel> get getChatList => _chatList;

  addUserMessage({required String msg}) {
    _chatList.add(ChatModel(msg: msg, chatIndex: 0));
    notifyListeners();
  }

  Future<void> askQuetion(
      {required String msg}) async {
    _chatList
        .addAll(await ApiService().getChatModel(msg: msg,));

    notifyListeners();
  }

  clearChat() {
    _chatList = [];
    notifyListeners();
  }
}

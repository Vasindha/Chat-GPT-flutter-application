import 'dart:convert';

import 'package:chat_gpt/constant/api_constant.dart';


import 'package:http/http.dart' as http;

import '../models/chatModel.dart';

class ApiService {
 

  //get chatmodel

  Future<List<ChatModel>> getChatModel(
      {required String msg}) async {
    try {
      var response = await http.post(
        Uri.parse(CHAT_URL),
        headers: {
          'Authorization': "Bearer $API_KEY",
          'Content-Type': 'application/json'
        },
        body: jsonEncode(
          {
            "model": "gpt-3.5-turbo",
            "messages": [
              {"role": "user", "content": msg}
            ],
            "temperature": 0.7
          },
        ),
      );

      Map<String, dynamic> res = jsonDecode(response.body);
      // print(res);
      List data = [];
      for (var i in res['choices']) {
        data.add(i);
      }
      return data.map((e) => ChatModel.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }
}

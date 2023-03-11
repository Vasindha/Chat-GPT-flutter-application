import 'package:chat_gpt/constant/constant.dart';
import 'package:chat_gpt/provider/chatProvider.dart';

import 'package:chat_gpt/screens/chatScreen.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => ChatProvier())],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Chat Gpt',
            theme: ThemeData(
                scaffoldBackgroundColor: scaffoldBackground,
                appBarTheme: const AppBarTheme(color: cardColor)),
            home: const ChatScreen()));
  }
}

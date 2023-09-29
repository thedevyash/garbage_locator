import 'package:flutter/material.dart';
import 'package:garbage_locator/chatbot/chat_body.dart';

class ChatBot extends StatefulWidget {
  const ChatBot({super.key});

  @override
  State<ChatBot> createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  @override
  Widget build(BuildContext context) {
    return ChatPage();
  }
}

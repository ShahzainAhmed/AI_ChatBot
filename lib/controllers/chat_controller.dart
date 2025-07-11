import 'dart:convert';
import 'package:chatgpt_clone/models/message_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ChatController extends GetxController {
  var messages = <MessageModel>[].obs;
  var messageController = TextEditingController().obs;

  final String _apiKey =
      "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";
  final String _apiUrl = "https://openrouter.ai/api/v1/chat/completions";

  final scrollController = ScrollController();

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void sendMessage() async {
    final text = messageController.value.text.trim();
    if (text.isEmpty) return;

    messages.add(MessageModel(role: "user", content: text));
    messageController.value.clear();
    _scrollToBottom();

    // Add temporary loading message
    messages.add(MessageModel(role: "bot", content: "Typing..."));
    _scrollToBottom();

    try {
      final response = await http.post(
        Uri.parse(_apiUrl),
        headers: {
          "Authorization": "Bearer $_apiKey",
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "model": "gpt-3.5-turbo",
          "messages": [
            {
              "role": "user",
              "content": text,
            }
          ]
        }),
      );

      // Remove the "Typing..." message
      messages.removeLast();

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final reply = data["choices"][0]["message"]["content"];
        messages.add(MessageModel(role: "bot", content: reply.trim()));
      } else {
        messages.add(MessageModel(
          role: "bot",
          content: "Error: ${response.statusCode} - ${response.reasonPhrase}",
        ));
      }

      _scrollToBottom();
    } catch (e, stackTrace) {
      messages.removeLast();
      messages.add(MessageModel(role: "bot", content: "Error: $e"));
      debugPrint("Error sending message: $e");
      debugPrint("StackTrace: $stackTrace");
      _scrollToBottom();
    }
  }
}

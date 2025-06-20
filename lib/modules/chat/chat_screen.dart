import 'package:chatgpt_clone/controllers/chat_controller.dart';
import 'package:chatgpt_clone/modules/chat/components/chat_input_field.dart';
import 'package:chatgpt_clone/modules/chat/components/chat_message_widget.dart';
import 'package:chatgpt_clone/modules/components/custom_appbar.dart';
import 'package:chatgpt_clone/resources/app_colors.dart';
import 'package:chatgpt_clone/resources/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  final ChatController chatController = Get.find<ChatController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.chatGPTBackground,
      appBar: CustomAppBar(title: "AI Chat Bot", circleAvatar: true),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Obx(() {
          return chatController.messages.isEmpty
              ? Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.smart_toy_outlined,
                          size: 64.sp, color: Colors.white70),
                      SizedBox(height: 16.h),
                      Text(
                        "How can I help you today?",
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 12.h),
                      Text(
                        "Ask me anything about parenting, child care,\nor get AI-powered guidance.",
                        textAlign: TextAlign.center,
                        style: AppTypography.kMedium14.copyWith(
                          color: Colors.white70,
                        ),
                      ),
                      SizedBox(height: 40.h),
                      ChatInputField(
                        controller: chatController.messageController.value,
                        onSendMessage: chatController.sendMessage,
                      ),
                    ],
                  ),
                )
              : Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        controller: chatController.scrollController,
                        padding: EdgeInsets.only(top: 8.h),
                        itemCount: chatController.messages.length,
                        itemBuilder: (context, index) {
                          return ChatMessageWidget(
                            message: chatController.messages[index],
                          );
                        },
                      ),
                    ),
                    ChatInputField(
                      controller: chatController.messageController.value,
                      onSendMessage: chatController.sendMessage,
                    ),
                  ],
                );
        }),
      ),
    );
  }
}

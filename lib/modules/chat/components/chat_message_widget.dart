import 'package:chatgpt_clone/models/message_model.dart';
import 'package:chatgpt_clone/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatMessageWidget extends StatelessWidget {
  final MessageModel message;

  const ChatMessageWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final isUser = message.role == "user";

    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: isUser
              ? AppColors.chatGPTUserBubble
              : AppColors.chatGPTBackground,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.r),
            topRight: Radius.circular(12.r),
            bottomLeft: Radius.circular(isUser ? 12.r : 0),
            bottomRight: Radius.circular(isUser ? 0 : 12.r),
          ),
        ),
        child: Text(
          message.content.trim(),
          style: TextStyle(
            color: Colors.white,
            fontSize: 14.sp,
          ),
        ),
      ),
    );
  }
}

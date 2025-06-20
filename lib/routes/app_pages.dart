import 'package:chatgpt_clone/modules/chat/binding/chat_binding.dart';
import 'package:chatgpt_clone/modules/chat/chat_screen.dart';
import 'package:chatgpt_clone/modules/profile/profile_screen.dart';
import 'package:chatgpt_clone/routes/app_routes.dart';
import 'package:get/get.dart';

class AppPages {
  AppPages._(); // private
  static var allPages = [
    GetPage(
      name: AppRoutes.chatScreen,
      binding: ChatsBinding(),
      page: () => ChatScreen(),
    ),
    GetPage(
      name: AppRoutes.profileScreen,
      page: () => ProfileScreen(),
    )
  ];
}

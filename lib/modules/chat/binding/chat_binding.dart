import 'package:chatgpt_clone/controllers/chat_controller.dart';
import 'package:get/get.dart';

class ChatsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChatController(), fenix: true);
  }
}

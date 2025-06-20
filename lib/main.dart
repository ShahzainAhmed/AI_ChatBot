import 'package:chatgpt_clone/resources/app_themes.dart';
import 'package:chatgpt_clone/routes/app_pages.dart';
import 'package:chatgpt_clone/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(defaultOverlay);
    return ScreenUtilInit(
      minTextAdapt: true,
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        getPages: AppPages.allPages,
        theme: Themes.primaryTheme,
        initialRoute: AppRoutes.chatScreen,
      ),
    );
  }
}

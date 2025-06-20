import 'package:chatgpt_clone/resources/app_assets.dart';
import 'package:chatgpt_clone/resources/app_colors.dart';
import 'package:chatgpt_clone/resources/app_typography.dart';
import 'package:chatgpt_clone/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isBackButton;
  final bool circleAvatar;
  final String title;

  const CustomAppBar({
    super.key,
    required this.title,
    this.isBackButton = false,
    this.circleAvatar = false,
  });

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    Widget? leadingWidget;

    if (isBackButton) {
      leadingWidget = GestureDetector(
        onTap: () => Get.back(),
        child: Padding(
          padding: EdgeInsets.only(right: 8.w),
          child: Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.kWhiteColor,
            size: 20.sp,
          ),
        ),
      );
    } else if (circleAvatar) {
      leadingWidget = GestureDetector(
        onTap: () => Get.toNamed(AppRoutes.profileScreen),
        child: Padding(
          padding: EdgeInsets.only(right: 8.w),
          child: CircleAvatar(
            radius: 16.r,
            foregroundImage: AssetImage(AppAssets.kProfileAvatar),
          ),
        ),
      );
    }

    return AppBar(
      backgroundColor: AppColors.chatGPTBackground,
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          leadingWidget ?? SizedBox(width: 40.w),
          Text(
            title,
            style:
                AppTypography.kMedium18.copyWith(color: AppColors.kWhiteColor),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(width: 40.w),
        ],
      ),
    );
  }
}

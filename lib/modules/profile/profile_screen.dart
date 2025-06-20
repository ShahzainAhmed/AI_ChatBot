import 'package:chatgpt_clone/models/profile_button_list.dart';
import 'package:chatgpt_clone/modules/profile/components/profile_button_widget.dart';
import 'package:chatgpt_clone/resources/app_assets.dart';
import 'package:chatgpt_clone/resources/app_colors.dart';
import 'package:chatgpt_clone/resources/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.chatGPTBackground,
      body: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 50.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.kSmokeColor.withAlpha(100),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () => Get.back(),
                    icon: Icon(
                      Icons.arrow_back_ios_new,
                      color: AppColors.kWhiteColor,
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      "Profile Settings",
                      style: AppTypography.kMedium16
                          .copyWith(color: AppColors.kWhiteColor),
                    ),
                  ),
                ),
                SizedBox(width: 48.w),
              ],
            ),
            SizedBox(height: 40.h),
            CircleAvatar(
              radius: 50.r,
              foregroundImage: AssetImage(AppAssets.kProfileAvatar),
              child: CircleAvatar(
                radius: 28.r,
                backgroundColor: AppColors.kGreyColor,
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              "Shahzain Ahmed",
              style:
                  AppTypography.kBold18.copyWith(color: AppColors.kWhiteColor),
            ),
            SizedBox(height: 4.h),
            Text(
              "Mobile App Developer",
              style:
                  AppTypography.kLight12.copyWith(color: AppColors.kSmokeColor),
            ),
            SizedBox(height: 40.h),
            ...profileButtonsAccount.map((button) {
              return Column(
                children: [
                  ProfileButtonWidget(
                    title: button['title'],
                    icon: button['icon'],
                  ),
                  SizedBox(height: 16.h),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}

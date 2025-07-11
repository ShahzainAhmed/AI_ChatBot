import 'package:chatgpt_clone/resources/app_colors.dart';
import 'package:chatgpt_clone/resources/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ProfileButtonWidget extends StatelessWidget {
  final String title;
  final String icon;

  const ProfileButtonWidget({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: AppColors.kSilverColor.withAlpha(200),
          minimumSize: Size(Get.width, 40.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
        child: ListTile(
          leading: SvgPicture.string(icon),
          title: Text(
            title,
            style: AppTypography.kMedium14,
          ),
          trailing: Icon(Icons.arrow_forward_ios, size: 16.sp),
        ));
  }
}

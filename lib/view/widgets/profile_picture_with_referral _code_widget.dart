import 'package:community_engaged_app/utils/app_colors.dart';
import 'package:community_engaged_app/view/widgets/custom_network_image.dart';
import 'package:community_engaged_app/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePictureWithReferralCodeWidget extends StatelessWidget {
  const ProfilePictureWithReferralCodeWidget({
    super.key,
    this.height = 104,
    this.width = 104,
    this.referralCode = "245323",
    this.showReferralCode = false,
    this.child,
  });

  final double height;
  final double width;
  final String referralCode;
  final bool showReferralCode;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          alignment: Alignment.center,
          height: height.h,
          width: width.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColor.primaryColor, width: 3),
          ),
          // child:child?? Image.asset(
          //   'https://i.pravatar.cc/150?img=29',
          //   fit: BoxFit.cover,
          // ),
          child:
              child ??
              CustomNetworkImage(
                imageUrl: 'https://i.pravatar.cc/150?img=30',
                height: 104.h,
                width: 104.w,
                boxShape: BoxShape.circle,
              ),
        ),
        if (showReferralCode)
          Container(
            alignment: Alignment.center,
            height: 27.h,
            width: 103.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColor.primaryColor,
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 4, right: 4, bottom: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomText(
                    text: referralCode,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontsize: 16.sp,
                  ),
                  GestureDetector(
                    onTap: () {
                      Clipboard.setData(ClipboardData(text: referralCode));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Copied to clipboard!')),
                      );
                    },
                    child: Icon(
                      Icons.copy_outlined,
                      color: AppColor.cardColorE9F2F9,
                      size: 20.h,
                      weight: .5,
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}

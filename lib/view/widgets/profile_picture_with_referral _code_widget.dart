import 'package:community_engaged_app/utils/app_colors.dart';
import 'package:community_engaged_app/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePictureWithReferralCodeWidget extends StatelessWidget {
  const ProfilePictureWithReferralCodeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CircleAvatar(
          radius: 60.r,
          backgroundImage: AssetImage(AppImage.splashScreenLogo),
        ),
        Container(
          alignment: Alignment.center,
          height: 25.h,
          width: 130.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.green,
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 4, right: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  '432563',
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w600,
                    color: AppColor.cardColorE9F2F9,
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Clipboard.setData(ClipboardData(text: '432563'));
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Copied to clipboard!')),
                    );
                  },
                  child: Icon(
                    Icons.copy_outlined,
                    color: AppColor.cardColorE9F2F9,
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
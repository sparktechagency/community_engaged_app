import 'package:community_engaged_app/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TermsOfServiceScreen extends StatefulWidget {
  const TermsOfServiceScreen({super.key});

  @override
  State<TermsOfServiceScreen> createState() => _TermsOfServiceScreenState();
}

class _TermsOfServiceScreenState extends State<TermsOfServiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: 'Support',
          fontsize: 22.sp,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomText(
              text:
                  'Lorem ipsum dolor sit amet consectetur. Enim massa aenean ac odio leo habitasse tortor tempor. Ut id urna odio dui leo congue. Ultrices pharetra ornare nam faucibus. Integer id varius consectetur non.',
              color: Colors.black,
              textOverflow: TextOverflow.fade,
              textAlign: TextAlign.start,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(height: 16.h),
            CustomText(
              text:
                  'Lorem ipsum dolor sit amet consectetur. Enim massa aenean ac odio leo habitasse tortor tempor. Ut id urna odio dui leo congue. Ultrices pharetra ornare nam faucibus. Integer id varius consectetur non.',
              color: Colors.black,
              textOverflow: TextOverflow.fade,
              textAlign: TextAlign.start,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(height: 16.h),
            CustomText(
              text:
                  'Lorem ipsum dolor sit amet consectetur. Enim massa aenean ac odio leo habitasse tortor tempor. Ut id urna odio dui leo congue. Ultrices pharetra ornare nam faucibus. Integer id varius consectetur non.',
              color: Colors.black,
              textOverflow: TextOverflow.fade,
              textAlign: TextAlign.start,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }
}

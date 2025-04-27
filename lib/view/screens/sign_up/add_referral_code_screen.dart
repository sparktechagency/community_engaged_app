import 'package:community_engaged_app/utils/app_colors.dart';
import 'package:community_engaged_app/utils/app_images.dart';
import 'package:community_engaged_app/view/widgets/custom_elevated_button_widget.dart';
import 'package:community_engaged_app/view/widgets/custom_pin_code_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddReferralCodeScreen extends StatefulWidget {
  const AddReferralCodeScreen({super.key});

  @override
  State<AddReferralCodeScreen> createState() => _AddReferralCodeScreenState();
}

class _AddReferralCodeScreenState extends State<AddReferralCodeScreen> {
  final TextEditingController _referralCodeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Sign Up',style: TextStyle(fontWeight: FontWeight.w500),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 16. h,),
              Center(child: SvgPicture.asset(AppImage.referralCodeLogo)),
              SizedBox(height: 16. h,),
              Text('Referral Code',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600,color: AppColor.themeColor),),
              SizedBox(height: 8. h,),
              Text('Use referral code to get exclusive things and go ahead!',textAlign: TextAlign.center,style: TextStyle(fontSize: 15),),
              SizedBox(height: 16. h,),
              CustomPinCodeTextField(
                textEditingController:_referralCodeController ,
              ),
              SizedBox(height: 32. h,),
              CustomElevatedButtonWidget(buttonName: 'Sign Up', onTapNext: (){}),
            ],
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    super.dispose();
    _referralCodeController.dispose();
  }
}

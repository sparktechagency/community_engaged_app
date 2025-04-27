import 'package:community_engaged_app/utils/app_colors.dart';
import 'package:community_engaged_app/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReferralUsersScreen extends StatefulWidget {
  const ReferralUsersScreen({super.key});

  @override
  State<ReferralUsersScreen> createState() => _ReferralUsersScreenState();
}

class _ReferralUsersScreenState extends State<ReferralUsersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Referral Users'),
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 20,fontWeight: FontWeight.w600),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: 20,
            itemBuilder: (context,index){
          return Container(
            // padding: EdgeInsets.all(8),
            margin: EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: AppColor.primaryColor,
            ),
            child: ListTile(
              // contentPadding: EdgeInsets.all(8),
              leading: CircleAvatar(backgroundImage: AssetImage(AppImage.splashScreenLogo),radius: 26,),
              title: Text('Jane Cooper',style: TextStyle(fontSize: 16),),
            ),
          );
        }),
      ),
    );
  }
}

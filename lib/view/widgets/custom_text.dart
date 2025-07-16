import 'package:community_engaged_app/gen/fonts.gen.dart';
import 'package:community_engaged_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomText extends StatelessWidget {
  CustomText({
    super.key,
    this.maxline,
    this.textOverflow,
    this.fontName,
    this.textAlign = TextAlign.center,
    this.left = 0,
    this.right = 0,
    this.top = 0,
    this.bottom = 0,
    this.fontsize,
    this.textHeight,
    this.fontWeight = FontWeight.w400,
    this.color,
    required this.text,
    this.shadows,
    this.decoration,
  });

  final double left;
  final TextOverflow? textOverflow;
  final double right;
  final double top;
  final double bottom;
  final double? fontsize;
  final FontWeight fontWeight;
  final Color? color;
  final String text;
  final TextAlign textAlign;
  final int? maxline;
  final String? fontName;
  final double? textHeight;
  final List<Shadow>? shadows;
  final TextDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: left,
        right: right,
        top: top,
        bottom: bottom,
      ),
      child: Text(
        textAlign: textAlign,
        text,
        maxLines: maxline,
        overflow: textOverflow ?? TextOverflow.fade,
        style: TextStyle(
          fontSize: fontsize ?? 14.h,
          fontFamily: FontFamily.poppins,
          fontWeight: fontWeight ?? FontWeight.w400,
          color: color ?? Colors.black,
          shadows: shadows,
          decoration: decoration,
        ),
      ),
    );
  }
}

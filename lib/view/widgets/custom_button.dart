import 'package:community_engaged_app/utils/app_colors.dart';
import 'package:community_engaged_app/view/widgets/custom_container.dart';
import 'package:community_engaged_app/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.suffixIcon,
    this.child,
    this.label,
    this.backgroundColor,
    this.foregroundColor,
    this.height,
    this.width,
    this.fontWeight,
    this.fontSize,
    this.fontName,
    required this.onPressed,
    this.radius,
    this.prefixIcon,
    this.bordersColor,
    this.suffixIconShow = false,
    this.prefixIconShow = false,
    this.isLoading = false,
    this.title,
    this.iconHeight,
    this.iconWidth,
    this.labelHorizontalAlignment,
    this.elevation = false,
    this.isRippleEffectEnabled = false, // Added parameter
  });

  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Widget? child;
  final String? label;
  final Widget? title;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? height;
  final double? width;
  final FontWeight? fontWeight;
  final double? fontSize;
  final double? radius;
  final String? fontName;
  final VoidCallback onPressed;
  final Color? bordersColor;
  final bool suffixIconShow;
  final bool prefixIconShow;
  final double? iconHeight;
  final double? iconWidth;
  final bool isLoading;
  final bool elevation;
  final MainAxisAlignment? labelHorizontalAlignment;
  final bool isRippleEffectEnabled; // New optional parameter

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: !isLoading,
      replacement: const Center(child: CircularProgressIndicator()),
      child: isRippleEffectEnabled
          ? InkWell(
        onTap: onPressed,
        splashColor: AppColor.primaryColor.withOpacity(0.2), // Customize splash color
        highlightColor: AppColor.primaryColor.withOpacity(0.1), // Customize highlight color
        child: _buildButtonContent(context),
      )
          : _buildButtonContent(context),
    );
  }

  Widget _buildButtonContent(BuildContext context) {
    return CustomContainer(
      elevation: elevation,
      onTap: onPressed,
      color: backgroundColor ?? AppColor.primaryColor,
      height: height ?? 50.h,
      width: width ?? double.infinity,
      radiusAll: radius ?? 100.r,
      bordersColor: bordersColor,
      child: child ??
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: labelHorizontalAlignment ?? MainAxisAlignment.center,
            children: [
              /// Prefix Icon
              if (prefixIcon != null || prefixIconShow == true) ...[
                prefixIcon ?? Icon(Icons.arrow_back),
                SizedBox(width: 8.w),
              ],

              if (title != null) title!,

              /// Label Text
              if (label != null)
                Flexible(
                  child: CustomText(
                    text: label ?? '',
                    color: foregroundColor ?? Colors.white,
                    fontName: fontName,
                    fontWeight: fontWeight ?? FontWeight.w600,
                    fontsize: fontSize ?? 20.sp,
                  ),
                ),

              /// Suffix Icon
              if (suffixIcon != null || suffixIconShow == true) ...[
                SizedBox(width: 8.w),
                // Use SvgPicture for SVG icons
                suffixIcon != null
                    ? suffixIcon! // If a custom widget is passed as suffixIcon
                    : SizedBox.shrink(),
              ],
            ],
          ),
    );
  }
}


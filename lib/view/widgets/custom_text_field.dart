import 'package:community_engaged_app/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/app_colors.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final bool? isObscureText;
  final String? obscure;
  final Color? filColor;
  final Color? borderColor;
  final Color? hintTextColor;
  final Widget? prefixIcon;
  final String? labelText;
  final String? hintText;
  final double? contentPaddingHorizontal;
  final double? contentPaddingVertical;
  final int? maxLine;
  final double? hintTextSize;
  final Widget? suffixIcon;
  final FormFieldValidator? validator;
  final bool isPassword;
  final bool? isEmail;
  final bool? readOnly;
  final double? borderRadio;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;
  final Color? suffixIconColor;

  const CustomTextField({
    super.key,
    this.contentPaddingHorizontal,
    this.contentPaddingVertical,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLine,
    this.validator,
    this.hintTextColor,
    this.borderColor,
    this.isEmail,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.isObscureText = false,
    this.obscure = '*',
    this.filColor,
    this.hintTextSize,
    this.labelText,
    this.isPassword = false,
    this.readOnly = false,
    this.borderRadio,
    this.onTap,
    this.onChanged,
    this.suffixIconColor,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscureText = true;

  void toggle() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: widget.onChanged,
      onTap: widget.onTap,
      readOnly: widget.readOnly!,
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      obscuringCharacter: widget.obscure!,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textInputAction: TextInputAction.next,
      maxLines: widget.maxLine ?? 1,
      enabled: true,
      // validator: widget.validator,
      validator:
          widget.validator ??
          (value) {
            if (widget.isEmail == null) {
              if (value!.isEmpty) {
                return "Please enter ${widget.hintText!.toLowerCase()}";
              } else if (widget.isPassword) {
                bool data = AppConstants.validatePassword(value);
                if (value.isEmpty) {
                  return "Please enter ${widget.hintText!.toLowerCase()}";
                } else if (data) {
                  return "Insecure password detected.";
                }
              }
            } else {
              bool data = AppConstants.emailValidate.hasMatch(value!);
              if (value.isEmpty) {
                return "Please enter ${widget.hintText!.toLowerCase()}";
              } else if (!data) {
                return "Please check your email!";
              }
            }
            return null;
          },

      cursorColor: Colors.black,
      obscureText: widget.isPassword ? obscureText : false,
      style: TextStyle(
        color: widget.hintTextColor ?? Colors.black,
        fontSize: widget.hintTextSize ?? 14.sp,
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: widget.contentPaddingHorizontal ?? 20.w,
          vertical: widget.contentPaddingVertical ?? 18.h,
        ),
        fillColor: Colors.white,
        filled: true,
        prefixIcon: widget.prefixIcon,
        suffixIcon:
            widget.isPassword
                ? GestureDetector(
                  onTap: toggle,
                  child: _suffixIcon(
                    obscureText
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                  ),
                )
                : widget.suffixIcon,
        prefixIconConstraints: BoxConstraints(minHeight: 24.w, minWidth: 24.w),
        labelText: widget.labelText,
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: widget.hintTextColor ?? Colors.black,
          fontSize: widget.hintTextSize ?? 14.h,
          fontWeight: FontWeight.bold,
          fontFamily: 'Outfit',
        ),
        focusedBorder: focusedBorder(),
        enabledBorder: enabledBorder(),
        errorBorder: errorBorder(),
        border: focusedBorder(),
        errorStyle: TextStyle(fontSize: 12.h, fontWeight: FontWeight.w400),
      ),
    );
  }

  _suffixIcon(IconData icon) {
    return Padding(
      padding: EdgeInsets.all(12.0),
      child: Icon(icon, color: widget.suffixIconColor),
    );
  }

  OutlineInputBorder focusedBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(widget.borderRadio?.r ?? 100.r),
      borderSide: BorderSide(
        color: widget.borderColor ?? AppColor.primaryColor,
      ),
    );
  }

  OutlineInputBorder enabledBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(widget.borderRadio?.r ?? 100.r),
      borderSide: BorderSide(
        color: widget.borderColor ?? AppColor.primaryColor.withOpacity(.5),
      ),
    );
  }

  OutlineInputBorder errorBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(widget.borderRadio?.r ?? 100.r),
      borderSide: const BorderSide(color: Colors.red, width: 0.5),
    );
  }
}

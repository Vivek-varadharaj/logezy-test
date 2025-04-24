import 'package:flutter/material.dart';
import 'package:logezy/utils/app_colors.dart';
import 'package:logezy/utils/app_text_styles.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {super.key,
      this.controller,
      this.obscureText = false,
      this.textColor = AppColors.neutral100,
      this.hintText,
      this.onChanged,
      this.textInputType,
      this.suffixIcon});

  final TextEditingController? controller;
  final String? hintText;
  final Function(String?)? onChanged;
  final TextInputType? textInputType;
  final Widget? suffixIcon;
  final bool obscureText;
  final Color textColor;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 48,
      decoration: BoxDecoration(
        color: AppColors.neutral0,
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: AppColors.neutral50),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
                style: AppTextStyles.heading7.copyWith(fontSize: 16),
                obscureText: widget.obscureText,
                keyboardType: widget.textInputType,
                onChanged: widget.onChanged,
                controller: widget.controller,
                scrollPadding: EdgeInsets.zero,
                decoration: InputDecoration(
                  suffixIconConstraints: const BoxConstraints(maxHeight: 14),
                  isCollapsed: false,
                  hintText: widget.hintText,
                  hintStyle: AppTextStyles.heading7
                      .copyWith(color: widget.textColor, fontSize: 16),
                  border: InputBorder.none,
                )),
          ),
          if (widget.suffixIcon != null) widget.suffixIcon!,
        ],
      ),
    );
  }
}

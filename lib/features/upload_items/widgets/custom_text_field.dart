 import 'package:flutter/material.dart';
import 'package:recycle_app/core/utils/app_text.dart/app_text.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key,required this.hintText,required this.prefixIcon,required this.controller});

  final String hintText;
  final IconData prefixIcon;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Material(
        elevation: 3,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              border: InputBorder.none,

              prefixIcon: Icon(prefixIcon, color: Colors.green),
              hintText: hintText,
              hintStyle: AppText.normalTextStyle(
                18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
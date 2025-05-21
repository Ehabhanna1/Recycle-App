
import 'package:flutter/material.dart';
import 'package:recycle_app/core/utils/app_text.dart/app_text.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.hintText, required this.controller, required this.prefixIcon});

  final String hintText;
  final TextEditingController controller;
  final Widget prefixIcon;


  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
     
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 20),
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.green),
        ),
        border: InputBorder.none,
        prefixIcon: prefixIcon,
        hintText: hintText,
        hintStyle: AppText.normalTextStyle(18),
      ),
    );
  }
}

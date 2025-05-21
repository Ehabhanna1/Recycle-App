import 'package:flutter/material.dart';
import 'package:recycle_app/core/utils/app_text.dart/app_text.dart';

class CustomButtom extends StatelessWidget {
  const CustomButtom({super.key, this.onPressed, required this.title, this.fontSize, this.backgroundColor});
 final  void Function()? onPressed;
 final String title;

 final double? fontSize;

 final Color? backgroundColor;



  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      
      style: ElevatedButton.
      styleFrom(
        
        elevation: 3,
        backgroundColor: backgroundColor?? Colors.green,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          
        ),
      ),
      onPressed: onPressed,
       child: Text(title, style: AppText.whiteTextStyle(fontSize??20),));
  }
}
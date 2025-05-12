import 'package:flutter/material.dart';
import 'package:recycle_app/core/utils/app_text.dart/app_text.dart';

class CategoriesItem extends StatelessWidget {
  const CategoriesItem({super.key, required this.image, required this.title});
  final String image;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Color(0xFFececF8),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.black45, width: 2),
          ),
          child: Image.asset(
           image,
            height: 70,
            width: 70,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 5),
        Text(title, style: AppText.normalTextStyle(20)),
      ],
    );
  }
}

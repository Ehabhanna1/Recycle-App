import 'package:flutter/material.dart';

class AppText {
  static TextStyle headLineTextStyle (double size,){
    return TextStyle(
      fontSize: size,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );
  }

   static TextStyle normalTextStyle (double size,){
    return TextStyle(
      fontSize: size,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    );
  }

    static TextStyle whiteTextStyle (double size,){
    return TextStyle(
      fontSize: size,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );
  }
   static TextStyle greenTextStyle (double size,){
    return TextStyle(
      fontSize: size,
      fontWeight: FontWeight.bold,
      color: Colors.green,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:recycle_app/core/utils/app_text.dart/app_text.dart';

class AppBarHome extends StatelessWidget {
  const AppBarHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 5,),
        Image.asset("assets/images/wave.png",height: 40,width: 40,fit: BoxFit.cover,),
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Text("Hello, ",style: AppText.headLineTextStyle(28),),
        ),
        Text("Ehab",style: AppText.greenTextStyle(25),),
        Spacer(),
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset("assets/images/boy.jpg",height: 60,width: 60,fit: BoxFit.cover,)),
        ),
    
      ],
    );
  }
}
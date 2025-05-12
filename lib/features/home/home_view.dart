import 'package:flutter/material.dart';
import 'package:recycle_app/core/utils/app_text.dart/app_text.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Container(
      margin: EdgeInsets.only(top: 50,left: 20),
      child: Column(
        children: [
          Row(
            children: [
              Text("Hello, ",style: AppText.headLineTextStyle(28),),
              Text("Ehab",style: AppText.greenTextStyle(25),),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset("assets/images/boy.jpg",height: 60,width: 60,fit: BoxFit.cover,)),
              ),

            ],
          ),
          Image.asset("assets/images/home.png"),

        ],
      ),
     ),
    );
  }
}
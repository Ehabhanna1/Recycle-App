import 'package:flutter/material.dart';
import 'package:recycle_app/core/utils/app_text.dart/app_text.dart';
import 'package:recycle_app/core/utils/routing/app_routes.dart';
import 'package:recycle_app/core/widgets/custom_buttom.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 50),
          Image.asset('assets/images/onboard.png'),
          SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),

            child: Text(
              'Recycle your waste products !!',
              style: AppText.headLineTextStyle(34),
            ),
          ),
          SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Text(
              "Earn rewards for every product you recycle",
              style: AppText.normalTextStyle(20),
            ),
          ),
          SizedBox(height: 90),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              height: 60,
              width: double.infinity,
              child: CustomButtom(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.loginView);
                },
                title: 'Get Started',
              ),
            ),
          ),
        ],
      ),
    );
  }
}




import 'package:flutter/material.dart';
import 'package:recycle_app/core/utils/routing/app_routes.dart';
import 'package:recycle_app/features/onboarding/onboarding_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.onboardingView:
      return MaterialPageRoute(
        builder: (context) => const OnboardingView(),
      );
    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: Center(
            child: Text('Route not found'),
          ),
        ),
      );
  }
}
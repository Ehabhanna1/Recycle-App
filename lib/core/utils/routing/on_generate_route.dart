


import 'package:flutter/material.dart';
import 'package:recycle_app/core/utils/routing/app_routes.dart';
import 'package:recycle_app/features/auth/login_view.dart';
import 'package:recycle_app/features/home/home_view.dart';
import 'package:recycle_app/features/onboarding/onboarding_view.dart';
import 'package:recycle_app/features/upload_items/upload_item_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.onboardingView:
      return MaterialPageRoute(
        builder: (context) => const OnboardingView(),
      );
    case AppRoutes.homeView:
      return MaterialPageRoute(
        builder: (context) => const HomeView(),
      );
    case AppRoutes.loginView:
      return MaterialPageRoute(
        builder: (context) => const LoginView(),
      );
    case AppRoutes.uploadItemView:
      return MaterialPageRoute(
        builder: (context) => const UploadItemView(),
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
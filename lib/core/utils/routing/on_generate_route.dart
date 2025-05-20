


import 'package:flutter/material.dart';
import 'package:recycle_app/core/utils/routing/app_routes.dart';
import 'package:recycle_app/features/admin/admin_approval_view.dart';
import 'package:recycle_app/features/admin/admin_login_view.dart';
import 'package:recycle_app/features/admin/admin_redeem_approved.dart';
import 'package:recycle_app/features/auth/login_view.dart';
import 'package:recycle_app/features/home/home_view.dart';
import 'package:recycle_app/features/main_navbar/main_nav_bar_view.dart';
import 'package:recycle_app/features/onboarding/onboarding_view.dart';
import 'package:recycle_app/features/points/point_view.dart';
import 'package:recycle_app/features/profile/profile_view.dart';
import 'package:recycle_app/features/upload_items/upload_item_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
     final arguments = settings.arguments;

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
        builder: (context) => UploadItemView(category: "", id: ""),
      );
    case AppRoutes.adminApprovalView:
      return MaterialPageRoute(
        builder: (context) => const AdminApprovalView(),
      );
    case AppRoutes.pointView:
      return MaterialPageRoute(
        builder: (context) => const PointView(),
      );
    case AppRoutes.profileView:
      return MaterialPageRoute(
        builder: (context) => const ProfileView(),
      );
    case AppRoutes.mainNavBarView:
      return MaterialPageRoute(
        builder: (context) => const MainNavBarView(),
      );
    case AppRoutes.adminRedeemApprovedView:
      return MaterialPageRoute(
        builder: (context) => const AdminRedeemApproved(),
      );
    case AppRoutes.adminLoginView:
      return MaterialPageRoute(
        builder: (context) => const AdminLoginView(),
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
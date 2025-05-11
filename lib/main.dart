import 'package:flutter/material.dart';
import 'package:recycle_app/core/utils/routing/app_routes.dart';
import 'package:recycle_app/core/utils/routing/on_generate_route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recycle App',
      onGenerateRoute: onGenerateRoute,
      initialRoute: AppRoutes.onboardingView,
      
    );
  }
}

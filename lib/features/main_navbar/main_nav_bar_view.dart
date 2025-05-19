import 'package:flutter/material.dart';
import 'package:recycle_app/features/home/home_view.dart';
import 'package:recycle_app/features/points/point_view.dart';
import 'package:recycle_app/features/profile/profile_view.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class MainNavBarView extends StatefulWidget {
  const MainNavBarView({super.key});

  @override
  State<MainNavBarView> createState() => _MainNavBarViewState();
}

class _MainNavBarViewState extends State<MainNavBarView> {


   final List<Widget> views = [
    const HomeView(),
   const PointView(),
    const ProfileView(),
  ];


  int currentIndex = 0;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 70,
        backgroundColor: Colors.white,
        color: Colors.black,
        animationDuration: Duration(milliseconds: 500),
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          Icon(Icons.home,color: Colors.white,size: 34,),
          Icon(Icons.point_of_sale,color: Colors.white,size: 34,),
          Icon(Icons.person,color: Colors.white,size: 34,),
        ],
        
        
      ),
      body: views[currentIndex],
    );
  }
}
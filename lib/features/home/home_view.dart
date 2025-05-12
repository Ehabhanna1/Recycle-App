import 'package:flutter/material.dart';
import 'package:recycle_app/core/utils/app_text.dart/app_text.dart';
import 'package:recycle_app/features/home/widgets/app_bar_home.dart';
import 'package:recycle_app/features/home/widgets/categories_item.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
     body: SingleChildScrollView(
       child: Container(
        margin: EdgeInsets.only(top: 50,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBarHome(),
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Center(child: Image.asset("assets/images/home.png")),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text("Categories",style: AppText.headLineTextStyle(24),),
       
            ),
            SizedBox(height: 10),
           Container(
            padding: EdgeInsets.only(left: 20,right: 10),
            height: 130,
             child: ListView(
             
              scrollDirection: Axis.horizontal,
             
              children: [
                CategoriesItem(image: 'assets/images/plastic.png',title: "Plastic"),
                SizedBox(width: 20),
                CategoriesItem(image: 'assets/images/paper.png',title: "Paper"),
                 SizedBox(width: 20),
               
                CategoriesItem(image: 'assets/images/battery.png',title: 'Battery'),
                SizedBox(width: 20),
                CategoriesItem(image: 'assets/images/glass.png',title: 'Glass'),
       
                
       
       
       
              ],
             ),
           ),
           SizedBox(height: 10),
           Padding(
             padding: const EdgeInsets.only(left: 20),
             child: Text("Pendibg Request",style: AppText.headLineTextStyle(22)),
           ),

           SizedBox(height: 20),
         
           Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(left: 20,right: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.black54,width: 2)
            ),
            child: Column(
              children: [
                SizedBox(height: 10),
                  Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.location_on,color: Colors.green,size: 30),
              SizedBox(width: 10),
              Text("Main market , delhi",style: AppText.normalTextStyle(20)),
            ],
           ),
           Divider(height: 20),
                Image.asset("assets/images/chips.png",height: 150,width: 150,fit: BoxFit.cover),
                SizedBox(height: 15),
                     Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             Icon(Icons.layers,color: Colors.green,size: 33),
              SizedBox(width: 10),
              Text("3",style: AppText.normalTextStyle(25)),
            ],
           ),
            SizedBox(width: 15),
              ],
            )
           ),
           SizedBox(height: 30),
          ],
        ),
       ),
     ),
    );
  }
}




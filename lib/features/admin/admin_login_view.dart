import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:recycle_app/core/utils/app_text.dart/app_text.dart';
import 'package:recycle_app/core/utils/routing/app_routes.dart';
import 'package:recycle_app/core/widgets/custom_buttom.dart';
import 'package:recycle_app/features/upload_items/widgets/custom_text_field.dart';

class AdminLoginView extends StatefulWidget {
  const AdminLoginView({super.key});

  @override
  State<AdminLoginView> createState() => _AdminLoginViewState();
}

class _AdminLoginViewState extends State<AdminLoginView> {


  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

@override
  void dispose() {
  userNameController.dispose();
  passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
          children: [
               Image.asset("assets/images/login.png",
            height: 300,
            width:MediaQuery.of(context).size.width,
            fit: BoxFit.cover,),
            SizedBox(height: 20,),
            
            Text("Admin Login",style: AppText.headLineTextStyle(27),),
            SizedBox(height: 10,),
           
            
          ],
          ),
      ),

      SliverFillRemaining(

        hasScrollBody: false,
        fillOverscroll:false,
        child:  Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/3,
              decoration: BoxDecoration(
                color: const Color.fromARGB(66, 76, 175, 79),
               borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(40)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height:30,),
                  Padding(
                    padding: const EdgeInsets.only(left: 25,right: 20,bottom: 5),
                    child: Text("User Name",style: AppText.normalTextStyle(18),),
                  ),
                 CustomTextField(hintText: "Enter User name",
                  controller: userNameController,
                  prefixIcon: Icons.person,),
                 SizedBox(height: 30,),
                 Padding(
                    padding: const EdgeInsets.only(left: 25,right: 20,bottom: 5),
                    child: Text("Password",style: AppText.normalTextStyle(18),),
                  ),
                 CustomTextField(hintText: "Enter Password", controller: passwordController,prefixIcon: Icons.lock,),
                 SizedBox(height: 60,),
                 Center(
                   child: SizedBox(
                    height: 55,
                     width: MediaQuery.of(context).size.width/1.8,
                     child: CustomButtom(
                      onPressed: (){
                        LoginAdmin();
                      },
                      title: "Login",
                      backgroundColor: Colors.black,),
                   ),
                 )
                ],
              ),
            ),
      ),




    ],
    ),
    );
  }

  LoginAdmin(){
    FirebaseFirestore.instance.collection("Admin").get().then((snapshot){
      for (var result in snapshot.docs) {
         if(result.data()["id"] != userNameController.text.trim() ){
           ScaffoldMessenger.of(context).showSnackBar(
             SnackBar(
              backgroundColor: Colors.red,
              content: Text("Your id is wrong",style: TextStyle(color: Colors.white,fontSize: 18),)),
           );
         }else if(result.data()["password"] != passwordController.text.trim() ){
           ScaffoldMessenger.of(context).showSnackBar(
             SnackBar(
              backgroundColor: Colors.red,
              content: Text("Your Password is wrong",style: TextStyle(color: Colors.white,fontSize: 18),)),
           );
         }else{
           ScaffoldMessenger.of(context).showSnackBar(
             SnackBar(content: Text("Login Success"),backgroundColor: Colors.green,),

           );

          Navigator.pushNamed(context, AppRoutes.homeAdminView);
         }
      }
    });
  } 



}